@implementation AWDMPTCPConnectionReport

- (void)dealloc
{
  objc_super v3;

  -[AWDMPTCPConnectionReport setClientId:](self, "setClientId:", 0);
  -[AWDMPTCPConnectionReport setEstablishmentInterfaceName:](self, "setEstablishmentInterfaceName:", 0);
  -[AWDMPTCPConnectionReport setInterfaceReports:](self, "setInterfaceReports:", 0);
  -[AWDMPTCPConnectionReport setSubflowSwitchingReports:](self, "setSubflowSwitchingReports:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPConnectionReport;
  -[AWDMPTCPConnectionReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (BOOL)hasEstablishmentInterfaceName
{
  return self->_establishmentInterfaceName != 0;
}

- (void)setEstablishmentSuccess:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_establishmentSuccess = a3;
}

- (void)setHasEstablishmentSuccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasEstablishmentSuccess
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setEstablishmentFailureError:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_establishmentFailureError = a3;
}

- (void)setHasEstablishmentFailureError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEstablishmentFailureError
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setEstablishmentTcpFallback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_establishmentTcpFallback = a3;
}

- (void)setHasEstablishmentTcpFallback:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasEstablishmentTcpFallback
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setEstablishmentCellularFallback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_establishmentCellularFallback = a3;
}

- (void)setHasEstablishmentCellularFallback:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasEstablishmentCellularFallback
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEstablishmentTime:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_establishmentTime = a3;
}

- (void)setHasEstablishmentTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEstablishmentTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setEstablishmentSynRetransmits:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_establishmentSynRetransmits = a3;
}

- (void)setHasEstablishmentSynRetransmits:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEstablishmentSynRetransmits
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEstablishmentForcedTcpFallback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_establishmentForcedTcpFallback = a3;
}

- (void)setHasEstablishmentForcedTcpFallback:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasEstablishmentForcedTcpFallback
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPostConnectMultiHomed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_postConnectMultiHomed = a3;
}

- (void)setHasPostConnectMultiHomed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasPostConnectMultiHomed
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setPostConnectSingleHomed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_postConnectSingleHomed = a3;
}

- (void)setHasPostConnectSingleHomed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasPostConnectSingleHomed
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setPostConnectSubflowAttemptCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_postConnectSubflowAttemptCount = a3;
}

- (void)setHasPostConnectSubflowAttemptCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPostConnectSubflowAttemptCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPostConnectSubflowMaxSubflowCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_postConnectSubflowMaxSubflowCount = a3;
}

- (void)setHasPostConnectSubflowMaxSubflowCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPostConnectSubflowMaxSubflowCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPostConnectSessionLifetime:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_postConnectSessionLifetime = a3;
}

- (void)setHasPostConnectSessionLifetime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPostConnectSessionLifetime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSubflowSwitchingCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subflowSwitchingCount = a3;
}

- (void)setHasSubflowSwitchingCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubflowSwitchingCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearInterfaceReports
{
  -[NSMutableArray removeAllObjects](self->_interfaceReports, "removeAllObjects");
}

- (void)addInterfaceReports:(id)a3
{
  NSMutableArray *interfaceReports;

  interfaceReports = self->_interfaceReports;
  if (!interfaceReports)
  {
    interfaceReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_interfaceReports = interfaceReports;
  }
  -[NSMutableArray addObject:](interfaceReports, "addObject:", a3);
}

- (unint64_t)interfaceReportsCount
{
  return -[NSMutableArray count](self->_interfaceReports, "count");
}

- (id)interfaceReportsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_interfaceReports, "objectAtIndex:", a3);
}

+ (Class)interfaceReportsType
{
  return (Class)objc_opt_class();
}

- (void)clearSubflowSwitchingReports
{
  -[NSMutableArray removeAllObjects](self->_subflowSwitchingReports, "removeAllObjects");
}

- (void)addSubflowSwitchingReports:(id)a3
{
  NSMutableArray *subflowSwitchingReports;

  subflowSwitchingReports = self->_subflowSwitchingReports;
  if (!subflowSwitchingReports)
  {
    subflowSwitchingReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_subflowSwitchingReports = subflowSwitchingReports;
  }
  -[NSMutableArray addObject:](subflowSwitchingReports, "addObject:", a3);
}

- (unint64_t)subflowSwitchingReportsCount
{
  return -[NSMutableArray count](self->_subflowSwitchingReports, "count");
}

- (id)subflowSwitchingReportsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subflowSwitchingReports, "objectAtIndex:", a3);
}

+ (Class)subflowSwitchingReportsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPConnectionReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMPTCPConnectionReport description](&v3, sel_description), -[AWDMPTCPConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *clientId;
  NSString *establishmentInterfaceName;
  __int16 has;
  void *v7;
  NSMutableArray *interfaceReports;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *subflowSwitchingReports;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  clientId = self->_clientId;
  if (clientId)
    objc_msgSend(v3, "setObject:forKey:", clientId, CFSTR("client_id"));
  establishmentInterfaceName = self->_establishmentInterfaceName;
  if (establishmentInterfaceName)
    objc_msgSend(v3, "setObject:forKey:", establishmentInterfaceName, CFSTR("establishment_interface_name"));
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_establishmentSuccess), CFSTR("establishment_success"));
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_42;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_establishmentFailureError), CFSTR("establishment_failure_error"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_establishmentTcpFallback), CFSTR("establishment_tcp_fallback"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_establishmentCellularFallback), CFSTR("establishment_cellular_fallback"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_establishmentTime), CFSTR("establishment_time"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_establishmentSynRetransmits), CFSTR("establishment_syn_retransmits"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_establishmentForcedTcpFallback), CFSTR("establishment_forced_tcp_fallback"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_postConnectMultiHomed), CFSTR("post_connect_multi_homed"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_postConnectSingleHomed), CFSTR("post_connect_single_homed"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_postConnectSubflowAttemptCount), CFSTR("post_connect_subflow_attempt_count"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_postConnectSubflowMaxSubflowCount), CFSTR("post_connect_subflow_max_subflow_count"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_postConnectSessionLifetime), CFSTR("post_connect_session_lifetime"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_20:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_subflowSwitchingCount), CFSTR("subflow_switching_count"));
LABEL_21:
  if (-[NSMutableArray count](self->_interfaceReports, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_interfaceReports, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    interfaceReports = self->_interfaceReports;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceReports, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(interfaceReports);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceReports, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("interface_reports"));

  }
  if (-[NSMutableArray count](self->_subflowSwitchingReports, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_subflowSwitchingReports, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    subflowSwitchingReports = self->_subflowSwitchingReports;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subflowSwitchingReports, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(subflowSwitchingReports);
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subflowSwitchingReports, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("subflow_switching_reports"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMPTCPConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSMutableArray *interfaceReports;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *subflowSwitchingReports;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_clientId)
    PBDataWriterWriteStringField();
  if (self->_establishmentInterfaceName)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_38;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_20:
    PBDataWriterWriteInt32Field();
LABEL_21:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  interfaceReports = self->_interfaceReports;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceReports, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(interfaceReports);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceReports, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  subflowSwitchingReports = self->_subflowSwitchingReports;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subflowSwitchingReports, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(subflowSwitchingReports);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subflowSwitchingReports, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_WORD *)a3 + 52) |= 4u;
  }
  if (self->_clientId)
    objc_msgSend(a3, "setClientId:");
  if (self->_establishmentInterfaceName)
    objc_msgSend(a3, "setEstablishmentInterfaceName:");
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_BYTE *)a3 + 98) = self->_establishmentSuccess;
    *((_WORD *)a3 + 52) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_32;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 10) = self->_establishmentFailureError;
  *((_WORD *)a3 + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_BYTE *)a3 + 99) = self->_establishmentTcpFallback;
  *((_WORD *)a3 + 52) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_BYTE *)a3 + 96) = self->_establishmentCellularFallback;
  *((_WORD *)a3 + 52) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_establishmentTime;
  *((_WORD *)a3 + 52) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 14) = self->_establishmentSynRetransmits;
  *((_WORD *)a3 + 52) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_BYTE *)a3 + 97) = self->_establishmentForcedTcpFallback;
  *((_WORD *)a3 + 52) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_BYTE *)a3 + 100) = self->_postConnectMultiHomed;
  *((_WORD *)a3 + 52) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)a3 + 101) = self->_postConnectSingleHomed;
  *((_WORD *)a3 + 52) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 18) = self->_postConnectSubflowAttemptCount;
  *((_WORD *)a3 + 52) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      goto LABEL_19;
LABEL_41:
    *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_postConnectSessionLifetime;
    *((_WORD *)a3 + 52) |= 2u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_40:
  *((_DWORD *)a3 + 19) = self->_postConnectSubflowMaxSubflowCount;
  *((_WORD *)a3 + 52) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_41;
LABEL_19:
  if ((has & 0x80) != 0)
  {
LABEL_20:
    *((_DWORD *)a3 + 20) = self->_subflowSwitchingCount;
    *((_WORD *)a3 + 52) |= 0x80u;
  }
LABEL_21:
  if (-[AWDMPTCPConnectionReport interfaceReportsCount](self, "interfaceReportsCount"))
  {
    objc_msgSend(a3, "clearInterfaceReports");
    v6 = -[AWDMPTCPConnectionReport interfaceReportsCount](self, "interfaceReportsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addInterfaceReports:", -[AWDMPTCPConnectionReport interfaceReportsAtIndex:](self, "interfaceReportsAtIndex:", i));
    }
  }
  if (-[AWDMPTCPConnectionReport subflowSwitchingReportsCount](self, "subflowSwitchingReportsCount"))
  {
    objc_msgSend(a3, "clearSubflowSwitchingReports");
    v9 = -[AWDMPTCPConnectionReport subflowSwitchingReportsCount](self, "subflowSwitchingReportsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addSubflowSwitchingReports:", -[AWDMPTCPConnectionReport subflowSwitchingReportsAtIndex:](self, "subflowSwitchingReportsAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  NSMutableArray *interfaceReports;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *subflowSwitchingReports;
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
  v6 = v5;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_WORD *)(v5 + 104) |= 4u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_clientId, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_establishmentInterfaceName, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(_BYTE *)(v6 + 98) = self->_establishmentSuccess;
    *(_WORD *)(v6 + 104) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0)
        goto LABEL_6;
      goto LABEL_34;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 40) = self->_establishmentFailureError;
  *(_WORD *)(v6 + 104) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  *(_BYTE *)(v6 + 99) = self->_establishmentTcpFallback;
  *(_WORD *)(v6 + 104) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  *(_BYTE *)(v6 + 96) = self->_establishmentCellularFallback;
  *(_WORD *)(v6 + 104) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *(double *)(v6 + 8) = self->_establishmentTime;
  *(_WORD *)(v6 + 104) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v6 + 56) = self->_establishmentSynRetransmits;
  *(_WORD *)(v6 + 104) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  *(_BYTE *)(v6 + 97) = self->_establishmentForcedTcpFallback;
  *(_WORD *)(v6 + 104) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  *(_BYTE *)(v6 + 100) = self->_postConnectMultiHomed;
  *(_WORD *)(v6 + 104) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  *(_BYTE *)(v6 + 101) = self->_postConnectSingleHomed;
  *(_WORD *)(v6 + 104) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 72) = self->_postConnectSubflowAttemptCount;
  *(_WORD *)(v6 + 104) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v6 + 76) = self->_postConnectSubflowMaxSubflowCount;
  *(_WORD *)(v6 + 104) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_43:
  *(double *)(v6 + 16) = self->_postConnectSessionLifetime;
  *(_WORD *)(v6 + 104) |= 2u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 80) = self->_subflowSwitchingCount;
    *(_WORD *)(v6 + 104) |= 0x80u;
  }
LABEL_17:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  interfaceReports = self->_interfaceReports;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceReports, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(interfaceReports);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addInterfaceReports:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interfaceReports, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  subflowSwitchingReports = self->_subflowSwitchingReports;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subflowSwitchingReports, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(subflowSwitchingReports);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSubflowSwitchingReports:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](subflowSwitchingReports, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 v6;
  NSString *clientId;
  NSString *establishmentInterfaceName;
  __int16 has;
  __int16 v10;
  NSMutableArray *interfaceReports;
  NSMutableArray *subflowSwitchingReports;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    v6 = *((_WORD *)a3 + 52);
    if ((*(_WORD *)&self->_has & 4) != 0)
    {
      if ((v6 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_98;
    }
    else if ((v6 & 4) != 0)
    {
      goto LABEL_98;
    }
    clientId = self->_clientId;
    if (!((unint64_t)clientId | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](clientId, "isEqual:")) != 0)
    {
      establishmentInterfaceName = self->_establishmentInterfaceName;
      if (!((unint64_t)establishmentInterfaceName | *((_QWORD *)a3 + 6))
        || (v5 = -[NSString isEqual:](establishmentInterfaceName, "isEqual:")) != 0)
      {
        has = (__int16)self->_has;
        v10 = *((_WORD *)a3 + 52);
        if ((has & 0x400) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x400) == 0)
            goto LABEL_98;
          if (self->_establishmentSuccess)
          {
            if (!*((_BYTE *)a3 + 98))
              goto LABEL_98;
          }
          else if (*((_BYTE *)a3 + 98))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
        {
          goto LABEL_98;
        }
        if ((has & 8) != 0)
        {
          if ((v10 & 8) == 0 || self->_establishmentFailureError != *((_DWORD *)a3 + 10))
            goto LABEL_98;
        }
        else if ((v10 & 8) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x800) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x800) == 0)
            goto LABEL_98;
          if (self->_establishmentTcpFallback)
          {
            if (!*((_BYTE *)a3 + 99))
              goto LABEL_98;
          }
          else if (*((_BYTE *)a3 + 99))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x100) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x100) == 0)
            goto LABEL_98;
          if (self->_establishmentCellularFallback)
          {
            if (!*((_BYTE *)a3 + 96))
              goto LABEL_98;
          }
          else if (*((_BYTE *)a3 + 96))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
        {
          goto LABEL_98;
        }
        if ((has & 1) != 0)
        {
          if ((v10 & 1) == 0 || self->_establishmentTime != *((double *)a3 + 1))
            goto LABEL_98;
        }
        else if ((v10 & 1) != 0)
        {
          goto LABEL_98;
        }
        if ((has & 0x10) != 0)
        {
          if ((v10 & 0x10) == 0 || self->_establishmentSynRetransmits != *((_DWORD *)a3 + 14))
            goto LABEL_98;
        }
        else if ((v10 & 0x10) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x200) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x200) == 0)
            goto LABEL_98;
          if (self->_establishmentForcedTcpFallback)
          {
            if (!*((_BYTE *)a3 + 97))
              goto LABEL_98;
          }
          else if (*((_BYTE *)a3 + 97))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x1000) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x1000) == 0)
            goto LABEL_98;
          if (self->_postConnectMultiHomed)
          {
            if (!*((_BYTE *)a3 + 100))
              goto LABEL_98;
          }
          else if (*((_BYTE *)a3 + 100))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x1000) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x2000) == 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x2000) != 0)
            goto LABEL_98;
          goto LABEL_74;
        }
        if ((*((_WORD *)a3 + 52) & 0x2000) != 0)
        {
          if (self->_postConnectSingleHomed)
          {
            if (!*((_BYTE *)a3 + 101))
              goto LABEL_98;
            goto LABEL_74;
          }
          if (!*((_BYTE *)a3 + 101))
          {
LABEL_74:
            if ((has & 0x20) != 0)
            {
              if ((v10 & 0x20) == 0 || self->_postConnectSubflowAttemptCount != *((_DWORD *)a3 + 18))
                goto LABEL_98;
            }
            else if ((v10 & 0x20) != 0)
            {
              goto LABEL_98;
            }
            if ((has & 0x40) != 0)
            {
              if ((v10 & 0x40) == 0 || self->_postConnectSubflowMaxSubflowCount != *((_DWORD *)a3 + 19))
                goto LABEL_98;
            }
            else if ((v10 & 0x40) != 0)
            {
              goto LABEL_98;
            }
            if ((has & 2) != 0)
            {
              if ((v10 & 2) == 0 || self->_postConnectSessionLifetime != *((double *)a3 + 2))
                goto LABEL_98;
            }
            else if ((v10 & 2) != 0)
            {
              goto LABEL_98;
            }
            if ((has & 0x80) != 0)
            {
              if ((v10 & 0x80) == 0 || self->_subflowSwitchingCount != *((_DWORD *)a3 + 20))
                goto LABEL_98;
            }
            else if ((v10 & 0x80) != 0)
            {
              goto LABEL_98;
            }
            interfaceReports = self->_interfaceReports;
            if (!((unint64_t)interfaceReports | *((_QWORD *)a3 + 8))
              || (v5 = -[NSMutableArray isEqual:](interfaceReports, "isEqual:")) != 0)
            {
              subflowSwitchingReports = self->_subflowSwitchingReports;
              if ((unint64_t)subflowSwitchingReports | *((_QWORD *)a3 + 11))
                LOBYTE(v5) = -[NSMutableArray isEqual:](subflowSwitchingReports, "isEqual:");
              else
                LOBYTE(v5) = 1;
            }
            return v5;
          }
        }
LABEL_98:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  double establishmentTime;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double postConnectSessionLifetime;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  NSUInteger v28;
  unint64_t v29;

  if ((*(_WORD *)&self->_has & 4) != 0)
    v29 = 2654435761u * self->_timestamp;
  else
    v29 = 0;
  v28 = -[NSString hash](self->_clientId, "hash");
  v27 = -[NSString hash](self->_establishmentInterfaceName, "hash");
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v26 = 2654435761 * self->_establishmentSuccess;
    if ((has & 8) != 0)
    {
LABEL_6:
      v25 = 2654435761 * self->_establishmentFailureError;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v26 = 0;
    if ((has & 8) != 0)
      goto LABEL_6;
  }
  v25 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    v24 = 2654435761 * self->_establishmentTcpFallback;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
LABEL_16:
    v23 = 0;
    if ((has & 1) != 0)
      goto LABEL_9;
LABEL_17:
    v8 = 0;
    goto LABEL_20;
  }
LABEL_15:
  v24 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_16;
LABEL_8:
  v23 = 2654435761 * self->_establishmentCellularFallback;
  if ((has & 1) == 0)
    goto LABEL_17;
LABEL_9:
  establishmentTime = self->_establishmentTime;
  v5 = -establishmentTime;
  if (establishmentTime >= 0.0)
    v5 = self->_establishmentTime;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_20:
  if ((has & 0x10) != 0)
  {
    v9 = 2654435761 * self->_establishmentSynRetransmits;
    if ((has & 0x200) != 0)
    {
LABEL_22:
      v10 = 2654435761 * self->_establishmentForcedTcpFallback;
      if ((has & 0x1000) != 0)
        goto LABEL_23;
      goto LABEL_33;
    }
  }
  else
  {
    v9 = 0;
    if ((has & 0x200) != 0)
      goto LABEL_22;
  }
  v10 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_23:
    v11 = 2654435761 * self->_postConnectMultiHomed;
    if ((has & 0x2000) != 0)
      goto LABEL_24;
    goto LABEL_34;
  }
LABEL_33:
  v11 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_24:
    v12 = 2654435761 * self->_postConnectSingleHomed;
    if ((has & 0x20) != 0)
      goto LABEL_25;
    goto LABEL_35;
  }
LABEL_34:
  v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_25:
    v13 = 2654435761 * self->_postConnectSubflowAttemptCount;
    if ((has & 0x40) != 0)
      goto LABEL_26;
LABEL_36:
    v14 = 0;
    if ((has & 2) != 0)
      goto LABEL_27;
LABEL_37:
    v19 = 0;
    goto LABEL_40;
  }
LABEL_35:
  v13 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_36;
LABEL_26:
  v14 = 2654435761 * self->_postConnectSubflowMaxSubflowCount;
  if ((has & 2) == 0)
    goto LABEL_37;
LABEL_27:
  postConnectSessionLifetime = self->_postConnectSessionLifetime;
  v16 = -postConnectSessionLifetime;
  if (postConnectSessionLifetime >= 0.0)
    v16 = self->_postConnectSessionLifetime;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_40:
  if ((has & 0x80) != 0)
    v20 = 2654435761 * self->_subflowSwitchingCount;
  else
    v20 = 0;
  v21 = v25 ^ v24 ^ v23 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v19 ^ v20 ^ -[NSMutableArray hash](self->_interfaceReports, "hash");
  return v28 ^ v29 ^ v27 ^ v26 ^ v21 ^ -[NSMutableArray hash](self->_subflowSwitchingReports, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
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
  if ((*((_WORD *)a3 + 52) & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDMPTCPConnectionReport setClientId:](self, "setClientId:");
  if (*((_QWORD *)a3 + 6))
    -[AWDMPTCPConnectionReport setEstablishmentInterfaceName:](self, "setEstablishmentInterfaceName:");
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x400) != 0)
  {
    self->_establishmentSuccess = *((_BYTE *)a3 + 98);
    *(_WORD *)&self->_has |= 0x400u;
    v5 = *((_WORD *)a3 + 52);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_38;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_establishmentFailureError = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x800) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  self->_establishmentTcpFallback = *((_BYTE *)a3 + 99);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 1) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  self->_establishmentCellularFallback = *((_BYTE *)a3 + 96);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  self->_establishmentTime = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  self->_establishmentSynRetransmits = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  self->_establishmentForcedTcpFallback = *((_BYTE *)a3 + 97);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x1000) == 0)
  {
LABEL_15:
    if ((v5 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  self->_postConnectMultiHomed = *((_BYTE *)a3 + 100);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  self->_postConnectSingleHomed = *((_BYTE *)a3 + 101);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  self->_postConnectSubflowAttemptCount = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 2) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  self->_postConnectSubflowMaxSubflowCount = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_19:
    if ((v5 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_47:
  self->_postConnectSessionLifetime = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 52) & 0x80) != 0)
  {
LABEL_20:
    self->_subflowSwitchingCount = *((_DWORD *)a3 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_21:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 8);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[AWDMPTCPConnectionReport addInterfaceReports:](self, "addInterfaceReports:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 11);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[AWDMPTCPConnectionReport addSubflowSwitchingReports:](self, "addSubflowSwitchingReports:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)establishmentInterfaceName
{
  return self->_establishmentInterfaceName;
}

- (void)setEstablishmentInterfaceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)establishmentSuccess
{
  return self->_establishmentSuccess;
}

- (int)establishmentFailureError
{
  return self->_establishmentFailureError;
}

- (BOOL)establishmentTcpFallback
{
  return self->_establishmentTcpFallback;
}

- (BOOL)establishmentCellularFallback
{
  return self->_establishmentCellularFallback;
}

- (double)establishmentTime
{
  return self->_establishmentTime;
}

- (int)establishmentSynRetransmits
{
  return self->_establishmentSynRetransmits;
}

- (BOOL)establishmentForcedTcpFallback
{
  return self->_establishmentForcedTcpFallback;
}

- (BOOL)postConnectMultiHomed
{
  return self->_postConnectMultiHomed;
}

- (BOOL)postConnectSingleHomed
{
  return self->_postConnectSingleHomed;
}

- (int)postConnectSubflowAttemptCount
{
  return self->_postConnectSubflowAttemptCount;
}

- (int)postConnectSubflowMaxSubflowCount
{
  return self->_postConnectSubflowMaxSubflowCount;
}

- (double)postConnectSessionLifetime
{
  return self->_postConnectSessionLifetime;
}

- (int)subflowSwitchingCount
{
  return self->_subflowSwitchingCount;
}

- (NSMutableArray)interfaceReports
{
  return self->_interfaceReports;
}

- (void)setInterfaceReports:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)subflowSwitchingReports
{
  return self->_subflowSwitchingReports;
}

- (void)setSubflowSwitchingReports:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
