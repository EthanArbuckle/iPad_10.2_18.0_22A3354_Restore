@implementation WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions

- (void)clearCTLMIndexs
{
  -[NSMutableArray removeAllObjects](self->_cTLMIndexs, "removeAllObjects");
}

- (void)addCTLMIndex:(id)a3
{
  id v4;
  NSMutableArray *cTLMIndexs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cTLMIndexs = self->_cTLMIndexs;
  v8 = v4;
  if (!cTLMIndexs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_cTLMIndexs;
    self->_cTLMIndexs = v6;

    v4 = v8;
    cTLMIndexs = self->_cTLMIndexs;
  }
  -[NSMutableArray addObject:](cTLMIndexs, "addObject:", v4);

}

- (unint64_t)cTLMIndexsCount
{
  return -[NSMutableArray count](self->_cTLMIndexs, "count");
}

- (id)cTLMIndexAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cTLMIndexs, "objectAtIndex:", a3);
}

+ (Class)cTLMIndexType
{
  return (Class)objc_opt_class();
}

- (void)clearTxPowerBackoffDBs
{
  -[NSMutableArray removeAllObjects](self->_txPowerBackoffDBs, "removeAllObjects");
}

- (void)addTxPowerBackoffDB:(id)a3
{
  id v4;
  NSMutableArray *txPowerBackoffDBs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txPowerBackoffDBs = self->_txPowerBackoffDBs;
  v8 = v4;
  if (!txPowerBackoffDBs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txPowerBackoffDBs;
    self->_txPowerBackoffDBs = v6;

    v4 = v8;
    txPowerBackoffDBs = self->_txPowerBackoffDBs;
  }
  -[NSMutableArray addObject:](txPowerBackoffDBs, "addObject:", v4);

}

- (unint64_t)txPowerBackoffDBsCount
{
  return -[NSMutableArray count](self->_txPowerBackoffDBs, "count");
}

- (id)txPowerBackoffDBAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txPowerBackoffDBs, "objectAtIndex:", a3);
}

+ (Class)txPowerBackoffDBType
{
  return (Class)objc_opt_class();
}

- (void)clearTxDutyCyclePcts
{
  -[NSMutableArray removeAllObjects](self->_txDutyCyclePcts, "removeAllObjects");
}

- (void)addTxDutyCyclePct:(id)a3
{
  id v4;
  NSMutableArray *txDutyCyclePcts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txDutyCyclePcts = self->_txDutyCyclePcts;
  v8 = v4;
  if (!txDutyCyclePcts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txDutyCyclePcts;
    self->_txDutyCyclePcts = v6;

    v4 = v8;
    txDutyCyclePcts = self->_txDutyCyclePcts;
  }
  -[NSMutableArray addObject:](txDutyCyclePcts, "addObject:", v4);

}

- (unint64_t)txDutyCyclePctsCount
{
  return -[NSMutableArray count](self->_txDutyCyclePcts, "count");
}

- (id)txDutyCyclePctAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txDutyCyclePcts, "objectAtIndex:", a3);
}

+ (Class)txDutyCyclePctType
{
  return (Class)objc_opt_class();
}

- (void)clearCTLMIndex1s
{
  -[NSMutableArray removeAllObjects](self->_cTLMIndex1s, "removeAllObjects");
}

- (void)addCTLMIndex1:(id)a3
{
  id v4;
  NSMutableArray *cTLMIndex1s;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cTLMIndex1s = self->_cTLMIndex1s;
  v8 = v4;
  if (!cTLMIndex1s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_cTLMIndex1s;
    self->_cTLMIndex1s = v6;

    v4 = v8;
    cTLMIndex1s = self->_cTLMIndex1s;
  }
  -[NSMutableArray addObject:](cTLMIndex1s, "addObject:", v4);

}

- (unint64_t)cTLMIndex1sCount
{
  return -[NSMutableArray count](self->_cTLMIndex1s, "count");
}

- (id)cTLMIndex1AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cTLMIndex1s, "objectAtIndex:", a3);
}

+ (Class)cTLMIndex1Type
{
  return (Class)objc_opt_class();
}

- (void)clearTxPowerBackoffDB1s
{
  -[NSMutableArray removeAllObjects](self->_txPowerBackoffDB1s, "removeAllObjects");
}

- (void)addTxPowerBackoffDB1:(id)a3
{
  id v4;
  NSMutableArray *txPowerBackoffDB1s;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  v8 = v4;
  if (!txPowerBackoffDB1s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txPowerBackoffDB1s;
    self->_txPowerBackoffDB1s = v6;

    v4 = v8;
    txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  }
  -[NSMutableArray addObject:](txPowerBackoffDB1s, "addObject:", v4);

}

- (unint64_t)txPowerBackoffDB1sCount
{
  return -[NSMutableArray count](self->_txPowerBackoffDB1s, "count");
}

- (id)txPowerBackoffDB1AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txPowerBackoffDB1s, "objectAtIndex:", a3);
}

+ (Class)txPowerBackoffDB1Type
{
  return (Class)objc_opt_class();
}

- (void)clearTxDutyCyclePct1s
{
  -[NSMutableArray removeAllObjects](self->_txDutyCyclePct1s, "removeAllObjects");
}

- (void)addTxDutyCyclePct1:(id)a3
{
  id v4;
  NSMutableArray *txDutyCyclePct1s;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  txDutyCyclePct1s = self->_txDutyCyclePct1s;
  v8 = v4;
  if (!txDutyCyclePct1s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_txDutyCyclePct1s;
    self->_txDutyCyclePct1s = v6;

    v4 = v8;
    txDutyCyclePct1s = self->_txDutyCyclePct1s;
  }
  -[NSMutableArray addObject:](txDutyCyclePct1s, "addObject:", v4);

}

- (unint64_t)txDutyCyclePct1sCount
{
  return -[NSMutableArray count](self->_txDutyCyclePct1s, "count");
}

- (id)txDutyCyclePct1AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_txDutyCyclePct1s, "objectAtIndex:", a3);
}

+ (Class)txDutyCyclePct1Type
{
  return (Class)objc_opt_class();
}

- (void)setTxduty0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_txduty0 = a3;
}

- (void)setHasTxduty0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTxduty0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTxduty1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_txduty1 = a3;
}

- (void)setHasTxduty1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTxduty1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setTxpowerbackoff0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_txpowerbackoff0 = a3;
}

- (void)setHasTxpowerbackoff0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTxpowerbackoff0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTxpowerbackoff1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_txpowerbackoff1 = a3;
}

- (void)setHasTxpowerbackoff1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTxpowerbackoff1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setActivechains0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_activechains0 = a3;
}

- (void)setHasActivechains0:(BOOL)a3
{
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasActivechains0
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setActivechains1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activechains1 = a3;
}

- (void)setHasActivechains1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActivechains1
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTemp0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_temp0 = a3;
}

- (void)setHasTemp0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTemp0
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTemp1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_temp1 = a3;
}

- (void)setHasTemp1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTemp1
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setVoltage0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_voltage0 = a3;
}

- (void)setHasVoltage0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasVoltage0
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setVoltage1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_voltage1 = a3;
}

- (void)setHasVoltage1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasVoltage1
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setPpm0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_ppm0 = a3;
}

- (void)setHasPpm0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPpm0
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPpm1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_ppm1 = a3;
}

- (void)setHasPpm1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPpm1
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCtlmid0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_ctlmid0 = a3;
}

- (void)setHasCtlmid0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCtlmid0
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCtlmid1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_ctlmid1 = a3;
}

- (void)setHasCtlmid1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCtlmid1
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTvpmindex0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tvpmindex0 = a3;
}

- (void)setHasTvpmindex0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTvpmindex0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTvpmindex1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_tvpmindex1 = a3;
}

- (void)setHasTvpmindex1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTvpmindex1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRc1Request:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_rc1Request = a3;
}

- (void)setHasRc1Request:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRc1Request
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRc1Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_rc1Duration = a3;
}

- (void)setHasRc1Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasRc1Duration
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRc1wlanCrit:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rc1wlanCrit = a3;
}

- (void)setHasRc1wlanCrit:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRc1wlanCrit
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setRc1wlanCritDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rc1wlanCritDuration = a3;
}

- (void)setHasRc1wlanCritDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRc1wlanCritDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRc2Request:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rc2Request = a3;
}

- (void)setHasRc2Request:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRc2Request
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRc2Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rc2Duration = a3;
}

- (void)setHasRc2Duration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRc2Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRc2Grant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_rc2Grant = a3;
}

- (void)setHasRc2Grant:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRc2Grant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRc2LongGrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rc2LongGrant = a3;
}

- (void)setHasRc2LongGrant:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRc2LongGrant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRc2cts2a:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rc2cts2a = a3;
}

- (void)setHasRc2cts2a:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRc2cts2a
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasSdbtdm
{
  return self->_sdbtdm != 0;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions;
  -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  void *v45;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has;
  void *v47;
  WiFiAnalyticsAWDWiFiTDM *sdbtdm;
  void *v49;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_cTLMIndexs, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_cTLMIndexs, "count"));
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v5 = self->_cTLMIndexs;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v97 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("CTLMIndex"));
  }
  if (-[NSMutableArray count](self->_txPowerBackoffDBs, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txPowerBackoffDBs, "count"));
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v12 = self->_txPowerBackoffDBs;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v93;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v93 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * j), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("TxPowerBackoff_dB"));
  }
  if (-[NSMutableArray count](self->_txDutyCyclePcts, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txDutyCyclePcts, "count"));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v19 = self->_txDutyCyclePcts;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v89;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v89 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * k), "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("TxDutyCycle_pct"));
  }
  if (-[NSMutableArray count](self->_cTLMIndex1s, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_cTLMIndex1s, "count"));
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v26 = self->_cTLMIndex1s;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v85;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v85 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * m), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("CTLMIndex1"));
  }
  if (-[NSMutableArray count](self->_txPowerBackoffDB1s, "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txPowerBackoffDB1s, "count"));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v33 = self->_txPowerBackoffDB1s;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v81;
      do
      {
        for (n = 0; n != v35; ++n)
        {
          if (*(_QWORD *)v81 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * n), "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
      }
      while (v35);
    }

    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("TxPowerBackoff_dB1"));
  }
  if (-[NSMutableArray count](self->_txDutyCyclePct1s, "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_txDutyCyclePct1s, "count"));
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v40 = self->_txDutyCyclePct1s;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v77;
      do
      {
        for (ii = 0; ii != v42; ++ii)
        {
          if (*(_QWORD *)v77 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * ii), "dictionaryRepresentation", (_QWORD)v76);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45);

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("TxDutyCycle_pct1"));
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txduty0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("txduty0"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_58;
      goto LABEL_86;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txduty1, (_QWORD)v76);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("txduty1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_59;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txpowerbackoff0, (_QWORD)v76);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("txpowerbackoff0"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_60;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_txpowerbackoff1, (_QWORD)v76);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("txpowerbackoff1"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_60:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_61;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_activechains0, (_QWORD)v76);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("activechains0"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_62;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_activechains1, (_QWORD)v76);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("activechains1"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_63;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_temp0, (_QWORD)v76);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("temp0"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_64;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_temp1, (_QWORD)v76);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("temp1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_65;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_voltage0, (_QWORD)v76);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("voltage0"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_65:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_66;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_voltage1, (_QWORD)v76);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("voltage1"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_66:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_67;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ppm0, (_QWORD)v76);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("ppm0"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_67:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_68;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ppm1, (_QWORD)v76);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("ppm1"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_68:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_69;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ctlmid0, (_QWORD)v76);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("ctlmid0"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_70;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ctlmid1, (_QWORD)v76);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("ctlmid1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_71;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tvpmindex0, (_QWORD)v76);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("tvpmindex0"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_71:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_72;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tvpmindex1, (_QWORD)v76);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("tvpmindex1"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_72:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_73;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc1Request, (_QWORD)v76);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("rc1Request"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_73:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_74;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc1Duration, (_QWORD)v76);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("rc1Duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_74:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_75;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc1wlanCrit, (_QWORD)v76);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("rc1wlanCrit"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_75:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_76;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc1wlanCritDuration, (_QWORD)v76);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("rc1wlanCritDuration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_76:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_77;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc2Request, (_QWORD)v76);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("rc2Request"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_77:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_78;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc2Duration, (_QWORD)v76);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("rc2Duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_79;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc2Grant, (_QWORD)v76);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("rc2Grant"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_79:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_81;
    goto LABEL_80;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc2LongGrant, (_QWORD)v76);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("rc2LongGrant"));

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_80:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc2cts2a, (_QWORD)v76);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("rc2cts2a"));

  }
LABEL_81:
  sdbtdm = self->_sdbtdm;
  if (sdbtdm)
  {
    -[WiFiAnalyticsAWDWiFiTDM dictionaryRepresentation](sdbtdm, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("sdbtdm"));

  }
  v50 = v3;

  return v50;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityImpedingFunctionsReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has;
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
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v5 = self->_cTLMIndexs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v57;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v7);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v10 = self->_txPowerBackoffDBs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v12);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = self->_txDutyCyclePcts;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    }
    while (v17);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = self->_cTLMIndex1s;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
    }
    while (v22);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v25 = self->_txPowerBackoffDB1s;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v41;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
    }
    while (v27);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v30 = self->_txDutyCyclePct1s;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v36, v60, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v37;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v36, v60, 16);
    }
    while (v32);
  }

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_45:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_46;
      goto LABEL_74;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_47;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_47:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_48;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_49;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_50;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_51;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_52;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_53;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_53:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_54;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_54:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_55;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_55:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_56;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_56:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_57;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_58;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_59;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_60;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_60:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_61;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_62;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_63;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_63:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_64;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_65;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_66;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_67;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
LABEL_68:
    PBDataWriterWriteUint32Field();
LABEL_69:
  if (self->_sdbtdm)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has;
  void *v29;
  _DWORD *v30;

  v30 = a3;
  if (-[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions cTLMIndexsCount](self, "cTLMIndexsCount"))
  {
    objc_msgSend(v30, "clearCTLMIndexs");
    v4 = -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions cTLMIndexsCount](self, "cTLMIndexsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions cTLMIndexAtIndex:](self, "cTLMIndexAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addCTLMIndex:", v7);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txPowerBackoffDBsCount](self, "txPowerBackoffDBsCount"))
  {
    objc_msgSend(v30, "clearTxPowerBackoffDBs");
    v8 = -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txPowerBackoffDBsCount](self, "txPowerBackoffDBsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txPowerBackoffDBAtIndex:](self, "txPowerBackoffDBAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addTxPowerBackoffDB:", v11);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txDutyCyclePctsCount](self, "txDutyCyclePctsCount"))
  {
    objc_msgSend(v30, "clearTxDutyCyclePcts");
    v12 = -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txDutyCyclePctsCount](self, "txDutyCyclePctsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txDutyCyclePctAtIndex:](self, "txDutyCyclePctAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addTxDutyCyclePct:", v15);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions cTLMIndex1sCount](self, "cTLMIndex1sCount"))
  {
    objc_msgSend(v30, "clearCTLMIndex1s");
    v16 = -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions cTLMIndex1sCount](self, "cTLMIndex1sCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions cTLMIndex1AtIndex:](self, "cTLMIndex1AtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addCTLMIndex1:", v19);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txPowerBackoffDB1sCount](self, "txPowerBackoffDB1sCount"))
  {
    objc_msgSend(v30, "clearTxPowerBackoffDB1s");
    v20 = -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txPowerBackoffDB1sCount](self, "txPowerBackoffDB1sCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txPowerBackoffDB1AtIndex:](self, "txPowerBackoffDB1AtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addTxPowerBackoffDB1:", v23);

      }
    }
  }
  if (-[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txDutyCyclePct1sCount](self, "txDutyCyclePct1sCount"))
  {
    objc_msgSend(v30, "clearTxDutyCyclePct1s");
    v24 = -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txDutyCyclePct1sCount](self, "txDutyCyclePct1sCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions txDutyCyclePct1AtIndex:](self, "txDutyCyclePct1AtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addTxDutyCyclePct1:", v27);

      }
    }
  }
  has = self->_has;
  v29 = v30;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v30[36] = self->_txduty0;
    v30[42] |= 0x80000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_28;
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_27;
  }
  v30[37] = self->_txduty1;
  v30[42] |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_29;
    goto LABEL_57;
  }
LABEL_56:
  v30[38] = self->_txpowerbackoff0;
  v30[42] |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_30;
    goto LABEL_58;
  }
LABEL_57:
  v30[39] = self->_txpowerbackoff1;
  v30[42] |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_31;
    goto LABEL_59;
  }
LABEL_58:
  v30[2] = self->_activechains0;
  v30[42] |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_60;
  }
LABEL_59:
  v30[3] = self->_activechains1;
  v30[42] |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_61;
  }
LABEL_60:
  v30[24] = self->_temp0;
  v30[42] |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_34;
    goto LABEL_62;
  }
LABEL_61:
  v30[25] = self->_temp1;
  v30[42] |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_63;
  }
LABEL_62:
  v30[40] = self->_voltage0;
  v30[42] |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_64;
  }
LABEL_63:
  v30[41] = self->_voltage1;
  v30[42] |= 0x1000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_37;
    goto LABEL_65;
  }
LABEL_64:
  v30[10] = self->_ppm0;
  v30[42] |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_38;
    goto LABEL_66;
  }
LABEL_65:
  v30[11] = self->_ppm1;
  v30[42] |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_39;
    goto LABEL_67;
  }
LABEL_66:
  v30[8] = self->_ctlmid0;
  v30[42] |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_40;
    goto LABEL_68;
  }
LABEL_67:
  v30[9] = self->_ctlmid1;
  v30[42] |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_41;
    goto LABEL_69;
  }
LABEL_68:
  v30[26] = self->_tvpmindex0;
  v30[42] |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_41:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_42;
    goto LABEL_70;
  }
LABEL_69:
  v30[27] = self->_tvpmindex1;
  v30[42] |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_43;
    goto LABEL_71;
  }
LABEL_70:
  v30[13] = self->_rc1Request;
  v30[42] |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_44;
    goto LABEL_72;
  }
LABEL_71:
  v30[12] = self->_rc1Duration;
  v30[42] |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_45;
    goto LABEL_73;
  }
LABEL_72:
  v30[14] = self->_rc1wlanCrit;
  v30[42] |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_46;
    goto LABEL_74;
  }
LABEL_73:
  v30[15] = self->_rc1wlanCritDuration;
  v30[42] |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_47;
    goto LABEL_75;
  }
LABEL_74:
  v30[19] = self->_rc2Request;
  v30[42] |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_48;
    goto LABEL_76;
  }
LABEL_75:
  v30[16] = self->_rc2Duration;
  v30[42] |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_49;
    goto LABEL_77;
  }
LABEL_76:
  v30[17] = self->_rc2Grant;
  v30[42] |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
LABEL_77:
  v30[18] = self->_rc2LongGrant;
  v30[42] |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_50:
    v30[20] = self->_rc2cts2a;
    v30[42] |= 0x4000u;
  }
LABEL_51:
  if (self->_sdbtdm)
  {
    objc_msgSend(v30, "setSdbtdm:");
    v29 = v30;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has;
  id v43;
  void *v44;
  id v45;
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
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v6 = self->_cTLMIndexs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v68;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v68 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCTLMIndex:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v8);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v12 = self->_txPowerBackoffDBs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v64;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v64 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxPowerBackoffDB:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v14);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v18 = self->_txDutyCyclePcts;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v60;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v60 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxDutyCyclePct:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    }
    while (v20);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v24 = self->_cTLMIndex1s;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v56;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v56 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v28), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCTLMIndex1:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
    }
    while (v26);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v30 = self->_txPowerBackoffDB1s;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v52;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v52 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v34), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTxPowerBackoffDB1:", v35);

        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
    }
    while (v32);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v36 = self->_txDutyCyclePct1s;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v48;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v48 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v40), "copyWithZone:", a3, (_QWORD)v47);
        objc_msgSend((id)v5, "addTxDutyCyclePct1:", v41);

        ++v40;
      }
      while (v38 != v40);
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
    }
    while (v38);
  }

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_txduty0;
    *(_DWORD *)(v5 + 168) |= 0x80000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_45:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_46;
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_45;
  }
  *(_DWORD *)(v5 + 148) = self->_txduty1;
  *(_DWORD *)(v5 + 168) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_47;
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 152) = self->_txpowerbackoff0;
  *(_DWORD *)(v5 + 168) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_47:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_48;
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 156) = self->_txpowerbackoff1;
  *(_DWORD *)(v5 + 168) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_49;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 8) = self->_activechains0;
  *(_DWORD *)(v5 + 168) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_50;
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 12) = self->_activechains1;
  *(_DWORD *)(v5 + 168) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_51;
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 96) = self->_temp0;
  *(_DWORD *)(v5 + 168) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_52;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 100) = self->_temp1;
  *(_DWORD *)(v5 + 168) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_53;
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v5 + 160) = self->_voltage0;
  *(_DWORD *)(v5 + 168) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_53:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_54;
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 164) = self->_voltage1;
  *(_DWORD *)(v5 + 168) |= 0x1000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_54:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_55;
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v5 + 40) = self->_ppm0;
  *(_DWORD *)(v5 + 168) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_55:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_56;
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v5 + 44) = self->_ppm1;
  *(_DWORD *)(v5 + 168) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_56:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_57;
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 32) = self->_ctlmid0;
  *(_DWORD *)(v5 + 168) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_58;
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v5 + 36) = self->_ctlmid1;
  *(_DWORD *)(v5 + 168) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_59;
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v5 + 104) = self->_tvpmindex0;
  *(_DWORD *)(v5 + 168) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_60;
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 108) = self->_tvpmindex1;
  *(_DWORD *)(v5 + 168) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_60:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_61;
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v5 + 52) = self->_rc1Request;
  *(_DWORD *)(v5 + 168) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_62;
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v5 + 48) = self->_rc1Duration;
  *(_DWORD *)(v5 + 168) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_63;
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v5 + 56) = self->_rc1wlanCrit;
  *(_DWORD *)(v5 + 168) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_63:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_64;
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v5 + 60) = self->_rc1wlanCritDuration;
  *(_DWORD *)(v5 + 168) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_65;
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v5 + 76) = self->_rc2Request;
  *(_DWORD *)(v5 + 168) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_66;
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v5 + 64) = self->_rc2Duration;
  *(_DWORD *)(v5 + 168) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_67;
LABEL_93:
    *(_DWORD *)(v5 + 72) = self->_rc2LongGrant;
    *(_DWORD *)(v5 + 168) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_92:
  *(_DWORD *)(v5 + 68) = self->_rc2Grant;
  *(_DWORD *)(v5 + 168) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
    goto LABEL_93;
LABEL_67:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_68:
    *(_DWORD *)(v5 + 80) = self->_rc2cts2a;
    *(_DWORD *)(v5 + 168) |= 0x4000u;
  }
LABEL_69:
  v43 = -[WiFiAnalyticsAWDWiFiTDM copyWithZone:](self->_sdbtdm, "copyWithZone:", a3, (_QWORD)v47);
  v44 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v43;

  v45 = (id)v5;
  return v45;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *cTLMIndexs;
  NSMutableArray *txPowerBackoffDBs;
  NSMutableArray *txDutyCyclePcts;
  NSMutableArray *cTLMIndex1s;
  NSMutableArray *txPowerBackoffDB1s;
  NSMutableArray *txDutyCyclePct1s;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has;
  int v12;
  WiFiAnalyticsAWDWiFiTDM *sdbtdm;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_141;
  cTLMIndexs = self->_cTLMIndexs;
  if ((unint64_t)cTLMIndexs | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](cTLMIndexs, "isEqual:"))
      goto LABEL_141;
  }
  txPowerBackoffDBs = self->_txPowerBackoffDBs;
  if ((unint64_t)txPowerBackoffDBs | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](txPowerBackoffDBs, "isEqual:"))
      goto LABEL_141;
  }
  txDutyCyclePcts = self->_txDutyCyclePcts;
  if ((unint64_t)txDutyCyclePcts | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](txDutyCyclePcts, "isEqual:"))
      goto LABEL_141;
  }
  cTLMIndex1s = self->_cTLMIndex1s;
  if ((unint64_t)cTLMIndex1s | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](cTLMIndex1s, "isEqual:"))
      goto LABEL_141;
  }
  txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  if ((unint64_t)txPowerBackoffDB1s | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](txPowerBackoffDB1s, "isEqual:"))
      goto LABEL_141;
  }
  txDutyCyclePct1s = self->_txDutyCyclePct1s;
  if ((unint64_t)txDutyCyclePct1s | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](txDutyCyclePct1s, "isEqual:"))
      goto LABEL_141;
  }
  has = self->_has;
  v12 = *((_DWORD *)v4 + 42);
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v12 & 0x80000) == 0 || self->_txduty0 != *((_DWORD *)v4 + 36))
      goto LABEL_141;
  }
  else if ((v12 & 0x80000) != 0)
  {
LABEL_141:
    v14 = 0;
    goto LABEL_142;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v12 & 0x100000) == 0 || self->_txduty1 != *((_DWORD *)v4 + 37))
      goto LABEL_141;
  }
  else if ((v12 & 0x100000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v12 & 0x200000) == 0 || self->_txpowerbackoff0 != *((_DWORD *)v4 + 38))
      goto LABEL_141;
  }
  else if ((v12 & 0x200000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0 || self->_txpowerbackoff1 != *((_DWORD *)v4 + 39))
      goto LABEL_141;
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_activechains0 != *((_DWORD *)v4 + 2))
      goto LABEL_141;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_activechains1 != *((_DWORD *)v4 + 3))
      goto LABEL_141;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_temp0 != *((_DWORD *)v4 + 24))
      goto LABEL_141;
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v12 & 0x10000) == 0 || self->_temp1 != *((_DWORD *)v4 + 25))
      goto LABEL_141;
  }
  else if ((v12 & 0x10000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0 || self->_voltage0 != *((_DWORD *)v4 + 40))
      goto LABEL_141;
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0 || self->_voltage1 != *((_DWORD *)v4 + 41))
      goto LABEL_141;
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_ppm0 != *((_DWORD *)v4 + 10))
      goto LABEL_141;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_ppm1 != *((_DWORD *)v4 + 11))
      goto LABEL_141;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_ctlmid0 != *((_DWORD *)v4 + 8))
      goto LABEL_141;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_ctlmid1 != *((_DWORD *)v4 + 9))
      goto LABEL_141;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v12 & 0x20000) == 0 || self->_tvpmindex0 != *((_DWORD *)v4 + 26))
      goto LABEL_141;
  }
  else if ((v12 & 0x20000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v12 & 0x40000) == 0 || self->_tvpmindex1 != *((_DWORD *)v4 + 27))
      goto LABEL_141;
  }
  else if ((v12 & 0x40000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_rc1Request != *((_DWORD *)v4 + 13))
      goto LABEL_141;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_rc1Duration != *((_DWORD *)v4 + 12))
      goto LABEL_141;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_rc1wlanCrit != *((_DWORD *)v4 + 14))
      goto LABEL_141;
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0 || self->_rc1wlanCritDuration != *((_DWORD *)v4 + 15))
      goto LABEL_141;
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_rc2Request != *((_DWORD *)v4 + 19))
      goto LABEL_141;
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_rc2Duration != *((_DWORD *)v4 + 16))
      goto LABEL_141;
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_rc2Grant != *((_DWORD *)v4 + 17))
      goto LABEL_141;
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_rc2LongGrant != *((_DWORD *)v4 + 18))
      goto LABEL_141;
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_rc2cts2a != *((_DWORD *)v4 + 20))
      goto LABEL_141;
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_141;
  }
  sdbtdm = self->_sdbtdm;
  if ((unint64_t)sdbtdm | *((_QWORD *)v4 + 11))
    v14 = -[WiFiAnalyticsAWDWiFiTDM isEqual:](sdbtdm, "isEqual:");
  else
    v14 = 1;
LABEL_142:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v3 = -[NSMutableArray hash](self->_cTLMIndexs, "hash");
  v35 = -[NSMutableArray hash](self->_txPowerBackoffDBs, "hash");
  v34 = -[NSMutableArray hash](self->_txDutyCyclePcts, "hash");
  v33 = -[NSMutableArray hash](self->_cTLMIndex1s, "hash");
  v32 = -[NSMutableArray hash](self->_txPowerBackoffDB1s, "hash");
  v4 = -[NSMutableArray hash](self->_txDutyCyclePct1s, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v31 = 2654435761 * self->_txduty0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_txduty1;
      if ((*(_DWORD *)&has & 0x200000) != 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else
  {
    v31 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_txpowerbackoff0;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_txpowerbackoff1;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  v8 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_activechains0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  v9 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_activechains1;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  v10 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_temp0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_temp1;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_10:
    v13 = 2654435761 * self->_voltage0;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_11:
    v14 = 2654435761 * self->_voltage1;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  v14 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_12:
    v15 = 2654435761 * self->_ppm0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  v15 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_13:
    v16 = 2654435761 * self->_ppm1;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  v16 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_14:
    v17 = 2654435761 * self->_ctlmid0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  v17 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_15:
    v18 = 2654435761 * self->_ctlmid1;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_16:
    v19 = 2654435761 * self->_tvpmindex0;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_17:
    v20 = 2654435761 * self->_tvpmindex1;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_18:
    v21 = 2654435761 * self->_rc1Request;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_19:
    v22 = 2654435761 * self->_rc1Duration;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  v22 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_20:
    v23 = 2654435761 * self->_rc1wlanCrit;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  v23 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_21:
    v24 = 2654435761 * self->_rc1wlanCritDuration;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  v24 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_22:
    v25 = 2654435761 * self->_rc2Request;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  v25 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_23:
    v26 = 2654435761 * self->_rc2Duration;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  v26 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_24:
    v27 = 2654435761 * self->_rc2Grant;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_25;
LABEL_50:
    v28 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_26;
LABEL_51:
    v29 = 0;
    return v35 ^ v3 ^ v34 ^ v33 ^ v32 ^ v4 ^ v31 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ -[WiFiAnalyticsAWDWiFiTDM hash](self->_sdbtdm, "hash");
  }
LABEL_49:
  v27 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0)
    goto LABEL_50;
LABEL_25:
  v28 = 2654435761 * self->_rc2LongGrant;
  if ((*(_WORD *)&has & 0x4000) == 0)
    goto LABEL_51;
LABEL_26:
  v29 = 2654435761 * self->_rc2cts2a;
  return v35 ^ v3 ^ v34 ^ v33 ^ v32 ^ v4 ^ v31 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ -[WiFiAnalyticsAWDWiFiTDM hash](self->_sdbtdm, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  int v35;
  WiFiAnalyticsAWDWiFiTDM *sdbtdm;
  uint64_t v37;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v5);
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions addCTLMIndex:](self, "addCTLMIndex:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v7);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v10 = *((id *)v4 + 17);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v55 != v13)
          objc_enumerationMutation(v10);
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions addTxPowerBackoffDB:](self, "addTxPowerBackoffDB:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v12);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v15 = *((id *)v4 + 15);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(v15);
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions addTxDutyCyclePct:](self, "addTxDutyCyclePct:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    }
    while (v17);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v20 = *((id *)v4 + 2);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(v20);
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions addCTLMIndex1:](self, "addCTLMIndex1:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    }
    while (v22);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = *((id *)v4 + 16);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v25);
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions addTxPowerBackoffDB1:](self, "addTxPowerBackoffDB1:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
    }
    while (v27);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = *((id *)v4 + 14);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v39;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(v30);
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions addTxDutyCyclePct1:](self, "addTxDutyCyclePct1:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * ii), (_QWORD)v38);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
    }
    while (v32);
  }

  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x80000) != 0)
  {
    self->_txduty0 = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_has |= 0x80000u;
    v35 = *((_DWORD *)v4 + 42);
    if ((v35 & 0x100000) == 0)
    {
LABEL_45:
      if ((v35 & 0x200000) == 0)
        goto LABEL_46;
      goto LABEL_74;
    }
  }
  else if ((v35 & 0x100000) == 0)
  {
    goto LABEL_45;
  }
  self->_txduty1 = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_has |= 0x100000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x200000) == 0)
  {
LABEL_46:
    if ((v35 & 0x400000) == 0)
      goto LABEL_47;
    goto LABEL_75;
  }
LABEL_74:
  self->_txpowerbackoff0 = *((_DWORD *)v4 + 38);
  *(_DWORD *)&self->_has |= 0x200000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x400000) == 0)
  {
LABEL_47:
    if ((v35 & 1) == 0)
      goto LABEL_48;
    goto LABEL_76;
  }
LABEL_75:
  self->_txpowerbackoff1 = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_has |= 0x400000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 1) == 0)
  {
LABEL_48:
    if ((v35 & 2) == 0)
      goto LABEL_49;
    goto LABEL_77;
  }
LABEL_76:
  self->_activechains0 = *((_DWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 2) == 0)
  {
LABEL_49:
    if ((v35 & 0x8000) == 0)
      goto LABEL_50;
    goto LABEL_78;
  }
LABEL_77:
  self->_activechains1 = *((_DWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 2u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x8000) == 0)
  {
LABEL_50:
    if ((v35 & 0x10000) == 0)
      goto LABEL_51;
    goto LABEL_79;
  }
LABEL_78:
  self->_temp0 = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x8000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x10000) == 0)
  {
LABEL_51:
    if ((v35 & 0x800000) == 0)
      goto LABEL_52;
    goto LABEL_80;
  }
LABEL_79:
  self->_temp1 = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x10000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x800000) == 0)
  {
LABEL_52:
    if ((v35 & 0x1000000) == 0)
      goto LABEL_53;
    goto LABEL_81;
  }
LABEL_80:
  self->_voltage0 = *((_DWORD *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x800000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x1000000) == 0)
  {
LABEL_53:
    if ((v35 & 0x10) == 0)
      goto LABEL_54;
    goto LABEL_82;
  }
LABEL_81:
  self->_voltage1 = *((_DWORD *)v4 + 41);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x10) == 0)
  {
LABEL_54:
    if ((v35 & 0x20) == 0)
      goto LABEL_55;
    goto LABEL_83;
  }
LABEL_82:
  self->_ppm0 = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x20) == 0)
  {
LABEL_55:
    if ((v35 & 4) == 0)
      goto LABEL_56;
    goto LABEL_84;
  }
LABEL_83:
  self->_ppm1 = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 4) == 0)
  {
LABEL_56:
    if ((v35 & 8) == 0)
      goto LABEL_57;
    goto LABEL_85;
  }
LABEL_84:
  self->_ctlmid0 = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 4u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 8) == 0)
  {
LABEL_57:
    if ((v35 & 0x20000) == 0)
      goto LABEL_58;
    goto LABEL_86;
  }
LABEL_85:
  self->_ctlmid1 = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 8u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x20000) == 0)
  {
LABEL_58:
    if ((v35 & 0x40000) == 0)
      goto LABEL_59;
    goto LABEL_87;
  }
LABEL_86:
  self->_tvpmindex0 = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x20000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x40000) == 0)
  {
LABEL_59:
    if ((v35 & 0x80) == 0)
      goto LABEL_60;
    goto LABEL_88;
  }
LABEL_87:
  self->_tvpmindex1 = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x40000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x80) == 0)
  {
LABEL_60:
    if ((v35 & 0x40) == 0)
      goto LABEL_61;
    goto LABEL_89;
  }
LABEL_88:
  self->_rc1Request = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x40) == 0)
  {
LABEL_61:
    if ((v35 & 0x100) == 0)
      goto LABEL_62;
    goto LABEL_90;
  }
LABEL_89:
  self->_rc1Duration = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x100) == 0)
  {
LABEL_62:
    if ((v35 & 0x200) == 0)
      goto LABEL_63;
    goto LABEL_91;
  }
LABEL_90:
  self->_rc1wlanCrit = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x200) == 0)
  {
LABEL_63:
    if ((v35 & 0x2000) == 0)
      goto LABEL_64;
    goto LABEL_92;
  }
LABEL_91:
  self->_rc1wlanCritDuration = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x2000) == 0)
  {
LABEL_64:
    if ((v35 & 0x400) == 0)
      goto LABEL_65;
    goto LABEL_93;
  }
LABEL_92:
  self->_rc2Request = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x400) == 0)
  {
LABEL_65:
    if ((v35 & 0x800) == 0)
      goto LABEL_66;
    goto LABEL_94;
  }
LABEL_93:
  self->_rc2Duration = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x800) == 0)
  {
LABEL_66:
    if ((v35 & 0x1000) == 0)
      goto LABEL_67;
    goto LABEL_95;
  }
LABEL_94:
  self->_rc2Grant = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x1000) == 0)
  {
LABEL_67:
    if ((v35 & 0x4000) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_95:
  self->_rc2LongGrant = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 42) & 0x4000) != 0)
  {
LABEL_68:
    self->_rc2cts2a = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_69:
  sdbtdm = self->_sdbtdm;
  v37 = *((_QWORD *)v4 + 11);
  if (sdbtdm)
  {
    if (v37)
      -[WiFiAnalyticsAWDWiFiTDM mergeFrom:](sdbtdm, "mergeFrom:");
  }
  else if (v37)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions setSdbtdm:](self, "setSdbtdm:");
  }

}

- (NSMutableArray)cTLMIndexs
{
  return self->_cTLMIndexs;
}

- (void)setCTLMIndexs:(id)a3
{
  objc_storeStrong((id *)&self->_cTLMIndexs, a3);
}

- (NSMutableArray)txPowerBackoffDBs
{
  return self->_txPowerBackoffDBs;
}

- (void)setTxPowerBackoffDBs:(id)a3
{
  objc_storeStrong((id *)&self->_txPowerBackoffDBs, a3);
}

- (NSMutableArray)txDutyCyclePcts
{
  return self->_txDutyCyclePcts;
}

- (void)setTxDutyCyclePcts:(id)a3
{
  objc_storeStrong((id *)&self->_txDutyCyclePcts, a3);
}

- (NSMutableArray)cTLMIndex1s
{
  return self->_cTLMIndex1s;
}

- (void)setCTLMIndex1s:(id)a3
{
  objc_storeStrong((id *)&self->_cTLMIndex1s, a3);
}

- (NSMutableArray)txPowerBackoffDB1s
{
  return self->_txPowerBackoffDB1s;
}

- (void)setTxPowerBackoffDB1s:(id)a3
{
  objc_storeStrong((id *)&self->_txPowerBackoffDB1s, a3);
}

- (NSMutableArray)txDutyCyclePct1s
{
  return self->_txDutyCyclePct1s;
}

- (void)setTxDutyCyclePct1s:(id)a3
{
  objc_storeStrong((id *)&self->_txDutyCyclePct1s, a3);
}

- (unsigned)txduty0
{
  return self->_txduty0;
}

- (unsigned)txduty1
{
  return self->_txduty1;
}

- (unsigned)txpowerbackoff0
{
  return self->_txpowerbackoff0;
}

- (unsigned)txpowerbackoff1
{
  return self->_txpowerbackoff1;
}

- (unsigned)activechains0
{
  return self->_activechains0;
}

- (unsigned)activechains1
{
  return self->_activechains1;
}

- (unsigned)temp0
{
  return self->_temp0;
}

- (unsigned)temp1
{
  return self->_temp1;
}

- (unsigned)voltage0
{
  return self->_voltage0;
}

- (unsigned)voltage1
{
  return self->_voltage1;
}

- (unsigned)ppm0
{
  return self->_ppm0;
}

- (unsigned)ppm1
{
  return self->_ppm1;
}

- (unsigned)ctlmid0
{
  return self->_ctlmid0;
}

- (unsigned)ctlmid1
{
  return self->_ctlmid1;
}

- (unsigned)tvpmindex0
{
  return self->_tvpmindex0;
}

- (unsigned)tvpmindex1
{
  return self->_tvpmindex1;
}

- (unsigned)rc1Request
{
  return self->_rc1Request;
}

- (unsigned)rc1Duration
{
  return self->_rc1Duration;
}

- (unsigned)rc1wlanCrit
{
  return self->_rc1wlanCrit;
}

- (unsigned)rc1wlanCritDuration
{
  return self->_rc1wlanCritDuration;
}

- (unsigned)rc2Request
{
  return self->_rc2Request;
}

- (unsigned)rc2Duration
{
  return self->_rc2Duration;
}

- (unsigned)rc2Grant
{
  return self->_rc2Grant;
}

- (unsigned)rc2LongGrant
{
  return self->_rc2LongGrant;
}

- (unsigned)rc2cts2a
{
  return self->_rc2cts2a;
}

- (WiFiAnalyticsAWDWiFiTDM)sdbtdm
{
  return self->_sdbtdm;
}

- (void)setSdbtdm:(id)a3
{
  objc_storeStrong((id *)&self->_sdbtdm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txPowerBackoffDBs, 0);
  objc_storeStrong((id *)&self->_txPowerBackoffDB1s, 0);
  objc_storeStrong((id *)&self->_txDutyCyclePcts, 0);
  objc_storeStrong((id *)&self->_txDutyCyclePct1s, 0);
  objc_storeStrong((id *)&self->_sdbtdm, 0);
  objc_storeStrong((id *)&self->_cTLMIndexs, 0);
  objc_storeStrong((id *)&self->_cTLMIndex1s, 0);
}

@end
