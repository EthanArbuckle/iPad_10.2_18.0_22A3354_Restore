@implementation AWDLibnetcoreTCPConnectionReport

- (void)dealloc
{
  objc_super v3;

  -[AWDLibnetcoreTCPConnectionReport setClientIdentifier:](self, "setClientIdentifier:", 0);
  -[AWDLibnetcoreTCPConnectionReport setConnectionStatisticsReport:](self, "setConnectionStatisticsReport:", 0);
  -[AWDLibnetcoreTCPConnectionReport setCellularFallbackReport:](self, "setCellularFallbackReport:", 0);
  -[AWDLibnetcoreTCPConnectionReport setConnectionAttemptStatisticsReports:](self, "setConnectionAttemptStatisticsReports:", 0);
  -[AWDLibnetcoreTCPConnectionReport setSourceAppIdentifier:](self, "setSourceAppIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPConnectionReport;
  -[AWDLibnetcoreTCPConnectionReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (void)setDelegated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_delegated = a3;
}

- (void)setHasDelegated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDelegated
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)reportReason
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_reportReason;
  else
    return 1;
}

- (void)setReportReason:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_reportReason = a3;
}

- (void)setHasReportReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReportReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)reportReasonAsString:(int)a3
{
  if ((a3 - 1) >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DAF0[a3 - 1];
}

- (int)StringAsReportReason:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("REPORT_REASON_FALLBACK_SIGNAL")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("REPORT_REASON_MPTCP")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("REPORT_REASON_DATA_STALL_AT_APP_LAYER")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("REPORT_REASON_CELL_FALLBACK_METRICS_TESTING")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("REPORT_REASON_TLS_HANDSHAKE_TIMEOUT")))
    return 5;
  return 1;
}

- (BOOL)hasConnectionStatisticsReport
{
  return self->_connectionStatisticsReport != 0;
}

- (BOOL)hasCellularFallbackReport
{
  return self->_cellularFallbackReport != 0;
}

- (void)setIPAddressAttemptCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_iPAddressAttemptCount = a3;
}

- (void)setHasIPAddressAttemptCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIPAddressAttemptCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearConnectionAttemptStatisticsReports
{
  -[NSMutableArray removeAllObjects](self->_connectionAttemptStatisticsReports, "removeAllObjects");
}

- (void)addConnectionAttemptStatisticsReports:(id)a3
{
  NSMutableArray *connectionAttemptStatisticsReports;

  connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
  if (!connectionAttemptStatisticsReports)
  {
    connectionAttemptStatisticsReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_connectionAttemptStatisticsReports = connectionAttemptStatisticsReports;
  }
  -[NSMutableArray addObject:](connectionAttemptStatisticsReports, "addObject:", a3);
}

- (unint64_t)connectionAttemptStatisticsReportsCount
{
  return -[NSMutableArray count](self->_connectionAttemptStatisticsReports, "count");
}

- (id)connectionAttemptStatisticsReportsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_connectionAttemptStatisticsReports, "objectAtIndex:", a3);
}

+ (Class)connectionAttemptStatisticsReportsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSourceAppIdentifier
{
  return self->_sourceAppIdentifier != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPConnectionReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreTCPConnectionReport description](&v3, sel_description), -[AWDLibnetcoreTCPConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *clientIdentifier;
  char has;
  unsigned int v6;
  __CFString *v7;
  AWDLibnetcoreConnectionStatisticsReport *connectionStatisticsReport;
  AWDLibnetcoreCellularFallbackReport *cellularFallbackReport;
  void *v10;
  NSMutableArray *connectionAttemptStatisticsReports;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSString *sourceAppIdentifier;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_delegated), CFSTR("delegated"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = self->_reportReason - 1;
    if (v6 >= 5)
      v7 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reportReason);
    else
      v7 = off_24C10DAF0[v6];
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("reportReason"));
  }
  connectionStatisticsReport = self->_connectionStatisticsReport;
  if (connectionStatisticsReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLibnetcoreConnectionStatisticsReport dictionaryRepresentation](connectionStatisticsReport, "dictionaryRepresentation"), CFSTR("connectionStatisticsReport"));
  cellularFallbackReport = self->_cellularFallbackReport;
  if (cellularFallbackReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLibnetcoreCellularFallbackReport dictionaryRepresentation](cellularFallbackReport, "dictionaryRepresentation"), CFSTR("cellularFallbackReport"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_iPAddressAttemptCount), CFSTR("IPAddressAttemptCount"));
  if (-[NSMutableArray count](self->_connectionAttemptStatisticsReports, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_connectionAttemptStatisticsReports, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(connectionAttemptStatisticsReports);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("connectionAttemptStatisticsReports"));

  }
  sourceAppIdentifier = self->_sourceAppIdentifier;
  if (sourceAppIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sourceAppIdentifier, CFSTR("sourceAppIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *connectionAttemptStatisticsReports;
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_connectionStatisticsReport)
    PBDataWriterWriteSubmessage();
  if (self->_cellularFallbackReport)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(connectionAttemptStatisticsReports);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  if (self->_sourceAppIdentifier)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 76) |= 2u;
  }
  if (self->_clientIdentifier)
    objc_msgSend(a3, "setClientIdentifier:");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)a3 + 72) = self->_delegated;
    *((_BYTE *)a3 + 76) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_reportReason;
    *((_BYTE *)a3 + 76) |= 4u;
  }
  if (self->_connectionStatisticsReport)
    objc_msgSend(a3, "setConnectionStatisticsReport:");
  if (self->_cellularFallbackReport)
    objc_msgSend(a3, "setCellularFallbackReport:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_iPAddressAttemptCount;
    *((_BYTE *)a3 + 76) |= 1u;
  }
  if (-[AWDLibnetcoreTCPConnectionReport connectionAttemptStatisticsReportsCount](self, "connectionAttemptStatisticsReportsCount"))
  {
    objc_msgSend(a3, "clearConnectionAttemptStatisticsReports");
    v6 = -[AWDLibnetcoreTCPConnectionReport connectionAttemptStatisticsReportsCount](self, "connectionAttemptStatisticsReportsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addConnectionAttemptStatisticsReports:", -[AWDLibnetcoreTCPConnectionReport connectionAttemptStatisticsReportsAtIndex:](self, "connectionAttemptStatisticsReportsAtIndex:", i));
    }
  }
  if (self->_sourceAppIdentifier)
    objc_msgSend(a3, "setSourceAppIdentifier:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *connectionAttemptStatisticsReports;
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 76) |= 2u;
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v6 + 72) = self->_delegated;
    *(_BYTE *)(v6 + 76) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_reportReason;
    *(_BYTE *)(v6 + 76) |= 4u;
  }

  *(_QWORD *)(v6 + 48) = -[AWDLibnetcoreConnectionStatisticsReport copyWithZone:](self->_connectionStatisticsReport, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[AWDLibnetcoreCellularFallbackReport copyWithZone:](self->_cellularFallbackReport, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_iPAddressAttemptCount;
    *(_BYTE *)(v6 + 76) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(connectionAttemptStatisticsReports);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addConnectionAttemptStatisticsReports:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionAttemptStatisticsReports, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  *(_QWORD *)(v6 + 64) = -[NSString copyWithZone:](self->_sourceAppIdentifier, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *clientIdentifier;
  AWDLibnetcoreConnectionStatisticsReport *connectionStatisticsReport;
  AWDLibnetcoreCellularFallbackReport *cellularFallbackReport;
  NSMutableArray *connectionAttemptStatisticsReports;
  NSString *sourceAppIdentifier;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 76) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)a3 + 76) & 2) != 0)
  {
    goto LABEL_36;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((_QWORD *)a3 + 4))
  {
    v5 = -[NSString isEqual:](clientIdentifier, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 8) == 0)
  {
    if ((*((_BYTE *)a3 + 76) & 8) != 0)
      goto LABEL_36;
    goto LABEL_18;
  }
  if ((*((_BYTE *)a3 + 76) & 8) == 0)
    goto LABEL_36;
  if (self->_delegated)
  {
    if (!*((_BYTE *)a3 + 72))
      goto LABEL_36;
    goto LABEL_18;
  }
  if (*((_BYTE *)a3 + 72))
  {
LABEL_36:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 76) & 4) == 0 || self->_reportReason != *((_DWORD *)a3 + 14))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)a3 + 76) & 4) != 0)
  {
    goto LABEL_36;
  }
  connectionStatisticsReport = self->_connectionStatisticsReport;
  if (!((unint64_t)connectionStatisticsReport | *((_QWORD *)a3 + 6))
    || (v5 = -[AWDLibnetcoreConnectionStatisticsReport isEqual:](connectionStatisticsReport, "isEqual:")) != 0)
  {
    cellularFallbackReport = self->_cellularFallbackReport;
    if (!((unint64_t)cellularFallbackReport | *((_QWORD *)a3 + 3))
      || (v5 = -[AWDLibnetcoreCellularFallbackReport isEqual:](cellularFallbackReport, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 76) & 1) == 0 || self->_iPAddressAttemptCount != *((_QWORD *)a3 + 1))
          goto LABEL_36;
      }
      else if ((*((_BYTE *)a3 + 76) & 1) != 0)
      {
        goto LABEL_36;
      }
      connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
      if (!((unint64_t)connectionAttemptStatisticsReports | *((_QWORD *)a3 + 5))
        || (v5 = -[NSMutableArray isEqual:](connectionAttemptStatisticsReports, "isEqual:")) != 0)
      {
        sourceAppIdentifier = self->_sourceAppIdentifier;
        if ((unint64_t)sourceAppIdentifier | *((_QWORD *)a3 + 8))
          LOBYTE(v5) = -[NSString isEqual:](sourceAppIdentifier, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_clientIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5 = 2654435761 * self->_delegated;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_reportReason;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  v7 = -[AWDLibnetcoreConnectionStatisticsReport hash](self->_connectionStatisticsReport, "hash");
  v8 = -[AWDLibnetcoreCellularFallbackReport hash](self->_cellularFallbackReport, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761u * self->_iPAddressAttemptCount;
  else
    v9 = 0;
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSMutableArray hash](self->_connectionAttemptStatisticsReports, "hash");
  return v10 ^ -[NSString hash](self->_sourceAppIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  AWDLibnetcoreConnectionStatisticsReport *connectionStatisticsReport;
  uint64_t v7;
  AWDLibnetcoreCellularFallbackReport *cellularFallbackReport;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 76) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDLibnetcoreTCPConnectionReport setClientIdentifier:](self, "setClientIdentifier:");
  v5 = *((_BYTE *)a3 + 76);
  if ((v5 & 8) != 0)
  {
    self->_delegated = *((_BYTE *)a3 + 72);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 76);
  }
  if ((v5 & 4) != 0)
  {
    self->_reportReason = *((_DWORD *)a3 + 14);
    *(_BYTE *)&self->_has |= 4u;
  }
  connectionStatisticsReport = self->_connectionStatisticsReport;
  v7 = *((_QWORD *)a3 + 6);
  if (connectionStatisticsReport)
  {
    if (v7)
      -[AWDLibnetcoreConnectionStatisticsReport mergeFrom:](connectionStatisticsReport, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDLibnetcoreTCPConnectionReport setConnectionStatisticsReport:](self, "setConnectionStatisticsReport:");
  }
  cellularFallbackReport = self->_cellularFallbackReport;
  v9 = *((_QWORD *)a3 + 3);
  if (cellularFallbackReport)
  {
    if (v9)
      -[AWDLibnetcoreCellularFallbackReport mergeFrom:](cellularFallbackReport, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDLibnetcoreTCPConnectionReport setCellularFallbackReport:](self, "setCellularFallbackReport:");
  }
  if ((*((_BYTE *)a3 + 76) & 1) != 0)
  {
    self->_iPAddressAttemptCount = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[AWDLibnetcoreTCPConnectionReport addConnectionAttemptStatisticsReports:](self, "addConnectionAttemptStatisticsReports:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
  if (*((_QWORD *)a3 + 8))
    -[AWDLibnetcoreTCPConnectionReport setSourceAppIdentifier:](self, "setSourceAppIdentifier:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)delegated
{
  return self->_delegated;
}

- (AWDLibnetcoreConnectionStatisticsReport)connectionStatisticsReport
{
  return self->_connectionStatisticsReport;
}

- (void)setConnectionStatisticsReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AWDLibnetcoreCellularFallbackReport)cellularFallbackReport
{
  return self->_cellularFallbackReport;
}

- (void)setCellularFallbackReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)iPAddressAttemptCount
{
  return self->_iPAddressAttemptCount;
}

- (NSMutableArray)connectionAttemptStatisticsReports
{
  return self->_connectionAttemptStatisticsReports;
}

- (void)setConnectionAttemptStatisticsReports:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (void)setSourceAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
