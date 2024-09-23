@implementation AWDWiFiDPSEpilogue

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiDPSEpilogue setChanges:](self, "setChanges:", 0);
  -[AWDWiFiDPSEpilogue setAssociationChanges:](self, "setAssociationChanges:", 0);
  -[AWDWiFiDPSEpilogue setQDpsStats:](self, "setQDpsStats:", 0);
  -[AWDWiFiDPSEpilogue setSymptomsDnsStats:](self, "setSymptomsDnsStats:", 0);
  -[AWDWiFiDPSEpilogue setDiscoveredPeerInfo:](self, "setDiscoveredPeerInfo:", 0);
  -[AWDWiFiDPSEpilogue setAccessPointInfos:](self, "setAccessPointInfos:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSEpilogue;
  -[AWDWiFiDPSEpilogue dealloc](&v3, sel_dealloc);
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
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E5C8 + a3);
}

- (int)StringAsBeforeAction:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAllAcFunctional")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kSomeAcFunctional")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNoAcFunctional")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kNotAssociated")))
    return 3;
  return 0;
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
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  }
  else
  {
    result = CFSTR("kNone");
    switch(a3)
    {
      case 0:
        return result;
      case 2:
        result = CFSTR("kFullWatchdog");
        break;
      case 4:
        result = CFSTR("kFastDPSWatchdog");
        break;
      case 8:
        result = CFSTR("kNoneNoFullWatchdogBudget");
        break;
      default:
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    }
  }
  return result;
}

- (int)StringAsAction:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNone")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kFullWatchdog")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kFastDPSWatchdog")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNoneNoFullWatchdogBudget")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNoneNoFastWatchdogBudget")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kUserChanged")) & 1) != 0)
    return 32;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kSymptomsdDPSWatchdog")) & 1) != 0)
    return 64;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kSymptomsdDPSReassoc")))
    return 128;
  return 0;
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
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E5C8 + a3);
}

- (int)StringAsAfterRecommendedAction:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kAllAcFunctional")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kSomeAcFunctional")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kNoAcFunctional")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kNotAssociated")))
    return 3;
  return 0;
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
  NSMutableArray *associationChanges;

  associationChanges = self->_associationChanges;
  if (!associationChanges)
  {
    associationChanges = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_associationChanges = associationChanges;
  }
  -[NSMutableArray addObject:](associationChanges, "addObject:", a3);
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
  if (!a3)
    return CFSTR("kDPEStudyTypeDataStall");
  if (a3 == 1)
    return CFSTR("kDPEStudyTypeSymptomsDps");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsStudyType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDPEStudyTypeDataStall")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("kDPEStudyTypeSymptomsDps"));
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
  NSMutableArray *accessPointInfos;

  accessPointInfos = self->_accessPointInfos;
  if (!accessPointInfos)
  {
    accessPointInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_accessPointInfos = accessPointInfos;
  }
  -[NSMutableArray addObject:](accessPointInfos, "addObject:", a3);
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
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSEpilogue;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiDPSEpilogue description](&v3, sel_description), -[AWDWiFiDPSEpilogue dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t beforeAction;
  uint64_t v6;
  int action;
  const __CFString *v8;
  uint64_t afterRecommendedAction;
  uint64_t v10;
  AWDWADiagnosisActionAssociationDifferences *changes;
  void *v12;
  NSMutableArray *associationChanges;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  AWDWAQuickDpsStats *qDpsStats;
  char v19;
  AWDWASymptomsDnsStats *symptomsDnsStats;
  AWDWAPeerDiscoveryInfo *discoveredPeerInfo;
  void *v22;
  NSMutableArray *accessPointInfos;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  int studyType;
  const __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
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
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_beforeAction);
  else
    v6 = (uint64_t)*(&off_24C10E5C8 + beforeAction);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("beforeAction"));
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
        v8 = CFSTR("kSymptomsdDPSWatchdog");
        goto LABEL_26;
      }
      if (action == 128)
      {
        v8 = CFSTR("kSymptomsdDPSReassoc");
        goto LABEL_26;
      }
    }
    else
    {
      if (action == 16)
      {
        v8 = CFSTR("kNoneNoFastWatchdogBudget");
        goto LABEL_26;
      }
      if (action == 32)
      {
        v8 = CFSTR("kUserChanged");
        goto LABEL_26;
      }
    }
LABEL_25:
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_action);
  }
  else
  {
    v8 = CFSTR("kNone");
    switch(action)
    {
      case 0:
        break;
      case 2:
        v8 = CFSTR("kFullWatchdog");
        break;
      case 4:
        v8 = CFSTR("kFastDPSWatchdog");
        break;
      case 8:
        v8 = CFSTR("kNoneNoFullWatchdogBudget");
        break;
      default:
        goto LABEL_25;
    }
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("action"));
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_31;
LABEL_27:
  afterRecommendedAction = self->_afterRecommendedAction;
  if (afterRecommendedAction >= 4)
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_afterRecommendedAction);
  else
    v10 = (uint64_t)*(&off_24C10E5C8 + afterRecommendedAction);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("afterRecommendedAction"));
LABEL_31:
  changes = self->_changes;
  if (changes)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWADiagnosisActionAssociationDifferences dictionaryRepresentation](changes, "dictionaryRepresentation"), CFSTR("changes"));
  if (-[NSMutableArray count](self->_associationChanges, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_associationChanges, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    associationChanges = self->_associationChanges;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](associationChanges, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(associationChanges);
          objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](associationChanges, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v15);
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("associationChanges"));

  }
  qDpsStats = self->_qDpsStats;
  if (qDpsStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWAQuickDpsStats dictionaryRepresentation](qDpsStats, "dictionaryRepresentation"), CFSTR("qDpsStats"));
  v19 = (char)self->_has;
  if ((v19 & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_actionIntVal), CFSTR("actionIntVal"));
    v19 = (char)self->_has;
    if ((v19 & 0x20) == 0)
    {
LABEL_46:
      if ((v19 & 0x40) == 0)
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
      v30 = CFSTR("kDPEStudyTypeSymptomsDps");
    else
      v30 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_studyType);
  }
  else
  {
    v30 = CFSTR("kDPEStudyTypeDataStall");
  }
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("studyType"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_47:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAssociatedAtStudyEnd), CFSTR("isAssociatedAtStudyEnd"));
LABEL_48:
  symptomsDnsStats = self->_symptomsDnsStats;
  if (symptomsDnsStats)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWASymptomsDnsStats dictionaryRepresentation](symptomsDnsStats, "dictionaryRepresentation"), CFSTR("symptomsDnsStats"));
  discoveredPeerInfo = self->_discoveredPeerInfo;
  if (discoveredPeerInfo)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWAPeerDiscoveryInfo dictionaryRepresentation](discoveredPeerInfo, "dictionaryRepresentation"), CFSTR("discoveredPeerInfo"));
  if (-[NSMutableArray count](self->_accessPointInfos, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_accessPointInfos, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    accessPointInfos = self->_accessPointInfos;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](accessPointInfos, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(accessPointInfos);
          objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](accessPointInfos, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v25);
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("accessPointInfo"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSEpilogueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *associationChanges;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  NSMutableArray *accessPointInfos;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
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
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  associationChanges = self->_associationChanges;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](associationChanges, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(associationChanges);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](associationChanges, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }
  if (self->_qDpsStats)
    PBDataWriterWriteSubmessage();
  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v10 = (char)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_19:
      if ((v10 & 0x40) == 0)
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
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  accessPointInfos = self->_accessPointInfos;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](accessPointInfos, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(accessPointInfos);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](accessPointInfos, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 100) |= 1u;
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
  *((_DWORD *)a3 + 12) = self->_beforeAction;
  *((_BYTE *)a3 + 100) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_29:
  *((_DWORD *)a3 + 6) = self->_action;
  *((_BYTE *)a3 + 100) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 8) = self->_afterRecommendedAction;
    *((_BYTE *)a3 + 100) |= 8u;
  }
LABEL_6:
  if (self->_changes)
    objc_msgSend(a3, "setChanges:");
  if (-[AWDWiFiDPSEpilogue associationChangesCount](self, "associationChangesCount"))
  {
    objc_msgSend(a3, "clearAssociationChanges");
    v6 = -[AWDWiFiDPSEpilogue associationChangesCount](self, "associationChangesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addAssociationChanges:", -[AWDWiFiDPSEpilogue associationChangesAtIndex:](self, "associationChangesAtIndex:", i));
    }
  }
  if (self->_qDpsStats)
    objc_msgSend(a3, "setQDpsStats:");
  v9 = (char)self->_has;
  if ((v9 & 4) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_actionIntVal;
    *((_BYTE *)a3 + 100) |= 4u;
    v9 = (char)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_16:
      if ((v9 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 20) = self->_studyType;
  *((_BYTE *)a3 + 100) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    *((_BYTE *)a3 + 96) = self->_isAssociatedAtStudyEnd;
    *((_BYTE *)a3 + 100) |= 0x40u;
  }
LABEL_18:
  if (self->_symptomsDnsStats)
    objc_msgSend(a3, "setSymptomsDnsStats:");
  if (self->_discoveredPeerInfo)
    objc_msgSend(a3, "setDiscoveredPeerInfo:");
  if (-[AWDWiFiDPSEpilogue accessPointInfosCount](self, "accessPointInfosCount"))
  {
    objc_msgSend(a3, "clearAccessPointInfos");
    v10 = -[AWDWiFiDPSEpilogue accessPointInfosCount](self, "accessPointInfosCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addAccessPointInfo:", -[AWDWiFiDPSEpilogue accessPointInfoAtIndex:](self, "accessPointInfoAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *associationChanges;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  NSMutableArray *accessPointInfos;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
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

  *(_QWORD *)(v6 + 56) = -[AWDWADiagnosisActionAssociationDifferences copyWithZone:](self->_changes, "copyWithZone:", a3);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  associationChanges = self->_associationChanges;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](associationChanges, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(associationChanges);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAssociationChanges:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](associationChanges, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  *(_QWORD *)(v6 + 72) = -[AWDWAQuickDpsStats copyWithZone:](self->_qDpsStats, "copyWithZone:", a3);
  v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_actionIntVal;
    *(_BYTE *)(v6 + 100) |= 4u;
    v14 = (char)self->_has;
    if ((v14 & 0x20) == 0)
    {
LABEL_15:
      if ((v14 & 0x40) == 0)
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

  *(_QWORD *)(v6 + 88) = -[AWDWASymptomsDnsStats copyWithZone:](self->_symptomsDnsStats, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 64) = -[AWDWAPeerDiscoveryInfo copyWithZone:](self->_discoveredPeerInfo, "copyWithZone:", a3);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  accessPointInfos = self->_accessPointInfos;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](accessPointInfos, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(accessPointInfos);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAccessPointInfo:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](accessPointInfos, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDWADiagnosisActionAssociationDifferences *changes;
  NSMutableArray *associationChanges;
  AWDWAQuickDpsStats *qDpsStats;
  AWDWASymptomsDnsStats *symptomsDnsStats;
  AWDWAPeerDiscoveryInfo *discoveredPeerInfo;
  NSMutableArray *accessPointInfos;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 100) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 100) & 1) != 0)
    {
      goto LABEL_42;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 100) & 0x10) == 0 || self->_beforeAction != *((_DWORD *)a3 + 12))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 100) & 0x10) != 0)
    {
      goto LABEL_42;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 100) & 2) == 0 || self->_action != *((_DWORD *)a3 + 6))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 100) & 2) != 0)
    {
      goto LABEL_42;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 100) & 8) == 0 || self->_afterRecommendedAction != *((_DWORD *)a3 + 8))
        goto LABEL_42;
    }
    else if ((*((_BYTE *)a3 + 100) & 8) != 0)
    {
      goto LABEL_42;
    }
    changes = self->_changes;
    if (!((unint64_t)changes | *((_QWORD *)a3 + 7))
      || (v5 = -[AWDWADiagnosisActionAssociationDifferences isEqual:](changes, "isEqual:")) != 0)
    {
      associationChanges = self->_associationChanges;
      if (!((unint64_t)associationChanges | *((_QWORD *)a3 + 5))
        || (v5 = -[NSMutableArray isEqual:](associationChanges, "isEqual:")) != 0)
      {
        qDpsStats = self->_qDpsStats;
        if (!((unint64_t)qDpsStats | *((_QWORD *)a3 + 9))
          || (v5 = -[AWDWAQuickDpsStats isEqual:](qDpsStats, "isEqual:")) != 0)
        {
          if ((*(_BYTE *)&self->_has & 4) != 0)
          {
            if ((*((_BYTE *)a3 + 100) & 4) == 0 || self->_actionIntVal != *((_DWORD *)a3 + 7))
              goto LABEL_42;
          }
          else if ((*((_BYTE *)a3 + 100) & 4) != 0)
          {
            goto LABEL_42;
          }
          if ((*(_BYTE *)&self->_has & 0x20) != 0)
          {
            if ((*((_BYTE *)a3 + 100) & 0x20) == 0 || self->_studyType != *((_DWORD *)a3 + 20))
              goto LABEL_42;
          }
          else if ((*((_BYTE *)a3 + 100) & 0x20) != 0)
          {
            goto LABEL_42;
          }
          if ((*(_BYTE *)&self->_has & 0x40) != 0)
          {
            if ((*((_BYTE *)a3 + 100) & 0x40) != 0)
            {
              if (self->_isAssociatedAtStudyEnd)
              {
                if (!*((_BYTE *)a3 + 96))
                  goto LABEL_42;
                goto LABEL_48;
              }
              if (!*((_BYTE *)a3 + 96))
              {
LABEL_48:
                symptomsDnsStats = self->_symptomsDnsStats;
                if (!((unint64_t)symptomsDnsStats | *((_QWORD *)a3 + 11))
                  || (v5 = -[AWDWASymptomsDnsStats isEqual:](symptomsDnsStats, "isEqual:")) != 0)
                {
                  discoveredPeerInfo = self->_discoveredPeerInfo;
                  if (!((unint64_t)discoveredPeerInfo | *((_QWORD *)a3 + 8))
                    || (v5 = -[AWDWAPeerDiscoveryInfo isEqual:](discoveredPeerInfo, "isEqual:")) != 0)
                  {
                    accessPointInfos = self->_accessPointInfos;
                    if ((unint64_t)accessPointInfos | *((_QWORD *)a3 + 2))
                      LOBYTE(v5) = -[NSMutableArray isEqual:](accessPointInfos, "isEqual:");
                    else
                      LOBYTE(v5) = 1;
                  }
                }
                return v5;
              }
            }
          }
          else if ((*((_BYTE *)a3 + 100) & 0x40) == 0)
          {
            goto LABEL_48;
          }
LABEL_42:
          LOBYTE(v5) = 0;
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
  v7 = -[AWDWADiagnosisActionAssociationDifferences hash](self->_changes, "hash");
  v8 = -[NSMutableArray hash](self->_associationChanges, "hash");
  v9 = -[AWDWAQuickDpsStats hash](self->_qDpsStats, "hash");
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
  v14 = v10 ^ v11 ^ v12 ^ -[AWDWASymptomsDnsStats hash](self->_symptomsDnsStats, "hash");
  v15 = v13 ^ v14 ^ -[AWDWAPeerDiscoveryInfo hash](self->_discoveredPeerInfo, "hash");
  return v15 ^ -[NSMutableArray hash](self->_accessPointInfos, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  AWDWADiagnosisActionAssociationDifferences *changes;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  AWDWAQuickDpsStats *qDpsStats;
  uint64_t v14;
  char v15;
  AWDWASymptomsDnsStats *symptomsDnsStats;
  uint64_t v17;
  AWDWAPeerDiscoveryInfo *discoveredPeerInfo;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
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
  v5 = *((_BYTE *)a3 + 100);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 100);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 100) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_beforeAction = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)a3 + 100);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_action = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 100) & 8) != 0)
  {
LABEL_5:
    self->_afterRecommendedAction = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  changes = self->_changes;
  v7 = *((_QWORD *)a3 + 7);
  if (changes)
  {
    if (v7)
      -[AWDWADiagnosisActionAssociationDifferences mergeFrom:](changes, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDWiFiDPSEpilogue setChanges:](self, "setChanges:");
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = (void *)*((_QWORD *)a3 + 5);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        -[AWDWiFiDPSEpilogue addAssociationChanges:](self, "addAssociationChanges:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }
  qDpsStats = self->_qDpsStats;
  v14 = *((_QWORD *)a3 + 9);
  if (qDpsStats)
  {
    if (v14)
      -[AWDWAQuickDpsStats mergeFrom:](qDpsStats, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDWiFiDPSEpilogue setQDpsStats:](self, "setQDpsStats:");
  }
  v15 = *((_BYTE *)a3 + 100);
  if ((v15 & 4) != 0)
  {
    self->_actionIntVal = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v15 = *((_BYTE *)a3 + 100);
    if ((v15 & 0x20) == 0)
    {
LABEL_29:
      if ((v15 & 0x40) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)a3 + 100) & 0x20) == 0)
  {
    goto LABEL_29;
  }
  self->_studyType = *((_DWORD *)a3 + 20);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 100) & 0x40) != 0)
  {
LABEL_30:
    self->_isAssociatedAtStudyEnd = *((_BYTE *)a3 + 96);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_31:
  symptomsDnsStats = self->_symptomsDnsStats;
  v17 = *((_QWORD *)a3 + 11);
  if (symptomsDnsStats)
  {
    if (v17)
      -[AWDWASymptomsDnsStats mergeFrom:](symptomsDnsStats, "mergeFrom:");
  }
  else if (v17)
  {
    -[AWDWiFiDPSEpilogue setSymptomsDnsStats:](self, "setSymptomsDnsStats:");
  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  v19 = *((_QWORD *)a3 + 8);
  if (discoveredPeerInfo)
  {
    if (v19)
      -[AWDWAPeerDiscoveryInfo mergeFrom:](discoveredPeerInfo, "mergeFrom:");
  }
  else if (v19)
  {
    -[AWDWiFiDPSEpilogue setDiscoveredPeerInfo:](self, "setDiscoveredPeerInfo:");
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = (void *)*((_QWORD *)a3 + 2);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[AWDWiFiDPSEpilogue addAccessPointInfo:](self, "addAccessPointInfo:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v22);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWADiagnosisActionAssociationDifferences)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)associationChanges
{
  return self->_associationChanges;
}

- (void)setAssociationChanges:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDWAQuickDpsStats)qDpsStats
{
  return self->_qDpsStats;
}

- (void)setQDpsStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unsigned)actionIntVal
{
  return self->_actionIntVal;
}

- (BOOL)isAssociatedAtStudyEnd
{
  return self->_isAssociatedAtStudyEnd;
}

- (AWDWASymptomsDnsStats)symptomsDnsStats
{
  return self->_symptomsDnsStats;
}

- (void)setSymptomsDnsStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (AWDWAPeerDiscoveryInfo)discoveredPeerInfo
{
  return self->_discoveredPeerInfo;
}

- (void)setDiscoveredPeerInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)accessPointInfos
{
  return self->_accessPointInfos;
}

- (void)setAccessPointInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
