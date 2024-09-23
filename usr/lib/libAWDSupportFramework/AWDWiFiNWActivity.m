@implementation AWDWiFiNWActivity

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiNWActivity setActivities:](self, "setActivities:", 0);
  -[AWDWiFiNWActivity setInterfaceStats:](self, "setInterfaceStats:", 0);
  -[AWDWiFiNWActivity setPeerStats:](self, "setPeerStats:", 0);
  -[AWDWiFiNWActivity setControllerStats:](self, "setControllerStats:", 0);
  -[AWDWiFiNWActivity setLinkQualSample:](self, "setLinkQualSample:", 0);
  -[AWDWiFiNWActivity setScores:](self, "setScores:", 0);
  -[AWDWiFiNWActivity setBtleConnections:](self, "setBtleConnections:", 0);
  -[AWDWiFiNWActivity setApProfile:](self, "setApProfile:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivity;
  -[AWDWiFiNWActivity dealloc](&v3, sel_dealloc);
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

- (void)clearActivities
{
  -[NSMutableArray removeAllObjects](self->_activities, "removeAllObjects");
}

- (void)addActivities:(id)a3
{
  NSMutableArray *activities;

  activities = self->_activities;
  if (!activities)
  {
    activities = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_activities = activities;
  }
  -[NSMutableArray addObject:](activities, "addObject:", a3);
}

- (unint64_t)activitiesCount
{
  return -[NSMutableArray count](self->_activities, "count");
}

- (id)activitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_activities, "objectAtIndex:", a3);
}

+ (Class)activitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearInterfaceStats
{
  -[NSMutableArray removeAllObjects](self->_interfaceStats, "removeAllObjects");
}

- (void)addInterfaceStats:(id)a3
{
  NSMutableArray *interfaceStats;

  interfaceStats = self->_interfaceStats;
  if (!interfaceStats)
  {
    interfaceStats = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_interfaceStats = interfaceStats;
  }
  -[NSMutableArray addObject:](interfaceStats, "addObject:", a3);
}

- (unint64_t)interfaceStatsCount
{
  return -[NSMutableArray count](self->_interfaceStats, "count");
}

- (id)interfaceStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_interfaceStats, "objectAtIndex:", a3);
}

+ (Class)interfaceStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearPeerStats
{
  -[NSMutableArray removeAllObjects](self->_peerStats, "removeAllObjects");
}

- (void)addPeerStats:(id)a3
{
  NSMutableArray *peerStats;

  peerStats = self->_peerStats;
  if (!peerStats)
  {
    peerStats = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_peerStats = peerStats;
  }
  -[NSMutableArray addObject:](peerStats, "addObject:", a3);
}

- (unint64_t)peerStatsCount
{
  return -[NSMutableArray count](self->_peerStats, "count");
}

- (id)peerStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_peerStats, "objectAtIndex:", a3);
}

+ (Class)peerStatsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasControllerStats
{
  return self->_controllerStats != 0;
}

- (BOOL)hasLinkQualSample
{
  return self->_linkQualSample != 0;
}

- (void)clearScores
{
  -[NSMutableArray removeAllObjects](self->_scores, "removeAllObjects");
}

- (void)addScore:(id)a3
{
  NSMutableArray *scores;

  scores = self->_scores;
  if (!scores)
  {
    scores = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_scores = scores;
  }
  -[NSMutableArray addObject:](scores, "addObject:", a3);
}

- (unint64_t)scoresCount
{
  return -[NSMutableArray count](self->_scores, "count");
}

- (id)scoreAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_scores, "objectAtIndex:", a3);
}

+ (Class)scoreType
{
  return (Class)objc_opt_class();
}

- (void)clearBtleConnections
{
  -[NSMutableArray removeAllObjects](self->_btleConnections, "removeAllObjects");
}

- (void)addBtleConnection:(id)a3
{
  NSMutableArray *btleConnections;

  btleConnections = self->_btleConnections;
  if (!btleConnections)
  {
    btleConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_btleConnections = btleConnections;
  }
  -[NSMutableArray addObject:](btleConnections, "addObject:", a3);
}

- (unint64_t)btleConnectionsCount
{
  return -[NSMutableArray count](self->_btleConnections, "count");
}

- (id)btleConnectionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_btleConnections, "objectAtIndex:", a3);
}

+ (Class)btleConnectionType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasApProfile
{
  return self->_apProfile != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivity;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivity description](&v3, sel_description), -[AWDWiFiNWActivity dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSMutableArray *activities;
  void *v5;
  NSMutableArray *interfaceStats;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *peerStats;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  AWDWiFiNWActivityControllerStats *controllerStats;
  AWDLinkQualityMeasurements *linkQualSample;
  void *v19;
  NSMutableArray *scores;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *btleConnections;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  NSString *apProfile;
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
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  activities = self->_activities;
  if (activities)
    objc_msgSend(v3, "setObject:forKey:", activities, CFSTR("activities"));
  if (-[NSMutableArray count](self->_interfaceStats, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_interfaceStats, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    interfaceStats = self->_interfaceStats;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceStats, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v46 != v9)
            objc_enumerationMutation(interfaceStats);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceStats, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("interfaceStats"));

  }
  if (-[NSMutableArray count](self->_peerStats, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_peerStats, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    peerStats = self->_peerStats;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerStats, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(peerStats);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerStats, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("peerStats"));

  }
  controllerStats = self->_controllerStats;
  if (controllerStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiNWActivityControllerStats dictionaryRepresentation](controllerStats, "dictionaryRepresentation"), CFSTR("controllerStats"));
  linkQualSample = self->_linkQualSample;
  if (linkQualSample)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLinkQualityMeasurements dictionaryRepresentation](linkQualSample, "dictionaryRepresentation"), CFSTR("linkQualSample"));
  if (-[NSMutableArray count](self->_scores, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_scores, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    scores = self->_scores;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scores, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(scores);
          objc_msgSend(v19, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scores, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v22);
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("score"));

  }
  if (-[NSMutableArray count](self->_btleConnections, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_btleConnections, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    btleConnections = self->_btleConnections;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](btleConnections, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(btleConnections);
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](btleConnections, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      }
      while (v28);
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("btleConnection"));

  }
  apProfile = self->_apProfile;
  if (apProfile)
    objc_msgSend(v3, "setObject:forKey:", apProfile, CFSTR("apProfile"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *activities;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *interfaceStats;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *peerStats;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  NSMutableArray *scores;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  NSMutableArray *btleConnections;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t n;
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
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  activities = self->_activities;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activities, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(activities);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activities, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v6);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  interfaceStats = self->_interfaceStats;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceStats, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(interfaceStats);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceStats, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v11);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  peerStats = self->_peerStats;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerStats, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(peerStats);
        PBDataWriterWriteSubmessage();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerStats, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v16);
  }
  if (self->_controllerStats)
    PBDataWriterWriteSubmessage();
  if (self->_linkQualSample)
    PBDataWriterWriteSubmessage();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  scores = self->_scores;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scores, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(scores);
        PBDataWriterWriteSubmessage();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scores, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
    }
    while (v21);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  btleConnections = self->_btleConnections;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](btleConnections, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (n = 0; n != v26; ++n)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(btleConnections);
        PBDataWriterWriteSubmessage();
      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](btleConnections, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
    }
    while (v26);
  }
  if (self->_apProfile)
    PBDataWriterWriteStringField();
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
  unint64_t v17;
  unint64_t v18;
  uint64_t n;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 80) |= 1u;
  }
  if (-[AWDWiFiNWActivity activitiesCount](self, "activitiesCount"))
  {
    objc_msgSend(a3, "clearActivities");
    v5 = -[AWDWiFiNWActivity activitiesCount](self, "activitiesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addActivities:", -[AWDWiFiNWActivity activitiesAtIndex:](self, "activitiesAtIndex:", i));
    }
  }
  if (-[AWDWiFiNWActivity interfaceStatsCount](self, "interfaceStatsCount"))
  {
    objc_msgSend(a3, "clearInterfaceStats");
    v8 = -[AWDWiFiNWActivity interfaceStatsCount](self, "interfaceStatsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addInterfaceStats:", -[AWDWiFiNWActivity interfaceStatsAtIndex:](self, "interfaceStatsAtIndex:", j));
    }
  }
  if (-[AWDWiFiNWActivity peerStatsCount](self, "peerStatsCount"))
  {
    objc_msgSend(a3, "clearPeerStats");
    v11 = -[AWDWiFiNWActivity peerStatsCount](self, "peerStatsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addPeerStats:", -[AWDWiFiNWActivity peerStatsAtIndex:](self, "peerStatsAtIndex:", k));
    }
  }
  if (self->_controllerStats)
    objc_msgSend(a3, "setControllerStats:");
  if (self->_linkQualSample)
    objc_msgSend(a3, "setLinkQualSample:");
  if (-[AWDWiFiNWActivity scoresCount](self, "scoresCount"))
  {
    objc_msgSend(a3, "clearScores");
    v14 = -[AWDWiFiNWActivity scoresCount](self, "scoresCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addScore:", -[AWDWiFiNWActivity scoreAtIndex:](self, "scoreAtIndex:", m));
    }
  }
  if (-[AWDWiFiNWActivity btleConnectionsCount](self, "btleConnectionsCount"))
  {
    objc_msgSend(a3, "clearBtleConnections");
    v17 = -[AWDWiFiNWActivity btleConnectionsCount](self, "btleConnectionsCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addBtleConnection:", -[AWDWiFiNWActivity btleConnectionAtIndex:](self, "btleConnectionAtIndex:", n));
    }
  }
  if (self->_apProfile)
    objc_msgSend(a3, "setApProfile:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
  NSMutableArray *activities;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *interfaceStats;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *peerStats;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  NSMutableArray *scores;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  NSMutableArray *btleConnections;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
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
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (id *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  activities = self->_activities;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activities, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(activities);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addActivities:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activities, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v9);
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  interfaceStats = self->_interfaceStats;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceStats, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(interfaceStats);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addInterfaceStats:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceStats, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v15);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  peerStats = self->_peerStats;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerStats, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(peerStats);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend(v6, "addPeerStats:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](peerStats, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v21);
  }

  v6[5] = -[AWDWiFiNWActivityControllerStats copyWithZone:](self->_controllerStats, "copyWithZone:", a3);
  v6[7] = -[AWDLinkQualityMeasurements copyWithZone:](self->_linkQualSample, "copyWithZone:", a3);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  scores = self->_scores;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scores, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(scores);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend(v6, "addScore:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scores, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    }
    while (v27);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  btleConnections = self->_btleConnections;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](btleConnections, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(btleConnections);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend(v6, "addBtleConnection:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](btleConnections, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
    }
    while (v33);
  }

  v6[3] = (id)-[NSString copyWithZone:](self->_apProfile, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *activities;
  NSMutableArray *interfaceStats;
  NSMutableArray *peerStats;
  AWDWiFiNWActivityControllerStats *controllerStats;
  AWDLinkQualityMeasurements *linkQualSample;
  NSMutableArray *scores;
  NSMutableArray *btleConnections;
  NSString *apProfile;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 80) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_23;
    }
    else if ((*((_BYTE *)a3 + 80) & 1) != 0)
    {
LABEL_23:
      LOBYTE(v5) = 0;
      return v5;
    }
    activities = self->_activities;
    if (!((unint64_t)activities | *((_QWORD *)a3 + 2))
      || (v5 = -[NSMutableArray isEqual:](activities, "isEqual:")) != 0)
    {
      interfaceStats = self->_interfaceStats;
      if (!((unint64_t)interfaceStats | *((_QWORD *)a3 + 6))
        || (v5 = -[NSMutableArray isEqual:](interfaceStats, "isEqual:")) != 0)
      {
        peerStats = self->_peerStats;
        if (!((unint64_t)peerStats | *((_QWORD *)a3 + 8))
          || (v5 = -[NSMutableArray isEqual:](peerStats, "isEqual:")) != 0)
        {
          controllerStats = self->_controllerStats;
          if (!((unint64_t)controllerStats | *((_QWORD *)a3 + 5))
            || (v5 = -[AWDWiFiNWActivityControllerStats isEqual:](controllerStats, "isEqual:")) != 0)
          {
            linkQualSample = self->_linkQualSample;
            if (!((unint64_t)linkQualSample | *((_QWORD *)a3 + 7))
              || (v5 = -[AWDLinkQualityMeasurements isEqual:](linkQualSample, "isEqual:")) != 0)
            {
              scores = self->_scores;
              if (!((unint64_t)scores | *((_QWORD *)a3 + 9))
                || (v5 = -[NSMutableArray isEqual:](scores, "isEqual:")) != 0)
              {
                btleConnections = self->_btleConnections;
                if (!((unint64_t)btleConnections | *((_QWORD *)a3 + 4))
                  || (v5 = -[NSMutableArray isEqual:](btleConnections, "isEqual:")) != 0)
                {
                  apProfile = self->_apProfile;
                  if ((unint64_t)apProfile | *((_QWORD *)a3 + 3))
                    LOBYTE(v5) = -[NSString isEqual:](apProfile, "isEqual:");
                  else
                    LOBYTE(v5) = 1;
                }
              }
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
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_activities, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_interfaceStats, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_peerStats, "hash");
  v7 = -[AWDWiFiNWActivityControllerStats hash](self->_controllerStats, "hash");
  v8 = v7 ^ -[AWDLinkQualityMeasurements hash](self->_linkQualSample, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_scores, "hash");
  v10 = -[NSMutableArray hash](self->_btleConnections, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_apProfile, "hash");
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
  AWDWiFiNWActivityControllerStats *controllerStats;
  uint64_t v21;
  AWDLinkQualityMeasurements *linkQualSample;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
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
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 80) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v5);
        -[AWDWiFiNWActivity addActivities:](self, "addActivities:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v7);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 6);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v10);
        -[AWDWiFiNWActivity addInterfaceStats:](self, "addInterfaceStats:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v12);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = (void *)*((_QWORD *)a3 + 8);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        -[AWDWiFiNWActivity addPeerStats:](self, "addPeerStats:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v17);
  }
  controllerStats = self->_controllerStats;
  v21 = *((_QWORD *)a3 + 5);
  if (controllerStats)
  {
    if (v21)
      -[AWDWiFiNWActivityControllerStats mergeFrom:](controllerStats, "mergeFrom:");
  }
  else if (v21)
  {
    -[AWDWiFiNWActivity setControllerStats:](self, "setControllerStats:");
  }
  linkQualSample = self->_linkQualSample;
  v23 = *((_QWORD *)a3 + 7);
  if (linkQualSample)
  {
    if (v23)
      -[AWDLinkQualityMeasurements mergeFrom:](linkQualSample, "mergeFrom:");
  }
  else if (v23)
  {
    -[AWDWiFiNWActivity setLinkQualSample:](self, "setLinkQualSample:");
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = (void *)*((_QWORD *)a3 + 9);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        -[AWDWiFiNWActivity addScore:](self, "addScore:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
    }
    while (v26);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = (void *)*((_QWORD *)a3 + 4);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v35;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v29);
        -[AWDWiFiNWActivity addBtleConnection:](self, "addBtleConnection:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * n));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    }
    while (v31);
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDWiFiNWActivity setApProfile:](self, "setApProfile:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)interfaceStats
{
  return self->_interfaceStats;
}

- (void)setInterfaceStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)peerStats
{
  return self->_peerStats;
}

- (void)setPeerStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (AWDWiFiNWActivityControllerStats)controllerStats
{
  return self->_controllerStats;
}

- (void)setControllerStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDLinkQualityMeasurements)linkQualSample
{
  return self->_linkQualSample;
}

- (void)setLinkQualSample:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableArray)btleConnections
{
  return self->_btleConnections;
}

- (void)setBtleConnections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)apProfile
{
  return self->_apProfile;
}

- (void)setApProfile:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
