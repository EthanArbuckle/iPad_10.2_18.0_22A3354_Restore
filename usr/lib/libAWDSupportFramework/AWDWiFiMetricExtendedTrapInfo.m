@implementation AWDWiFiMetricExtendedTrapInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricExtendedTrapInfo;
  -[AWDWiFiMetricExtendedTrapInfo dealloc](&v3, sel_dealloc);
}

- (void)setSequence:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequence = a3;
}

- (void)setHasSequence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequence
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)signaturesCount
{
  return self->_signatures.count;
}

- (unsigned)signatures
{
  return self->_signatures.list;
}

- (void)clearSignatures
{
  PBRepeatedUInt32Clear();
}

- (void)addSignature:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)signatureAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_signatures;
  unint64_t count;

  p_signatures = &self->_signatures;
  count = self->_signatures.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_signatures->list[a3];
}

- (void)setSignatures:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)stackTracesCount
{
  return self->_stackTraces.count;
}

- (unsigned)stackTraces
{
  return self->_stackTraces.list;
}

- (void)clearStackTraces
{
  PBRepeatedUInt32Clear();
}

- (void)addStackTraces:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)stackTracesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_stackTraces;
  unint64_t count;

  p_stackTraces = &self->_stackTraces;
  count = self->_stackTraces.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_stackTraces->list[a3];
}

- (void)setStackTraces:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)ucodeErrorsCount
{
  return self->_ucodeErrors.count;
}

- (unsigned)ucodeErrors
{
  return self->_ucodeErrors.list;
}

- (void)clearUcodeErrors
{
  PBRepeatedUInt32Clear();
}

- (void)addUcodeErrors:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)ucodeErrorsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_ucodeErrors;
  unint64_t count;

  p_ucodeErrors = &self->_ucodeErrors;
  count = self->_ucodeErrors.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_ucodeErrors->list[a3];
}

- (void)setUcodeErrors:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)memoryDumpsCount
{
  return self->_memoryDumps.count;
}

- (unsigned)memoryDumps
{
  return self->_memoryDumps.list;
}

- (void)clearMemoryDumps
{
  PBRepeatedUInt32Clear();
}

- (void)addMemoryDump:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)memoryDumpAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_memoryDumps;
  unint64_t count;

  p_memoryDumps = &self->_memoryDumps;
  count = self->_memoryDumps.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_memoryDumps->list[a3];
}

- (void)setMemoryDumps:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)deepSleepsCount
{
  return self->_deepSleeps.count;
}

- (unsigned)deepSleeps
{
  return self->_deepSleeps.list;
}

- (void)clearDeepSleeps
{
  PBRepeatedUInt32Clear();
}

- (void)addDeepSleep:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)deepSleepAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_deepSleeps;
  unint64_t count;

  p_deepSleeps = &self->_deepSleeps;
  count = self->_deepSleeps.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_deepSleeps->list[a3];
}

- (void)setDeepSleeps:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)psmWDsCount
{
  return self->_psmWDs.count;
}

- (unsigned)psmWDs
{
  return self->_psmWDs.list;
}

- (void)clearPsmWDs
{
  PBRepeatedUInt32Clear();
}

- (void)addPsmWD:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)psmWDAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_psmWDs;
  unint64_t count;

  p_psmWDs = &self->_psmWDs;
  count = self->_psmWDs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_psmWDs->list[a3];
}

- (void)setPsmWDs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)physCount
{
  return self->_phys.count;
}

- (unsigned)phys
{
  return self->_phys.list;
}

- (void)clearPhys
{
  PBRepeatedUInt32Clear();
}

- (void)addPhy:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)phyAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_phys;
  unint64_t count;

  p_phys = &self->_phys;
  count = self->_phys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_phys->list[a3];
}

- (void)setPhys:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)busCount
{
  return self->_bus.count;
}

- (unsigned)bus
{
  return self->_bus.list;
}

- (void)clearBus
{
  PBRepeatedUInt32Clear();
}

- (void)addBus:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)busAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_bus;
  unint64_t count;

  p_bus = &self->_bus;
  count = self->_bus.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_bus->list[a3];
}

- (void)setBus:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)macsCount
{
  return self->_macs.count;
}

- (unsigned)macs
{
  return self->_macs.list;
}

- (void)clearMacs
{
  PBRepeatedUInt32Clear();
}

- (void)addMac:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)macAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_macs;
  unint64_t count;

  p_macs = &self->_macs;
  count = self->_macs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_macs->list[a3];
}

- (void)setMacs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)backplanesCount
{
  return self->_backplanes.count;
}

- (unsigned)backplanes
{
  return self->_backplanes.list;
}

- (void)clearBackplanes
{
  PBRepeatedUInt32Clear();
}

- (void)addBackplane:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)backplaneAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_backplanes;
  unint64_t count;

  p_backplanes = &self->_backplanes;
  count = self->_backplanes.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_backplanes->list[a3];
}

- (void)setBackplanes:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)pcieQueueStatesCount
{
  return self->_pcieQueueStates.count;
}

- (unsigned)pcieQueueStates
{
  return self->_pcieQueueStates.list;
}

- (void)clearPcieQueueStates
{
  PBRepeatedUInt32Clear();
}

- (void)addPcieQueueState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)pcieQueueStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_pcieQueueStates;
  unint64_t count;

  p_pcieQueueStates = &self->_pcieQueueStates;
  count = self->_pcieQueueStates.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_pcieQueueStates->list[a3];
}

- (void)setPcieQueueStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)wlcStatesCount
{
  return self->_wlcStates.count;
}

- (unsigned)wlcStates
{
  return self->_wlcStates.list;
}

- (void)clearWlcStates
{
  PBRepeatedUInt32Clear();
}

- (void)addWlcState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)wlcStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_wlcStates;
  unint64_t count;

  p_wlcStates = &self->_wlcStates;
  count = self->_wlcStates.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_wlcStates->list[a3];
}

- (void)setWlcStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)macEnabsCount
{
  return self->_macEnabs.count;
}

- (unsigned)macEnabs
{
  return self->_macEnabs.list;
}

- (void)clearMacEnabs
{
  PBRepeatedUInt32Clear();
}

- (void)addMacEnab:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)macEnabAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_macEnabs;
  unint64_t count;

  p_macEnabs = &self->_macEnabs;
  count = self->_macEnabs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_macEnabs->list[a3];
}

- (void)setMacEnabs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)phyTxErrThreshsCount
{
  return self->_phyTxErrThreshs.count;
}

- (unsigned)phyTxErrThreshs
{
  return self->_phyTxErrThreshs.list;
}

- (void)clearPhyTxErrThreshs
{
  PBRepeatedUInt32Clear();
}

- (void)addPhyTxErrThresh:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)phyTxErrThreshAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_phyTxErrThreshs;
  unint64_t count;

  p_phyTxErrThreshs = &self->_phyTxErrThreshs;
  count = self->_phyTxErrThreshs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_phyTxErrThreshs->list[a3];
}

- (void)setPhyTxErrThreshs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricExtendedTrapInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricExtendedTrapInfo description](&v3, sel_description), -[AWDWiFiMetricExtendedTrapInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sequence), CFSTR("sequence"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("signature"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("stackTraces"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("ucodeErrors"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("memoryDump"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("deepSleep"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("psmWD"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("phy"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("bus"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("mac"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("backplane"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("pcieQueueState"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("wlcState"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("macEnab"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("phyTxErrThresh"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricExtendedTrapInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_phyTxErrThreshs;
  unint64_t v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_signatures.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_signatures.count);
  }
  if (self->_stackTraces.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_stackTraces.count);
  }
  if (self->_ucodeErrors.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_ucodeErrors.count);
  }
  if (self->_memoryDumps.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_memoryDumps.count);
  }
  if (self->_deepSleeps.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v8;
    }
    while (v8 < self->_deepSleeps.count);
  }
  if (self->_psmWDs.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v9;
    }
    while (v9 < self->_psmWDs.count);
  }
  if (self->_phys.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < self->_phys.count);
  }
  if (self->_bus.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v11;
    }
    while (v11 < self->_bus.count);
  }
  if (self->_macs.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v12;
    }
    while (v12 < self->_macs.count);
  }
  if (self->_backplanes.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v13;
    }
    while (v13 < self->_backplanes.count);
  }
  if (self->_pcieQueueStates.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v14;
    }
    while (v14 < self->_pcieQueueStates.count);
  }
  if (self->_wlcStates.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v15;
    }
    while (v15 < self->_wlcStates.count);
  }
  if (self->_macEnabs.count)
  {
    v16 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v16;
    }
    while (v16 < self->_macEnabs.count);
  }
  p_phyTxErrThreshs = &self->_phyTxErrThreshs;
  if (p_phyTxErrThreshs->count)
  {
    v18 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v18;
    }
    while (v18 < p_phyTxErrThreshs->count);
  }
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
  unint64_t v20;
  unint64_t v21;
  uint64_t ii;
  unint64_t v23;
  unint64_t v24;
  uint64_t jj;
  unint64_t v26;
  unint64_t v27;
  uint64_t kk;
  unint64_t v29;
  unint64_t v30;
  uint64_t mm;
  unint64_t v32;
  unint64_t v33;
  uint64_t nn;
  unint64_t v35;
  unint64_t v36;
  uint64_t i1;
  unint64_t v38;
  unint64_t v39;
  uint64_t i2;
  unint64_t v41;
  unint64_t v42;
  uint64_t i3;
  unint64_t v44;
  unint64_t v45;
  uint64_t i4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 86) = self->_sequence;
    *((_BYTE *)a3 + 348) |= 1u;
  }
  if (-[AWDWiFiMetricExtendedTrapInfo signaturesCount](self, "signaturesCount"))
  {
    objc_msgSend(a3, "clearSignatures");
    v5 = -[AWDWiFiMetricExtendedTrapInfo signaturesCount](self, "signaturesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addSignature:", -[AWDWiFiMetricExtendedTrapInfo signatureAtIndex:](self, "signatureAtIndex:", i));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo stackTracesCount](self, "stackTracesCount"))
  {
    objc_msgSend(a3, "clearStackTraces");
    v8 = -[AWDWiFiMetricExtendedTrapInfo stackTracesCount](self, "stackTracesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addStackTraces:", -[AWDWiFiMetricExtendedTrapInfo stackTracesAtIndex:](self, "stackTracesAtIndex:", j));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo ucodeErrorsCount](self, "ucodeErrorsCount"))
  {
    objc_msgSend(a3, "clearUcodeErrors");
    v11 = -[AWDWiFiMetricExtendedTrapInfo ucodeErrorsCount](self, "ucodeErrorsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addUcodeErrors:", -[AWDWiFiMetricExtendedTrapInfo ucodeErrorsAtIndex:](self, "ucodeErrorsAtIndex:", k));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo memoryDumpsCount](self, "memoryDumpsCount"))
  {
    objc_msgSend(a3, "clearMemoryDumps");
    v14 = -[AWDWiFiMetricExtendedTrapInfo memoryDumpsCount](self, "memoryDumpsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addMemoryDump:", -[AWDWiFiMetricExtendedTrapInfo memoryDumpAtIndex:](self, "memoryDumpAtIndex:", m));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo deepSleepsCount](self, "deepSleepsCount"))
  {
    objc_msgSend(a3, "clearDeepSleeps");
    v17 = -[AWDWiFiMetricExtendedTrapInfo deepSleepsCount](self, "deepSleepsCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addDeepSleep:", -[AWDWiFiMetricExtendedTrapInfo deepSleepAtIndex:](self, "deepSleepAtIndex:", n));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo psmWDsCount](self, "psmWDsCount"))
  {
    objc_msgSend(a3, "clearPsmWDs");
    v20 = -[AWDWiFiMetricExtendedTrapInfo psmWDsCount](self, "psmWDsCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
        objc_msgSend(a3, "addPsmWD:", -[AWDWiFiMetricExtendedTrapInfo psmWDAtIndex:](self, "psmWDAtIndex:", ii));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo physCount](self, "physCount"))
  {
    objc_msgSend(a3, "clearPhys");
    v23 = -[AWDWiFiMetricExtendedTrapInfo physCount](self, "physCount");
    if (v23)
    {
      v24 = v23;
      for (jj = 0; jj != v24; ++jj)
        objc_msgSend(a3, "addPhy:", -[AWDWiFiMetricExtendedTrapInfo phyAtIndex:](self, "phyAtIndex:", jj));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo busCount](self, "busCount"))
  {
    objc_msgSend(a3, "clearBus");
    v26 = -[AWDWiFiMetricExtendedTrapInfo busCount](self, "busCount");
    if (v26)
    {
      v27 = v26;
      for (kk = 0; kk != v27; ++kk)
        objc_msgSend(a3, "addBus:", -[AWDWiFiMetricExtendedTrapInfo busAtIndex:](self, "busAtIndex:", kk));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo macsCount](self, "macsCount"))
  {
    objc_msgSend(a3, "clearMacs");
    v29 = -[AWDWiFiMetricExtendedTrapInfo macsCount](self, "macsCount");
    if (v29)
    {
      v30 = v29;
      for (mm = 0; mm != v30; ++mm)
        objc_msgSend(a3, "addMac:", -[AWDWiFiMetricExtendedTrapInfo macAtIndex:](self, "macAtIndex:", mm));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo backplanesCount](self, "backplanesCount"))
  {
    objc_msgSend(a3, "clearBackplanes");
    v32 = -[AWDWiFiMetricExtendedTrapInfo backplanesCount](self, "backplanesCount");
    if (v32)
    {
      v33 = v32;
      for (nn = 0; nn != v33; ++nn)
        objc_msgSend(a3, "addBackplane:", -[AWDWiFiMetricExtendedTrapInfo backplaneAtIndex:](self, "backplaneAtIndex:", nn));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo pcieQueueStatesCount](self, "pcieQueueStatesCount"))
  {
    objc_msgSend(a3, "clearPcieQueueStates");
    v35 = -[AWDWiFiMetricExtendedTrapInfo pcieQueueStatesCount](self, "pcieQueueStatesCount");
    if (v35)
    {
      v36 = v35;
      for (i1 = 0; i1 != v36; ++i1)
        objc_msgSend(a3, "addPcieQueueState:", -[AWDWiFiMetricExtendedTrapInfo pcieQueueStateAtIndex:](self, "pcieQueueStateAtIndex:", i1));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo wlcStatesCount](self, "wlcStatesCount"))
  {
    objc_msgSend(a3, "clearWlcStates");
    v38 = -[AWDWiFiMetricExtendedTrapInfo wlcStatesCount](self, "wlcStatesCount");
    if (v38)
    {
      v39 = v38;
      for (i2 = 0; i2 != v39; ++i2)
        objc_msgSend(a3, "addWlcState:", -[AWDWiFiMetricExtendedTrapInfo wlcStateAtIndex:](self, "wlcStateAtIndex:", i2));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo macEnabsCount](self, "macEnabsCount"))
  {
    objc_msgSend(a3, "clearMacEnabs");
    v41 = -[AWDWiFiMetricExtendedTrapInfo macEnabsCount](self, "macEnabsCount");
    if (v41)
    {
      v42 = v41;
      for (i3 = 0; i3 != v42; ++i3)
        objc_msgSend(a3, "addMacEnab:", -[AWDWiFiMetricExtendedTrapInfo macEnabAtIndex:](self, "macEnabAtIndex:", i3));
    }
  }
  if (-[AWDWiFiMetricExtendedTrapInfo phyTxErrThreshsCount](self, "phyTxErrThreshsCount"))
  {
    objc_msgSend(a3, "clearPhyTxErrThreshs");
    v44 = -[AWDWiFiMetricExtendedTrapInfo phyTxErrThreshsCount](self, "phyTxErrThreshsCount");
    if (v44)
    {
      v45 = v44;
      for (i4 = 0; i4 != v45; ++i4)
        objc_msgSend(a3, "addPhyTxErrThresh:", -[AWDWiFiMetricExtendedTrapInfo phyTxErrThreshAtIndex:](self, "phyTxErrThreshAtIndex:", i4));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v4 + 344) = self->_sequence;
    *(_BYTE *)(v4 + 348) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 348) & 1) == 0 || self->_sequence != *((_DWORD *)a3 + 86))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 348) & 1) != 0)
  {
    return 0;
  }
  if (PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    return PBRepeatedUInt32IsEqual();
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_sequence;
  else
    v2 = 0;
  v3 = PBRepeatedUInt32Hash() ^ v2;
  v4 = PBRepeatedUInt32Hash();
  v5 = v3 ^ v4 ^ PBRepeatedUInt32Hash();
  v6 = PBRepeatedUInt32Hash();
  v7 = v6 ^ PBRepeatedUInt32Hash();
  v8 = v5 ^ v7 ^ PBRepeatedUInt32Hash();
  v9 = PBRepeatedUInt32Hash();
  v10 = v9 ^ PBRepeatedUInt32Hash();
  v11 = v10 ^ PBRepeatedUInt32Hash();
  v12 = v8 ^ v11 ^ PBRepeatedUInt32Hash();
  v13 = PBRepeatedUInt32Hash();
  v14 = v13 ^ PBRepeatedUInt32Hash();
  v15 = v14 ^ PBRepeatedUInt32Hash();
  return v12 ^ v15 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;
  uint64_t v20;
  uint64_t v21;
  uint64_t ii;
  uint64_t v23;
  uint64_t v24;
  uint64_t jj;
  uint64_t v26;
  uint64_t v27;
  uint64_t kk;
  uint64_t v29;
  uint64_t v30;
  uint64_t mm;
  uint64_t v32;
  uint64_t v33;
  uint64_t nn;
  uint64_t v35;
  uint64_t v36;
  uint64_t i1;
  uint64_t v38;
  uint64_t v39;
  uint64_t i2;
  uint64_t v41;
  uint64_t v42;
  uint64_t i3;
  uint64_t v44;
  uint64_t v45;
  uint64_t i4;

  if ((*((_BYTE *)a3 + 348) & 1) != 0)
  {
    self->_sequence = *((_DWORD *)a3 + 86);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(a3, "signaturesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWiFiMetricExtendedTrapInfo addSignature:](self, "addSignature:", objc_msgSend(a3, "signatureAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "stackTracesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDWiFiMetricExtendedTrapInfo addStackTraces:](self, "addStackTraces:", objc_msgSend(a3, "stackTracesAtIndex:", j));
  }
  v11 = objc_msgSend(a3, "ucodeErrorsCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[AWDWiFiMetricExtendedTrapInfo addUcodeErrors:](self, "addUcodeErrors:", objc_msgSend(a3, "ucodeErrorsAtIndex:", k));
  }
  v14 = objc_msgSend(a3, "memoryDumpsCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[AWDWiFiMetricExtendedTrapInfo addMemoryDump:](self, "addMemoryDump:", objc_msgSend(a3, "memoryDumpAtIndex:", m));
  }
  v17 = objc_msgSend(a3, "deepSleepsCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[AWDWiFiMetricExtendedTrapInfo addDeepSleep:](self, "addDeepSleep:", objc_msgSend(a3, "deepSleepAtIndex:", n));
  }
  v20 = objc_msgSend(a3, "psmWDsCount");
  if (v20)
  {
    v21 = v20;
    for (ii = 0; ii != v21; ++ii)
      -[AWDWiFiMetricExtendedTrapInfo addPsmWD:](self, "addPsmWD:", objc_msgSend(a3, "psmWDAtIndex:", ii));
  }
  v23 = objc_msgSend(a3, "physCount");
  if (v23)
  {
    v24 = v23;
    for (jj = 0; jj != v24; ++jj)
      -[AWDWiFiMetricExtendedTrapInfo addPhy:](self, "addPhy:", objc_msgSend(a3, "phyAtIndex:", jj));
  }
  v26 = objc_msgSend(a3, "busCount");
  if (v26)
  {
    v27 = v26;
    for (kk = 0; kk != v27; ++kk)
      -[AWDWiFiMetricExtendedTrapInfo addBus:](self, "addBus:", objc_msgSend(a3, "busAtIndex:", kk));
  }
  v29 = objc_msgSend(a3, "macsCount");
  if (v29)
  {
    v30 = v29;
    for (mm = 0; mm != v30; ++mm)
      -[AWDWiFiMetricExtendedTrapInfo addMac:](self, "addMac:", objc_msgSend(a3, "macAtIndex:", mm));
  }
  v32 = objc_msgSend(a3, "backplanesCount");
  if (v32)
  {
    v33 = v32;
    for (nn = 0; nn != v33; ++nn)
      -[AWDWiFiMetricExtendedTrapInfo addBackplane:](self, "addBackplane:", objc_msgSend(a3, "backplaneAtIndex:", nn));
  }
  v35 = objc_msgSend(a3, "pcieQueueStatesCount");
  if (v35)
  {
    v36 = v35;
    for (i1 = 0; i1 != v36; ++i1)
      -[AWDWiFiMetricExtendedTrapInfo addPcieQueueState:](self, "addPcieQueueState:", objc_msgSend(a3, "pcieQueueStateAtIndex:", i1));
  }
  v38 = objc_msgSend(a3, "wlcStatesCount");
  if (v38)
  {
    v39 = v38;
    for (i2 = 0; i2 != v39; ++i2)
      -[AWDWiFiMetricExtendedTrapInfo addWlcState:](self, "addWlcState:", objc_msgSend(a3, "wlcStateAtIndex:", i2));
  }
  v41 = objc_msgSend(a3, "macEnabsCount");
  if (v41)
  {
    v42 = v41;
    for (i3 = 0; i3 != v42; ++i3)
      -[AWDWiFiMetricExtendedTrapInfo addMacEnab:](self, "addMacEnab:", objc_msgSend(a3, "macEnabAtIndex:", i3));
  }
  v44 = objc_msgSend(a3, "phyTxErrThreshsCount");
  if (v44)
  {
    v45 = v44;
    for (i4 = 0; i4 != v45; ++i4)
      -[AWDWiFiMetricExtendedTrapInfo addPhyTxErrThresh:](self, "addPhyTxErrThresh:", objc_msgSend(a3, "phyTxErrThreshAtIndex:", i4));
  }
}

- (unsigned)sequence
{
  return self->_sequence;
}

@end
