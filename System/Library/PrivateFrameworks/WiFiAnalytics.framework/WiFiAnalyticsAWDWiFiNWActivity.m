@implementation WiFiAnalyticsAWDWiFiNWActivity

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
  id v4;
  NSMutableArray *activities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  activities = self->_activities;
  v8 = v4;
  if (!activities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_activities;
    self->_activities = v6;

    v4 = v8;
    activities = self->_activities;
  }
  -[NSMutableArray addObject:](activities, "addObject:", v4);

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
  id v4;
  NSMutableArray *interfaceStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  interfaceStats = self->_interfaceStats;
  v8 = v4;
  if (!interfaceStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_interfaceStats;
    self->_interfaceStats = v6;

    v4 = v8;
    interfaceStats = self->_interfaceStats;
  }
  -[NSMutableArray addObject:](interfaceStats, "addObject:", v4);

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
  id v4;
  NSMutableArray *peerStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  peerStats = self->_peerStats;
  v8 = v4;
  if (!peerStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_peerStats;
    self->_peerStats = v6;

    v4 = v8;
    peerStats = self->_peerStats;
  }
  -[NSMutableArray addObject:](peerStats, "addObject:", v4);

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
  id v4;
  NSMutableArray *scores;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  scores = self->_scores;
  v8 = v4;
  if (!scores)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_scores;
    self->_scores = v6;

    v4 = v8;
    scores = self->_scores;
  }
  -[NSMutableArray addObject:](scores, "addObject:", v4);

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
  id v4;
  NSMutableArray *btleConnections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  btleConnections = self->_btleConnections;
  v8 = v4;
  if (!btleConnections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_btleConnections;
    self->_btleConnections = v6;

    v4 = v8;
    btleConnections = self->_btleConnections;
  }
  -[NSMutableArray addObject:](btleConnections, "addObject:", v4);

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

- (BOOL)hasAwdlIfStats
{
  return self->_awdlIfStats != 0;
}

- (BOOL)hasApIfStats
{
  return self->_apIfStats != 0;
}

- (BOOL)hasNanIfStats
{
  return self->_nanIfStats != 0;
}

- (BOOL)hasIrIfStats
{
  return self->_irIfStats != 0;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivity;
  -[WiFiAnalyticsAWDWiFiNWActivity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *activities;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  WiFiAnalyticsAWDWiFiNWActivityControllerStats *controllerStats;
  void *v21;
  WiFiAnalyticsAWDLinkQualityMeasurements *linkQualSample;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  NSString *apProfile;
  WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *awdlIfStats;
  void *v40;
  WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *apIfStats;
  void *v42;
  WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats *nanIfStats;
  void *v44;
  WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats *irIfStats;
  void *v46;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  activities = self->_activities;
  if (activities)
    objc_msgSend(v3, "setObject:forKey:", activities, CFSTR("activities"));
  if (-[NSMutableArray count](self->_interfaceStats, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_interfaceStats, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v7 = self->_interfaceStats;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v61 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("interfaceStats"));
  }
  if (-[NSMutableArray count](self->_peerStats, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_peerStats, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v14 = self->_peerStats;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v57 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("peerStats"));
  }
  controllerStats = self->_controllerStats;
  if (controllerStats)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats dictionaryRepresentation](controllerStats, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("controllerStats"));

  }
  linkQualSample = self->_linkQualSample;
  if (linkQualSample)
  {
    -[WiFiAnalyticsAWDLinkQualityMeasurements dictionaryRepresentation](linkQualSample, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("linkQualSample"));

  }
  if (-[NSMutableArray count](self->_scores, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_scores, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v25 = self->_scores;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v53 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * k), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("score"));
  }
  if (-[NSMutableArray count](self->_btleConnections, "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_btleConnections, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v32 = self->_btleConnections;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v49;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v48);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("btleConnection"));
  }
  apProfile = self->_apProfile;
  if (apProfile)
    objc_msgSend(v3, "setObject:forKey:", apProfile, CFSTR("apProfile"));
  awdlIfStats = self->_awdlIfStats;
  if (awdlIfStats)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats dictionaryRepresentation](awdlIfStats, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("awdlIfStats"));

  }
  apIfStats = self->_apIfStats;
  if (apIfStats)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats dictionaryRepresentation](apIfStats, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("apIfStats"));

  }
  nanIfStats = self->_nanIfStats;
  if (nanIfStats)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats dictionaryRepresentation](nanIfStats, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("nanIfStats"));

  }
  irIfStats = self->_irIfStats;
  if (irIfStats)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats dictionaryRepresentation](irIfStats, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("irIfStats"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = self->_activities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_interfaceStats;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_peerStats;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  if (self->_controllerStats)
    PBDataWriterWriteSubmessage();
  if (self->_linkQualSample)
    PBDataWriterWriteSubmessage();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_scores;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_btleConnections;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

  if (self->_apProfile)
    PBDataWriterWriteStringField();
  if (self->_awdlIfStats)
    PBDataWriterWriteSubmessage();
  if (self->_apIfStats)
    PBDataWriterWriteSubmessage();
  if (self->_nanIfStats)
    PBDataWriterWriteSubmessage();
  if (self->_irIfStats)
    PBDataWriterWriteSubmessage();

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
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 112) |= 1u;
  }
  v26 = v4;
  if (-[WiFiAnalyticsAWDWiFiNWActivity activitiesCount](self, "activitiesCount"))
  {
    objc_msgSend(v26, "clearActivities");
    v5 = -[WiFiAnalyticsAWDWiFiNWActivity activitiesCount](self, "activitiesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[WiFiAnalyticsAWDWiFiNWActivity activitiesAtIndex:](self, "activitiesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addActivities:", v8);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivity interfaceStatsCount](self, "interfaceStatsCount"))
  {
    objc_msgSend(v26, "clearInterfaceStats");
    v9 = -[WiFiAnalyticsAWDWiFiNWActivity interfaceStatsCount](self, "interfaceStatsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[WiFiAnalyticsAWDWiFiNWActivity interfaceStatsAtIndex:](self, "interfaceStatsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addInterfaceStats:", v12);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivity peerStatsCount](self, "peerStatsCount"))
  {
    objc_msgSend(v26, "clearPeerStats");
    v13 = -[WiFiAnalyticsAWDWiFiNWActivity peerStatsCount](self, "peerStatsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[WiFiAnalyticsAWDWiFiNWActivity peerStatsAtIndex:](self, "peerStatsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addPeerStats:", v16);

      }
    }
  }
  if (self->_controllerStats)
    objc_msgSend(v26, "setControllerStats:");
  if (self->_linkQualSample)
    objc_msgSend(v26, "setLinkQualSample:");
  if (-[WiFiAnalyticsAWDWiFiNWActivity scoresCount](self, "scoresCount"))
  {
    objc_msgSend(v26, "clearScores");
    v17 = -[WiFiAnalyticsAWDWiFiNWActivity scoresCount](self, "scoresCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[WiFiAnalyticsAWDWiFiNWActivity scoreAtIndex:](self, "scoreAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addScore:", v20);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivity btleConnectionsCount](self, "btleConnectionsCount"))
  {
    objc_msgSend(v26, "clearBtleConnections");
    v21 = -[WiFiAnalyticsAWDWiFiNWActivity btleConnectionsCount](self, "btleConnectionsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[WiFiAnalyticsAWDWiFiNWActivity btleConnectionAtIndex:](self, "btleConnectionAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addBtleConnection:", v24);

      }
    }
  }
  if (self->_apProfile)
    objc_msgSend(v26, "setApProfile:");
  v25 = v26;
  if (self->_awdlIfStats)
  {
    objc_msgSend(v26, "setAwdlIfStats:");
    v25 = v26;
  }
  if (self->_apIfStats)
  {
    objc_msgSend(v26, "setApIfStats:");
    v25 = v26;
  }
  if (self->_nanIfStats)
  {
    objc_msgSend(v26, "setNanIfStats:");
    v25 = v26;
  }
  if (self->_irIfStats)
  {
    objc_msgSend(v26, "setIrIfStats:");
    v25 = v26;
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
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 112) |= 1u;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v7 = self->_activities;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v69;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v69 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addActivities:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v9);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v13 = self->_interfaceStats;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v65;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v65 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addInterfaceStats:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v15);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v19 = self->_peerStats;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v61;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v61 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v23), "copyWithZone:", a3);
        objc_msgSend(v6, "addPeerStats:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    }
    while (v21);
  }

  v25 = -[WiFiAnalyticsAWDWiFiNWActivityControllerStats copyWithZone:](self->_controllerStats, "copyWithZone:", a3);
  v26 = (void *)v6[7];
  v6[7] = v25;

  v27 = -[WiFiAnalyticsAWDLinkQualityMeasurements copyWithZone:](self->_linkQualSample, "copyWithZone:", a3);
  v28 = (void *)v6[10];
  v6[10] = v27;

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v29 = self->_scores;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v57;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v57 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v33), "copyWithZone:", a3);
        objc_msgSend(v6, "addScore:", v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    }
    while (v31);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v35 = self->_btleConnections;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v53;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v53 != v38)
          objc_enumerationMutation(v35);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v39), "copyWithZone:", a3, (_QWORD)v52);
        objc_msgSend(v6, "addBtleConnection:", v40);

        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
    }
    while (v37);
  }

  v41 = -[NSString copyWithZone:](self->_apProfile, "copyWithZone:", a3);
  v42 = (void *)v6[4];
  v6[4] = v41;

  v43 = -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats copyWithZone:](self->_awdlIfStats, "copyWithZone:", a3);
  v44 = (void *)v6[5];
  v6[5] = v43;

  v45 = -[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats copyWithZone:](self->_apIfStats, "copyWithZone:", a3);
  v46 = (void *)v6[3];
  v6[3] = v45;

  v47 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats copyWithZone:](self->_nanIfStats, "copyWithZone:", a3);
  v48 = (void *)v6[11];
  v6[11] = v47;

  v49 = -[WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats copyWithZone:](self->_irIfStats, "copyWithZone:", a3);
  v50 = (void *)v6[9];
  v6[9] = v49;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *activities;
  NSMutableArray *interfaceStats;
  NSMutableArray *peerStats;
  WiFiAnalyticsAWDWiFiNWActivityControllerStats *controllerStats;
  WiFiAnalyticsAWDLinkQualityMeasurements *linkQualSample;
  NSMutableArray *scores;
  NSMutableArray *btleConnections;
  NSString *apProfile;
  WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *awdlIfStats;
  WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *apIfStats;
  WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats *nanIfStats;
  WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats *irIfStats;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
LABEL_31:
    v17 = 0;
    goto LABEL_32;
  }
  activities = self->_activities;
  if ((unint64_t)activities | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](activities, "isEqual:"))
  {
    goto LABEL_31;
  }
  interfaceStats = self->_interfaceStats;
  if ((unint64_t)interfaceStats | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](interfaceStats, "isEqual:"))
      goto LABEL_31;
  }
  peerStats = self->_peerStats;
  if ((unint64_t)peerStats | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](peerStats, "isEqual:"))
      goto LABEL_31;
  }
  controllerStats = self->_controllerStats;
  if ((unint64_t)controllerStats | *((_QWORD *)v4 + 7))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityControllerStats isEqual:](controllerStats, "isEqual:"))
      goto LABEL_31;
  }
  linkQualSample = self->_linkQualSample;
  if ((unint64_t)linkQualSample | *((_QWORD *)v4 + 10))
  {
    if (!-[WiFiAnalyticsAWDLinkQualityMeasurements isEqual:](linkQualSample, "isEqual:"))
      goto LABEL_31;
  }
  scores = self->_scores;
  if ((unint64_t)scores | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](scores, "isEqual:"))
      goto LABEL_31;
  }
  btleConnections = self->_btleConnections;
  if ((unint64_t)btleConnections | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](btleConnections, "isEqual:"))
      goto LABEL_31;
  }
  apProfile = self->_apProfile;
  if ((unint64_t)apProfile | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](apProfile, "isEqual:"))
      goto LABEL_31;
  }
  awdlIfStats = self->_awdlIfStats;
  if ((unint64_t)awdlIfStats | *((_QWORD *)v4 + 5))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats isEqual:](awdlIfStats, "isEqual:"))
      goto LABEL_31;
  }
  apIfStats = self->_apIfStats;
  if ((unint64_t)apIfStats | *((_QWORD *)v4 + 3))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats isEqual:](apIfStats, "isEqual:"))
      goto LABEL_31;
  }
  nanIfStats = self->_nanIfStats;
  if ((unint64_t)nanIfStats | *((_QWORD *)v4 + 11))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats isEqual:](nanIfStats, "isEqual:"))
      goto LABEL_31;
  }
  irIfStats = self->_irIfStats;
  if ((unint64_t)irIfStats | *((_QWORD *)v4 + 9))
    v17 = -[WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats isEqual:](irIfStats, "isEqual:");
  else
    v17 = 1;
LABEL_32:

  return v17;
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
  NSUInteger v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_activities, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_interfaceStats, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_peerStats, "hash");
  v7 = -[WiFiAnalyticsAWDWiFiNWActivityControllerStats hash](self->_controllerStats, "hash");
  v8 = v7 ^ -[WiFiAnalyticsAWDLinkQualityMeasurements hash](self->_linkQualSample, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_scores, "hash");
  v10 = -[NSMutableArray hash](self->_btleConnections, "hash");
  v11 = v10 ^ -[NSString hash](self->_apProfile, "hash");
  v12 = v11 ^ -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats hash](self->_awdlIfStats, "hash");
  v13 = v9 ^ v12 ^ -[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats hash](self->_apIfStats, "hash");
  v14 = -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats hash](self->_nanIfStats, "hash");
  return v13 ^ v14 ^ -[WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats hash](self->_irIfStats, "hash");
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
  WiFiAnalyticsAWDWiFiNWActivityControllerStats *controllerStats;
  id v22;
  WiFiAnalyticsAWDLinkQualityMeasurements *linkQualSample;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *awdlIfStats;
  id v36;
  WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *apIfStats;
  id v38;
  WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats *nanIfStats;
  id v40;
  WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats *irIfStats;
  id v42;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v6);
        -[WiFiAnalyticsAWDWiFiNWActivity addActivities:](self, "addActivities:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v8);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v11 = v5[8];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(v11);
        -[WiFiAnalyticsAWDWiFiNWActivity addInterfaceStats:](self, "addInterfaceStats:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v13);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v16 = v5[12];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v52 != v19)
          objc_enumerationMutation(v16);
        -[WiFiAnalyticsAWDWiFiNWActivity addPeerStats:](self, "addPeerStats:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v18);
  }

  controllerStats = self->_controllerStats;
  v22 = v5[7];
  if (controllerStats)
  {
    if (v22)
      -[WiFiAnalyticsAWDWiFiNWActivityControllerStats mergeFrom:](controllerStats, "mergeFrom:");
  }
  else if (v22)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setControllerStats:](self, "setControllerStats:");
  }
  linkQualSample = self->_linkQualSample;
  v24 = v5[10];
  if (linkQualSample)
  {
    if (v24)
      -[WiFiAnalyticsAWDLinkQualityMeasurements mergeFrom:](linkQualSample, "mergeFrom:");
  }
  else if (v24)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setLinkQualSample:](self, "setLinkQualSample:");
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = v5[13];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v48;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v48 != v28)
          objc_enumerationMutation(v25);
        -[WiFiAnalyticsAWDWiFiNWActivity addScore:](self, "addScore:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * m));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    }
    while (v27);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v30 = v5[6];
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v44;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(v30);
        -[WiFiAnalyticsAWDWiFiNWActivity addBtleConnection:](self, "addBtleConnection:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * n), (_QWORD)v43);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    }
    while (v32);
  }

  if (v5[4])
    -[WiFiAnalyticsAWDWiFiNWActivity setApProfile:](self, "setApProfile:");
  awdlIfStats = self->_awdlIfStats;
  v36 = v5[5];
  if (awdlIfStats)
  {
    if (v36)
      -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats mergeFrom:](awdlIfStats, "mergeFrom:");
  }
  else if (v36)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setAwdlIfStats:](self, "setAwdlIfStats:");
  }
  apIfStats = self->_apIfStats;
  v38 = v5[3];
  if (apIfStats)
  {
    if (v38)
      -[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats mergeFrom:](apIfStats, "mergeFrom:");
  }
  else if (v38)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setApIfStats:](self, "setApIfStats:");
  }
  nanIfStats = self->_nanIfStats;
  v40 = v5[11];
  if (nanIfStats)
  {
    if (v40)
      -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats mergeFrom:](nanIfStats, "mergeFrom:");
  }
  else if (v40)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setNanIfStats:](self, "setNanIfStats:");
  }
  irIfStats = self->_irIfStats;
  v42 = v5[9];
  if (irIfStats)
  {
    if (v42)
      -[WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats mergeFrom:](irIfStats, "mergeFrom:");
  }
  else if (v42)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setIrIfStats:](self, "setIrIfStats:");
  }

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
  objc_storeStrong((id *)&self->_activities, a3);
}

- (NSMutableArray)interfaceStats
{
  return self->_interfaceStats;
}

- (void)setInterfaceStats:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceStats, a3);
}

- (NSMutableArray)peerStats
{
  return self->_peerStats;
}

- (void)setPeerStats:(id)a3
{
  objc_storeStrong((id *)&self->_peerStats, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityControllerStats)controllerStats
{
  return self->_controllerStats;
}

- (void)setControllerStats:(id)a3
{
  objc_storeStrong((id *)&self->_controllerStats, a3);
}

- (WiFiAnalyticsAWDLinkQualityMeasurements)linkQualSample
{
  return self->_linkQualSample;
}

- (void)setLinkQualSample:(id)a3
{
  objc_storeStrong((id *)&self->_linkQualSample, a3);
}

- (NSMutableArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (NSMutableArray)btleConnections
{
  return self->_btleConnections;
}

- (void)setBtleConnections:(id)a3
{
  objc_storeStrong((id *)&self->_btleConnections, a3);
}

- (NSString)apProfile
{
  return self->_apProfile;
}

- (void)setApProfile:(id)a3
{
  objc_storeStrong((id *)&self->_apProfile, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats)awdlIfStats
{
  return self->_awdlIfStats;
}

- (void)setAwdlIfStats:(id)a3
{
  objc_storeStrong((id *)&self->_awdlIfStats, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats)apIfStats
{
  return self->_apIfStats;
}

- (void)setApIfStats:(id)a3
{
  objc_storeStrong((id *)&self->_apIfStats, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats)nanIfStats
{
  return self->_nanIfStats;
}

- (void)setNanIfStats:(id)a3
{
  objc_storeStrong((id *)&self->_nanIfStats, a3);
}

- (WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats)irIfStats
{
  return self->_irIfStats;
}

- (void)setIrIfStats:(id)a3
{
  objc_storeStrong((id *)&self->_irIfStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_peerStats, 0);
  objc_storeStrong((id *)&self->_nanIfStats, 0);
  objc_storeStrong((id *)&self->_linkQualSample, 0);
  objc_storeStrong((id *)&self->_irIfStats, 0);
  objc_storeStrong((id *)&self->_interfaceStats, 0);
  objc_storeStrong((id *)&self->_controllerStats, 0);
  objc_storeStrong((id *)&self->_btleConnections, 0);
  objc_storeStrong((id *)&self->_awdlIfStats, 0);
  objc_storeStrong((id *)&self->_apProfile, 0);
  objc_storeStrong((id *)&self->_apIfStats, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end
