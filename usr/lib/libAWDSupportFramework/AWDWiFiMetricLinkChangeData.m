@implementation AWDWiFiMetricLinkChangeData

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  -[AWDWiFiMetricLinkChangeData setOui:](self, "setOui:", 0);
  -[AWDWiFiMetricLinkChangeData setHtSupportedMcsSet:](self, "setHtSupportedMcsSet:", 0);
  -[AWDWiFiMetricLinkChangeData setVhtSupportedMcsSet:](self, "setVhtSupportedMcsSet:", 0);
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  -[AWDWiFiMetricLinkChangeData setLocale:](self, "setLocale:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsResponseType:](self, "setWpsResponseType:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsManufacturerElement:](self, "setWpsManufacturerElement:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsModelName:](self, "setWpsModelName:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsModelNumber:](self, "setWpsModelNumber:", 0);
  -[AWDWiFiMetricLinkChangeData setCountryCode:](self, "setCountryCode:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsDeviceNameData:](self, "setWpsDeviceNameData:", 0);
  -[AWDWiFiMetricLinkChangeData setWpsConfigMethods:](self, "setWpsConfigMethods:", 0);
  -[AWDWiFiMetricLinkChangeData setLocaleSource:](self, "setLocaleSource:", 0);
  -[AWDWiFiMetricLinkChangeData setPrivateMacType:](self, "setPrivateMacType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricLinkChangeData;
  -[AWDWiFiMetricLinkChangeData dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isLinkUp = a3;
}

- (void)setHasIsLinkUp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsLinkUp
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsInVol:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isInVol = a3;
}

- (void)setHasIsInVol:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsInVol
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSubreason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_subreason = a3;
}

- (void)setHasSubreason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSubreason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setChannelWidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasChannelWidth
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setPhyMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_phyMode = a3;
}

- (void)setHasPhyMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setWpaProtocol:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_wpaProtocol = a3;
}

- (void)setHasWpaProtocol:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasWpaProtocol
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setMcastCipher:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_mcastCipher = a3;
}

- (void)setHasMcastCipher:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMcastCipher
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setUcastCipher:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_ucastCipher = a3;
}

- (void)setHasUcastCipher:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUcastCipher
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAkmSuites:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_akmSuites = a3;
}

- (void)setHasAkmSuites:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAkmSuites
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCapabilities:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCapabilities
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEnhancedSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_enhancedSecurityType = a3;
}

- (void)setHasEnhancedSecurityType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasEnhancedSecurityType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHtInfo:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_htInfo = a3;
}

- (void)setHasHtInfo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasHtInfo
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHtExtended:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_htExtended = a3;
}

- (void)setHasHtExtended:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasHtExtended
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHtTxBf:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_htTxBf = a3;
}

- (void)setHasHtTxBf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasHtTxBf
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHtASel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_htASel = a3;
}

- (void)setHasHtASel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHtASel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHtAmpduParams:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_htAmpduParams = a3;
}

- (void)setHasHtAmpduParams:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHtAmpduParams
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasHtSupportedMcsSet
{
  return self->_htSupportedMcsSet != 0;
}

- (void)setVhtInfo:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_vhtInfo = a3;
}

- (void)setHasVhtInfo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasVhtInfo
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
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
  *(_DWORD *)&self->_has |= 0x400u;
  self->_gatewayARPHistory = a3;
}

- (void)setHasGatewayARPHistory:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasGatewayARPHistory
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)setAssociationDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_associationDuration = a3;
}

- (void)setHasAssociationDuration:(BOOL)a3
{
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAssociationDuration
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasWpsResponseType
{
  return self->_wpsResponseType != 0;
}

- (BOOL)hasWpsManufacturerElement
{
  return self->_wpsManufacturerElement != 0;
}

- (BOOL)hasWpsModelName
{
  return self->_wpsModelName != 0;
}

- (BOOL)hasWpsModelNumber
{
  return self->_wpsModelNumber != 0;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory != 0;
}

- (BOOL)hasWpsDeviceNameElement
{
  return self->_wpsDeviceNameElement != 0;
}

- (BOOL)hasWpsDeviceNameData
{
  return self->_wpsDeviceNameData != 0;
}

- (BOOL)hasWpsConfigMethods
{
  return self->_wpsConfigMethods != 0;
}

- (BOOL)hasLocaleSource
{
  return self->_localeSource != 0;
}

- (void)setRxCSAFrames:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_rxCSAFrames = a3;
}

- (void)setHasRxCSAFrames:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRxCSAFrames
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setChannelSwitchDuringHostSleep:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_channelSwitchDuringHostSleep = a3;
}

- (void)setHasChannelSwitchDuringHostSleep:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasChannelSwitchDuringHostSleep
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setChannelSwitchDuringHostWake:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_channelSwitchDuringHostWake = a3;
}

- (void)setHasChannelSwitchDuringHostWake:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasChannelSwitchDuringHostWake
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasPrivateMacType
{
  return self->_privateMacType != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricLinkChangeData;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricLinkChangeData description](&v3, sel_description), -[AWDWiFiMetricLinkChangeData dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $B0D1D818CB9EA72D974DA75CDADC79AD has;
  NSData *oui;
  $B0D1D818CB9EA72D974DA75CDADC79AD v6;
  NSData *htSupportedMcsSet;
  NSData *vhtSupportedMcsSet;
  NSString *locale;
  NSString *wpsResponseType;
  NSString *wpsManufacturerElement;
  NSString *wpsModelName;
  NSString *wpsModelNumber;
  NSString *countryCode;
  NSString *wpsPrimaryDeviceTypeCategory;
  NSString *wpsPrimaryDeviceTypeSubCategory;
  NSString *wpsDeviceNameElement;
  NSString *wpsDeviceNameData;
  NSString *wpsConfigMethods;
  NSString *localeSource;
  $B0D1D818CB9EA72D974DA75CDADC79AD v21;
  NSString *privateMacType;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("rssiHistory"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLinkUp), CFSTR("isLinkUp"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x40000) == 0)
        goto LABEL_6;
      goto LABEL_70;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInVol), CFSTR("isInVol"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reason), CFSTR("reason"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_subreason), CFSTR("subreason"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channel), CFSTR("channel"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelWidth), CFSTR("channelWidth"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_phyMode), CFSTR("phyMode"));
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags), CFSTR("flags"));
LABEL_12:
  oui = self->_oui;
  if (oui)
    objc_msgSend(v3, "setObject:forKey:", oui, CFSTR("oui"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType), CFSTR("securityType"));
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v6 & 0x10000) == 0)
        goto LABEL_17;
      goto LABEL_78;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wpaProtocol), CFSTR("wpaProtocol"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_mcastCipher), CFSTR("mcastCipher"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_19;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ucastCipher), CFSTR("ucastCipher"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_20;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_akmSuites), CFSTR("akmSuites"));
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_capabilities), CFSTR("capabilities"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enhancedSecurityType), CFSTR("enhancedSecurityType"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htInfo), CFSTR("htInfo"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htExtended), CFSTR("htExtended"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htTxBf), CFSTR("htTxBf"));
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_86:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htASel), CFSTR("htASel"));
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_26:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_htAmpduParams), CFSTR("htAmpduParams"));
LABEL_27:
  htSupportedMcsSet = self->_htSupportedMcsSet;
  if (htSupportedMcsSet)
    objc_msgSend(v3, "setObject:forKey:", htSupportedMcsSet, CFSTR("htSupportedMcsSet"));
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
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
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_gatewayARPHistory), CFSTR("gatewayARPHistory"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_associationDuration), CFSTR("associationDuration"));
  wpsResponseType = self->_wpsResponseType;
  if (wpsResponseType)
    objc_msgSend(v3, "setObject:forKey:", wpsResponseType, CFSTR("wpsResponseType"));
  wpsManufacturerElement = self->_wpsManufacturerElement;
  if (wpsManufacturerElement)
    objc_msgSend(v3, "setObject:forKey:", wpsManufacturerElement, CFSTR("wpsManufacturerElement"));
  wpsModelName = self->_wpsModelName;
  if (wpsModelName)
    objc_msgSend(v3, "setObject:forKey:", wpsModelName, CFSTR("wpsModelName"));
  wpsModelNumber = self->_wpsModelNumber;
  if (wpsModelNumber)
    objc_msgSend(v3, "setObject:forKey:", wpsModelNumber, CFSTR("wpsModelNumber"));
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v3, "setObject:forKey:", countryCode, CFSTR("countryCode"));
  wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
  if (wpsPrimaryDeviceTypeCategory)
    objc_msgSend(v3, "setObject:forKey:", wpsPrimaryDeviceTypeCategory, CFSTR("wpsPrimaryDeviceTypeCategory"));
  wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
  if (wpsPrimaryDeviceTypeSubCategory)
    objc_msgSend(v3, "setObject:forKey:", wpsPrimaryDeviceTypeSubCategory, CFSTR("wpsPrimaryDeviceTypeSubCategory"));
  wpsDeviceNameElement = self->_wpsDeviceNameElement;
  if (wpsDeviceNameElement)
    objc_msgSend(v3, "setObject:forKey:", wpsDeviceNameElement, CFSTR("wpsDeviceNameElement"));
  wpsDeviceNameData = self->_wpsDeviceNameData;
  if (wpsDeviceNameData)
    objc_msgSend(v3, "setObject:forKey:", wpsDeviceNameData, CFSTR("wpsDeviceNameData"));
  wpsConfigMethods = self->_wpsConfigMethods;
  if (wpsConfigMethods)
    objc_msgSend(v3, "setObject:forKey:", wpsConfigMethods, CFSTR("wpsConfigMethods"));
  localeSource = self->_localeSource;
  if (localeSource)
    objc_msgSend(v3, "setObject:forKey:", localeSource, CFSTR("localeSource"));
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rxCSAFrames), CFSTR("rxCSAFrames"));
    v21 = self->_has;
    if ((*(_BYTE *)&v21 & 0x20) == 0)
    {
LABEL_63:
      if ((*(_BYTE *)&v21 & 0x40) == 0)
        goto LABEL_65;
      goto LABEL_64;
    }
  }
  else if ((*(_BYTE *)&v21 & 0x20) == 0)
  {
    goto LABEL_63;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelSwitchDuringHostSleep), CFSTR("channelSwitchDuringHostSleep"));
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_64:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_channelSwitchDuringHostWake), CFSTR("channelSwitchDuringHostWake"));
LABEL_65:
  privateMacType = self->_privateMacType;
  if (privateMacType)
    objc_msgSend(v3, "setObject:forKey:", privateMacType, CFSTR("privateMacType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricLinkChangeDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  $B0D1D818CB9EA72D974DA75CDADC79AD has;
  $B0D1D818CB9EA72D974DA75CDADC79AD v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $B0D1D818CB9EA72D974DA75CDADC79AD v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
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
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_8:
      if ((*(_DWORD *)&has & 0x40000) == 0)
        goto LABEL_9;
      goto LABEL_90;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_10;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
LABEL_14:
    PBDataWriterWriteUint32Field();
LABEL_15:
  if (self->_oui)
    PBDataWriterWriteDataField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
    {
LABEL_19:
      if ((*(_DWORD *)&v6 & 0x10000) == 0)
        goto LABEL_20;
      goto LABEL_98;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_22;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_23;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_106:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_29:
    PBDataWriterWriteUint32Field();
LABEL_30:
  if (self->_htSupportedMcsSet)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
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
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_locale)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_wpsResponseType)
    PBDataWriterWriteStringField();
  if (self->_wpsManufacturerElement)
    PBDataWriterWriteStringField();
  if (self->_wpsModelName)
    PBDataWriterWriteStringField();
  if (self->_wpsModelNumber)
    PBDataWriterWriteStringField();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if (self->_wpsPrimaryDeviceTypeCategory)
    PBDataWriterWriteStringField();
  if (self->_wpsPrimaryDeviceTypeSubCategory)
    PBDataWriterWriteStringField();
  if (self->_wpsDeviceNameElement)
    PBDataWriterWriteStringField();
  if (self->_wpsDeviceNameData)
    PBDataWriterWriteStringField();
  if (self->_wpsConfigMethods)
    PBDataWriterWriteStringField();
  if (self->_localeSource)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v13 = self->_has;
    if ((*(_BYTE *)&v13 & 0x20) == 0)
    {
LABEL_84:
      if ((*(_BYTE *)&v13 & 0x40) == 0)
        goto LABEL_86;
      goto LABEL_85;
    }
  }
  else if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
    goto LABEL_84;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_85:
    PBDataWriterWriteUint32Field();
LABEL_86:
  if (self->_privateMacType)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  $B0D1D818CB9EA72D974DA75CDADC79AD has;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9;
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
  $B0D1D818CB9EA72D974DA75CDADC79AD v28;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 23) = self->_timestamp;
    *((_DWORD *)a3 + 109) |= 2u;
  }
  if (-[AWDWiFiMetricLinkChangeData rssiHistorysCount](self, "rssiHistorysCount"))
  {
    objc_msgSend(a3, "clearRssiHistorys");
    v5 = -[AWDWiFiMetricLinkChangeData rssiHistorysCount](self, "rssiHistorysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addRssiHistory:", -[AWDWiFiMetricLinkChangeData rssiHistoryAtIndex:](self, "rssiHistoryAtIndex:", i));
    }
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    *((_BYTE *)a3 + 433) = self->_isLinkUp;
    *((_DWORD *)a3 + 109) |= 0x4000000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&has & 0x40000) == 0)
        goto LABEL_10;
      goto LABEL_97;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)a3 + 432) = self->_isInVol;
  *((_DWORD *)a3 + 109) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 80) = self->_reason;
  *((_DWORD *)a3 + 109) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 83) = self->_subreason;
  *((_DWORD *)a3 + 109) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)a3 + 50) = self->_channel;
  *((_DWORD *)a3 + 109) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)a3 + 53) = self->_channelWidth;
  *((_DWORD *)a3 + 109) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_101:
  *((_DWORD *)a3 + 76) = self->_phyMode;
  *((_DWORD *)a3 + 109) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 57) = self->_flags;
    *((_DWORD *)a3 + 109) |= 0x200u;
  }
LABEL_16:
  if (self->_oui)
    objc_msgSend(a3, "setOui:");
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) != 0)
  {
    *((_DWORD *)a3 + 82) = self->_securityType;
    *((_DWORD *)a3 + 109) |= 0x100000u;
    v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x1000000) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&v9 & 0x10000) == 0)
        goto LABEL_21;
      goto LABEL_105;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)a3 + 88) = self->_wpaProtocol;
  *((_DWORD *)a3 + 109) |= 0x1000000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
      goto LABEL_22;
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)a3 + 72) = self->_mcastCipher;
  *((_DWORD *)a3 + 109) |= 0x10000u;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v9 & 4) == 0)
      goto LABEL_23;
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)a3 + 84) = self->_ucastCipher;
  *((_DWORD *)a3 + 109) |= 0x400000u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 4) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v9 & 8) == 0)
      goto LABEL_24;
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)a3 + 48) = self->_akmSuites;
  *((_DWORD *)a3 + 109) |= 4u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 8) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v9 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)a3 + 49) = self->_capabilities;
  *((_DWORD *)a3 + 109) |= 8u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v9 & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)a3 + 56) = self->_enhancedSecurityType;
  *((_DWORD *)a3 + 109) |= 0x100u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v9 & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)a3 + 62) = self->_htInfo;
  *((_DWORD *)a3 + 109) |= 0x4000u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v9 & 0x8000) == 0)
      goto LABEL_28;
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)a3 + 61) = self->_htExtended;
  *((_DWORD *)a3 + 109) |= 0x2000u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v9 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)a3 + 66) = self->_htTxBf;
  *((_DWORD *)a3 + 109) |= 0x8000u;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v9 & 0x1000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_113:
  *((_DWORD *)a3 + 59) = self->_htASel;
  *((_DWORD *)a3 + 109) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_30:
    *((_DWORD *)a3 + 60) = self->_htAmpduParams;
    *((_DWORD *)a3 + 109) |= 0x1000u;
  }
LABEL_31:
  if (self->_htSupportedMcsSet)
    objc_msgSend(a3, "setHtSupportedMcsSet:");
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *((_DWORD *)a3 + 85) = self->_vhtInfo;
    *((_DWORD *)a3 + 109) |= 0x800000u;
  }
  if (self->_vhtSupportedMcsSet)
    objc_msgSend(a3, "setVhtSupportedMcsSet:");
  if (-[AWDWiFiMetricLinkChangeData txPerHistorysCount](self, "txPerHistorysCount"))
  {
    objc_msgSend(a3, "clearTxPerHistorys");
    v10 = -[AWDWiFiMetricLinkChangeData txPerHistorysCount](self, "txPerHistorysCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addTxPerHistory:", -[AWDWiFiMetricLinkChangeData txPerHistoryAtIndex:](self, "txPerHistoryAtIndex:", j));
    }
  }
  if (-[AWDWiFiMetricLinkChangeData txFrmsHistorysCount](self, "txFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearTxFrmsHistorys");
    v13 = -[AWDWiFiMetricLinkChangeData txFrmsHistorysCount](self, "txFrmsHistorysCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(a3, "addTxFrmsHistory:", -[AWDWiFiMetricLinkChangeData txFrmsHistoryAtIndex:](self, "txFrmsHistoryAtIndex:", k));
    }
  }
  if (-[AWDWiFiMetricLinkChangeData fwTxPerHistorysCount](self, "fwTxPerHistorysCount"))
  {
    objc_msgSend(a3, "clearFwTxPerHistorys");
    v16 = -[AWDWiFiMetricLinkChangeData fwTxPerHistorysCount](self, "fwTxPerHistorysCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(a3, "addFwTxPerHistory:", -[AWDWiFiMetricLinkChangeData fwTxPerHistoryAtIndex:](self, "fwTxPerHistoryAtIndex:", m));
    }
  }
  if (-[AWDWiFiMetricLinkChangeData fwTxFrmsHistorysCount](self, "fwTxFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearFwTxFrmsHistorys");
    v19 = -[AWDWiFiMetricLinkChangeData fwTxFrmsHistorysCount](self, "fwTxFrmsHistorysCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
        objc_msgSend(a3, "addFwTxFrmsHistory:", -[AWDWiFiMetricLinkChangeData fwTxFrmsHistoryAtIndex:](self, "fwTxFrmsHistoryAtIndex:", n));
    }
  }
  if (-[AWDWiFiMetricLinkChangeData bcnPerHistorysCount](self, "bcnPerHistorysCount"))
  {
    objc_msgSend(a3, "clearBcnPerHistorys");
    v22 = -[AWDWiFiMetricLinkChangeData bcnPerHistorysCount](self, "bcnPerHistorysCount");
    if (v22)
    {
      v23 = v22;
      for (ii = 0; ii != v23; ++ii)
        objc_msgSend(a3, "addBcnPerHistory:", -[AWDWiFiMetricLinkChangeData bcnPerHistoryAtIndex:](self, "bcnPerHistoryAtIndex:", ii));
    }
  }
  if (-[AWDWiFiMetricLinkChangeData bcnFrmsHistorysCount](self, "bcnFrmsHistorysCount"))
  {
    objc_msgSend(a3, "clearBcnFrmsHistorys");
    v25 = -[AWDWiFiMetricLinkChangeData bcnFrmsHistorysCount](self, "bcnFrmsHistorysCount");
    if (v25)
    {
      v26 = v25;
      for (jj = 0; jj != v26; ++jj)
        objc_msgSend(a3, "addBcnFrmsHistory:", -[AWDWiFiMetricLinkChangeData bcnFrmsHistoryAtIndex:](self, "bcnFrmsHistoryAtIndex:", jj));
    }
  }
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    *((_DWORD *)a3 + 58) = self->_gatewayARPHistory;
    *((_DWORD *)a3 + 109) |= 0x400u;
  }
  if (self->_locale)
    objc_msgSend(a3, "setLocale:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 22) = *(_QWORD *)&self->_associationDuration;
    *((_DWORD *)a3 + 109) |= 1u;
  }
  if (self->_wpsResponseType)
    objc_msgSend(a3, "setWpsResponseType:");
  if (self->_wpsManufacturerElement)
    objc_msgSend(a3, "setWpsManufacturerElement:");
  if (self->_wpsModelName)
    objc_msgSend(a3, "setWpsModelName:");
  if (self->_wpsModelNumber)
    objc_msgSend(a3, "setWpsModelNumber:");
  if (self->_countryCode)
    objc_msgSend(a3, "setCountryCode:");
  if (self->_wpsPrimaryDeviceTypeCategory)
    objc_msgSend(a3, "setWpsPrimaryDeviceTypeCategory:");
  if (self->_wpsPrimaryDeviceTypeSubCategory)
    objc_msgSend(a3, "setWpsPrimaryDeviceTypeSubCategory:");
  if (self->_wpsDeviceNameElement)
    objc_msgSend(a3, "setWpsDeviceNameElement:");
  if (self->_wpsDeviceNameData)
    objc_msgSend(a3, "setWpsDeviceNameData:");
  if (self->_wpsConfigMethods)
    objc_msgSend(a3, "setWpsConfigMethods:");
  if (self->_localeSource)
    objc_msgSend(a3, "setLocaleSource:");
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x80000) != 0)
  {
    *((_DWORD *)a3 + 81) = self->_rxCSAFrames;
    *((_DWORD *)a3 + 109) |= 0x80000u;
    v28 = self->_has;
    if ((*(_BYTE *)&v28 & 0x20) == 0)
    {
LABEL_91:
      if ((*(_BYTE *)&v28 & 0x40) == 0)
        goto LABEL_93;
      goto LABEL_92;
    }
  }
  else if ((*(_BYTE *)&v28 & 0x20) == 0)
  {
    goto LABEL_91;
  }
  *((_DWORD *)a3 + 51) = self->_channelSwitchDuringHostSleep;
  *((_DWORD *)a3 + 109) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_92:
    *((_DWORD *)a3 + 52) = self->_channelSwitchDuringHostWake;
    *((_DWORD *)a3 + 109) |= 0x40u;
  }
LABEL_93:
  if (self->_privateMacType)
    objc_msgSend(a3, "setPrivateMacType:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $B0D1D818CB9EA72D974DA75CDADC79AD has;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 184) = self->_timestamp;
    *(_DWORD *)(v5 + 436) |= 2u;
  }
  PBRepeatedInt32Copy();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    *(_BYTE *)(v6 + 433) = self->_isLinkUp;
    *(_DWORD *)(v6 + 436) |= 0x4000000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x40000) == 0)
        goto LABEL_6;
      goto LABEL_38;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 432) = self->_isInVol;
  *(_DWORD *)(v6 + 436) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v6 + 320) = self->_reason;
  *(_DWORD *)(v6 + 436) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v6 + 332) = self->_subreason;
  *(_DWORD *)(v6 + 436) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v6 + 200) = self->_channel;
  *(_DWORD *)(v6 + 436) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 212) = self->_channelWidth;
  *(_DWORD *)(v6 + 436) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_42:
  *(_DWORD *)(v6 + 304) = self->_phyMode;
  *(_DWORD *)(v6 + 436) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 228) = self->_flags;
    *(_DWORD *)(v6 + 436) |= 0x200u;
  }
LABEL_12:

  *(_QWORD *)(v6 + 296) = -[NSData copyWithZone:](self->_oui, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) != 0)
  {
    *(_DWORD *)(v6 + 328) = self->_securityType;
    *(_DWORD *)(v6 + 436) |= 0x100000u;
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
    {
LABEL_14:
      if ((*(_DWORD *)&v8 & 0x10000) == 0)
        goto LABEL_15;
      goto LABEL_46;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 352) = self->_wpaProtocol;
  *(_DWORD *)(v6 + 436) |= 0x1000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 288) = self->_mcastCipher;
  *(_DWORD *)(v6 + 436) |= 0x10000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 336) = self->_ucastCipher;
  *(_DWORD *)(v6 + 436) |= 0x400000u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v8 & 8) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 192) = self->_akmSuites;
  *(_DWORD *)(v6 + 436) |= 4u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v8 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v6 + 196) = self->_capabilities;
  *(_DWORD *)(v6 + 436) |= 8u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v8 & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v6 + 224) = self->_enhancedSecurityType;
  *(_DWORD *)(v6 + 436) |= 0x100u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 248) = self->_htInfo;
  *(_DWORD *)(v6 + 436) |= 0x4000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v8 & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 244) = self->_htExtended;
  *(_DWORD *)(v6 + 436) |= 0x2000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v8 & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v6 + 264) = self->_htTxBf;
  *(_DWORD *)(v6 + 436) |= 0x8000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_54:
  *(_DWORD *)(v6 + 236) = self->_htASel;
  *(_DWORD *)(v6 + 436) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_24:
    *(_DWORD *)(v6 + 240) = self->_htAmpduParams;
    *(_DWORD *)(v6 + 436) |= 0x1000u;
  }
LABEL_25:

  *(_QWORD *)(v6 + 256) = -[NSData copyWithZone:](self->_htSupportedMcsSet, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 340) = self->_vhtInfo;
    *(_DWORD *)(v6 + 436) |= 0x800000u;
  }

  *(_QWORD *)(v6 + 344) = -[NSData copyWithZone:](self->_vhtSupportedMcsSet, "copyWithZone:", a3);
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    *(_DWORD *)(v6 + 232) = self->_gatewayARPHistory;
    *(_DWORD *)(v6 + 436) |= 0x400u;
  }

  *(_QWORD *)(v6 + 272) = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 176) = self->_associationDuration;
    *(_DWORD *)(v6 + 436) |= 1u;
  }

  *(_QWORD *)(v6 + 424) = -[NSString copyWithZone:](self->_wpsResponseType, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 384) = -[NSString copyWithZone:](self->_wpsManufacturerElement, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 392) = -[NSString copyWithZone:](self->_wpsModelName, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 400) = -[NSString copyWithZone:](self->_wpsModelNumber, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 216) = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 408) = -[NSString copyWithZone:](self->_wpsPrimaryDeviceTypeCategory, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 416) = -[NSString copyWithZone:](self->_wpsPrimaryDeviceTypeSubCategory, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 376) = -[NSString copyWithZone:](self->_wpsDeviceNameElement, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 368) = -[NSString copyWithZone:](self->_wpsDeviceNameData, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 360) = -[NSString copyWithZone:](self->_wpsConfigMethods, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 280) = -[NSString copyWithZone:](self->_localeSource, "copyWithZone:", a3);
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
    if ((*(_BYTE *)&v9 & 0x20) == 0)
      goto LABEL_33;
LABEL_57:
    *(_DWORD *)(v6 + 204) = self->_channelSwitchDuringHostSleep;
    *(_DWORD *)(v6 + 436) |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
  *(_DWORD *)(v6 + 324) = self->_rxCSAFrames;
  *(_DWORD *)(v6 + 436) |= 0x80000u;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x20) != 0)
    goto LABEL_57;
LABEL_33:
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
LABEL_34:
    *(_DWORD *)(v6 + 208) = self->_channelSwitchDuringHostWake;
    *(_DWORD *)(v6 + 436) |= 0x40u;
  }
LABEL_35:

  *(_QWORD *)(v6 + 312) = -[NSString copyWithZone:](self->_privateMacType, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  int v6;
  $B0D1D818CB9EA72D974DA75CDADC79AD has;
  int v8;
  NSData *oui;
  int v10;
  NSData *htSupportedMcsSet;
  int v12;
  NSData *vhtSupportedMcsSet;
  $B0D1D818CB9EA72D974DA75CDADC79AD v14;
  int v15;
  NSString *locale;
  int v17;
  NSString *wpsResponseType;
  NSString *wpsManufacturerElement;
  NSString *wpsModelName;
  NSString *wpsModelNumber;
  NSString *countryCode;
  NSString *wpsPrimaryDeviceTypeCategory;
  NSString *wpsPrimaryDeviceTypeSubCategory;
  NSString *wpsDeviceNameElement;
  NSString *wpsDeviceNameData;
  NSString *wpsConfigMethods;
  NSString *localeSource;
  $B0D1D818CB9EA72D974DA75CDADC79AD v29;
  int v30;
  NSString *privateMacType;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!IsEqual)
    return IsEqual;
  v6 = *((_DWORD *)a3 + 109);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 23))
      goto LABEL_185;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_185;
  }
  IsEqual = PBRepeatedInt32IsEqual();
  if (!IsEqual)
    return IsEqual;
  has = self->_has;
  v8 = *((_DWORD *)a3 + 109);
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0)
      goto LABEL_185;
    if (self->_isLinkUp)
    {
      if (!*((_BYTE *)a3 + 433))
        goto LABEL_185;
    }
    else if (*((_BYTE *)a3 + 433))
    {
      goto LABEL_185;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    if ((v8 & 0x2000000) != 0)
      goto LABEL_185;
    goto LABEL_24;
  }
  if ((v8 & 0x2000000) == 0)
    goto LABEL_185;
  if (self->_isInVol)
  {
    if (!*((_BYTE *)a3 + 432))
      goto LABEL_185;
    goto LABEL_24;
  }
  if (*((_BYTE *)a3 + 432))
  {
LABEL_185:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }
LABEL_24:
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_reason != *((_DWORD *)a3 + 80))
      goto LABEL_185;
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_subreason != *((_DWORD *)a3 + 83))
      goto LABEL_185;
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_channel != *((_DWORD *)a3 + 50))
      goto LABEL_185;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_channelWidth != *((_DWORD *)a3 + 53))
      goto LABEL_185;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_phyMode != *((_DWORD *)a3 + 76))
      goto LABEL_185;
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_flags != *((_DWORD *)a3 + 57))
      goto LABEL_185;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_185;
  }
  oui = self->_oui;
  if ((unint64_t)oui | *((_QWORD *)a3 + 37))
  {
    IsEqual = -[NSData isEqual:](oui, "isEqual:");
    if (!IsEqual)
      return IsEqual;
    has = self->_has;
  }
  v10 = *((_DWORD *)a3 + 109);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_securityType != *((_DWORD *)a3 + 82))
      goto LABEL_185;
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_wpaProtocol != *((_DWORD *)a3 + 88))
      goto LABEL_185;
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_mcastCipher != *((_DWORD *)a3 + 72))
      goto LABEL_185;
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_ucastCipher != *((_DWORD *)a3 + 84))
      goto LABEL_185;
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_akmSuites != *((_DWORD *)a3 + 48))
      goto LABEL_185;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_capabilities != *((_DWORD *)a3 + 49))
      goto LABEL_185;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_enhancedSecurityType != *((_DWORD *)a3 + 56))
      goto LABEL_185;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_htInfo != *((_DWORD *)a3 + 62))
      goto LABEL_185;
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_htExtended != *((_DWORD *)a3 + 61))
      goto LABEL_185;
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_htTxBf != *((_DWORD *)a3 + 66))
      goto LABEL_185;
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_htASel != *((_DWORD *)a3 + 59))
      goto LABEL_185;
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_htAmpduParams != *((_DWORD *)a3 + 60))
      goto LABEL_185;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_185;
  }
  htSupportedMcsSet = self->_htSupportedMcsSet;
  if ((unint64_t)htSupportedMcsSet | *((_QWORD *)a3 + 32))
  {
    IsEqual = -[NSData isEqual:](htSupportedMcsSet, "isEqual:");
    if (!IsEqual)
      return IsEqual;
    has = self->_has;
  }
  v12 = *((_DWORD *)a3 + 109);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0 || self->_vhtInfo != *((_DWORD *)a3 + 85))
      goto LABEL_185;
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_185;
  }
  vhtSupportedMcsSet = self->_vhtSupportedMcsSet;
  if (!((unint64_t)vhtSupportedMcsSet | *((_QWORD *)a3 + 43))
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
                v14 = self->_has;
                v15 = *((_DWORD *)a3 + 109);
                if ((*(_WORD *)&v14 & 0x400) != 0)
                {
                  if ((v15 & 0x400) == 0 || self->_gatewayARPHistory != *((_DWORD *)a3 + 58))
                    goto LABEL_185;
                }
                else if ((v15 & 0x400) != 0)
                {
                  goto LABEL_185;
                }
                locale = self->_locale;
                if ((unint64_t)locale | *((_QWORD *)a3 + 34))
                {
                  IsEqual = -[NSString isEqual:](locale, "isEqual:");
                  if (!IsEqual)
                    return IsEqual;
                  v14 = self->_has;
                }
                v17 = *((_DWORD *)a3 + 109);
                if ((*(_BYTE *)&v14 & 1) != 0)
                {
                  if ((v17 & 1) == 0 || self->_associationDuration != *((double *)a3 + 22))
                    goto LABEL_185;
                }
                else if ((v17 & 1) != 0)
                {
                  goto LABEL_185;
                }
                wpsResponseType = self->_wpsResponseType;
                if (!((unint64_t)wpsResponseType | *((_QWORD *)a3 + 53))
                  || (IsEqual = -[NSString isEqual:](wpsResponseType, "isEqual:")) != 0)
                {
                  wpsManufacturerElement = self->_wpsManufacturerElement;
                  if (!((unint64_t)wpsManufacturerElement | *((_QWORD *)a3 + 48))
                    || (IsEqual = -[NSString isEqual:](wpsManufacturerElement, "isEqual:")) != 0)
                  {
                    wpsModelName = self->_wpsModelName;
                    if (!((unint64_t)wpsModelName | *((_QWORD *)a3 + 49))
                      || (IsEqual = -[NSString isEqual:](wpsModelName, "isEqual:")) != 0)
                    {
                      wpsModelNumber = self->_wpsModelNumber;
                      if (!((unint64_t)wpsModelNumber | *((_QWORD *)a3 + 50))
                        || (IsEqual = -[NSString isEqual:](wpsModelNumber, "isEqual:")) != 0)
                      {
                        countryCode = self->_countryCode;
                        if (!((unint64_t)countryCode | *((_QWORD *)a3 + 27))
                          || (IsEqual = -[NSString isEqual:](countryCode, "isEqual:")) != 0)
                        {
                          wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
                          if (!((unint64_t)wpsPrimaryDeviceTypeCategory | *((_QWORD *)a3 + 51))
                            || (IsEqual = -[NSString isEqual:](wpsPrimaryDeviceTypeCategory, "isEqual:")) != 0)
                          {
                            wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
                            if (!((unint64_t)wpsPrimaryDeviceTypeSubCategory | *((_QWORD *)a3 + 52))
                              || (IsEqual = -[NSString isEqual:](wpsPrimaryDeviceTypeSubCategory, "isEqual:")) != 0)
                            {
                              wpsDeviceNameElement = self->_wpsDeviceNameElement;
                              if (!((unint64_t)wpsDeviceNameElement | *((_QWORD *)a3 + 47))
                                || (IsEqual = -[NSString isEqual:](wpsDeviceNameElement, "isEqual:")) != 0)
                              {
                                wpsDeviceNameData = self->_wpsDeviceNameData;
                                if (!((unint64_t)wpsDeviceNameData | *((_QWORD *)a3 + 46))
                                  || (IsEqual = -[NSString isEqual:](wpsDeviceNameData, "isEqual:")) != 0)
                                {
                                  wpsConfigMethods = self->_wpsConfigMethods;
                                  if (!((unint64_t)wpsConfigMethods | *((_QWORD *)a3 + 45))
                                    || (IsEqual = -[NSString isEqual:](wpsConfigMethods, "isEqual:")) != 0)
                                  {
                                    localeSource = self->_localeSource;
                                    if (!((unint64_t)localeSource | *((_QWORD *)a3 + 35))
                                      || (IsEqual = -[NSString isEqual:](localeSource, "isEqual:")) != 0)
                                    {
                                      v29 = self->_has;
                                      v30 = *((_DWORD *)a3 + 109);
                                      if ((*(_DWORD *)&v29 & 0x80000) != 0)
                                      {
                                        if ((v30 & 0x80000) == 0 || self->_rxCSAFrames != *((_DWORD *)a3 + 81))
                                          goto LABEL_185;
                                      }
                                      else if ((v30 & 0x80000) != 0)
                                      {
                                        goto LABEL_185;
                                      }
                                      if ((*(_BYTE *)&v29 & 0x20) != 0)
                                      {
                                        if ((v30 & 0x20) == 0
                                          || self->_channelSwitchDuringHostSleep != *((_DWORD *)a3 + 51))
                                        {
                                          goto LABEL_185;
                                        }
                                      }
                                      else if ((v30 & 0x20) != 0)
                                      {
                                        goto LABEL_185;
                                      }
                                      if ((*(_BYTE *)&v29 & 0x40) != 0)
                                      {
                                        if ((v30 & 0x40) == 0
                                          || self->_channelSwitchDuringHostWake != *((_DWORD *)a3 + 52))
                                        {
                                          goto LABEL_185;
                                        }
                                      }
                                      else if ((v30 & 0x40) != 0)
                                      {
                                        goto LABEL_185;
                                      }
                                      privateMacType = self->_privateMacType;
                                      if ((unint64_t)privateMacType | *((_QWORD *)a3 + 39))
                                        LOBYTE(IsEqual) = -[NSString isEqual:](privateMacType, "isEqual:");
                                      else
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
  $B0D1D818CB9EA72D974DA75CDADC79AD has;
  $B0D1D818CB9EA72D974DA75CDADC79AD v4;
  double associationDuration;
  double v6;
  long double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  $B0D1D818CB9EA72D974DA75CDADC79AD v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  unint64_t v29;
  NSUInteger v30;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v63 = 2654435761u * self->_timestamp;
  else
    v63 = 0;
  v62 = PBRepeatedInt32Hash();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    v61 = 2654435761 * self->_isLinkUp;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
LABEL_6:
      v60 = 2654435761 * self->_isInVol;
      if ((*(_DWORD *)&has & 0x40000) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v61 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_6;
  }
  v60 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_7:
    v59 = 2654435761 * self->_reason;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v59 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_8:
    v58 = 2654435761 * self->_subreason;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v58 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_9:
    v57 = 2654435761 * self->_channel;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v57 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_10:
    v56 = 2654435761 * self->_channelWidth;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_11;
LABEL_19:
    v55 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_18:
  v56 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_19;
LABEL_11:
  v55 = 2654435761 * self->_phyMode;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_12:
    v54 = 2654435761 * self->_flags;
    goto LABEL_21;
  }
LABEL_20:
  v54 = 0;
LABEL_21:
  v53 = -[NSData hash](self->_oui, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
    v52 = 2654435761 * self->_securityType;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0)
    {
LABEL_23:
      v51 = 2654435761 * self->_wpaProtocol;
      if ((*(_DWORD *)&v4 & 0x10000) != 0)
        goto LABEL_24;
      goto LABEL_36;
    }
  }
  else
  {
    v52 = 0;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0)
      goto LABEL_23;
  }
  v51 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_24:
    v50 = 2654435761 * self->_mcastCipher;
    if ((*(_DWORD *)&v4 & 0x400000) != 0)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  v50 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_25:
    v49 = 2654435761 * self->_ucastCipher;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  v49 = 0;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_26:
    v48 = 2654435761 * self->_akmSuites;
    if ((*(_BYTE *)&v4 & 8) != 0)
      goto LABEL_27;
    goto LABEL_39;
  }
LABEL_38:
  v48 = 0;
  if ((*(_BYTE *)&v4 & 8) != 0)
  {
LABEL_27:
    v47 = 2654435761 * self->_capabilities;
    if ((*(_WORD *)&v4 & 0x100) != 0)
      goto LABEL_28;
    goto LABEL_40;
  }
LABEL_39:
  v47 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_28:
    v46 = 2654435761 * self->_enhancedSecurityType;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_29;
    goto LABEL_41;
  }
LABEL_40:
  v46 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_29:
    v45 = 2654435761 * self->_htInfo;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_30;
    goto LABEL_42;
  }
LABEL_41:
  v45 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_30:
    v44 = 2654435761 * self->_htExtended;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
      goto LABEL_31;
    goto LABEL_43;
  }
LABEL_42:
  v44 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_31:
    v43 = 2654435761 * self->_htTxBf;
    if ((*(_WORD *)&v4 & 0x800) != 0)
      goto LABEL_32;
LABEL_44:
    v42 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_33;
    goto LABEL_45;
  }
LABEL_43:
  v43 = 0;
  if ((*(_WORD *)&v4 & 0x800) == 0)
    goto LABEL_44;
LABEL_32:
  v42 = 2654435761 * self->_htASel;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_33:
    v41 = 2654435761 * self->_htAmpduParams;
    goto LABEL_46;
  }
LABEL_45:
  v41 = 0;
LABEL_46:
  v40 = -[NSData hash](self->_htSupportedMcsSet, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    v39 = 2654435761 * self->_vhtInfo;
  else
    v39 = 0;
  v38 = -[NSData hash](self->_vhtSupportedMcsSet, "hash");
  v37 = PBRepeatedInt32Hash();
  v36 = PBRepeatedInt32Hash();
  v35 = PBRepeatedInt32Hash();
  v34 = PBRepeatedInt32Hash();
  v33 = PBRepeatedInt32Hash();
  v32 = PBRepeatedInt32Hash();
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    v31 = 2654435761 * self->_gatewayARPHistory;
  else
    v31 = 0;
  v30 = -[NSString hash](self->_locale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    associationDuration = self->_associationDuration;
    v6 = -associationDuration;
    if (associationDuration >= 0.0)
      v6 = self->_associationDuration;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v9 = fmod(v7, 1.84467441e19);
    v10 = 2654435761u * (unint64_t)v9;
    v11 = v10 + (unint64_t)v8;
    if (v8 <= 0.0)
      v11 = 2654435761u * (unint64_t)v9;
    v12 = v10 - (unint64_t)fabs(v8);
    if (v8 >= 0.0)
      v12 = v11;
    v29 = v12;
  }
  else
  {
    v29 = 0;
  }
  v28 = -[NSString hash](self->_wpsResponseType, "hash");
  v27 = -[NSString hash](self->_wpsManufacturerElement, "hash");
  v26 = -[NSString hash](self->_wpsModelName, "hash");
  v13 = -[NSString hash](self->_wpsModelNumber, "hash");
  v14 = -[NSString hash](self->_countryCode, "hash");
  v15 = -[NSString hash](self->_wpsPrimaryDeviceTypeCategory, "hash");
  v16 = -[NSString hash](self->_wpsPrimaryDeviceTypeSubCategory, "hash");
  v17 = -[NSString hash](self->_wpsDeviceNameElement, "hash");
  v18 = -[NSString hash](self->_wpsDeviceNameData, "hash");
  v19 = -[NSString hash](self->_wpsConfigMethods, "hash");
  v20 = -[NSString hash](self->_localeSource, "hash");
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
    v22 = 0;
    if ((*(_BYTE *)&v21 & 0x20) != 0)
      goto LABEL_63;
LABEL_66:
    v23 = 0;
    if ((*(_BYTE *)&v21 & 0x40) != 0)
      goto LABEL_64;
LABEL_67:
    v24 = 0;
    return v62 ^ v63 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v52 ^ v51 ^ v53 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ -[NSString hash](self->_privateMacType, "hash");
  }
  v22 = 2654435761 * self->_rxCSAFrames;
  if ((*(_BYTE *)&v21 & 0x20) == 0)
    goto LABEL_66;
LABEL_63:
  v23 = 2654435761 * self->_channelSwitchDuringHostSleep;
  if ((*(_BYTE *)&v21 & 0x40) == 0)
    goto LABEL_67;
LABEL_64:
  v24 = 2654435761 * self->_channelSwitchDuringHostWake;
  return v62 ^ v63 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v52 ^ v51 ^ v53 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ -[NSString hash](self->_privateMacType, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  int v9;
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
  int v28;

  if ((*((_BYTE *)a3 + 436) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 23);
    *(_DWORD *)&self->_has |= 2u;
  }
  v5 = objc_msgSend(a3, "rssiHistorysCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDWiFiMetricLinkChangeData addRssiHistory:](self, "addRssiHistory:", objc_msgSend(a3, "rssiHistoryAtIndex:", i));
  }
  v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x4000000) != 0)
  {
    self->_isLinkUp = *((_BYTE *)a3 + 433);
    *(_DWORD *)&self->_has |= 0x4000000u;
    v8 = *((_DWORD *)a3 + 109);
    if ((v8 & 0x2000000) == 0)
    {
LABEL_8:
      if ((v8 & 0x40000) == 0)
        goto LABEL_9;
      goto LABEL_90;
    }
  }
  else if ((v8 & 0x2000000) == 0)
  {
    goto LABEL_8;
  }
  self->_isInVol = *((_BYTE *)a3 + 432);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x40000) == 0)
  {
LABEL_9:
    if ((v8 & 0x200000) == 0)
      goto LABEL_10;
    goto LABEL_91;
  }
LABEL_90:
  self->_reason = *((_DWORD *)a3 + 80);
  *(_DWORD *)&self->_has |= 0x40000u;
  v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x200000) == 0)
  {
LABEL_10:
    if ((v8 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_92;
  }
LABEL_91:
  self->_subreason = *((_DWORD *)a3 + 83);
  *(_DWORD *)&self->_has |= 0x200000u;
  v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x10) == 0)
  {
LABEL_11:
    if ((v8 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_93;
  }
LABEL_92:
  self->_channel = *((_DWORD *)a3 + 50);
  *(_DWORD *)&self->_has |= 0x10u;
  v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x80) == 0)
  {
LABEL_12:
    if ((v8 & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_94;
  }
LABEL_93:
  self->_channelWidth = *((_DWORD *)a3 + 53);
  *(_DWORD *)&self->_has |= 0x80u;
  v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x20000) == 0)
  {
LABEL_13:
    if ((v8 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_94:
  self->_phyMode = *((_DWORD *)a3 + 76);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)a3 + 109) & 0x200) != 0)
  {
LABEL_14:
    self->_flags = *((_DWORD *)a3 + 57);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_15:
  if (*((_QWORD *)a3 + 37))
    -[AWDWiFiMetricLinkChangeData setOui:](self, "setOui:");
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x100000) != 0)
  {
    self->_securityType = *((_DWORD *)a3 + 82);
    *(_DWORD *)&self->_has |= 0x100000u;
    v9 = *((_DWORD *)a3 + 109);
    if ((v9 & 0x1000000) == 0)
    {
LABEL_19:
      if ((v9 & 0x10000) == 0)
        goto LABEL_20;
      goto LABEL_98;
    }
  }
  else if ((v9 & 0x1000000) == 0)
  {
    goto LABEL_19;
  }
  self->_wpaProtocol = *((_DWORD *)a3 + 88);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x10000) == 0)
  {
LABEL_20:
    if ((v9 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_99;
  }
LABEL_98:
  self->_mcastCipher = *((_DWORD *)a3 + 72);
  *(_DWORD *)&self->_has |= 0x10000u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x400000) == 0)
  {
LABEL_21:
    if ((v9 & 4) == 0)
      goto LABEL_22;
    goto LABEL_100;
  }
LABEL_99:
  self->_ucastCipher = *((_DWORD *)a3 + 84);
  *(_DWORD *)&self->_has |= 0x400000u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 4) == 0)
  {
LABEL_22:
    if ((v9 & 8) == 0)
      goto LABEL_23;
    goto LABEL_101;
  }
LABEL_100:
  self->_akmSuites = *((_DWORD *)a3 + 48);
  *(_DWORD *)&self->_has |= 4u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 8) == 0)
  {
LABEL_23:
    if ((v9 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_102;
  }
LABEL_101:
  self->_capabilities = *((_DWORD *)a3 + 49);
  *(_DWORD *)&self->_has |= 8u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x100) == 0)
  {
LABEL_24:
    if ((v9 & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_103;
  }
LABEL_102:
  self->_enhancedSecurityType = *((_DWORD *)a3 + 56);
  *(_DWORD *)&self->_has |= 0x100u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x4000) == 0)
  {
LABEL_25:
    if ((v9 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_104;
  }
LABEL_103:
  self->_htInfo = *((_DWORD *)a3 + 62);
  *(_DWORD *)&self->_has |= 0x4000u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x2000) == 0)
  {
LABEL_26:
    if ((v9 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_105;
  }
LABEL_104:
  self->_htExtended = *((_DWORD *)a3 + 61);
  *(_DWORD *)&self->_has |= 0x2000u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x8000) == 0)
  {
LABEL_27:
    if ((v9 & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_106;
  }
LABEL_105:
  self->_htTxBf = *((_DWORD *)a3 + 66);
  *(_DWORD *)&self->_has |= 0x8000u;
  v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x800) == 0)
  {
LABEL_28:
    if ((v9 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_106:
  self->_htASel = *((_DWORD *)a3 + 59);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)a3 + 109) & 0x1000) != 0)
  {
LABEL_29:
    self->_htAmpduParams = *((_DWORD *)a3 + 60);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_30:
  if (*((_QWORD *)a3 + 32))
    -[AWDWiFiMetricLinkChangeData setHtSupportedMcsSet:](self, "setHtSupportedMcsSet:");
  if ((*((_BYTE *)a3 + 438) & 0x80) != 0)
  {
    self->_vhtInfo = *((_DWORD *)a3 + 85);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  if (*((_QWORD *)a3 + 43))
    -[AWDWiFiMetricLinkChangeData setVhtSupportedMcsSet:](self, "setVhtSupportedMcsSet:");
  v10 = objc_msgSend(a3, "txPerHistorysCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[AWDWiFiMetricLinkChangeData addTxPerHistory:](self, "addTxPerHistory:", objc_msgSend(a3, "txPerHistoryAtIndex:", j));
  }
  v13 = objc_msgSend(a3, "txFrmsHistorysCount");
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[AWDWiFiMetricLinkChangeData addTxFrmsHistory:](self, "addTxFrmsHistory:", objc_msgSend(a3, "txFrmsHistoryAtIndex:", k));
  }
  v16 = objc_msgSend(a3, "fwTxPerHistorysCount");
  if (v16)
  {
    v17 = v16;
    for (m = 0; m != v17; ++m)
      -[AWDWiFiMetricLinkChangeData addFwTxPerHistory:](self, "addFwTxPerHistory:", objc_msgSend(a3, "fwTxPerHistoryAtIndex:", m));
  }
  v19 = objc_msgSend(a3, "fwTxFrmsHistorysCount");
  if (v19)
  {
    v20 = v19;
    for (n = 0; n != v20; ++n)
      -[AWDWiFiMetricLinkChangeData addFwTxFrmsHistory:](self, "addFwTxFrmsHistory:", objc_msgSend(a3, "fwTxFrmsHistoryAtIndex:", n));
  }
  v22 = objc_msgSend(a3, "bcnPerHistorysCount");
  if (v22)
  {
    v23 = v22;
    for (ii = 0; ii != v23; ++ii)
      -[AWDWiFiMetricLinkChangeData addBcnPerHistory:](self, "addBcnPerHistory:", objc_msgSend(a3, "bcnPerHistoryAtIndex:", ii));
  }
  v25 = objc_msgSend(a3, "bcnFrmsHistorysCount");
  if (v25)
  {
    v26 = v25;
    for (jj = 0; jj != v26; ++jj)
      -[AWDWiFiMetricLinkChangeData addBcnFrmsHistory:](self, "addBcnFrmsHistory:", objc_msgSend(a3, "bcnFrmsHistoryAtIndex:", jj));
  }
  if ((*((_BYTE *)a3 + 437) & 4) != 0)
  {
    self->_gatewayARPHistory = *((_DWORD *)a3 + 58);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)a3 + 34))
    -[AWDWiFiMetricLinkChangeData setLocale:](self, "setLocale:");
  if ((*((_BYTE *)a3 + 436) & 1) != 0)
  {
    self->_associationDuration = *((double *)a3 + 22);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 53))
    -[AWDWiFiMetricLinkChangeData setWpsResponseType:](self, "setWpsResponseType:");
  if (*((_QWORD *)a3 + 48))
    -[AWDWiFiMetricLinkChangeData setWpsManufacturerElement:](self, "setWpsManufacturerElement:");
  if (*((_QWORD *)a3 + 49))
    -[AWDWiFiMetricLinkChangeData setWpsModelName:](self, "setWpsModelName:");
  if (*((_QWORD *)a3 + 50))
    -[AWDWiFiMetricLinkChangeData setWpsModelNumber:](self, "setWpsModelNumber:");
  if (*((_QWORD *)a3 + 27))
    -[AWDWiFiMetricLinkChangeData setCountryCode:](self, "setCountryCode:");
  if (*((_QWORD *)a3 + 51))
    -[AWDWiFiMetricLinkChangeData setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:");
  if (*((_QWORD *)a3 + 52))
    -[AWDWiFiMetricLinkChangeData setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:");
  if (*((_QWORD *)a3 + 47))
    -[AWDWiFiMetricLinkChangeData setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:");
  if (*((_QWORD *)a3 + 46))
    -[AWDWiFiMetricLinkChangeData setWpsDeviceNameData:](self, "setWpsDeviceNameData:");
  if (*((_QWORD *)a3 + 45))
    -[AWDWiFiMetricLinkChangeData setWpsConfigMethods:](self, "setWpsConfigMethods:");
  if (*((_QWORD *)a3 + 35))
    -[AWDWiFiMetricLinkChangeData setLocaleSource:](self, "setLocaleSource:");
  v28 = *((_DWORD *)a3 + 109);
  if ((v28 & 0x80000) != 0)
  {
    self->_rxCSAFrames = *((_DWORD *)a3 + 81);
    *(_DWORD *)&self->_has |= 0x80000u;
    v28 = *((_DWORD *)a3 + 109);
    if ((v28 & 0x20) == 0)
    {
LABEL_84:
      if ((v28 & 0x40) == 0)
        goto LABEL_86;
      goto LABEL_85;
    }
  }
  else if ((v28 & 0x20) == 0)
  {
    goto LABEL_84;
  }
  self->_channelSwitchDuringHostSleep = *((_DWORD *)a3 + 51);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)a3 + 109) & 0x40) != 0)
  {
LABEL_85:
    self->_channelSwitchDuringHostWake = *((_DWORD *)a3 + 52);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_86:
  if (*((_QWORD *)a3 + 39))
    -[AWDWiFiMetricLinkChangeData setPrivateMacType:](self, "setPrivateMacType:");
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
  objc_setProperty_nonatomic(self, a2, a3, 296);
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
  objc_setProperty_nonatomic(self, a2, a3, 256);
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
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (unsigned)gatewayARPHistory
{
  return self->_gatewayARPHistory;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (double)associationDuration
{
  return self->_associationDuration;
}

- (NSString)wpsResponseType
{
  return self->_wpsResponseType;
}

- (void)setWpsResponseType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (NSString)wpsManufacturerElement
{
  return self->_wpsManufacturerElement;
}

- (void)setWpsManufacturerElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (NSString)wpsModelName
{
  return self->_wpsModelName;
}

- (void)setWpsModelName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (NSString)wpsModelNumber
{
  return self->_wpsModelNumber;
}

- (void)setWpsModelNumber:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (NSString)wpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory;
}

- (void)setWpsPrimaryDeviceTypeCategory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (NSString)wpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory;
}

- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (NSString)wpsDeviceNameElement
{
  return self->_wpsDeviceNameElement;
}

- (void)setWpsDeviceNameElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (NSString)wpsDeviceNameData
{
  return self->_wpsDeviceNameData;
}

- (void)setWpsDeviceNameData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (NSString)wpsConfigMethods
{
  return self->_wpsConfigMethods;
}

- (void)setWpsConfigMethods:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (NSString)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (unsigned)rxCSAFrames
{
  return self->_rxCSAFrames;
}

- (unsigned)channelSwitchDuringHostSleep
{
  return self->_channelSwitchDuringHostSleep;
}

- (unsigned)channelSwitchDuringHostWake
{
  return self->_channelSwitchDuringHostWake;
}

- (NSString)privateMacType
{
  return self->_privateMacType;
}

- (void)setPrivateMacType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

@end
