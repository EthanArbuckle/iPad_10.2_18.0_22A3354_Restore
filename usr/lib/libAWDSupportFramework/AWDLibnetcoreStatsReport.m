@implementation AWDLibnetcoreStatsReport

- (void)dealloc
{
  objc_super v3;

  -[AWDLibnetcoreStatsReport setMbufStatisticsReport:](self, "setMbufStatisticsReport:", 0);
  -[AWDLibnetcoreStatsReport setTcpStatisticsReport:](self, "setTcpStatisticsReport:", 0);
  -[AWDLibnetcoreStatsReport setTcpECNStatisticsReport:](self, "setTcpECNStatisticsReport:", 0);
  -[AWDLibnetcoreStatsReport setTcpTFOStatisticsReport:](self, "setTcpTFOStatisticsReport:", 0);
  -[AWDLibnetcoreStatsReport setNetworkdStatisticsReport:](self, "setNetworkdStatisticsReport:", 0);
  -[AWDLibnetcoreStatsReport setTcpECNInterfaceReports:](self, "setTcpECNInterfaceReports:", 0);
  -[AWDLibnetcoreStatsReport setNwAPIUsageReport:](self, "setNwAPIUsageReport:", 0);
  -[AWDLibnetcoreStatsReport setMptcpStatisticsReport:](self, "setMptcpStatisticsReport:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreStatsReport;
  -[AWDLibnetcoreStatsReport dealloc](&v3, sel_dealloc);
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

- (void)setReportReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reportReason = a3;
}

- (void)setHasReportReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMbufStatisticsReport
{
  return self->_mbufStatisticsReport != 0;
}

- (BOOL)hasTcpStatisticsReport
{
  return self->_tcpStatisticsReport != 0;
}

- (BOOL)hasTcpECNStatisticsReport
{
  return self->_tcpECNStatisticsReport != 0;
}

- (BOOL)hasTcpTFOStatisticsReport
{
  return self->_tcpTFOStatisticsReport != 0;
}

- (BOOL)hasNetworkdStatisticsReport
{
  return self->_networkdStatisticsReport != 0;
}

- (void)clearTcpECNInterfaceReports
{
  -[NSMutableArray removeAllObjects](self->_tcpECNInterfaceReports, "removeAllObjects");
}

- (void)addTcpECNInterfaceReport:(id)a3
{
  NSMutableArray *tcpECNInterfaceReports;

  tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
  if (!tcpECNInterfaceReports)
  {
    tcpECNInterfaceReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_tcpECNInterfaceReports = tcpECNInterfaceReports;
  }
  -[NSMutableArray addObject:](tcpECNInterfaceReports, "addObject:", a3);
}

- (unint64_t)tcpECNInterfaceReportsCount
{
  return -[NSMutableArray count](self->_tcpECNInterfaceReports, "count");
}

- (id)tcpECNInterfaceReportAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tcpECNInterfaceReports, "objectAtIndex:", a3);
}

+ (Class)tcpECNInterfaceReportType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNwAPIUsageReport
{
  return self->_nwAPIUsageReport != 0;
}

- (BOOL)hasMptcpStatisticsReport
{
  return self->_mptcpStatisticsReport != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreStatsReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreStatsReport description](&v3, sel_description), -[AWDLibnetcoreStatsReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  AWDLibnetcoreMbufStatsReport *mbufStatisticsReport;
  AWDLibnetcoreTCPStatsReport *tcpStatisticsReport;
  AWDLibnetcoreTCPECNStatsReport *tcpECNStatisticsReport;
  AWDLibnetcoreTCPTFOStatsReport *tcpTFOStatisticsReport;
  AWDLibnetcoreNetworkdStatsReport *networkdStatisticsReport;
  void *v10;
  NSMutableArray *tcpECNInterfaceReports;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  AWDNWAPIUsage *nwAPIUsageReport;
  AWDLibnetcoreMPTCPStatsReport *mptcpStatisticsReport;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reportReason), CFSTR("reportReason"));
  mbufStatisticsReport = self->_mbufStatisticsReport;
  if (mbufStatisticsReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLibnetcoreMbufStatsReport dictionaryRepresentation](mbufStatisticsReport, "dictionaryRepresentation"), CFSTR("mbufStatisticsReport"));
  tcpStatisticsReport = self->_tcpStatisticsReport;
  if (tcpStatisticsReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLibnetcoreTCPStatsReport dictionaryRepresentation](tcpStatisticsReport, "dictionaryRepresentation"), CFSTR("tcpStatisticsReport"));
  tcpECNStatisticsReport = self->_tcpECNStatisticsReport;
  if (tcpECNStatisticsReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLibnetcoreTCPECNStatsReport dictionaryRepresentation](tcpECNStatisticsReport, "dictionaryRepresentation"), CFSTR("tcpECNStatisticsReport"));
  tcpTFOStatisticsReport = self->_tcpTFOStatisticsReport;
  if (tcpTFOStatisticsReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLibnetcoreTCPTFOStatsReport dictionaryRepresentation](tcpTFOStatisticsReport, "dictionaryRepresentation"), CFSTR("tcpTFOStatisticsReport"));
  networkdStatisticsReport = self->_networkdStatisticsReport;
  if (networkdStatisticsReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLibnetcoreNetworkdStatsReport dictionaryRepresentation](networkdStatisticsReport, "dictionaryRepresentation"), CFSTR("networkdStatisticsReport"));
  if (-[NSMutableArray count](self->_tcpECNInterfaceReports, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_tcpECNInterfaceReports, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpECNInterfaceReports, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(tcpECNInterfaceReports);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpECNInterfaceReports, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("tcpECNInterfaceReport"));

  }
  nwAPIUsageReport = self->_nwAPIUsageReport;
  if (nwAPIUsageReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWAPIUsage dictionaryRepresentation](nwAPIUsageReport, "dictionaryRepresentation"), CFSTR("nwAPIUsageReport"));
  mptcpStatisticsReport = self->_mptcpStatisticsReport;
  if (mptcpStatisticsReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDLibnetcoreMPTCPStatsReport dictionaryRepresentation](mptcpStatisticsReport, "dictionaryRepresentation"), CFSTR("mptcpStatisticsReport"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *tcpECNInterfaceReports;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_mbufStatisticsReport)
    PBDataWriterWriteSubmessage();
  if (self->_tcpStatisticsReport)
    PBDataWriterWriteSubmessage();
  if (self->_tcpECNStatisticsReport)
    PBDataWriterWriteSubmessage();
  if (self->_tcpTFOStatisticsReport)
    PBDataWriterWriteSubmessage();
  if (self->_networkdStatisticsReport)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpECNInterfaceReports, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(tcpECNInterfaceReports);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpECNInterfaceReports, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  if (self->_nwAPIUsageReport)
    PBDataWriterWriteSubmessage();
  if (self->_mptcpStatisticsReport)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_reportReason;
    *((_BYTE *)a3 + 88) |= 2u;
  }
  if (self->_mbufStatisticsReport)
    objc_msgSend(a3, "setMbufStatisticsReport:");
  if (self->_tcpStatisticsReport)
    objc_msgSend(a3, "setTcpStatisticsReport:");
  if (self->_tcpECNStatisticsReport)
    objc_msgSend(a3, "setTcpECNStatisticsReport:");
  if (self->_tcpTFOStatisticsReport)
    objc_msgSend(a3, "setTcpTFOStatisticsReport:");
  if (self->_networkdStatisticsReport)
    objc_msgSend(a3, "setNetworkdStatisticsReport:");
  if (-[AWDLibnetcoreStatsReport tcpECNInterfaceReportsCount](self, "tcpECNInterfaceReportsCount"))
  {
    objc_msgSend(a3, "clearTcpECNInterfaceReports");
    v6 = -[AWDLibnetcoreStatsReport tcpECNInterfaceReportsCount](self, "tcpECNInterfaceReportsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addTcpECNInterfaceReport:", -[AWDLibnetcoreStatsReport tcpECNInterfaceReportAtIndex:](self, "tcpECNInterfaceReportAtIndex:", i));
    }
  }
  if (self->_nwAPIUsageReport)
    objc_msgSend(a3, "setNwAPIUsageReport:");
  if (self->_mptcpStatisticsReport)
    objc_msgSend(a3, "setMptcpStatisticsReport:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *tcpECNInterfaceReports;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_reportReason;
    *(_BYTE *)(v5 + 88) |= 2u;
  }

  *(_QWORD *)(v6 + 16) = -[AWDLibnetcoreMbufStatsReport copyWithZone:](self->_mbufStatisticsReport, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 72) = -[AWDLibnetcoreTCPStatsReport copyWithZone:](self->_tcpStatisticsReport, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 64) = -[AWDLibnetcoreTCPECNStatsReport copyWithZone:](self->_tcpECNStatisticsReport, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 80) = -[AWDLibnetcoreTCPTFOStatsReport copyWithZone:](self->_tcpTFOStatisticsReport, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 32) = -[AWDLibnetcoreNetworkdStatsReport copyWithZone:](self->_networkdStatisticsReport, "copyWithZone:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpECNInterfaceReports, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(tcpECNInterfaceReports);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTcpECNInterfaceReport:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpECNInterfaceReports, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  *(_QWORD *)(v6 + 40) = -[AWDNWAPIUsage copyWithZone:](self->_nwAPIUsageReport, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[AWDLibnetcoreMPTCPStatsReport copyWithZone:](self->_mptcpStatisticsReport, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDLibnetcoreMbufStatsReport *mbufStatisticsReport;
  AWDLibnetcoreTCPStatsReport *tcpStatisticsReport;
  AWDLibnetcoreTCPECNStatsReport *tcpECNStatisticsReport;
  AWDLibnetcoreTCPTFOStatsReport *tcpTFOStatisticsReport;
  AWDLibnetcoreNetworkdStatsReport *networkdStatisticsReport;
  NSMutableArray *tcpECNInterfaceReports;
  AWDNWAPIUsage *nwAPIUsageReport;
  AWDLibnetcoreMPTCPStatsReport *mptcpStatisticsReport;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 88) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_28;
    }
    else if ((*((_BYTE *)a3 + 88) & 1) != 0)
    {
LABEL_28:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 88) & 2) == 0 || self->_reportReason != *((_DWORD *)a3 + 12))
        goto LABEL_28;
    }
    else if ((*((_BYTE *)a3 + 88) & 2) != 0)
    {
      goto LABEL_28;
    }
    mbufStatisticsReport = self->_mbufStatisticsReport;
    if (!((unint64_t)mbufStatisticsReport | *((_QWORD *)a3 + 2))
      || (v5 = -[AWDLibnetcoreMbufStatsReport isEqual:](mbufStatisticsReport, "isEqual:")) != 0)
    {
      tcpStatisticsReport = self->_tcpStatisticsReport;
      if (!((unint64_t)tcpStatisticsReport | *((_QWORD *)a3 + 9))
        || (v5 = -[AWDLibnetcoreTCPStatsReport isEqual:](tcpStatisticsReport, "isEqual:")) != 0)
      {
        tcpECNStatisticsReport = self->_tcpECNStatisticsReport;
        if (!((unint64_t)tcpECNStatisticsReport | *((_QWORD *)a3 + 8))
          || (v5 = -[AWDLibnetcoreTCPECNStatsReport isEqual:](tcpECNStatisticsReport, "isEqual:")) != 0)
        {
          tcpTFOStatisticsReport = self->_tcpTFOStatisticsReport;
          if (!((unint64_t)tcpTFOStatisticsReport | *((_QWORD *)a3 + 10))
            || (v5 = -[AWDLibnetcoreTCPTFOStatsReport isEqual:](tcpTFOStatisticsReport, "isEqual:")) != 0)
          {
            networkdStatisticsReport = self->_networkdStatisticsReport;
            if (!((unint64_t)networkdStatisticsReport | *((_QWORD *)a3 + 4))
              || (v5 = -[AWDLibnetcoreNetworkdStatsReport isEqual:](networkdStatisticsReport, "isEqual:")) != 0)
            {
              tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
              if (!((unint64_t)tcpECNInterfaceReports | *((_QWORD *)a3 + 7))
                || (v5 = -[NSMutableArray isEqual:](tcpECNInterfaceReports, "isEqual:")) != 0)
              {
                nwAPIUsageReport = self->_nwAPIUsageReport;
                if (!((unint64_t)nwAPIUsageReport | *((_QWORD *)a3 + 5))
                  || (v5 = -[AWDNWAPIUsage isEqual:](nwAPIUsageReport, "isEqual:")) != 0)
                {
                  mptcpStatisticsReport = self->_mptcpStatisticsReport;
                  if ((unint64_t)mptcpStatisticsReport | *((_QWORD *)a3 + 3))
                    LOBYTE(v5) = -[AWDLibnetcoreMPTCPStatsReport isEqual:](mptcpStatisticsReport, "isEqual:");
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
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_reportReason;
LABEL_6:
  v5 = v4 ^ v3 ^ -[AWDLibnetcoreMbufStatsReport hash](self->_mbufStatisticsReport, "hash");
  v6 = -[AWDLibnetcoreTCPStatsReport hash](self->_tcpStatisticsReport, "hash");
  v7 = v5 ^ v6 ^ -[AWDLibnetcoreTCPECNStatsReport hash](self->_tcpECNStatisticsReport, "hash");
  v8 = -[AWDLibnetcoreTCPTFOStatsReport hash](self->_tcpTFOStatisticsReport, "hash");
  v9 = v8 ^ -[AWDLibnetcoreNetworkdStatsReport hash](self->_networkdStatisticsReport, "hash");
  v10 = v7 ^ v9 ^ -[NSMutableArray hash](self->_tcpECNInterfaceReports, "hash");
  v11 = -[AWDNWAPIUsage hash](self->_nwAPIUsageReport, "hash");
  return v10 ^ v11 ^ -[AWDLibnetcoreMPTCPStatsReport hash](self->_mptcpStatisticsReport, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  AWDLibnetcoreMbufStatsReport *mbufStatisticsReport;
  uint64_t v7;
  AWDLibnetcoreTCPStatsReport *tcpStatisticsReport;
  uint64_t v9;
  AWDLibnetcoreTCPECNStatsReport *tcpECNStatisticsReport;
  uint64_t v11;
  AWDLibnetcoreTCPTFOStatsReport *tcpTFOStatisticsReport;
  uint64_t v13;
  AWDLibnetcoreNetworkdStatsReport *networkdStatisticsReport;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  AWDNWAPIUsage *nwAPIUsageReport;
  uint64_t v22;
  AWDLibnetcoreMPTCPStatsReport *mptcpStatisticsReport;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 88);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 88);
  }
  if ((v5 & 2) != 0)
  {
    self->_reportReason = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
  mbufStatisticsReport = self->_mbufStatisticsReport;
  v7 = *((_QWORD *)a3 + 2);
  if (mbufStatisticsReport)
  {
    if (v7)
      -[AWDLibnetcoreMbufStatsReport mergeFrom:](mbufStatisticsReport, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDLibnetcoreStatsReport setMbufStatisticsReport:](self, "setMbufStatisticsReport:");
  }
  tcpStatisticsReport = self->_tcpStatisticsReport;
  v9 = *((_QWORD *)a3 + 9);
  if (tcpStatisticsReport)
  {
    if (v9)
      -[AWDLibnetcoreTCPStatsReport mergeFrom:](tcpStatisticsReport, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDLibnetcoreStatsReport setTcpStatisticsReport:](self, "setTcpStatisticsReport:");
  }
  tcpECNStatisticsReport = self->_tcpECNStatisticsReport;
  v11 = *((_QWORD *)a3 + 8);
  if (tcpECNStatisticsReport)
  {
    if (v11)
      -[AWDLibnetcoreTCPECNStatsReport mergeFrom:](tcpECNStatisticsReport, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDLibnetcoreStatsReport setTcpECNStatisticsReport:](self, "setTcpECNStatisticsReport:");
  }
  tcpTFOStatisticsReport = self->_tcpTFOStatisticsReport;
  v13 = *((_QWORD *)a3 + 10);
  if (tcpTFOStatisticsReport)
  {
    if (v13)
      -[AWDLibnetcoreTCPTFOStatsReport mergeFrom:](tcpTFOStatisticsReport, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDLibnetcoreStatsReport setTcpTFOStatisticsReport:](self, "setTcpTFOStatisticsReport:");
  }
  networkdStatisticsReport = self->_networkdStatisticsReport;
  v15 = *((_QWORD *)a3 + 4);
  if (networkdStatisticsReport)
  {
    if (v15)
      -[AWDLibnetcoreNetworkdStatsReport mergeFrom:](networkdStatisticsReport, "mergeFrom:");
  }
  else if (v15)
  {
    -[AWDLibnetcoreStatsReport setNetworkdStatisticsReport:](self, "setNetworkdStatisticsReport:");
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = (void *)*((_QWORD *)a3 + 7);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        -[AWDLibnetcoreStatsReport addTcpECNInterfaceReport:](self, "addTcpECNInterfaceReport:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }
  nwAPIUsageReport = self->_nwAPIUsageReport;
  v22 = *((_QWORD *)a3 + 5);
  if (nwAPIUsageReport)
  {
    if (v22)
      -[AWDNWAPIUsage mergeFrom:](nwAPIUsageReport, "mergeFrom:");
  }
  else if (v22)
  {
    -[AWDLibnetcoreStatsReport setNwAPIUsageReport:](self, "setNwAPIUsageReport:");
  }
  mptcpStatisticsReport = self->_mptcpStatisticsReport;
  v24 = *((_QWORD *)a3 + 3);
  if (mptcpStatisticsReport)
  {
    if (v24)
      -[AWDLibnetcoreMPTCPStatsReport mergeFrom:](mptcpStatisticsReport, "mergeFrom:");
  }
  else if (v24)
  {
    -[AWDLibnetcoreStatsReport setMptcpStatisticsReport:](self, "setMptcpStatisticsReport:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)reportReason
{
  return self->_reportReason;
}

- (AWDLibnetcoreMbufStatsReport)mbufStatisticsReport
{
  return self->_mbufStatisticsReport;
}

- (void)setMbufStatisticsReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (AWDLibnetcoreTCPStatsReport)tcpStatisticsReport
{
  return self->_tcpStatisticsReport;
}

- (void)setTcpStatisticsReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (AWDLibnetcoreTCPECNStatsReport)tcpECNStatisticsReport
{
  return self->_tcpECNStatisticsReport;
}

- (void)setTcpECNStatisticsReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (AWDLibnetcoreTCPTFOStatsReport)tcpTFOStatisticsReport
{
  return self->_tcpTFOStatisticsReport;
}

- (void)setTcpTFOStatisticsReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (AWDLibnetcoreNetworkdStatsReport)networkdStatisticsReport
{
  return self->_networkdStatisticsReport;
}

- (void)setNetworkdStatisticsReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)tcpECNInterfaceReports
{
  return self->_tcpECNInterfaceReports;
}

- (void)setTcpECNInterfaceReports:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (AWDNWAPIUsage)nwAPIUsageReport
{
  return self->_nwAPIUsageReport;
}

- (void)setNwAPIUsageReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDLibnetcoreMPTCPStatsReport)mptcpStatisticsReport
{
  return self->_mptcpStatisticsReport;
}

- (void)setMptcpStatisticsReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
