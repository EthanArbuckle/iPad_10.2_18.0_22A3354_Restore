@implementation AWDWiFiMetric11axLinkChangeData

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  -[AWDWiFiMetric11axLinkChangeData setOui:](self, "setOui:", 0);
  -[AWDWiFiMetric11axLinkChangeData setHtSupportedMcsSet:](self, "setHtSupportedMcsSet:", 0);
  -[AWDWiFiMetric11axLinkChangeData setVhtSupportedMcsSet:](self, "setVhtSupportedMcsSet:", 0);
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  -[AWDWiFiMetric11axLinkChangeData setHeCapabilitiesIE:](self, "setHeCapabilitiesIE:", 0);
  -[AWDWiFiMetric11axLinkChangeData setHeOperationIE:](self, "setHeOperationIE:", 0);
  -[AWDWiFiMetric11axLinkChangeData setHeBSSLoadIE:](self, "setHeBSSLoadIE:", 0);
  -[AWDWiFiMetric11axLinkChangeData setMuEDCAParametersIE:](self, "setMuEDCAParametersIE:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetric11axLinkChangeData;
  -[AWDWiFiMetric11axLinkChangeData dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (unint64_t)rssiHistorysCount
{
  return self->_rssiHistorys.count;
}

- (int)rssiHistorys
{
  return self->_rssiHistorys.list;
}

- (void)clearRssiHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addRssiHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)rssiHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_rssiHistorys;
  unint64_t count;

  p_rssiHistorys = &self->_rssiHistorys;
  count = self->_rssiHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_rssiHistorys->list[a3];
}

- (void)setRssiHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setIsLinkUp:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_isLinkUp = a3;
}

- (void)setHasIsLinkUp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsLinkUp
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsInVol:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_isInVol = a3;
}

- (void)setHasIsInVol:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsInVol
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setReason:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSubreason:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_subreason = a3;
}

- (void)setHasSubreason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSubreason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setChannelWidth:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasChannelWidth
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPhyMode:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_phyMode = a3;
}

- (void)setHasPhyMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setFlags:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasFlags
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setWpaProtocol:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_wpaProtocol = a3;
}

- (void)setHasWpaProtocol:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasWpaProtocol
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setMcastCipher:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_mcastCipher = a3;
}

- (void)setHasMcastCipher:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMcastCipher
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setUcastCipher:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_ucastCipher = a3;
}

- (void)setHasUcastCipher:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasUcastCipher
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setAkmSuites:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_akmSuites = a3;
}

- (void)setHasAkmSuites:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAkmSuites
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCapabilities:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasCapabilities
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEnhancedSecurityType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_enhancedSecurityType = a3;
}

- (void)setHasEnhancedSecurityType:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasEnhancedSecurityType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHtInfo:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_htInfo = a3;
}

- (void)setHasHtInfo:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasHtInfo
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHtExtended:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_htExtended = a3;
}

- (void)setHasHtExtended:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasHtExtended
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHtTxBf:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_htTxBf = a3;
}

- (void)setHasHtTxBf:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasHtTxBf
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHtASel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_htASel = a3;
}

- (void)setHasHtASel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasHtASel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHtAmpduParams:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_htAmpduParams = a3;
}

- (void)setHasHtAmpduParams:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasHtAmpduParams
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasHtSupportedMcsSet
{
  return self->_htSupportedMcsSet != 0;
}

- (void)setVhtInfo:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_vhtInfo = a3;
}

- (void)setHasVhtInfo:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasVhtInfo
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (BOOL)hasVhtSupportedMcsSet
{
  return self->_vhtSupportedMcsSet != 0;
}

- (unint64_t)txPerHistorysCount
{
  return self->_txPerHistorys.count;
}

- (int)txPerHistorys
{
  return self->_txPerHistorys.list;
}

- (void)clearTxPerHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addTxPerHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)txPerHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_txPerHistorys;
  unint64_t count;

  p_txPerHistorys = &self->_txPerHistorys;
  count = self->_txPerHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txPerHistorys->list[a3];
}

- (void)setTxPerHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)txFrmsHistorysCount
{
  return self->_txFrmsHistorys.count;
}

- (int)txFrmsHistorys
{
  return self->_txFrmsHistorys.list;
}

- (void)clearTxFrmsHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addTxFrmsHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)txFrmsHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_txFrmsHistorys;
  unint64_t count;

  p_txFrmsHistorys = &self->_txFrmsHistorys;
  count = self->_txFrmsHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_txFrmsHistorys->list[a3];
}

- (void)setTxFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)fwTxPerHistorysCount
{
  return self->_fwTxPerHistorys.count;
}

- (int)fwTxPerHistorys
{
  return self->_fwTxPerHistorys.list;
}

- (void)clearFwTxPerHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addFwTxPerHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)fwTxPerHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_fwTxPerHistorys;
  unint64_t count;

  p_fwTxPerHistorys = &self->_fwTxPerHistorys;
  count = self->_fwTxPerHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_fwTxPerHistorys->list[a3];
}

- (void)setFwTxPerHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)fwTxFrmsHistorysCount
{
  return self->_fwTxFrmsHistorys.count;
}

- (int)fwTxFrmsHistorys
{
  return self->_fwTxFrmsHistorys.list;
}

- (void)clearFwTxFrmsHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addFwTxFrmsHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)fwTxFrmsHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_fwTxFrmsHistorys;
  unint64_t count;

  p_fwTxFrmsHistorys = &self->_fwTxFrmsHistorys;
  count = self->_fwTxFrmsHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_fwTxFrmsHistorys->list[a3];
}

- (void)setFwTxFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)bcnPerHistorysCount
{
  return self->_bcnPerHistorys.count;
}

- (int)bcnPerHistorys
{
  return self->_bcnPerHistorys.list;
}

- (void)clearBcnPerHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addBcnPerHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)bcnPerHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_bcnPerHistorys;
  unint64_t count;

  p_bcnPerHistorys = &self->_bcnPerHistorys;
  count = self->_bcnPerHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_bcnPerHistorys->list[a3];
}

- (void)setBcnPerHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)bcnFrmsHistorysCount
{
  return self->_bcnFrmsHistorys.count;
}

- (int)bcnFrmsHistorys
{
  return self->_bcnFrmsHistorys.list;
}

- (void)clearBcnFrmsHistorys
{
  PBRepeatedInt32Clear();
}

- (void)addBcnFrmsHistory:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)bcnFrmsHistoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_bcnFrmsHistorys;
  unint64_t count;

  p_bcnFrmsHistorys = &self->_bcnFrmsHistorys;
  count = self->_bcnFrmsHistorys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_bcnFrmsHistorys->list[a3];
}

- (void)setBcnFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setGatewayARPHistory:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_gatewayARPHistory = a3;
}

- (void)setHasGatewayARPHistory:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasGatewayARPHistory
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasHeCapabilitiesIE
{
  return self->_heCapabilitiesIE != 0;
}

- (BOOL)hasHeOperationIE
{
  return self->_heOperationIE != 0;
}

- (BOOL)hasHeBSSLoadIE
{
  return self->_heBSSLoadIE != 0;
}

- (BOOL)hasMuEDCAParametersIE
{
  return self->_muEDCAParametersIE != 0;
}

- (void)setHeMacCapSubfields:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_heMacCapSubfields = a3;
}

- (void)setHasHeMacCapSubfields:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasHeMacCapSubfields
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHePhyCapSubfields:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_hePhyCapSubfields = a3;
}

- (void)setHasHePhyCapSubfields:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasHePhyCapSubfields
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHeRxTxMcsMap:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_heRxTxMcsMap = a3;
}

- (void)setHasHeRxTxMcsMap:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasHeRxTxMcsMap
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHeOpsParams:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_heOpsParams = a3;
}

- (void)setHasHeOpsParams:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasHeOpsParams
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHeBssMcsNss:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_heBssMcsNss = a3;
}

- (void)setHasHeBssMcsNss:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasHeBssMcsNss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHeStaCnt:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_heStaCnt = a3;
}

- (void)setHasHeStaCnt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasHeStaCnt
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHeUtilization:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_heUtilization = a3;
}

- (void)setHasHeUtilization:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasHeUtilization
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHeBEParamRecord:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_heBEParamRecord = a3;
}

- (void)setHasHeBEParamRecord:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasHeBEParamRecord
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHeBKParamRecord:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_heBKParamRecord = a3;
}

- (void)setHasHeBKParamRecord:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasHeBKParamRecord
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHeVIParamRecord:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_heVIParamRecord = a3;
}

- (void)setHasHeVIParamRecord:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasHeVIParamRecord
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHeVOParamRecord:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_heVOParamRecord = a3;
}

- (void)setHasHeVOParamRecord:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasHeVOParamRecord
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetric11axLinkChangeData;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetric11axLinkChangeData description](&v3, sel_description), -[AWDWiFiMetric11axLinkChangeData dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has;
  NSData *oui;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6;
  NSData *htSupportedMcsSet;
  NSData *vhtSupportedMcsSet;
  NSData *heCapabilitiesIE;
  NSData *heOperationIE;
  NSData *heBSSLoadIE;
  NSData *muEDCAParametersIE;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("rssiHistory"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLinkUp), CFSTR("isLinkUp"));
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_58;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInVol), CFSTR("isInVol"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reason), CFSTR("reason"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_subreason), CFSTR("subreason"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel), CFSTR("channel"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelWidth), CFSTR("channelWidth"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_phyMode), CFSTR("phyMode"));
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags), CFSTR("flags"));
LABEL_12:
  oui = self->_oui;
  if (oui)
    objc_msgSend(v3, "setObject:forKey:", oui, CFSTR("oui"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType), CFSTR("securityType"));
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v6 & 0x1000000) == 0)
        goto LABEL_17;
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wpaProtocol), CFSTR("wpaProtocol"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
      goto LABEL_18;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mcastCipher), CFSTR("mcastCipher"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_19;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ucastCipher), CFSTR("ucastCipher"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_20;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_akmSuites), CFSTR("akmSuites"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_capabilities), CFSTR("capabilities"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_22;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enhancedSecurityType), CFSTR("enhancedSecurityType"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htInfo), CFSTR("htInfo"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htExtended), CFSTR("htExtended"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_25;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htTxBf), CFSTR("htTxBf"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htASel), CFSTR("htASel"));
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
LABEL_26:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htAmpduParams), CFSTR("htAmpduParams"));
LABEL_27:
  htSupportedMcsSet = self->_htSupportedMcsSet;
  if (htSupportedMcsSet)
    objc_msgSend(v3, "setObject:forKey:", htSupportedMcsSet, CFSTR("htSupportedMcsSet"));
  if ((*((_BYTE *)&self->_has + 3) & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_vhtInfo), CFSTR("vhtInfo"));
  vhtSupportedMcsSet = self->_vhtSupportedMcsSet;
  if (vhtSupportedMcsSet)
    objc_msgSend(v3, "setObject:forKey:", vhtSupportedMcsSet, CFSTR("vhtSupportedMcsSet"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("txPerHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("txFrmsHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("fwTxPerHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("fwTxFrmsHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("bcnPerHistory"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("bcnFrmsHistory"));
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_gatewayARPHistory), CFSTR("gatewayARPHistory"));
  heCapabilitiesIE = self->_heCapabilitiesIE;
  if (heCapabilitiesIE)
    objc_msgSend(v3, "setObject:forKey:", heCapabilitiesIE, CFSTR("heCapabilitiesIE"));
  heOperationIE = self->_heOperationIE;
  if (heOperationIE)
    objc_msgSend(v3, "setObject:forKey:", heOperationIE, CFSTR("heOperationIE"));
  heBSSLoadIE = self->_heBSSLoadIE;
  if (heBSSLoadIE)
    objc_msgSend(v3, "setObject:forKey:", heBSSLoadIE, CFSTR("heBSSLoadIE"));
  muEDCAParametersIE = self->_muEDCAParametersIE;
  if (muEDCAParametersIE)
    objc_msgSend(v3, "setObject:forKey:", muEDCAParametersIE, CFSTR("muEDCAParametersIE"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heMacCapSubfields), CFSTR("heMacCapSubfields"));
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_45:
      if ((*(_WORD *)&v13 & 0x4000) == 0)
        goto LABEL_46;
      goto LABEL_78;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_45;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hePhyCapSubfields), CFSTR("hePhyCapSubfields"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v13 & 0x1000) == 0)
      goto LABEL_47;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heRxTxMcsMap), CFSTR("heRxTxMcsMap"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v13 & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heOpsParams), CFSTR("heOpsParams"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v13 & 0x8000) == 0)
      goto LABEL_49;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heBssMcsNss), CFSTR("heBssMcsNss"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
      goto LABEL_50;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heStaCnt), CFSTR("heStaCnt"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v13 & 0x100) == 0)
      goto LABEL_51;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heUtilization), CFSTR("heUtilization"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v13 & 0x200) == 0)
      goto LABEL_52;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heBEParamRecord), CFSTR("heBEParamRecord"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v13 & 0x20000) == 0)
      goto LABEL_53;
LABEL_85:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heVIParamRecord), CFSTR("heVIParamRecord"));
    if ((*(_QWORD *)&self->_has & 0x40000) == 0)
      return v3;
    goto LABEL_54;
  }
LABEL_84:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heBKParamRecord), CFSTR("heBKParamRecord"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
    goto LABEL_85;
LABEL_53:
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
LABEL_54:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_heVOParamRecord), CFSTR("heVOParamRecord"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetric11axLinkChangeDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_rssiHistorys.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_rssiHistorys.count);
  }
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_8:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_9;
      goto LABEL_78;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_13;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
LABEL_14:
    PBDataWriterWriteUint32Field();
LABEL_15:
  if (self->_oui)
    PBDataWriterWriteDataField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
    {
LABEL_19:
      if ((*(_DWORD *)&v6 & 0x1000000) == 0)
        goto LABEL_20;
      goto LABEL_86;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
      goto LABEL_21;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_22;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_23;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_25;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_26;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
LABEL_29:
    PBDataWriterWriteUint32Field();
LABEL_30:
  if (self->_htSupportedMcsSet)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 3) & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_vhtSupportedMcsSet)
    PBDataWriterWriteDataField();
  if (self->_txPerHistorys.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_txPerHistorys.count);
  }
  if (self->_txFrmsHistorys.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_txFrmsHistorys.count);
  }
  if (self->_fwTxPerHistorys.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_fwTxPerHistorys.count);
  }
  if (self->_fwTxFrmsHistorys.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_fwTxFrmsHistorys.count);
  }
  if (self->_bcnPerHistorys.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_bcnPerHistorys.count);
  }
  if (self->_bcnFrmsHistorys.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_bcnFrmsHistorys.count);
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_heCapabilitiesIE)
    PBDataWriterWriteDataField();
  if (self->_heOperationIE)
    PBDataWriterWriteDataField();
  if (self->_heBSSLoadIE)
    PBDataWriterWriteDataField();
  if (self->_muEDCAParametersIE)
    PBDataWriterWriteDataField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_66:
      if ((*(_WORD *)&v13 & 0x4000) == 0)
        goto LABEL_67;
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_66;
  }
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v13 & 0x1000) == 0)
      goto LABEL_68;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_68:
    if ((*(_WORD *)&v13 & 0x400) == 0)
      goto LABEL_69;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_69:
    if ((*(_WORD *)&v13 & 0x8000) == 0)
      goto LABEL_70;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
      goto LABEL_71;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v13 & 0x100) == 0)
      goto LABEL_72;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v13 & 0x200) == 0)
      goto LABEL_73;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_73:
    if ((*(_DWORD *)&v13 & 0x20000) == 0)
      goto LABEL_74;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      return;
LABEL_106:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
    goto LABEL_106;
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  unint64_t v19;
  unint64_t v20;
  uint64_t n;
  unint64_t v22;
  unint64_t v23;
  uint64_t ii;
  unint64_t v25;
  unint64_t v26;
  uint64_t jj;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 22) = self->_timestamp;
    *((_QWORD *)a3 + 48) |= 1uLL;
  }
  if (-[AWDWiFiMetric11axLinkChangeData rssiHistorysCount](self, "rssiHistorysCount"))
  {
    objc_msgSend(a3, "clearRssiHistorys");
    v5 = -[AWDWiFiMetric11axLinkChangeData rssiHistorysCount](self, "rssiHistorysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addRssiHistory:", -[AWDWiFiMetric11axLinkChangeData rssiHistoryAtIndex:](self, "rssiHistoryAtIndex:", i));
    }
  }
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    *((_BYTE *)a3 + 381) = self->_isLinkUp;
    *((_QWORD *)a3 + 48) |= 0x200000000uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_10;
      goto LABEL_86;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)a3 + 380) = self->_isInVol;
  *((_QWORD *)a3 + 48) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_11;
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)a3 + 87) = self->_reason;
  *((_QWORD *)a3 + 48) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)a3 + 89) = self->_subreason;
  *((_QWORD *)a3 + 48) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)a3 + 48) = self->_channel;
  *((_QWORD *)a3 + 48) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_14;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)a3 + 49) = self->_channelWidth;
  *((_QWORD *)a3 + 48) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_90:
  *((_DWORD *)a3 + 86) = self->_phyMode;
  *((_QWORD *)a3 + 48) |= 0x2000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 51) = self->_flags;
    *((_QWORD *)a3 + 48) |= 0x40uLL;
  }
LABEL_16:
  if (self->_oui)
    objc_msgSend(a3, "setOui:");
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
  {
    *((_DWORD *)a3 + 88) = self->_securityType;
    *((_QWORD *)a3 + 48) |= 0x8000000uLL;
    v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x80000000) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&v9 & 0x1000000) == 0)
        goto LABEL_21;
      goto LABEL_94;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)a3 + 94) = self->_wpaProtocol;
  *((_QWORD *)a3 + 48) |= 0x80000000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v9 & 0x20000000) == 0)
      goto LABEL_22;
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)a3 + 81) = self->_mcastCipher;
  *((_QWORD *)a3 + 48) |= 0x1000000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v9 & 2) == 0)
      goto LABEL_23;
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)a3 + 90) = self->_ucastCipher;
  *((_QWORD *)a3 + 48) |= 0x20000000uLL;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 2) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v9 & 4) == 0)
      goto LABEL_24;
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 46) = self->_akmSuites;
  *((_QWORD *)a3 + 48) |= 2uLL;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 4) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v9 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 47) = self->_capabilities;
  *((_QWORD *)a3 + 48) |= 4uLL;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
      goto LABEL_26;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 50) = self->_enhancedSecurityType;
  *((_QWORD *)a3 + 48) |= 0x20uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
      goto LABEL_27;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)a3 + 76) = self->_htInfo;
  *((_QWORD *)a3 + 48) |= 0x400000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x800000) == 0)
      goto LABEL_28;
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)a3 + 75) = self->_htExtended;
  *((_QWORD *)a3 + 48) |= 0x200000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)a3 + 80) = self->_htTxBf;
  *((_QWORD *)a3 + 48) |= 0x800000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_102:
  *((_DWORD *)a3 + 73) = self->_htASel;
  *((_QWORD *)a3 + 48) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_30:
    *((_DWORD *)a3 + 74) = self->_htAmpduParams;
    *((_QWORD *)a3 + 48) |= 0x100000uLL;
  }
LABEL_31:
  if (self->_htSupportedMcsSet)
    objc_msgSend(a3, "setHtSupportedMcsSet:");
  if ((*((_BYTE *)&self->_has + 3) & 0x40) != 0)
  {
    *((_DWORD *)a3 + 91) = self->_vhtInfo;
    *((_QWORD *)a3 + 48) |= 0x40000000uLL;
  }
  if (self->_vhtSupportedMcsSet)
    objc_msgSend(a3, "setVhtSupportedMcsSet:");
  if (-[AWDWiFiMetric11axLinkChangeData txPerHistorysCount](self, "txPerHistorysCount"))
  {
    objc_msgSend(a3, "clearTxPerHistorys");
    v10 = -[AWDWiFiMetric11axLinkChangeData txPerHistorysCount](self, "txPerHistorysCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addTxPerHistory:", -[AWDWiFiMetric11axLinkChangeData txPerHistoryAtIndex:](self, "txPerHistoryAtIndex:", j));
    }
  }
  if (-[AWDWiFiMetric11axLinkChangeData txFrmsHistorysCount](self, "txFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearTxFrmsHistorys");
    v13 = -[AWDWiFiMetric11axLinkChangeData txFrmsHistorysCount](self, "txFrmsHistorysCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(a3, "addTxFrmsHistory:", -[AWDWiFiMetric11axLinkChangeData txFrmsHistoryAtIndex:](self, "txFrmsHistoryAtIndex:", k));
    }
  }
  if (-[AWDWiFiMetric11axLinkChangeData fwTxPerHistorysCount](self, "fwTxPerHistorysCount"))
  {
    objc_msgSend(a3, "clearFwTxPerHistorys");
    v16 = -[AWDWiFiMetric11axLinkChangeData fwTxPerHistorysCount](self, "fwTxPerHistorysCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(a3, "addFwTxPerHistory:", -[AWDWiFiMetric11axLinkChangeData fwTxPerHistoryAtIndex:](self, "fwTxPerHistoryAtIndex:", m));
    }
  }
  if (-[AWDWiFiMetric11axLinkChangeData fwTxFrmsHistorysCount](self, "fwTxFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearFwTxFrmsHistorys");
    v19 = -[AWDWiFiMetric11axLinkChangeData fwTxFrmsHistorysCount](self, "fwTxFrmsHistorysCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
        objc_msgSend(a3, "addFwTxFrmsHistory:", -[AWDWiFiMetric11axLinkChangeData fwTxFrmsHistoryAtIndex:](self, "fwTxFrmsHistoryAtIndex:", n));
    }
  }
  if (-[AWDWiFiMetric11axLinkChangeData bcnPerHistorysCount](self, "bcnPerHistorysCount"))
  {
    objc_msgSend(a3, "clearBcnPerHistorys");
    v22 = -[AWDWiFiMetric11axLinkChangeData bcnPerHistorysCount](self, "bcnPerHistorysCount");
    if (v22)
    {
      v23 = v22;
      for (ii = 0; ii != v23; ++ii)
        objc_msgSend(a3, "addBcnPerHistory:", -[AWDWiFiMetric11axLinkChangeData bcnPerHistoryAtIndex:](self, "bcnPerHistoryAtIndex:", ii));
    }
  }
  if (-[AWDWiFiMetric11axLinkChangeData bcnFrmsHistorysCount](self, "bcnFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearBcnFrmsHistorys");
    v25 = -[AWDWiFiMetric11axLinkChangeData bcnFrmsHistorysCount](self, "bcnFrmsHistorysCount");
    if (v25)
    {
      v26 = v25;
      for (jj = 0; jj != v26; ++jj)
        objc_msgSend(a3, "addBcnFrmsHistory:", -[AWDWiFiMetric11axLinkChangeData bcnFrmsHistoryAtIndex:](self, "bcnFrmsHistoryAtIndex:", jj));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)a3 + 52) = self->_gatewayARPHistory;
    *((_QWORD *)a3 + 48) |= 0x80uLL;
  }
  if (self->_heCapabilitiesIE)
    objc_msgSend(a3, "setHeCapabilitiesIE:");
  if (self->_heOperationIE)
    objc_msgSend(a3, "setHeOperationIE:");
  if (self->_heBSSLoadIE)
    objc_msgSend(a3, "setHeBSSLoadIE:");
  if (self->_muEDCAParametersIE)
    objc_msgSend(a3, "setMuEDCAParametersIE:");
  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x800) != 0)
  {
    *((_DWORD *)a3 + 62) = self->_heMacCapSubfields;
    *((_QWORD *)a3 + 48) |= 0x800uLL;
    v28 = self->_has;
    if ((*(_WORD *)&v28 & 0x2000) == 0)
    {
LABEL_73:
      if ((*(_WORD *)&v28 & 0x4000) == 0)
        goto LABEL_74;
      goto LABEL_106;
    }
  }
  else if ((*(_WORD *)&v28 & 0x2000) == 0)
  {
    goto LABEL_73;
  }
  *((_DWORD *)a3 + 67) = self->_hePhyCapSubfields;
  *((_QWORD *)a3 + 48) |= 0x2000uLL;
  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x4000) == 0)
  {
LABEL_74:
    if ((*(_WORD *)&v28 & 0x1000) == 0)
      goto LABEL_75;
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)a3 + 68) = self->_heRxTxMcsMap;
  *((_QWORD *)a3 + 48) |= 0x4000uLL;
  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x1000) == 0)
  {
LABEL_75:
    if ((*(_WORD *)&v28 & 0x400) == 0)
      goto LABEL_76;
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)a3 + 66) = self->_heOpsParams;
  *((_QWORD *)a3 + 48) |= 0x1000uLL;
  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x400) == 0)
  {
LABEL_76:
    if ((*(_WORD *)&v28 & 0x8000) == 0)
      goto LABEL_77;
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)a3 + 58) = self->_heBssMcsNss;
  *((_QWORD *)a3 + 48) |= 0x400uLL;
  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x8000) == 0)
  {
LABEL_77:
    if ((*(_DWORD *)&v28 & 0x10000) == 0)
      goto LABEL_78;
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)a3 + 69) = self->_heStaCnt;
  *((_QWORD *)a3 + 48) |= 0x8000uLL;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x10000) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&v28 & 0x100) == 0)
      goto LABEL_79;
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)a3 + 70) = self->_heUtilization;
  *((_QWORD *)a3 + 48) |= 0x10000uLL;
  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x100) == 0)
  {
LABEL_79:
    if ((*(_WORD *)&v28 & 0x200) == 0)
      goto LABEL_80;
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)a3 + 53) = self->_heBEParamRecord;
  *((_QWORD *)a3 + 48) |= 0x100uLL;
  v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x200) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v28 & 0x20000) == 0)
      goto LABEL_81;
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)a3 + 54) = self->_heBKParamRecord;
  *((_QWORD *)a3 + 48) |= 0x200uLL;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x20000) == 0)
  {
LABEL_81:
    if ((*(_DWORD *)&v28 & 0x40000) == 0)
      return;
    goto LABEL_82;
  }
LABEL_113:
  *((_DWORD *)a3 + 71) = self->_heVIParamRecord;
  *((_QWORD *)a3 + 48) |= 0x20000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000) == 0)
    return;
LABEL_82:
  *((_DWORD *)a3 + 72) = self->_heVOParamRecord;
  *((_QWORD *)a3 + 48) |= 0x40000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 176) = self->_timestamp;
    *(_QWORD *)(v5 + 384) |= 1uLL;
  }
  PBRepeatedInt32Copy();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    *(_BYTE *)(v6 + 381) = self->_isLinkUp;
    *(_QWORD *)(v6 + 384) |= 0x200000000uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_44;
    }
  }
  else if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 380) = self->_isInVol;
  *(_QWORD *)(v6 + 384) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 348) = self->_reason;
  *(_QWORD *)(v6 + 384) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 356) = self->_subreason;
  *(_QWORD *)(v6 + 384) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 192) = self->_channel;
  *(_QWORD *)(v6 + 384) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 196) = self->_channelWidth;
  *(_QWORD *)(v6 + 384) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_48:
  *(_DWORD *)(v6 + 344) = self->_phyMode;
  *(_QWORD *)(v6 + 384) |= 0x2000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 204) = self->_flags;
    *(_QWORD *)(v6 + 384) |= 0x40uLL;
  }
LABEL_12:

  *(_QWORD *)(v6 + 336) = -[NSData copyWithZone:](self->_oui, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) != 0)
  {
    *(_DWORD *)(v6 + 352) = self->_securityType;
    *(_QWORD *)(v6 + 384) |= 0x8000000uLL;
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x80000000) == 0)
    {
LABEL_14:
      if ((*(_DWORD *)&v8 & 0x1000000) == 0)
        goto LABEL_15;
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 376) = self->_wpaProtocol;
  *(_QWORD *)(v6 + 384) |= 0x80000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v8 & 0x20000000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 324) = self->_mcastCipher;
  *(_QWORD *)(v6 + 384) |= 0x1000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v8 & 2) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v6 + 360) = self->_ucastCipher;
  *(_QWORD *)(v6 + 384) |= 0x20000000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v6 + 184) = self->_akmSuites;
  *(_QWORD *)(v6 + 384) |= 2uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v8 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v6 + 188) = self->_capabilities;
  *(_QWORD *)(v6 + 384) |= 4uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v6 + 200) = self->_enhancedSecurityType;
  *(_QWORD *)(v6 + 384) |= 0x20uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v8 & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v6 + 304) = self->_htInfo;
  *(_QWORD *)(v6 + 384) |= 0x400000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v8 & 0x800000) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 300) = self->_htExtended;
  *(_QWORD *)(v6 + 384) |= 0x200000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v8 & 0x80000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v6 + 320) = self->_htTxBf;
  *(_QWORD *)(v6 + 384) |= 0x800000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v8 & 0x100000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_60:
  *(_DWORD *)(v6 + 292) = self->_htASel;
  *(_QWORD *)(v6 + 384) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_24:
    *(_DWORD *)(v6 + 296) = self->_htAmpduParams;
    *(_QWORD *)(v6 + 384) |= 0x100000uLL;
  }
LABEL_25:

  *(_QWORD *)(v6 + 312) = -[NSData copyWithZone:](self->_htSupportedMcsSet, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 3) & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 364) = self->_vhtInfo;
    *(_QWORD *)(v6 + 384) |= 0x40000000uLL;
  }

  *(_QWORD *)(v6 + 368) = -[NSData copyWithZone:](self->_vhtSupportedMcsSet, "copyWithZone:", a3);
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 208) = self->_gatewayARPHistory;
    *(_QWORD *)(v6 + 384) |= 0x80uLL;
  }

  *(_QWORD *)(v6 + 240) = -[NSData copyWithZone:](self->_heCapabilitiesIE, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 256) = -[NSData copyWithZone:](self->_heOperationIE, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 224) = -[NSData copyWithZone:](self->_heBSSLoadIE, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 328) = -[NSData copyWithZone:](self->_muEDCAParametersIE, "copyWithZone:", a3);
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 248) = self->_heMacCapSubfields;
    *(_QWORD *)(v6 + 384) |= 0x800uLL;
    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x2000) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v9 & 0x4000) == 0)
        goto LABEL_32;
      goto LABEL_64;
    }
  }
  else if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
    goto LABEL_31;
  }
  *(_DWORD *)(v6 + 268) = self->_hePhyCapSubfields;
  *(_QWORD *)(v6 + 384) |= 0x2000uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v9 & 0x1000) == 0)
      goto LABEL_33;
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v6 + 272) = self->_heRxTxMcsMap;
  *(_QWORD *)(v6 + 384) |= 0x4000uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v9 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v6 + 264) = self->_heOpsParams;
  *(_QWORD *)(v6 + 384) |= 0x1000uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v9 & 0x8000) == 0)
      goto LABEL_35;
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v6 + 232) = self->_heBssMcsNss;
  *(_QWORD *)(v6 + 384) |= 0x400uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
      goto LABEL_36;
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v6 + 276) = self->_heStaCnt;
  *(_QWORD *)(v6 + 384) |= 0x8000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v9 & 0x100) == 0)
      goto LABEL_37;
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v6 + 280) = self->_heUtilization;
  *(_QWORD *)(v6 + 384) |= 0x10000uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v9 & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v6 + 212) = self->_heBEParamRecord;
  *(_QWORD *)(v6 + 384) |= 0x100uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v9 & 0x20000) == 0)
      goto LABEL_39;
LABEL_71:
    *(_DWORD *)(v6 + 284) = self->_heVIParamRecord;
    *(_QWORD *)(v6 + 384) |= 0x20000uLL;
    if ((*(_QWORD *)&self->_has & 0x40000) == 0)
      return (id)v6;
    goto LABEL_40;
  }
LABEL_70:
  *(_DWORD *)(v6 + 216) = self->_heBKParamRecord;
  *(_QWORD *)(v6 + 384) |= 0x200uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) != 0)
    goto LABEL_71;
LABEL_39:
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
LABEL_40:
    *(_DWORD *)(v6 + 288) = self->_heVOParamRecord;
    *(_QWORD *)(v6 + 384) |= 0x40000uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  uint64_t v6;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has;
  uint64_t v8;
  NSData *oui;
  uint64_t v10;
  NSData *htSupportedMcsSet;
  uint64_t v12;
  NSData *vhtSupportedMcsSet;
  uint64_t v14;
  NSData *heCapabilitiesIE;
  NSData *heOperationIE;
  NSData *heBSSLoadIE;
  NSData *muEDCAParametersIE;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v19;
  uint64_t v20;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!IsEqual)
    return IsEqual;
  v6 = *((_QWORD *)a3 + 48);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 22))
      goto LABEL_200;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_200;
  }
  IsEqual = PBRepeatedInt32IsEqual();
  if (!IsEqual)
    return IsEqual;
  has = self->_has;
  v8 = *((_QWORD *)a3 + 48);
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v8 & 0x200000000) == 0)
      goto LABEL_200;
    if (self->_isLinkUp)
    {
      if (!*((_BYTE *)a3 + 381))
        goto LABEL_200;
    }
    else if (*((_BYTE *)a3 + 381))
    {
      goto LABEL_200;
    }
  }
  else if ((v8 & 0x200000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
    if ((v8 & 0x100000000) != 0)
      goto LABEL_200;
    goto LABEL_24;
  }
  if ((v8 & 0x100000000) == 0)
    goto LABEL_200;
  if (self->_isInVol)
  {
    if (!*((_BYTE *)a3 + 380))
      goto LABEL_200;
    goto LABEL_24;
  }
  if (*((_BYTE *)a3 + 380))
  {
LABEL_200:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }
LABEL_24:
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0 || self->_reason != *((_DWORD *)a3 + 87))
      goto LABEL_200;
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v8 & 0x10000000) == 0 || self->_subreason != *((_DWORD *)a3 + 89))
      goto LABEL_200;
  }
  else if ((v8 & 0x10000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_channel != *((_DWORD *)a3 + 48))
      goto LABEL_200;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_channelWidth != *((_DWORD *)a3 + 49))
      goto LABEL_200;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_phyMode != *((_DWORD *)a3 + 86))
      goto LABEL_200;
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_flags != *((_DWORD *)a3 + 51))
      goto LABEL_200;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_200;
  }
  oui = self->_oui;
  if ((unint64_t)oui | *((_QWORD *)a3 + 42))
  {
    IsEqual = -[NSData isEqual:](oui, "isEqual:");
    if (!IsEqual)
      return IsEqual;
    has = self->_has;
  }
  v10 = *((_QWORD *)a3 + 48);
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v10 & 0x8000000) == 0 || self->_securityType != *((_DWORD *)a3 + 88))
      goto LABEL_200;
  }
  else if ((v10 & 0x8000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_wpaProtocol != *((_DWORD *)a3 + 94))
      goto LABEL_200;
  }
  else if ((v10 & 0x80000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_mcastCipher != *((_DWORD *)a3 + 81))
      goto LABEL_200;
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0 || self->_ucastCipher != *((_DWORD *)a3 + 90))
      goto LABEL_200;
  }
  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_akmSuites != *((_DWORD *)a3 + 46))
      goto LABEL_200;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_capabilities != *((_DWORD *)a3 + 47))
      goto LABEL_200;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_enhancedSecurityType != *((_DWORD *)a3 + 50))
      goto LABEL_200;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_htInfo != *((_DWORD *)a3 + 76))
      goto LABEL_200;
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_htExtended != *((_DWORD *)a3 + 75))
      goto LABEL_200;
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_htTxBf != *((_DWORD *)a3 + 80))
      goto LABEL_200;
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_htASel != *((_DWORD *)a3 + 73))
      goto LABEL_200;
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_htAmpduParams != *((_DWORD *)a3 + 74))
      goto LABEL_200;
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_200;
  }
  htSupportedMcsSet = self->_htSupportedMcsSet;
  if ((unint64_t)htSupportedMcsSet | *((_QWORD *)a3 + 39))
  {
    IsEqual = -[NSData isEqual:](htSupportedMcsSet, "isEqual:");
    if (!IsEqual)
      return IsEqual;
    has = self->_has;
  }
  v12 = *((_QWORD *)a3 + 48);
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v12 & 0x40000000) == 0 || self->_vhtInfo != *((_DWORD *)a3 + 91))
      goto LABEL_200;
  }
  else if ((v12 & 0x40000000) != 0)
  {
    goto LABEL_200;
  }
  vhtSupportedMcsSet = self->_vhtSupportedMcsSet;
  if (!((unint64_t)vhtSupportedMcsSet | *((_QWORD *)a3 + 46))
    || (IsEqual = -[NSData isEqual:](vhtSupportedMcsSet, "isEqual:")) != 0)
  {
    IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      IsEqual = PBRepeatedInt32IsEqual();
      if (IsEqual)
      {
        IsEqual = PBRepeatedInt32IsEqual();
        if (IsEqual)
        {
          IsEqual = PBRepeatedInt32IsEqual();
          if (IsEqual)
          {
            IsEqual = PBRepeatedInt32IsEqual();
            if (IsEqual)
            {
              IsEqual = PBRepeatedInt32IsEqual();
              if (IsEqual)
              {
                v14 = *((_QWORD *)a3 + 48);
                if ((*(_BYTE *)&self->_has & 0x80) != 0)
                {
                  if ((v14 & 0x80) == 0 || self->_gatewayARPHistory != *((_DWORD *)a3 + 52))
                    goto LABEL_200;
                }
                else if ((v14 & 0x80) != 0)
                {
                  goto LABEL_200;
                }
                heCapabilitiesIE = self->_heCapabilitiesIE;
                if (!((unint64_t)heCapabilitiesIE | *((_QWORD *)a3 + 30))
                  || (IsEqual = -[NSData isEqual:](heCapabilitiesIE, "isEqual:")) != 0)
                {
                  heOperationIE = self->_heOperationIE;
                  if (!((unint64_t)heOperationIE | *((_QWORD *)a3 + 32))
                    || (IsEqual = -[NSData isEqual:](heOperationIE, "isEqual:")) != 0)
                  {
                    heBSSLoadIE = self->_heBSSLoadIE;
                    if (!((unint64_t)heBSSLoadIE | *((_QWORD *)a3 + 28))
                      || (IsEqual = -[NSData isEqual:](heBSSLoadIE, "isEqual:")) != 0)
                    {
                      muEDCAParametersIE = self->_muEDCAParametersIE;
                      if (!((unint64_t)muEDCAParametersIE | *((_QWORD *)a3 + 41))
                        || (IsEqual = -[NSData isEqual:](muEDCAParametersIE, "isEqual:")) != 0)
                      {
                        v19 = self->_has;
                        v20 = *((_QWORD *)a3 + 48);
                        if ((*(_WORD *)&v19 & 0x800) != 0)
                        {
                          if ((v20 & 0x800) == 0 || self->_heMacCapSubfields != *((_DWORD *)a3 + 62))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x800) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x2000) != 0)
                        {
                          if ((v20 & 0x2000) == 0 || self->_hePhyCapSubfields != *((_DWORD *)a3 + 67))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x2000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x4000) != 0)
                        {
                          if ((v20 & 0x4000) == 0 || self->_heRxTxMcsMap != *((_DWORD *)a3 + 68))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x4000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x1000) != 0)
                        {
                          if ((v20 & 0x1000) == 0 || self->_heOpsParams != *((_DWORD *)a3 + 66))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x1000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x400) != 0)
                        {
                          if ((v20 & 0x400) == 0 || self->_heBssMcsNss != *((_DWORD *)a3 + 58))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x400) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x8000) != 0)
                        {
                          if ((v20 & 0x8000) == 0 || self->_heStaCnt != *((_DWORD *)a3 + 69))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x8000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_DWORD *)&v19 & 0x10000) != 0)
                        {
                          if ((v20 & 0x10000) == 0 || self->_heUtilization != *((_DWORD *)a3 + 70))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x10000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x100) != 0)
                        {
                          if ((v20 & 0x100) == 0 || self->_heBEParamRecord != *((_DWORD *)a3 + 53))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x100) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x200) != 0)
                        {
                          if ((v20 & 0x200) == 0 || self->_heBKParamRecord != *((_DWORD *)a3 + 54))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x200) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_DWORD *)&v19 & 0x20000) != 0)
                        {
                          if ((v20 & 0x20000) == 0 || self->_heVIParamRecord != *((_DWORD *)a3 + 71))
                            goto LABEL_200;
                        }
                        else if ((v20 & 0x20000) != 0)
                        {
                          goto LABEL_200;
                        }
                        LOBYTE(IsEqual) = (v20 & 0x40000) == 0;
                        if ((*(_DWORD *)&v19 & 0x40000) != 0)
                        {
                          if ((v20 & 0x40000) == 0 || self->_heVOParamRecord != *((_DWORD *)a3 + 72))
                            goto LABEL_200;
                          LOBYTE(IsEqual) = 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  $1830DFFC7F3C793B1FB608FDA3AB4356 has;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v55 = 2654435761u * self->_timestamp;
  else
    v55 = 0;
  v54 = PBRepeatedInt32Hash();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    v53 = 2654435761 * self->_isLinkUp;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
    {
LABEL_6:
      v52 = 2654435761 * self->_isInVol;
      if ((*(_DWORD *)&has & 0x4000000) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v53 = 0;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_6;
  }
  v52 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_7:
    v51 = 2654435761 * self->_reason;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v51 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_8:
    v50 = 2654435761 * self->_subreason;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v50 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_9:
    v49 = 2654435761 * self->_channel;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v49 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_10:
    v48 = 2654435761 * self->_channelWidth;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_11;
LABEL_19:
    v47 = 0;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_18:
  v48 = 0;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
    goto LABEL_19;
LABEL_11:
  v47 = 2654435761 * self->_phyMode;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_12:
    v46 = 2654435761 * self->_flags;
    goto LABEL_21;
  }
LABEL_20:
  v46 = 0;
LABEL_21:
  v45 = -[NSData hash](self->_oui, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
    v44 = 2654435761 * self->_securityType;
    if ((*(_DWORD *)&v4 & 0x80000000) != 0)
    {
LABEL_23:
      v43 = 2654435761 * self->_wpaProtocol;
      if ((*(_DWORD *)&v4 & 0x1000000) != 0)
        goto LABEL_24;
      goto LABEL_36;
    }
  }
  else
  {
    v44 = 0;
    if ((*(_DWORD *)&v4 & 0x80000000) != 0)
      goto LABEL_23;
  }
  v43 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_24:
    v42 = 2654435761 * self->_mcastCipher;
    if ((*(_DWORD *)&v4 & 0x20000000) != 0)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  v42 = 0;
  if ((*(_DWORD *)&v4 & 0x20000000) != 0)
  {
LABEL_25:
    v41 = 2654435761 * self->_ucastCipher;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  v41 = 0;
  if ((*(_BYTE *)&v4 & 2) != 0)
  {
LABEL_26:
    v40 = 2654435761 * self->_akmSuites;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_27;
    goto LABEL_39;
  }
LABEL_38:
  v40 = 0;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_27:
    v39 = 2654435761 * self->_capabilities;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
      goto LABEL_28;
    goto LABEL_40;
  }
LABEL_39:
  v39 = 0;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
  {
LABEL_28:
    v38 = 2654435761 * self->_enhancedSecurityType;
    if ((*(_DWORD *)&v4 & 0x400000) != 0)
      goto LABEL_29;
    goto LABEL_41;
  }
LABEL_40:
  v38 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_29:
    v37 = 2654435761 * self->_htInfo;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
      goto LABEL_30;
    goto LABEL_42;
  }
LABEL_41:
  v37 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_30:
    v36 = 2654435761 * self->_htExtended;
    if ((*(_DWORD *)&v4 & 0x800000) != 0)
      goto LABEL_31;
    goto LABEL_43;
  }
LABEL_42:
  v36 = 0;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
LABEL_31:
    v35 = 2654435761 * self->_htTxBf;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
      goto LABEL_32;
LABEL_44:
    v34 = 0;
    if ((*(_DWORD *)&v4 & 0x100000) != 0)
      goto LABEL_33;
    goto LABEL_45;
  }
LABEL_43:
  v35 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) == 0)
    goto LABEL_44;
LABEL_32:
  v34 = 2654435761 * self->_htASel;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_33:
    v33 = 2654435761 * self->_htAmpduParams;
    goto LABEL_46;
  }
LABEL_45:
  v33 = 0;
LABEL_46:
  v32 = -[NSData hash](self->_htSupportedMcsSet, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 0x40) != 0)
    v31 = 2654435761 * self->_vhtInfo;
  else
    v31 = 0;
  v30 = -[NSData hash](self->_vhtSupportedMcsSet, "hash");
  v29 = PBRepeatedInt32Hash();
  v28 = PBRepeatedInt32Hash();
  v26 = PBRepeatedInt32Hash();
  v5 = PBRepeatedInt32Hash();
  v6 = PBRepeatedInt32Hash();
  v7 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v8 = 2654435761 * self->_gatewayARPHistory;
  else
    v8 = 0;
  v9 = -[NSData hash](self->_heCapabilitiesIE, "hash", v26);
  v10 = -[NSData hash](self->_heOperationIE, "hash");
  v11 = -[NSData hash](self->_heBSSLoadIE, "hash");
  v12 = -[NSData hash](self->_muEDCAParametersIE, "hash");
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    v14 = 2654435761 * self->_heMacCapSubfields;
    if ((*(_WORD *)&v13 & 0x2000) != 0)
    {
LABEL_54:
      v15 = 2654435761 * self->_hePhyCapSubfields;
      if ((*(_WORD *)&v13 & 0x4000) != 0)
        goto LABEL_55;
      goto LABEL_66;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_WORD *)&v13 & 0x2000) != 0)
      goto LABEL_54;
  }
  v15 = 0;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
LABEL_55:
    v16 = 2654435761 * self->_heRxTxMcsMap;
    if ((*(_WORD *)&v13 & 0x1000) != 0)
      goto LABEL_56;
    goto LABEL_67;
  }
LABEL_66:
  v16 = 0;
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
LABEL_56:
    v17 = 2654435761 * self->_heOpsParams;
    if ((*(_WORD *)&v13 & 0x400) != 0)
      goto LABEL_57;
    goto LABEL_68;
  }
LABEL_67:
  v17 = 0;
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
LABEL_57:
    v18 = 2654435761 * self->_heBssMcsNss;
    if ((*(_WORD *)&v13 & 0x8000) != 0)
      goto LABEL_58;
    goto LABEL_69;
  }
LABEL_68:
  v18 = 0;
  if ((*(_WORD *)&v13 & 0x8000) != 0)
  {
LABEL_58:
    v19 = 2654435761 * self->_heStaCnt;
    if ((*(_DWORD *)&v13 & 0x10000) != 0)
      goto LABEL_59;
    goto LABEL_70;
  }
LABEL_69:
  v19 = 0;
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
LABEL_59:
    v20 = 2654435761 * self->_heUtilization;
    if ((*(_WORD *)&v13 & 0x100) != 0)
      goto LABEL_60;
    goto LABEL_71;
  }
LABEL_70:
  v20 = 0;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
LABEL_60:
    v21 = 2654435761 * self->_heBEParamRecord;
    if ((*(_WORD *)&v13 & 0x200) != 0)
      goto LABEL_61;
    goto LABEL_72;
  }
LABEL_71:
  v21 = 0;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
LABEL_61:
    v22 = 2654435761 * self->_heBKParamRecord;
    if ((*(_DWORD *)&v13 & 0x20000) != 0)
      goto LABEL_62;
LABEL_73:
    v23 = 0;
    if ((*(_DWORD *)&v13 & 0x40000) != 0)
      goto LABEL_63;
LABEL_74:
    v24 = 0;
    return v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v44 ^ v43 ^ v45 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  }
LABEL_72:
  v22 = 0;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
    goto LABEL_73;
LABEL_62:
  v23 = 2654435761 * self->_heVIParamRecord;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
    goto LABEL_74;
LABEL_63:
  v24 = 2654435761 * self->_heVOParamRecord;
  return v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v44 ^ v43 ^ v45 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  uint64_t v16;
  uint64_t v17;
  uint64_t m;
  uint64_t v19;
  uint64_t v20;
  uint64_t n;
  uint64_t v22;
  uint64_t v23;
  uint64_t ii;
  uint64_t v25;
  uint64_t v26;
  uint64_t jj;
  uint64_t v28;

  if ((*((_BYTE *)a3 + 384) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 22);
    *(_QWORD *)&self->_has |= 1uLL;
  }
  v5 = objc_msgSend(a3, "rssiHistorysCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWiFiMetric11axLinkChangeData addRssiHistory:](self, "addRssiHistory:", objc_msgSend(a3, "rssiHistoryAtIndex:", i));
  }
  v8 = *((_QWORD *)a3 + 48);
  if ((v8 & 0x200000000) != 0)
  {
    self->_isLinkUp = *((_BYTE *)a3 + 381);
    *(_QWORD *)&self->_has |= 0x200000000uLL;
    v8 = *((_QWORD *)a3 + 48);
    if ((v8 & 0x100000000) == 0)
    {
LABEL_8:
      if ((v8 & 0x4000000) == 0)
        goto LABEL_9;
      goto LABEL_79;
    }
  }
  else if ((v8 & 0x100000000) == 0)
  {
    goto LABEL_8;
  }
  self->_isInVol = *((_BYTE *)a3 + 380);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v8 = *((_QWORD *)a3 + 48);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_9:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_80;
  }
LABEL_79:
  self->_reason = *((_DWORD *)a3 + 87);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v8 = *((_QWORD *)a3 + 48);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_10:
    if ((v8 & 8) == 0)
      goto LABEL_11;
    goto LABEL_81;
  }
LABEL_80:
  self->_subreason = *((_DWORD *)a3 + 89);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v8 = *((_QWORD *)a3 + 48);
  if ((v8 & 8) == 0)
  {
LABEL_11:
    if ((v8 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_82;
  }
LABEL_81:
  self->_channel = *((_DWORD *)a3 + 48);
  *(_QWORD *)&self->_has |= 8uLL;
  v8 = *((_QWORD *)a3 + 48);
  if ((v8 & 0x10) == 0)
  {
LABEL_12:
    if ((v8 & 0x2000000) == 0)
      goto LABEL_13;
    goto LABEL_83;
  }
LABEL_82:
  self->_channelWidth = *((_DWORD *)a3 + 49);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v8 = *((_QWORD *)a3 + 48);
  if ((v8 & 0x2000000) == 0)
  {
LABEL_13:
    if ((v8 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_83:
  self->_phyMode = *((_DWORD *)a3 + 86);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  if ((*((_QWORD *)a3 + 48) & 0x40) != 0)
  {
LABEL_14:
    self->_flags = *((_DWORD *)a3 + 51);
    *(_QWORD *)&self->_has |= 0x40uLL;
  }
LABEL_15:
  if (*((_QWORD *)a3 + 42))
    -[AWDWiFiMetric11axLinkChangeData setOui:](self, "setOui:");
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 0x8000000) != 0)
  {
    self->_securityType = *((_DWORD *)a3 + 88);
    *(_QWORD *)&self->_has |= 0x8000000uLL;
    v9 = *((_QWORD *)a3 + 48);
    if ((v9 & 0x80000000) == 0)
    {
LABEL_19:
      if ((v9 & 0x1000000) == 0)
        goto LABEL_20;
      goto LABEL_87;
    }
  }
  else if ((v9 & 0x80000000) == 0)
  {
    goto LABEL_19;
  }
  self->_wpaProtocol = *((_DWORD *)a3 + 94);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_20:
    if ((v9 & 0x20000000) == 0)
      goto LABEL_21;
    goto LABEL_88;
  }
LABEL_87:
  self->_mcastCipher = *((_DWORD *)a3 + 81);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 0x20000000) == 0)
  {
LABEL_21:
    if ((v9 & 2) == 0)
      goto LABEL_22;
    goto LABEL_89;
  }
LABEL_88:
  self->_ucastCipher = *((_DWORD *)a3 + 90);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 2) == 0)
  {
LABEL_22:
    if ((v9 & 4) == 0)
      goto LABEL_23;
    goto LABEL_90;
  }
LABEL_89:
  self->_akmSuites = *((_DWORD *)a3 + 46);
  *(_QWORD *)&self->_has |= 2uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 4) == 0)
  {
LABEL_23:
    if ((v9 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_91;
  }
LABEL_90:
  self->_capabilities = *((_DWORD *)a3 + 47);
  *(_QWORD *)&self->_has |= 4uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 0x20) == 0)
  {
LABEL_24:
    if ((v9 & 0x400000) == 0)
      goto LABEL_25;
    goto LABEL_92;
  }
LABEL_91:
  self->_enhancedSecurityType = *((_DWORD *)a3 + 50);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 0x400000) == 0)
  {
LABEL_25:
    if ((v9 & 0x200000) == 0)
      goto LABEL_26;
    goto LABEL_93;
  }
LABEL_92:
  self->_htInfo = *((_DWORD *)a3 + 76);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 0x200000) == 0)
  {
LABEL_26:
    if ((v9 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_94;
  }
LABEL_93:
  self->_htExtended = *((_DWORD *)a3 + 75);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 0x800000) == 0)
  {
LABEL_27:
    if ((v9 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_95;
  }
LABEL_94:
  self->_htTxBf = *((_DWORD *)a3 + 80);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v9 = *((_QWORD *)a3 + 48);
  if ((v9 & 0x80000) == 0)
  {
LABEL_28:
    if ((v9 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_95:
  self->_htASel = *((_DWORD *)a3 + 73);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  if ((*((_QWORD *)a3 + 48) & 0x100000) != 0)
  {
LABEL_29:
    self->_htAmpduParams = *((_DWORD *)a3 + 74);
    *(_QWORD *)&self->_has |= 0x100000uLL;
  }
LABEL_30:
  if (*((_QWORD *)a3 + 39))
    -[AWDWiFiMetric11axLinkChangeData setHtSupportedMcsSet:](self, "setHtSupportedMcsSet:");
  if ((*((_BYTE *)a3 + 387) & 0x40) != 0)
  {
    self->_vhtInfo = *((_DWORD *)a3 + 91);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
  }
  if (*((_QWORD *)a3 + 46))
    -[AWDWiFiMetric11axLinkChangeData setVhtSupportedMcsSet:](self, "setVhtSupportedMcsSet:");
  v10 = objc_msgSend(a3, "txPerHistorysCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[AWDWiFiMetric11axLinkChangeData addTxPerHistory:](self, "addTxPerHistory:", objc_msgSend(a3, "txPerHistoryAtIndex:", j));
  }
  v13 = objc_msgSend(a3, "txFrmsHistorysCount");
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[AWDWiFiMetric11axLinkChangeData addTxFrmsHistory:](self, "addTxFrmsHistory:", objc_msgSend(a3, "txFrmsHistoryAtIndex:", k));
  }
  v16 = objc_msgSend(a3, "fwTxPerHistorysCount");
  if (v16)
  {
    v17 = v16;
    for (m = 0; m != v17; ++m)
      -[AWDWiFiMetric11axLinkChangeData addFwTxPerHistory:](self, "addFwTxPerHistory:", objc_msgSend(a3, "fwTxPerHistoryAtIndex:", m));
  }
  v19 = objc_msgSend(a3, "fwTxFrmsHistorysCount");
  if (v19)
  {
    v20 = v19;
    for (n = 0; n != v20; ++n)
      -[AWDWiFiMetric11axLinkChangeData addFwTxFrmsHistory:](self, "addFwTxFrmsHistory:", objc_msgSend(a3, "fwTxFrmsHistoryAtIndex:", n));
  }
  v22 = objc_msgSend(a3, "bcnPerHistorysCount");
  if (v22)
  {
    v23 = v22;
    for (ii = 0; ii != v23; ++ii)
      -[AWDWiFiMetric11axLinkChangeData addBcnPerHistory:](self, "addBcnPerHistory:", objc_msgSend(a3, "bcnPerHistoryAtIndex:", ii));
  }
  v25 = objc_msgSend(a3, "bcnFrmsHistorysCount");
  if (v25)
  {
    v26 = v25;
    for (jj = 0; jj != v26; ++jj)
      -[AWDWiFiMetric11axLinkChangeData addBcnFrmsHistory:](self, "addBcnFrmsHistory:", objc_msgSend(a3, "bcnFrmsHistoryAtIndex:", jj));
  }
  if ((*((_BYTE *)a3 + 384) & 0x80) != 0)
  {
    self->_gatewayARPHistory = *((_DWORD *)a3 + 52);
    *(_QWORD *)&self->_has |= 0x80uLL;
  }
  if (*((_QWORD *)a3 + 30))
    -[AWDWiFiMetric11axLinkChangeData setHeCapabilitiesIE:](self, "setHeCapabilitiesIE:");
  if (*((_QWORD *)a3 + 32))
    -[AWDWiFiMetric11axLinkChangeData setHeOperationIE:](self, "setHeOperationIE:");
  if (*((_QWORD *)a3 + 28))
    -[AWDWiFiMetric11axLinkChangeData setHeBSSLoadIE:](self, "setHeBSSLoadIE:");
  if (*((_QWORD *)a3 + 41))
    -[AWDWiFiMetric11axLinkChangeData setMuEDCAParametersIE:](self, "setMuEDCAParametersIE:");
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x800) != 0)
  {
    self->_heMacCapSubfields = *((_DWORD *)a3 + 62);
    *(_QWORD *)&self->_has |= 0x800uLL;
    v28 = *((_QWORD *)a3 + 48);
    if ((v28 & 0x2000) == 0)
    {
LABEL_66:
      if ((v28 & 0x4000) == 0)
        goto LABEL_67;
      goto LABEL_99;
    }
  }
  else if ((v28 & 0x2000) == 0)
  {
    goto LABEL_66;
  }
  self->_hePhyCapSubfields = *((_DWORD *)a3 + 67);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x4000) == 0)
  {
LABEL_67:
    if ((v28 & 0x1000) == 0)
      goto LABEL_68;
    goto LABEL_100;
  }
LABEL_99:
  self->_heRxTxMcsMap = *((_DWORD *)a3 + 68);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x1000) == 0)
  {
LABEL_68:
    if ((v28 & 0x400) == 0)
      goto LABEL_69;
    goto LABEL_101;
  }
LABEL_100:
  self->_heOpsParams = *((_DWORD *)a3 + 66);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x400) == 0)
  {
LABEL_69:
    if ((v28 & 0x8000) == 0)
      goto LABEL_70;
    goto LABEL_102;
  }
LABEL_101:
  self->_heBssMcsNss = *((_DWORD *)a3 + 58);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x8000) == 0)
  {
LABEL_70:
    if ((v28 & 0x10000) == 0)
      goto LABEL_71;
    goto LABEL_103;
  }
LABEL_102:
  self->_heStaCnt = *((_DWORD *)a3 + 69);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x10000) == 0)
  {
LABEL_71:
    if ((v28 & 0x100) == 0)
      goto LABEL_72;
    goto LABEL_104;
  }
LABEL_103:
  self->_heUtilization = *((_DWORD *)a3 + 70);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x100) == 0)
  {
LABEL_72:
    if ((v28 & 0x200) == 0)
      goto LABEL_73;
    goto LABEL_105;
  }
LABEL_104:
  self->_heBEParamRecord = *((_DWORD *)a3 + 53);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x200) == 0)
  {
LABEL_73:
    if ((v28 & 0x20000) == 0)
      goto LABEL_74;
    goto LABEL_106;
  }
LABEL_105:
  self->_heBKParamRecord = *((_DWORD *)a3 + 54);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v28 = *((_QWORD *)a3 + 48);
  if ((v28 & 0x20000) == 0)
  {
LABEL_74:
    if ((v28 & 0x40000) == 0)
      return;
    goto LABEL_75;
  }
LABEL_106:
  self->_heVIParamRecord = *((_DWORD *)a3 + 71);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  if ((*((_QWORD *)a3 + 48) & 0x40000) == 0)
    return;
LABEL_75:
  self->_heVOParamRecord = *((_DWORD *)a3 + 72);
  *(_QWORD *)&self->_has |= 0x40000uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isLinkUp
{
  return self->_isLinkUp;
}

- (BOOL)isInVol
{
  return self->_isInVol;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unsigned)subreason
{
  return self->_subreason;
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)channelWidth
{
  return self->_channelWidth;
}

- (unsigned)phyMode
{
  return self->_phyMode;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)wpaProtocol
{
  return self->_wpaProtocol;
}

- (unsigned)mcastCipher
{
  return self->_mcastCipher;
}

- (unsigned)ucastCipher
{
  return self->_ucastCipher;
}

- (unsigned)akmSuites
{
  return self->_akmSuites;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (unsigned)enhancedSecurityType
{
  return self->_enhancedSecurityType;
}

- (unsigned)htInfo
{
  return self->_htInfo;
}

- (unsigned)htExtended
{
  return self->_htExtended;
}

- (unsigned)htTxBf
{
  return self->_htTxBf;
}

- (unsigned)htASel
{
  return self->_htASel;
}

- (unsigned)htAmpduParams
{
  return self->_htAmpduParams;
}

- (NSData)htSupportedMcsSet
{
  return self->_htSupportedMcsSet;
}

- (void)setHtSupportedMcsSet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (unsigned)vhtInfo
{
  return self->_vhtInfo;
}

- (NSData)vhtSupportedMcsSet
{
  return self->_vhtSupportedMcsSet;
}

- (void)setVhtSupportedMcsSet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (unsigned)gatewayARPHistory
{
  return self->_gatewayARPHistory;
}

- (NSData)heCapabilitiesIE
{
  return self->_heCapabilitiesIE;
}

- (void)setHeCapabilitiesIE:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (NSData)heOperationIE
{
  return self->_heOperationIE;
}

- (void)setHeOperationIE:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (NSData)heBSSLoadIE
{
  return self->_heBSSLoadIE;
}

- (void)setHeBSSLoadIE:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (NSData)muEDCAParametersIE
{
  return self->_muEDCAParametersIE;
}

- (void)setMuEDCAParametersIE:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (unsigned)heMacCapSubfields
{
  return self->_heMacCapSubfields;
}

- (unsigned)hePhyCapSubfields
{
  return self->_hePhyCapSubfields;
}

- (unsigned)heRxTxMcsMap
{
  return self->_heRxTxMcsMap;
}

- (unsigned)heOpsParams
{
  return self->_heOpsParams;
}

- (unsigned)heBssMcsNss
{
  return self->_heBssMcsNss;
}

- (unsigned)heStaCnt
{
  return self->_heStaCnt;
}

- (unsigned)heUtilization
{
  return self->_heUtilization;
}

- (unsigned)heBEParamRecord
{
  return self->_heBEParamRecord;
}

- (unsigned)heBKParamRecord
{
  return self->_heBKParamRecord;
}

- (unsigned)heVIParamRecord
{
  return self->_heVIParamRecord;
}

- (unsigned)heVOParamRecord
{
  return self->_heVOParamRecord;
}

@end
