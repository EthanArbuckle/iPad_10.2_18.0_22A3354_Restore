@implementation AWDLibnetcoreMPTCPStatsReport

- (void)setMptcpHandoverAttempts:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_mptcpHandoverAttempts = a3;
}

- (void)setHasMptcpHandoverAttempts:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMptcpHandoverAttempts
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMptcpInteractiveAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_mptcpInteractiveAttempt = a3;
}

- (void)setHasMptcpInteractiveAttempt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasMptcpInteractiveAttempt
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setMptcpAggregateAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_mptcpAggregateAttempt = a3;
}

- (void)setHasMptcpAggregateAttempt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasMptcpAggregateAttempt
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMptcpFirstPartyHandoverAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_mptcpFirstPartyHandoverAttempt = a3;
}

- (void)setHasMptcpFirstPartyHandoverAttempt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMptcpFirstPartyHandoverAttempt
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMptcpFirstPartyInteractiveAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_mptcpFirstPartyInteractiveAttempt = a3;
}

- (void)setHasMptcpFirstPartyInteractiveAttempt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMptcpFirstPartyInteractiveAttempt
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setMptcpFirstPartyAggregateAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_mptcpFirstPartyAggregateAttempt = a3;
}

- (void)setHasMptcpFirstPartyAggregateAttempt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMptcpFirstPartyAggregateAttempt
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setMptcpHeuristicFallback:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_mptcpHeuristicFallback = a3;
}

- (void)setHasMptcpHeuristicFallback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasMptcpHeuristicFallback
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setMptcpHeuristicFallbackFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_mptcpHeuristicFallbackFirstParty = a3;
}

- (void)setHasMptcpHeuristicFallbackFirstParty:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasMptcpHeuristicFallbackFirstParty
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setMptcpHandshakeHandoverSuccessWiFi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_mptcpHandshakeHandoverSuccessWiFi = a3;
}

- (void)setHasMptcpHandshakeHandoverSuccessWiFi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasMptcpHandshakeHandoverSuccessWiFi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMptcpHandshakeHandoverSuccessCell:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_mptcpHandshakeHandoverSuccessCell = a3;
}

- (void)setHasMptcpHandshakeHandoverSuccessCell:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMptcpHandshakeHandoverSuccessCell
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setMptcpHandshakeInteractiveSuccess:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_mptcpHandshakeInteractiveSuccess = a3;
}

- (void)setHasMptcpHandshakeInteractiveSuccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasMptcpHandshakeInteractiveSuccess
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMptcpHandshakeAggregateSuccess:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_mptcpHandshakeAggregateSuccess = a3;
}

- (void)setHasMptcpHandshakeAggregateSuccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMptcpHandshakeAggregateSuccess
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMptcpHandshakeHandoverSuccessWiFiFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_mptcpHandshakeHandoverSuccessWiFiFirstParty = a3;
}

- (void)setHasMptcpHandshakeHandoverSuccessWiFiFirstParty:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasMptcpHandshakeHandoverSuccessWiFiFirstParty
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMptcpHandshakeHandoverSuccessCellFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_mptcpHandshakeHandoverSuccessCellFirstParty = a3;
}

- (void)setHasMptcpHandshakeHandoverSuccessCellFirstParty:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMptcpHandshakeHandoverSuccessCellFirstParty
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMptcpHandshakeInteractiveSuccessFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_mptcpHandshakeInteractiveSuccessFirstParty = a3;
}

- (void)setHasMptcpHandshakeInteractiveSuccessFirstParty:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasMptcpHandshakeInteractiveSuccessFirstParty
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setMptcpHandshakeAggregateSuccessFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_mptcpHandshakeAggregateSuccessFirstParty = a3;
}

- (void)setHasMptcpHandshakeAggregateSuccessFirstParty:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMptcpHandshakeAggregateSuccessFirstParty
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMptcpHandoverCellSubflowFromWiFi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mptcpHandoverCellSubflowFromWiFi = a3;
}

- (void)setHasMptcpHandoverCellSubflowFromWiFi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMptcpHandoverCellSubflowFromWiFi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMptcpHandoverWiFiSubflowFromCell:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_mptcpHandoverWiFiSubflowFromCell = a3;
}

- (void)setHasMptcpHandoverWiFiSubflowFromCell:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMptcpHandoverWiFiSubflowFromCell
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMptcpInteractiveCellUsage:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_mptcpInteractiveCellUsage = a3;
}

- (void)setHasMptcpInteractiveCellUsage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasMptcpInteractiveCellUsage
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setMptcpHandoverCellBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_mptcpHandoverCellBytes = a3;
}

- (void)setHasMptcpHandoverCellBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMptcpHandoverCellBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMptcpInteractiveCellBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_mptcpInteractiveCellBytes = a3;
}

- (void)setHasMptcpInteractiveCellBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasMptcpInteractiveCellBytes
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMptcpAggregateCellBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_mptcpAggregateCellBytes = a3;
}

- (void)setHasMptcpAggregateCellBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMptcpAggregateCellBytes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMptcpHandoverAllBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_mptcpHandoverAllBytes = a3;
}

- (void)setHasMptcpHandoverAllBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMptcpHandoverAllBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setMptcpInteractiveAllBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_mptcpInteractiveAllBytes = a3;
}

- (void)setHasMptcpInteractiveAllBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasMptcpInteractiveAllBytes
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setMptcpAggregateAllBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_mptcpAggregateAllBytes = a3;
}

- (void)setHasMptcpAggregateAllBytes:(BOOL)a3
{
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasMptcpAggregateAllBytes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setMptcpBackToWiFi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_mptcpBackToWiFi = a3;
}

- (void)setHasMptcpBackToWiFi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMptcpBackToWiFi
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMptcpCellDenied:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_mptcpCellDenied = a3;
}

- (void)setHasMptcpCellDenied:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMptcpCellDenied
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMptcpCellProxy:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_mptcpCellProxy = a3;
}

- (void)setHasMptcpCellProxy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMptcpCellProxy
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setMptcpWiFiProxy:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_mptcpWiFiProxy = a3;
}

- (void)setHasMptcpWiFiProxy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasMptcpWiFiProxy
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setMptcpTriggeredCell:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_mptcpTriggeredCell = a3;
}

- (void)setHasMptcpTriggeredCell:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasMptcpTriggeredCell
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreMPTCPStatsReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreMPTCPStatsReport description](&v3, sel_description), -[AWDLibnetcoreMPTCPStatsReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $A42C86F35415F5D5ABC6B48FCFD0454C has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandoverAttempts), CFSTR("mptcpHandoverAttempts"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpInteractiveAttempt), CFSTR("mptcpInteractiveAttempt"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpAggregateAttempt), CFSTR("mptcpAggregateAttempt"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpFirstPartyHandoverAttempt), CFSTR("mptcpFirstPartyHandoverAttempt"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpFirstPartyInteractiveAttempt), CFSTR("mptcpFirstPartyInteractiveAttempt"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpFirstPartyAggregateAttempt), CFSTR("mptcpFirstPartyAggregateAttempt"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHeuristicFallback), CFSTR("mptcpHeuristicFallback"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHeuristicFallbackFirstParty), CFSTR("mptcpHeuristicFallbackFirstParty"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandshakeHandoverSuccessWiFi), CFSTR("mptcpHandshakeHandoverSuccessWiFi"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandshakeHandoverSuccessCell), CFSTR("mptcpHandshakeHandoverSuccessCell"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandshakeInteractiveSuccess), CFSTR("mptcpHandshakeInteractiveSuccess"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandshakeAggregateSuccess), CFSTR("mptcpHandshakeAggregateSuccess"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandshakeHandoverSuccessWiFiFirstParty), CFSTR("mptcpHandshakeHandoverSuccessWiFiFirstParty"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandshakeHandoverSuccessCellFirstParty), CFSTR("mptcpHandshakeHandoverSuccessCellFirstParty"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandshakeInteractiveSuccessFirstParty), CFSTR("mptcpHandshakeInteractiveSuccessFirstParty"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandshakeAggregateSuccessFirstParty), CFSTR("mptcpHandshakeAggregateSuccessFirstParty"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandoverCellSubflowFromWiFi), CFSTR("mptcpHandoverCellSubflowFromWiFi"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandoverWiFiSubflowFromCell), CFSTR("mptcpHandoverWiFiSubflowFromCell"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpInteractiveCellUsage), CFSTR("mptcpInteractiveCellUsage"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandoverCellBytes), CFSTR("mptcpHandoverCellBytes"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpInteractiveCellBytes), CFSTR("mptcpInteractiveCellBytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpAggregateCellBytes), CFSTR("mptcpAggregateCellBytes"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpHandoverAllBytes), CFSTR("mptcpHandoverAllBytes"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpInteractiveAllBytes), CFSTR("mptcpInteractiveAllBytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpAggregateAllBytes), CFSTR("mptcpAggregateAllBytes"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpBackToWiFi), CFSTR("mptcpBackToWiFi"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpCellDenied), CFSTR("mptcpCellDenied"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_30;
LABEL_61:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpWiFiProxy), CFSTR("mptcpWiFiProxy"));
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      return v3;
    goto LABEL_31;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpCellProxy), CFSTR("mptcpCellProxy"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
    goto LABEL_61;
LABEL_30:
  if ((*(_DWORD *)&has & 0x10000000) != 0)
LABEL_31:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpTriggeredCell), CFSTR("mptcpTriggeredCell"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreMPTCPStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $A42C86F35415F5D5ABC6B48FCFD0454C has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      return;
LABEL_61:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
    goto LABEL_61;
}

- (void)copyTo:(id)a3
{
  $A42C86F35415F5D5ABC6B48FCFD0454C has;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_QWORD *)a3 + 11) = self->_mptcpHandoverAttempts;
    *((_DWORD *)a3 + 62) |= 0x400u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 26) = self->_mptcpInteractiveAttempt;
  *((_DWORD *)a3 + 62) |= 0x2000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)a3 + 2) = self->_mptcpAggregateAttempt;
  *((_DWORD *)a3 + 62) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 8) = self->_mptcpFirstPartyHandoverAttempt;
  *((_DWORD *)a3 + 62) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 9) = self->_mptcpFirstPartyInteractiveAttempt;
  *((_DWORD *)a3 + 62) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)a3 + 7) = self->_mptcpFirstPartyAggregateAttempt;
  *((_DWORD *)a3 + 62) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)a3 + 23) = self->_mptcpHeuristicFallback;
  *((_DWORD *)a3 + 62) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)a3 + 24) = self->_mptcpHeuristicFallbackFirstParty;
  *((_DWORD *)a3 + 62) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)a3 + 19) = self->_mptcpHandshakeHandoverSuccessWiFi;
  *((_DWORD *)a3 + 62) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)a3 + 17) = self->_mptcpHandshakeHandoverSuccessCell;
  *((_DWORD *)a3 + 62) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)a3 + 21) = self->_mptcpHandshakeInteractiveSuccess;
  *((_DWORD *)a3 + 62) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)a3 + 15) = self->_mptcpHandshakeAggregateSuccess;
  *((_DWORD *)a3 + 62) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)a3 + 20) = self->_mptcpHandshakeHandoverSuccessWiFiFirstParty;
  *((_DWORD *)a3 + 62) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)a3 + 18) = self->_mptcpHandshakeHandoverSuccessCellFirstParty;
  *((_DWORD *)a3 + 62) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)a3 + 22) = self->_mptcpHandshakeInteractiveSuccessFirstParty;
  *((_DWORD *)a3 + 62) |= 0x200000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)a3 + 16) = self->_mptcpHandshakeAggregateSuccessFirstParty;
  *((_DWORD *)a3 + 62) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)a3 + 13) = self->_mptcpHandoverCellSubflowFromWiFi;
  *((_DWORD *)a3 + 62) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)a3 + 14) = self->_mptcpHandoverWiFiSubflowFromCell;
  *((_DWORD *)a3 + 62) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)a3 + 28) = self->_mptcpInteractiveCellUsage;
  *((_DWORD *)a3 + 62) |= 0x8000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)a3 + 12) = self->_mptcpHandoverCellBytes;
  *((_DWORD *)a3 + 62) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)a3 + 27) = self->_mptcpInteractiveCellBytes;
  *((_DWORD *)a3 + 62) |= 0x4000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)a3 + 3) = self->_mptcpAggregateCellBytes;
  *((_DWORD *)a3 + 62) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)a3 + 10) = self->_mptcpHandoverAllBytes;
  *((_DWORD *)a3 + 62) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)a3 + 25) = self->_mptcpInteractiveAllBytes;
  *((_DWORD *)a3 + 62) |= 0x1000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 1) = self->_mptcpAggregateAllBytes;
  *((_DWORD *)a3 + 62) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 4) = self->_mptcpBackToWiFi;
  *((_DWORD *)a3 + 62) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)a3 + 5) = self->_mptcpCellDenied;
  *((_DWORD *)a3 + 62) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)a3 + 6) = self->_mptcpCellProxy;
  *((_DWORD *)a3 + 62) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      return;
LABEL_61:
    *((_QWORD *)a3 + 29) = self->_mptcpTriggeredCell;
    *((_DWORD *)a3 + 62) |= 0x10000000u;
    return;
  }
LABEL_60:
  *((_QWORD *)a3 + 30) = self->_mptcpWiFiProxy;
  *((_DWORD *)a3 + 62) |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
    goto LABEL_61;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $A42C86F35415F5D5ABC6B48FCFD0454C has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_QWORD *)result + 11) = self->_mptcpHandoverAttempts;
    *((_DWORD *)result + 62) |= 0x400u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 26) = self->_mptcpInteractiveAttempt;
  *((_DWORD *)result + 62) |= 0x2000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 2) = self->_mptcpAggregateAttempt;
  *((_DWORD *)result + 62) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 8) = self->_mptcpFirstPartyHandoverAttempt;
  *((_DWORD *)result + 62) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 9) = self->_mptcpFirstPartyInteractiveAttempt;
  *((_DWORD *)result + 62) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 7) = self->_mptcpFirstPartyAggregateAttempt;
  *((_DWORD *)result + 62) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 23) = self->_mptcpHeuristicFallback;
  *((_DWORD *)result + 62) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 24) = self->_mptcpHeuristicFallbackFirstParty;
  *((_DWORD *)result + 62) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)result + 19) = self->_mptcpHandshakeHandoverSuccessWiFi;
  *((_DWORD *)result + 62) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)result + 17) = self->_mptcpHandshakeHandoverSuccessCell;
  *((_DWORD *)result + 62) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)result + 21) = self->_mptcpHandshakeInteractiveSuccess;
  *((_DWORD *)result + 62) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)result + 15) = self->_mptcpHandshakeAggregateSuccess;
  *((_DWORD *)result + 62) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)result + 20) = self->_mptcpHandshakeHandoverSuccessWiFiFirstParty;
  *((_DWORD *)result + 62) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)result + 18) = self->_mptcpHandshakeHandoverSuccessCellFirstParty;
  *((_DWORD *)result + 62) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)result + 22) = self->_mptcpHandshakeInteractiveSuccessFirstParty;
  *((_DWORD *)result + 62) |= 0x200000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)result + 16) = self->_mptcpHandshakeAggregateSuccessFirstParty;
  *((_DWORD *)result + 62) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)result + 13) = self->_mptcpHandoverCellSubflowFromWiFi;
  *((_DWORD *)result + 62) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)result + 14) = self->_mptcpHandoverWiFiSubflowFromCell;
  *((_DWORD *)result + 62) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)result + 28) = self->_mptcpInteractiveCellUsage;
  *((_DWORD *)result + 62) |= 0x8000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)result + 12) = self->_mptcpHandoverCellBytes;
  *((_DWORD *)result + 62) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)result + 27) = self->_mptcpInteractiveCellBytes;
  *((_DWORD *)result + 62) |= 0x4000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)result + 3) = self->_mptcpAggregateCellBytes;
  *((_DWORD *)result + 62) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)result + 10) = self->_mptcpHandoverAllBytes;
  *((_DWORD *)result + 62) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)result + 25) = self->_mptcpInteractiveAllBytes;
  *((_DWORD *)result + 62) |= 0x1000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)result + 1) = self->_mptcpAggregateAllBytes;
  *((_DWORD *)result + 62) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)result + 4) = self->_mptcpBackToWiFi;
  *((_DWORD *)result + 62) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)result + 5) = self->_mptcpCellDenied;
  *((_DWORD *)result + 62) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)result + 6) = self->_mptcpCellProxy;
  *((_DWORD *)result + 62) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      return result;
    goto LABEL_31;
  }
LABEL_61:
  *((_QWORD *)result + 30) = self->_mptcpWiFiProxy;
  *((_DWORD *)result + 62) |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
    return result;
LABEL_31:
  *((_QWORD *)result + 29) = self->_mptcpTriggeredCell;
  *((_DWORD *)result + 62) |= 0x10000000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $A42C86F35415F5D5ABC6B48FCFD0454C has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 62);
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_mptcpHandoverAttempts != *((_QWORD *)a3 + 11))
        goto LABEL_151;
    }
    else if ((v7 & 0x400) != 0)
    {
LABEL_151:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_mptcpInteractiveAttempt != *((_QWORD *)a3 + 26))
        goto LABEL_151;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_mptcpAggregateAttempt != *((_QWORD *)a3 + 2))
        goto LABEL_151;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_mptcpFirstPartyHandoverAttempt != *((_QWORD *)a3 + 8))
        goto LABEL_151;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_mptcpFirstPartyInteractiveAttempt != *((_QWORD *)a3 + 9))
        goto LABEL_151;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_mptcpFirstPartyAggregateAttempt != *((_QWORD *)a3 + 7))
        goto LABEL_151;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_mptcpHeuristicFallback != *((_QWORD *)a3 + 23))
        goto LABEL_151;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_mptcpHeuristicFallbackFirstParty != *((_QWORD *)a3 + 24))
        goto LABEL_151;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_mptcpHandshakeHandoverSuccessWiFi != *((_QWORD *)a3 + 19))
        goto LABEL_151;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_mptcpHandshakeHandoverSuccessCell != *((_QWORD *)a3 + 17))
        goto LABEL_151;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_mptcpHandshakeInteractiveSuccess != *((_QWORD *)a3 + 21))
        goto LABEL_151;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_mptcpHandshakeAggregateSuccess != *((_QWORD *)a3 + 15))
        goto LABEL_151;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_mptcpHandshakeHandoverSuccessWiFiFirstParty != *((_QWORD *)a3 + 20))
        goto LABEL_151;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_mptcpHandshakeHandoverSuccessCellFirstParty != *((_QWORD *)a3 + 18))
        goto LABEL_151;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_mptcpHandshakeInteractiveSuccessFirstParty != *((_QWORD *)a3 + 22))
        goto LABEL_151;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_mptcpHandshakeAggregateSuccessFirstParty != *((_QWORD *)a3 + 16))
        goto LABEL_151;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_mptcpHandoverCellSubflowFromWiFi != *((_QWORD *)a3 + 13))
        goto LABEL_151;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_mptcpHandoverWiFiSubflowFromCell != *((_QWORD *)a3 + 14))
        goto LABEL_151;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_mptcpInteractiveCellUsage != *((_QWORD *)a3 + 28))
        goto LABEL_151;
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_mptcpHandoverCellBytes != *((_QWORD *)a3 + 12))
        goto LABEL_151;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_mptcpInteractiveCellBytes != *((_QWORD *)a3 + 27))
        goto LABEL_151;
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_mptcpAggregateCellBytes != *((_QWORD *)a3 + 3))
        goto LABEL_151;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_mptcpHandoverAllBytes != *((_QWORD *)a3 + 10))
        goto LABEL_151;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_mptcpInteractiveAllBytes != *((_QWORD *)a3 + 25))
        goto LABEL_151;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_mptcpAggregateAllBytes != *((_QWORD *)a3 + 1))
        goto LABEL_151;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_mptcpBackToWiFi != *((_QWORD *)a3 + 4))
        goto LABEL_151;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_mptcpCellDenied != *((_QWORD *)a3 + 5))
        goto LABEL_151;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_mptcpCellProxy != *((_QWORD *)a3 + 6))
        goto LABEL_151;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_mptcpWiFiProxy != *((_QWORD *)a3 + 30))
        goto LABEL_151;
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_151;
    }
    LOBYTE(v5) = (v7 & 0x10000000) == 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_mptcpTriggeredCell != *((_QWORD *)a3 + 29))
        goto LABEL_151;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $A42C86F35415F5D5ABC6B48FCFD0454C has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v33 = 2654435761u * self->_mptcpHandoverAttempts;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
LABEL_3:
      v32 = 2654435761u * self->_mptcpInteractiveAttempt;
      if ((*(_BYTE *)&has & 2) != 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else
  {
    v33 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_3;
  }
  v32 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_4:
    v31 = 2654435761u * self->_mptcpAggregateAttempt;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  v31 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_5:
    v3 = 2654435761u * self->_mptcpFirstPartyHandoverAttempt;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  v3 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_6:
    v4 = 2654435761u * self->_mptcpFirstPartyInteractiveAttempt;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_7:
    v5 = 2654435761u * self->_mptcpFirstPartyAggregateAttempt;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_8:
    v6 = 2654435761u * self->_mptcpHeuristicFallback;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_9:
    v7 = 2654435761u * self->_mptcpHeuristicFallbackFirstParty;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_10:
    v8 = 2654435761u * self->_mptcpHandshakeHandoverSuccessWiFi;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_11:
    v9 = 2654435761u * self->_mptcpHandshakeHandoverSuccessCell;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_12:
    v10 = 2654435761u * self->_mptcpHandshakeInteractiveSuccess;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  v10 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    v11 = 2654435761u * self->_mptcpHandshakeAggregateSuccess;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    v12 = 2654435761u * self->_mptcpHandshakeHandoverSuccessWiFiFirstParty;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_15:
    v13 = 2654435761u * self->_mptcpHandshakeHandoverSuccessCellFirstParty;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_16:
    v14 = 2654435761u * self->_mptcpHandshakeInteractiveSuccessFirstParty;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    v15 = 2654435761u * self->_mptcpHandshakeAggregateSuccessFirstParty;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  v15 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    v16 = 2654435761u * self->_mptcpHandoverCellSubflowFromWiFi;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  v16 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_19:
    v17 = 2654435761u * self->_mptcpHandoverWiFiSubflowFromCell;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_20:
    v18 = 2654435761u * self->_mptcpInteractiveCellUsage;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  v18 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_21:
    v19 = 2654435761u * self->_mptcpHandoverCellBytes;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_22:
    v20 = 2654435761u * self->_mptcpInteractiveCellBytes;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  v20 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_23:
    v21 = 2654435761u * self->_mptcpAggregateCellBytes;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  v21 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_24:
    v22 = 2654435761u * self->_mptcpHandoverAllBytes;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_25:
    v23 = 2654435761u * self->_mptcpInteractiveAllBytes;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  v23 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_26:
    v24 = 2654435761u * self->_mptcpAggregateAllBytes;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  v24 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_27:
    v25 = 2654435761u * self->_mptcpBackToWiFi;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  v25 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_28:
    v26 = 2654435761u * self->_mptcpCellDenied;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  v26 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_29:
    v27 = 2654435761u * self->_mptcpCellProxy;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_30;
LABEL_60:
    v28 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_31;
LABEL_61:
    v29 = 0;
    return v32 ^ v33 ^ v31 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_59:
  v27 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
    goto LABEL_60;
LABEL_30:
  v28 = 2654435761u * self->_mptcpWiFiProxy;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
    goto LABEL_61;
LABEL_31:
  v29 = 2654435761u * self->_mptcpTriggeredCell;
  return v32 ^ v33 ^ v31 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x400) != 0)
  {
    self->_mptcpHandoverAttempts = *((_QWORD *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
    v3 = *((_DWORD *)a3 + 62);
    if ((v3 & 0x2000000) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((v3 & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  self->_mptcpInteractiveAttempt = *((_QWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  self->_mptcpAggregateAttempt = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  self->_mptcpFirstPartyHandoverAttempt = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  self->_mptcpFirstPartyInteractiveAttempt = *((_QWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x400000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  self->_mptcpFirstPartyAggregateAttempt = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x400000) == 0)
  {
LABEL_8:
    if ((v3 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  self->_mptcpHeuristicFallback = *((_QWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x400000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x800000) == 0)
  {
LABEL_9:
    if ((v3 & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  self->_mptcpHeuristicFallbackFirstParty = *((_QWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x40000) == 0)
  {
LABEL_10:
    if ((v3 & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  self->_mptcpHandshakeHandoverSuccessWiFi = *((_QWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x10000) == 0)
  {
LABEL_11:
    if ((v3 & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  self->_mptcpHandshakeHandoverSuccessCell = *((_QWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x100000) == 0)
  {
LABEL_12:
    if ((v3 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  self->_mptcpHandshakeInteractiveSuccess = *((_QWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x4000) == 0)
  {
LABEL_13:
    if ((v3 & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  self->_mptcpHandshakeAggregateSuccess = *((_QWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x80000) == 0)
  {
LABEL_14:
    if ((v3 & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  self->_mptcpHandshakeHandoverSuccessWiFiFirstParty = *((_QWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20000) == 0)
  {
LABEL_15:
    if ((v3 & 0x200000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  self->_mptcpHandshakeHandoverSuccessCellFirstParty = *((_QWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x200000) == 0)
  {
LABEL_16:
    if ((v3 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  self->_mptcpHandshakeInteractiveSuccessFirstParty = *((_QWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x8000) == 0)
  {
LABEL_17:
    if ((v3 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  self->_mptcpHandshakeAggregateSuccessFirstParty = *((_QWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x1000) == 0)
  {
LABEL_18:
    if ((v3 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  self->_mptcpHandoverCellSubflowFromWiFi = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x2000) == 0)
  {
LABEL_19:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  self->_mptcpHandoverWiFiSubflowFromCell = *((_QWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  self->_mptcpInteractiveCellUsage = *((_QWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x800) == 0)
  {
LABEL_21:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  self->_mptcpHandoverCellBytes = *((_QWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_22:
    if ((v3 & 4) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  self->_mptcpInteractiveCellBytes = *((_QWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 4) == 0)
  {
LABEL_23:
    if ((v3 & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  self->_mptcpAggregateCellBytes = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x200) == 0)
  {
LABEL_24:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  self->_mptcpHandoverAllBytes = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_25:
    if ((v3 & 1) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  self->_mptcpInteractiveAllBytes = *((_QWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 1) == 0)
  {
LABEL_26:
    if ((v3 & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  self->_mptcpAggregateAllBytes = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 8) == 0)
  {
LABEL_27:
    if ((v3 & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  self->_mptcpBackToWiFi = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x10) == 0)
  {
LABEL_28:
    if ((v3 & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  self->_mptcpCellDenied = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20) == 0)
  {
LABEL_29:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  self->_mptcpCellProxy = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x10000000) == 0)
      return;
LABEL_61:
    self->_mptcpTriggeredCell = *((_QWORD *)a3 + 29);
    *(_DWORD *)&self->_has |= 0x10000000u;
    return;
  }
LABEL_60:
  self->_mptcpWiFiProxy = *((_QWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x20000000u;
  if ((*((_DWORD *)a3 + 62) & 0x10000000) != 0)
    goto LABEL_61;
}

- (unint64_t)mptcpHandoverAttempts
{
  return self->_mptcpHandoverAttempts;
}

- (unint64_t)mptcpInteractiveAttempt
{
  return self->_mptcpInteractiveAttempt;
}

- (unint64_t)mptcpAggregateAttempt
{
  return self->_mptcpAggregateAttempt;
}

- (unint64_t)mptcpFirstPartyHandoverAttempt
{
  return self->_mptcpFirstPartyHandoverAttempt;
}

- (unint64_t)mptcpFirstPartyInteractiveAttempt
{
  return self->_mptcpFirstPartyInteractiveAttempt;
}

- (unint64_t)mptcpFirstPartyAggregateAttempt
{
  return self->_mptcpFirstPartyAggregateAttempt;
}

- (unint64_t)mptcpHeuristicFallback
{
  return self->_mptcpHeuristicFallback;
}

- (unint64_t)mptcpHeuristicFallbackFirstParty
{
  return self->_mptcpHeuristicFallbackFirstParty;
}

- (unint64_t)mptcpHandshakeHandoverSuccessWiFi
{
  return self->_mptcpHandshakeHandoverSuccessWiFi;
}

- (unint64_t)mptcpHandshakeHandoverSuccessCell
{
  return self->_mptcpHandshakeHandoverSuccessCell;
}

- (unint64_t)mptcpHandshakeInteractiveSuccess
{
  return self->_mptcpHandshakeInteractiveSuccess;
}

- (unint64_t)mptcpHandshakeAggregateSuccess
{
  return self->_mptcpHandshakeAggregateSuccess;
}

- (unint64_t)mptcpHandshakeHandoverSuccessWiFiFirstParty
{
  return self->_mptcpHandshakeHandoverSuccessWiFiFirstParty;
}

- (unint64_t)mptcpHandshakeHandoverSuccessCellFirstParty
{
  return self->_mptcpHandshakeHandoverSuccessCellFirstParty;
}

- (unint64_t)mptcpHandshakeInteractiveSuccessFirstParty
{
  return self->_mptcpHandshakeInteractiveSuccessFirstParty;
}

- (unint64_t)mptcpHandshakeAggregateSuccessFirstParty
{
  return self->_mptcpHandshakeAggregateSuccessFirstParty;
}

- (unint64_t)mptcpHandoverCellSubflowFromWiFi
{
  return self->_mptcpHandoverCellSubflowFromWiFi;
}

- (unint64_t)mptcpHandoverWiFiSubflowFromCell
{
  return self->_mptcpHandoverWiFiSubflowFromCell;
}

- (unint64_t)mptcpInteractiveCellUsage
{
  return self->_mptcpInteractiveCellUsage;
}

- (unint64_t)mptcpHandoverCellBytes
{
  return self->_mptcpHandoverCellBytes;
}

- (unint64_t)mptcpInteractiveCellBytes
{
  return self->_mptcpInteractiveCellBytes;
}

- (unint64_t)mptcpAggregateCellBytes
{
  return self->_mptcpAggregateCellBytes;
}

- (unint64_t)mptcpHandoverAllBytes
{
  return self->_mptcpHandoverAllBytes;
}

- (unint64_t)mptcpInteractiveAllBytes
{
  return self->_mptcpInteractiveAllBytes;
}

- (unint64_t)mptcpAggregateAllBytes
{
  return self->_mptcpAggregateAllBytes;
}

- (unint64_t)mptcpBackToWiFi
{
  return self->_mptcpBackToWiFi;
}

- (unint64_t)mptcpCellDenied
{
  return self->_mptcpCellDenied;
}

- (unint64_t)mptcpCellProxy
{
  return self->_mptcpCellProxy;
}

- (unint64_t)mptcpWiFiProxy
{
  return self->_mptcpWiFiProxy;
}

- (unint64_t)mptcpTriggeredCell
{
  return self->_mptcpTriggeredCell;
}

@end
