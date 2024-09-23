@implementation WiFiAnalyticsAWDWiFiDPSEpilogue

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

- (int)beforeAction
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_beforeAction;
  else
    return 0;
}

- (void)setBeforeAction:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_beforeAction = a3;
}

- (void)setHasBeforeAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBeforeAction
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)beforeActionAsString:(int)a3
{
  if (a3 < 4)
    return off_24CDDDFA0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBeforeAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kAllAcFunctional")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSomeAcFunctional")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kNoAcFunctional")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kNotAssociated")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)action
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_action;
  else
    return 0;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)actionAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 15)
  {
    if (a3 > 63)
    {
      if (a3 == 64)
        return CFSTR("kSymptomsdDPSWatchdog");
      if (a3 == 128)
        return CFSTR("kSymptomsdDPSReassoc");
    }
    else
    {
      if (a3 == 16)
        return CFSTR("kNoneNoFastWatchdogBudget");
      if (a3 == 32)
        return CFSTR("kUserChanged");
    }
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("kNone");
    switch(a3)
    {
      case 0:
        return v3;
      case 2:
        v3 = CFSTR("kFullWatchdog");
        return v3;
      case 4:
        result = CFSTR("kFastDPSWatchdog");
        break;
      case 8:
        result = CFSTR("kNoneNoFullWatchdogBudget");
        break;
      default:
        goto LABEL_17;
    }
  }
  return result;
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kFullWatchdog")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kFastDPSWatchdog")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kNoneNoFullWatchdogBudget")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kNoneNoFastWatchdogBudget")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kUserChanged")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsdDPSWatchdog")) & 1) != 0)
  {
    v4 = 64;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsdDPSReassoc")))
  {
    v4 = 128;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)afterRecommendedAction
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_afterRecommendedAction;
  else
    return 0;
}

- (void)setAfterRecommendedAction:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_afterRecommendedAction = a3;
}

- (void)setHasAfterRecommendedAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAfterRecommendedAction
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)afterRecommendedActionAsString:(int)a3
{
  if (a3 < 4)
    return off_24CDDDFA0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAfterRecommendedAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kAllAcFunctional")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSomeAcFunctional")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kNoAcFunctional")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kNotAssociated")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasChanges
{
  return self->_changes != 0;
}

- (void)clearAssociationChanges
{
  -[NSMutableArray removeAllObjects](self->_associationChanges, "removeAllObjects");
}

- (void)addAssociationChanges:(id)a3
{
  id v4;
  NSMutableArray *associationChanges;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  associationChanges = self->_associationChanges;
  v8 = v4;
  if (!associationChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_associationChanges;
    self->_associationChanges = v6;

    v4 = v8;
    associationChanges = self->_associationChanges;
  }
  -[NSMutableArray addObject:](associationChanges, "addObject:", v4);

}

- (unint64_t)associationChangesCount
{
  return -[NSMutableArray count](self->_associationChanges, "count");
}

- (id)associationChangesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_associationChanges, "objectAtIndex:", a3);
}

+ (Class)associationChangesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasQDpsStats
{
  return self->_qDpsStats != 0;
}

- (void)setActionIntVal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_actionIntVal = a3;
}

- (void)setHasActionIntVal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActionIntVal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)studyType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_studyType;
  else
    return 0;
}

- (void)setStudyType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_studyType = a3;
}

- (void)setHasStudyType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStudyType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)studyTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("kDPEStudyTypeDataStall");
  if (a3 == 1)
  {
    v3 = CFSTR("kDPEStudyTypeSymptomsDps");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsStudyType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDPEStudyTypeDataStall")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kDPEStudyTypeSymptomsDps"));

  return v4;
}

- (void)setIsAssociatedAtStudyEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isAssociatedAtStudyEnd = a3;
}

- (void)setHasIsAssociatedAtStudyEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsAssociatedAtStudyEnd
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasSymptomsDnsStats
{
  return self->_symptomsDnsStats != 0;
}

- (BOOL)hasDiscoveredPeerInfo
{
  return self->_discoveredPeerInfo != 0;
}

- (void)clearAccessPointInfos
{
  -[NSMutableArray removeAllObjects](self->_accessPointInfos, "removeAllObjects");
}

- (void)addAccessPointInfo:(id)a3
{
  id v4;
  NSMutableArray *accessPointInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  accessPointInfos = self->_accessPointInfos;
  v8 = v4;
  if (!accessPointInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_accessPointInfos;
    self->_accessPointInfos = v6;

    v4 = v8;
    accessPointInfos = self->_accessPointInfos;
  }
  -[NSMutableArray addObject:](accessPointInfos, "addObject:", v4);

}

- (unint64_t)accessPointInfosCount
{
  return -[NSMutableArray count](self->_accessPointInfos, "count");
}

- (id)accessPointInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_accessPointInfos, "objectAtIndex:", a3);
}

+ (Class)accessPointInfoType
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSEpilogue;
  -[WiFiAnalyticsAWDWiFiDPSEpilogue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiDPSEpilogue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  uint64_t beforeAction;
  __CFString *v7;
  int action;
  __CFString *v9;
  uint64_t afterRecommendedAction;
  __CFString *v11;
  WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences *changes;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  WiFiAnalyticsAWDWAQuickDpsStats *qDpsStats;
  void *v22;
  char v23;
  void *v24;
  WiFiAnalyticsAWDWASymptomsDnsStats *symptomsDnsStats;
  void *v26;
  WiFiAnalyticsAWDWAPeerDiscoveryInfo *discoveredPeerInfo;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v37;
  int studyType;
  __CFString *v39;
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
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  beforeAction = self->_beforeAction;
  if (beforeAction >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_beforeAction);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_24CDDDFA0[beforeAction];
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("beforeAction"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_31;
    goto LABEL_27;
  }
LABEL_11:
  action = self->_action;
  if (action > 15)
  {
    if (action > 63)
    {
      if (action == 64)
      {
        v9 = CFSTR("kSymptomsdDPSWatchdog");
        goto LABEL_26;
      }
      if (action == 128)
      {
        v9 = CFSTR("kSymptomsdDPSReassoc");
        goto LABEL_26;
      }
    }
    else
    {
      if (action == 16)
      {
        v9 = CFSTR("kNoneNoFastWatchdogBudget");
        goto LABEL_26;
      }
      if (action == 32)
      {
        v9 = CFSTR("kUserChanged");
        goto LABEL_26;
      }
    }
LABEL_25:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_action);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("kNone");
    switch(action)
    {
      case 0:
        break;
      case 2:
        v9 = CFSTR("kFullWatchdog");
        break;
      case 4:
        v9 = CFSTR("kFastDPSWatchdog");
        break;
      case 8:
        v9 = CFSTR("kNoneNoFullWatchdogBudget");
        break;
      default:
        goto LABEL_25;
    }
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("action"));

  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_31;
LABEL_27:
  afterRecommendedAction = self->_afterRecommendedAction;
  if (afterRecommendedAction >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_afterRecommendedAction);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_24CDDDFA0[afterRecommendedAction];
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("afterRecommendedAction"));

LABEL_31:
  changes = self->_changes;
  if (changes)
  {
    -[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences dictionaryRepresentation](changes, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("changes"));

  }
  if (-[NSMutableArray count](self->_associationChanges, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_associationChanges, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v15 = self->_associationChanges;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("associationChanges"));
  }
  qDpsStats = self->_qDpsStats;
  if (qDpsStats)
  {
    -[WiFiAnalyticsAWDWAQuickDpsStats dictionaryRepresentation](qDpsStats, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("qDpsStats"));

  }
  v23 = (char)self->_has;
  if ((v23 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_actionIntVal);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("actionIntVal"));

    v23 = (char)self->_has;
    if ((v23 & 0x20) == 0)
    {
LABEL_46:
      if ((v23 & 0x40) == 0)
        goto LABEL_48;
      goto LABEL_47;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_46;
  }
  studyType = self->_studyType;
  if (studyType)
  {
    if (studyType == 1)
    {
      v39 = CFSTR("kDPEStudyTypeSymptomsDps");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_studyType);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v39 = CFSTR("kDPEStudyTypeDataStall");
  }
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("studyType"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_47:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAssociatedAtStudyEnd);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("isAssociatedAtStudyEnd"));

  }
LABEL_48:
  symptomsDnsStats = self->_symptomsDnsStats;
  if (symptomsDnsStats)
  {
    -[WiFiAnalyticsAWDWASymptomsDnsStats dictionaryRepresentation](symptomsDnsStats, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("symptomsDnsStats"));

  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  if (discoveredPeerInfo)
  {
    -[WiFiAnalyticsAWDWAPeerDiscoveryInfo dictionaryRepresentation](discoveredPeerInfo, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("discoveredPeerInfo"));

  }
  if (-[NSMutableArray count](self->_accessPointInfos, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_accessPointInfos, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v30 = self->_accessPointInfos;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("accessPointInfo"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSEpilogueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  NSMutableArray *v12;
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
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_changes)
    PBDataWriterWriteSubmessage();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_associationChanges;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  if (self->_qDpsStats)
    PBDataWriterWriteSubmessage();
  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = (char)self->_has;
    if ((v11 & 0x20) == 0)
    {
LABEL_19:
      if ((v11 & 0x40) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_20:
    PBDataWriterWriteBOOLField();
LABEL_21:
  if (self->_symptomsDnsStats)
    PBDataWriterWriteSubmessage();
  if (self->_discoveredPeerInfo)
    PBDataWriterWriteSubmessage();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_accessPointInfos;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  id v15;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 100) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_beforeAction;
  *((_BYTE *)v4 + 100) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_29:
  *((_DWORD *)v4 + 6) = self->_action;
  *((_BYTE *)v4 + 100) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 8) = self->_afterRecommendedAction;
    *((_BYTE *)v4 + 100) |= 8u;
  }
LABEL_6:
  v15 = v4;
  if (self->_changes)
    objc_msgSend(v4, "setChanges:");
  if (-[WiFiAnalyticsAWDWiFiDPSEpilogue associationChangesCount](self, "associationChangesCount"))
  {
    objc_msgSend(v15, "clearAssociationChanges");
    v6 = -[WiFiAnalyticsAWDWiFiDPSEpilogue associationChangesCount](self, "associationChangesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[WiFiAnalyticsAWDWiFiDPSEpilogue associationChangesAtIndex:](self, "associationChangesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addAssociationChanges:", v9);

      }
    }
  }
  if (self->_qDpsStats)
    objc_msgSend(v15, "setQDpsStats:");
  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v15 + 7) = self->_actionIntVal;
    *((_BYTE *)v15 + 100) |= 4u;
    v10 = (char)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_16:
      if ((v10 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v15 + 20) = self->_studyType;
  *((_BYTE *)v15 + 100) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    *((_BYTE *)v15 + 96) = self->_isAssociatedAtStudyEnd;
    *((_BYTE *)v15 + 100) |= 0x40u;
  }
LABEL_18:
  if (self->_symptomsDnsStats)
    objc_msgSend(v15, "setSymptomsDnsStats:");
  if (self->_discoveredPeerInfo)
    objc_msgSend(v15, "setDiscoveredPeerInfo:");
  if (-[WiFiAnalyticsAWDWiFiDPSEpilogue accessPointInfosCount](self, "accessPointInfosCount"))
  {
    objc_msgSend(v15, "clearAccessPointInfos");
    v11 = -[WiFiAnalyticsAWDWiFiDPSEpilogue accessPointInfosCount](self, "accessPointInfosCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[WiFiAnalyticsAWDWiFiDPSEpilogue accessPointInfoAtIndex:](self, "accessPointInfoAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addAccessPointInfo:", v14);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 100) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_beforeAction;
  *(_BYTE *)(v5 + 100) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_27:
  *(_DWORD *)(v5 + 24) = self->_action;
  *(_BYTE *)(v5 + 100) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_afterRecommendedAction;
    *(_BYTE *)(v5 + 100) |= 8u;
  }
LABEL_6:
  v8 = -[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences copyWithZone:](self->_changes, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v8;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = self->_associationChanges;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAssociationChanges:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  v16 = -[WiFiAnalyticsAWDWAQuickDpsStats copyWithZone:](self->_qDpsStats, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v16;

  v18 = (char)self->_has;
  if ((v18 & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_actionIntVal;
    *(_BYTE *)(v6 + 100) |= 4u;
    v18 = (char)self->_has;
    if ((v18 & 0x20) == 0)
    {
LABEL_15:
      if ((v18 & 0x40) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 80) = self->_studyType;
  *(_BYTE *)(v6 + 100) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_16:
    *(_BYTE *)(v6 + 96) = self->_isAssociatedAtStudyEnd;
    *(_BYTE *)(v6 + 100) |= 0x40u;
  }
LABEL_17:
  v19 = -[WiFiAnalyticsAWDWASymptomsDnsStats copyWithZone:](self->_symptomsDnsStats, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v19;

  v21 = -[WiFiAnalyticsAWDWAPeerDiscoveryInfo copyWithZone:](self->_discoveredPeerInfo, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v21;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = self->_accessPointInfos;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v6, "addAccessPointInfo:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v25);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences *changes;
  NSMutableArray *associationChanges;
  WiFiAnalyticsAWDWAQuickDpsStats *qDpsStats;
  WiFiAnalyticsAWDWASymptomsDnsStats *symptomsDnsStats;
  WiFiAnalyticsAWDWAPeerDiscoveryInfo *discoveredPeerInfo;
  NSMutableArray *accessPointInfos;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x10) == 0 || self->_beforeAction != *((_DWORD *)v4 + 12))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0 || self->_action != *((_DWORD *)v4 + 6))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) == 0 || self->_afterRecommendedAction != *((_DWORD *)v4 + 8))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
    goto LABEL_52;
  }
  changes = self->_changes;
  if ((unint64_t)changes | *((_QWORD *)v4 + 7)
    && !-[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences isEqual:](changes, "isEqual:"))
  {
    goto LABEL_52;
  }
  associationChanges = self->_associationChanges;
  if ((unint64_t)associationChanges | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](associationChanges, "isEqual:"))
      goto LABEL_52;
  }
  qDpsStats = self->_qDpsStats;
  if ((unint64_t)qDpsStats | *((_QWORD *)v4 + 9))
  {
    if (!-[WiFiAnalyticsAWDWAQuickDpsStats isEqual:](qDpsStats, "isEqual:"))
      goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_actionIntVal != *((_DWORD *)v4 + 7))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x20) == 0 || self->_studyType != *((_DWORD *)v4 + 20))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x40) != 0)
    {
      if (self->_isAssociatedAtStudyEnd)
      {
        if (!*((_BYTE *)v4 + 96))
          goto LABEL_52;
        goto LABEL_46;
      }
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_46;
    }
LABEL_52:
    v11 = 0;
    goto LABEL_53;
  }
  if ((*((_BYTE *)v4 + 100) & 0x40) != 0)
    goto LABEL_52;
LABEL_46:
  symptomsDnsStats = self->_symptomsDnsStats;
  if ((unint64_t)symptomsDnsStats | *((_QWORD *)v4 + 11)
    && !-[WiFiAnalyticsAWDWASymptomsDnsStats isEqual:](symptomsDnsStats, "isEqual:"))
  {
    goto LABEL_52;
  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  if ((unint64_t)discoveredPeerInfo | *((_QWORD *)v4 + 8))
  {
    if (!-[WiFiAnalyticsAWDWAPeerDiscoveryInfo isEqual:](discoveredPeerInfo, "isEqual:"))
      goto LABEL_52;
  }
  accessPointInfos = self->_accessPointInfos;
  if ((unint64_t)accessPointInfos | *((_QWORD *)v4 + 2))
    v11 = -[NSMutableArray isEqual:](accessPointInfos, "isEqual:");
  else
    v11 = 1;
LABEL_53:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_beforeAction;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_action;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_afterRecommendedAction;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences hash](self->_changes, "hash");
  v8 = -[NSMutableArray hash](self->_associationChanges, "hash");
  v9 = -[WiFiAnalyticsAWDWAQuickDpsStats hash](self->_qDpsStats, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_12;
LABEL_15:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_13;
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v10 = 2654435761 * self->_actionIntVal;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_12:
  v11 = 2654435761 * self->_studyType;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_13:
  v12 = 2654435761 * self->_isAssociatedAtStudyEnd;
LABEL_17:
  v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v14 = v10 ^ v11 ^ v12 ^ -[WiFiAnalyticsAWDWASymptomsDnsStats hash](self->_symptomsDnsStats, "hash");
  v15 = v13 ^ v14 ^ -[WiFiAnalyticsAWDWAPeerDiscoveryInfo hash](self->_discoveredPeerInfo, "hash");
  return v15 ^ -[NSMutableArray hash](self->_accessPointInfos, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences *changes;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  WiFiAnalyticsAWDWAQuickDpsStats *qDpsStats;
  uint64_t v15;
  char v16;
  WiFiAnalyticsAWDWASymptomsDnsStats *symptomsDnsStats;
  uint64_t v18;
  WiFiAnalyticsAWDWAPeerDiscoveryInfo *discoveredPeerInfo;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 100);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 100);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_beforeAction = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 0x10u;
  v6 = *((_BYTE *)v4 + 100);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_action = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
LABEL_5:
    self->_afterRecommendedAction = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  changes = self->_changes;
  v8 = *((_QWORD *)v5 + 7);
  if (changes)
  {
    if (v8)
      -[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences mergeFrom:](changes, "mergeFrom:");
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue setChanges:](self, "setChanges:");
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = *((id *)v5 + 5);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        -[WiFiAnalyticsAWDWiFiDPSEpilogue addAssociationChanges:](self, "addAssociationChanges:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

  qDpsStats = self->_qDpsStats;
  v15 = *((_QWORD *)v5 + 9);
  if (qDpsStats)
  {
    if (v15)
      -[WiFiAnalyticsAWDWAQuickDpsStats mergeFrom:](qDpsStats, "mergeFrom:");
  }
  else if (v15)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue setQDpsStats:](self, "setQDpsStats:");
  }
  v16 = *((_BYTE *)v5 + 100);
  if ((v16 & 4) != 0)
  {
    self->_actionIntVal = *((_DWORD *)v5 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v16 = *((_BYTE *)v5 + 100);
    if ((v16 & 0x20) == 0)
    {
LABEL_29:
      if ((v16 & 0x40) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v5 + 100) & 0x20) == 0)
  {
    goto LABEL_29;
  }
  self->_studyType = *((_DWORD *)v5 + 20);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v5 + 100) & 0x40) != 0)
  {
LABEL_30:
    self->_isAssociatedAtStudyEnd = *((_BYTE *)v5 + 96);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_31:
  symptomsDnsStats = self->_symptomsDnsStats;
  v18 = *((_QWORD *)v5 + 11);
  if (symptomsDnsStats)
  {
    if (v18)
      -[WiFiAnalyticsAWDWASymptomsDnsStats mergeFrom:](symptomsDnsStats, "mergeFrom:");
  }
  else if (v18)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue setSymptomsDnsStats:](self, "setSymptomsDnsStats:");
  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  v20 = *((_QWORD *)v5 + 8);
  if (discoveredPeerInfo)
  {
    if (v20)
      -[WiFiAnalyticsAWDWAPeerDiscoveryInfo mergeFrom:](discoveredPeerInfo, "mergeFrom:");
  }
  else if (v20)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue setDiscoveredPeerInfo:](self, "setDiscoveredPeerInfo:");
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = *((id *)v5 + 2);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[WiFiAnalyticsAWDWiFiDPSEpilogue addAccessPointInfo:](self, "addAccessPointInfo:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), (_QWORD)v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v23);
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
  objc_storeStrong((id *)&self->_changes, a3);
}

- (NSMutableArray)associationChanges
{
  return self->_associationChanges;
}

- (void)setAssociationChanges:(id)a3
{
  objc_storeStrong((id *)&self->_associationChanges, a3);
}

- (WiFiAnalyticsAWDWAQuickDpsStats)qDpsStats
{
  return self->_qDpsStats;
}

- (void)setQDpsStats:(id)a3
{
  objc_storeStrong((id *)&self->_qDpsStats, a3);
}

- (unsigned)actionIntVal
{
  return self->_actionIntVal;
}

- (BOOL)isAssociatedAtStudyEnd
{
  return self->_isAssociatedAtStudyEnd;
}

- (WiFiAnalyticsAWDWASymptomsDnsStats)symptomsDnsStats
{
  return self->_symptomsDnsStats;
}

- (void)setSymptomsDnsStats:(id)a3
{
  objc_storeStrong((id *)&self->_symptomsDnsStats, a3);
}

- (WiFiAnalyticsAWDWAPeerDiscoveryInfo)discoveredPeerInfo
{
  return self->_discoveredPeerInfo;
}

- (void)setDiscoveredPeerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredPeerInfo, a3);
}

- (NSMutableArray)accessPointInfos
{
  return self->_accessPointInfos;
}

- (void)setAccessPointInfos:(id)a3
{
  objc_storeStrong((id *)&self->_accessPointInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptomsDnsStats, 0);
  objc_storeStrong((id *)&self->_qDpsStats, 0);
  objc_storeStrong((id *)&self->_discoveredPeerInfo, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_associationChanges, 0);
  objc_storeStrong((id *)&self->_accessPointInfos, 0);
}

@end
