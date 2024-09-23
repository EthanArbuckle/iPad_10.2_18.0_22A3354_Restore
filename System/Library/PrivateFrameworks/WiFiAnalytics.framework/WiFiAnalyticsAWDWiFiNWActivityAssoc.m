@implementation WiFiAnalyticsAWDWiFiNWActivityAssoc

- (void)setAuthSuccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_authSuccess = a3;
}

- (void)setHasAuthSuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAuthSuccess
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setAuthFailed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_authFailed = a3;
}

- (void)setHasAuthFailed:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasAuthFailed
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAssocSuccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_assocSuccess = a3;
}

- (void)setHasAssocSuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAssocSuccess
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAssocFailed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_assocFailed = a3;
}

- (void)setHasAssocFailed:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAssocFailed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setReassocSuccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_reassocSuccess = a3;
}

- (void)setHasReassocSuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasReassocSuccess
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setReassocFailed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_reassocFailed = a3;
}

- (void)setHasReassocFailed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasReassocFailed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLinkChanged:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_linkChanged = a3;
}

- (void)setHasLinkChanged:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasLinkChanged
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRoamSuccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_roamSuccess = a3;
}

- (void)setHasRoamSuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasRoamSuccess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setRoamFailed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_roamFailed = a3;
}

- (void)setHasRoamFailed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasRoamFailed
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setAssocDoneSuccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_assocDoneSuccess = a3;
}

- (void)setHasAssocDoneSuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAssocDoneSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAssocDoneFailed:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_assocDoneFailed = a3;
}

- (void)setHasAssocDoneFailed:(BOOL)a3
{
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAssocDoneFailed
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAssocReady:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_assocReady = a3;
}

- (void)setHasAssocReady:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAssocReady
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSsidChanged:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_ssidChanged = a3;
}

- (void)setHasSsidChanged:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSsidChanged
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setBssidChanged:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_bssidChanged = a3;
}

- (void)setHasBssidChanged:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasBssidChanged
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDeauthReceived:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_deauthReceived = a3;
}

- (void)setHasDeauthReceived:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasDeauthReceived
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDisassocReceived:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_disassocReceived = a3;
}

- (void)setHasDisassocReceived:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDisassocReceived
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDecryptError:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_decryptError = a3;
}

- (void)setHasDecryptError:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDecryptError
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setPruned:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_pruned = a3;
}

- (void)setHasPruned:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasPruned
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSupplicant:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_supplicant = a3;
}

- (void)setHasSupplicant:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasSupplicant
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setMacAddrChanged:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_macAddrChanged = a3;
}

- (void)setHasMacAddrChanged:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMacAddrChanged
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRssiChanged:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_rssiChanged = a3;
}

- (void)setHasRssiChanged:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasRssiChanged
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHomeChanQualChanged:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_homeChanQualChanged = a3;
}

- (void)setHasHomeChanQualChanged:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasHomeChanQualChanged
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setChanSwitchEvent:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_chanSwitchEvent = a3;
}

- (void)setHasChanSwitchEvent:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasChanSwitchEvent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRoamPrep:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_roamPrep = a3;
}

- (void)setHasRoamPrep:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasRoamPrep
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setRoamScanStart:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_roamScanStart = a3;
}

- (void)setHasRoamScanStart:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRoamScanStart
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setRoamScanEnd:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_roamScanEnd = a3;
}

- (void)setHasRoamScanEnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasRoamScanEnd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setScanResults:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_scanResults = a3;
}

- (void)setHasScanResults:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasScanResults
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setScanSummary:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_scanSummary = a3;
}

- (void)setHasScanSummary:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasScanSummary
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setScanDone:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_scanDone = a3;
}

- (void)setHasScanDone:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasScanDone
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setScanInternalDone:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_scanInternalDone = a3;
}

- (void)setHasScanInternalDone:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasScanInternalDone
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setBssDisallowEvent:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_bssDisallowEvent = a3;
}

- (void)setHasBssDisallowEvent:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasBssDisallowEvent
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSlowWiFiSymptom:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_slowWiFiSymptom = a3;
}

- (void)setHasSlowWiFiSymptom:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSlowWiFiSymptom
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setDpsSymptom:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_dpsSymptom = a3;
}

- (void)setHasDpsSymptom:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDpsSymptom
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCrashTracerTrig:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_crashTracerTrig = a3;
}

- (void)setHasCrashTracerTrig:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCrashTracerTrig
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRc1Stats:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_rc1Stats = a3;
}

- (void)setHasRc1Stats:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasRc1Stats
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRc2Stats:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_rc2Stats = a3;
}

- (void)setHasRc2Stats:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasRc2Stats
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setEscoTrafficInd:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_escoTrafficInd = a3;
}

- (void)setHasEscoTrafficInd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasEscoTrafficInd
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityAssoc;
  -[WiFiAnalyticsAWDWiFiNWActivityAssoc description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWiFiNWActivityAssoc dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $AFB9C266CFE0CD92D8803EB1297E3989 has;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_authSuccess);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("authSuccess"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_authFailed);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("authFailed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_assocSuccess);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("assocSuccess"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_assocFailed);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("assocFailed"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reassocSuccess);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("reassocSuccess"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reassocFailed);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("reassocFailed"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_linkChanged);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("linkChanged"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamSuccess);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("roamSuccess"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamFailed);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("roamFailed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_assocDoneSuccess);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("assocDoneSuccess"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_assocDoneFailed);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("assocDoneFailed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_assocReady);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("assocReady"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ssidChanged);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ssidChanged"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bssidChanged);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("bssidChanged"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_deauthReceived);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("deauthReceived"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_disassocReceived);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("disassocReceived"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_decryptError);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("decryptError"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pruned);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("pruned"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_supplicant);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("supplicant"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_macAddrChanged);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("macAddrChanged"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rssiChanged);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("rssiChanged"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_homeChanQualChanged);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("homeChanQualChanged"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chanSwitchEvent);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("chanSwitchEvent"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamPrep);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("roamPrep"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamScanStart);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("roamScanStart"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamScanEnd);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("roamScanEnd"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scanResults);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("scanResults"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scanSummary);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("scanSummary"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scanDone);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("scanDone"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_scanInternalDone);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("scanInternalDone"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bssDisallowEvent);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("bssDisallowEvent"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_slowWiFiSymptom);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("slowWiFiSymptom"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dpsSymptom);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("dpsSymptom"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_crashTracerTrig);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("crashTracerTrig"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_37;
LABEL_75:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc2Stats);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("rc2Stats"));

    if ((*(_QWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rc1Stats);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("rc1Stats"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_75;
LABEL_37:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_escoTrafficInd);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("escoTrafficInd"));

  }
LABEL_39:
  v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityAssocReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $AFB9C266CFE0CD92D8803EB1297E3989 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_37;
LABEL_75:
    PBDataWriterWriteUint32Field();
    if ((*(_QWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_75;
LABEL_37:
  if ((*(_WORD *)&has & 0x8000) != 0)
LABEL_38:
    PBDataWriterWriteUint32Field();
LABEL_39:

}

- (void)copyTo:(id)a3
{
  char *v4;
  $AFB9C266CFE0CD92D8803EB1297E3989 has;

  v4 = (char *)a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_authSuccess;
    *(_QWORD *)(v4 + 156) |= 0x40uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_authFailed;
  *(_QWORD *)(v4 + 156) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 6) = self->_assocSuccess;
  *(_QWORD *)(v4 + 156) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 4) = self->_assocFailed;
  *(_QWORD *)(v4 + 156) |= 4uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 25) = self->_reassocSuccess;
  *(_QWORD *)(v4 + 156) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 24) = self->_reassocFailed;
  *(_QWORD *)(v4 + 156) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 19) = self->_linkChanged;
  *(_QWORD *)(v4 + 156) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 30) = self->_roamSuccess;
  *(_QWORD *)(v4 + 156) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 26) = self->_roamFailed;
  *(_QWORD *)(v4 + 156) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 3) = self->_assocDoneSuccess;
  *(_QWORD *)(v4 + 156) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 2) = self->_assocDoneFailed;
  *(_QWORD *)(v4 + 156) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 5) = self->_assocReady;
  *(_QWORD *)(v4 + 156) |= 8uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 37) = self->_ssidChanged;
  *(_QWORD *)(v4 + 156) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 10) = self->_bssidChanged;
  *(_QWORD *)(v4 + 156) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 13) = self->_deauthReceived;
  *(_QWORD *)(v4 + 156) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 15) = self->_disassocReceived;
  *(_QWORD *)(v4 + 156) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 14) = self->_decryptError;
  *(_QWORD *)(v4 + 156) |= 0x1000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 21) = self->_pruned;
  *(_QWORD *)(v4 + 156) |= 0x80000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 38) = self->_supplicant;
  *(_QWORD *)(v4 + 156) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 20) = self->_macAddrChanged;
  *(_QWORD *)(v4 + 156) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 31) = self->_rssiChanged;
  *(_QWORD *)(v4 + 156) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 18) = self->_homeChanQualChanged;
  *(_QWORD *)(v4 + 156) |= 0x10000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 11) = self->_chanSwitchEvent;
  *(_QWORD *)(v4 + 156) |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 27) = self->_roamPrep;
  *(_QWORD *)(v4 + 156) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 29) = self->_roamScanStart;
  *(_QWORD *)(v4 + 156) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 28) = self->_roamScanEnd;
  *(_QWORD *)(v4 + 156) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 34) = self->_scanResults;
  *(_QWORD *)(v4 + 156) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 35) = self->_scanSummary;
  *(_QWORD *)(v4 + 156) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 32) = self->_scanDone;
  *(_QWORD *)(v4 + 156) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 33) = self->_scanInternalDone;
  *(_QWORD *)(v4 + 156) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v4 + 9) = self->_bssDisallowEvent;
  *(_QWORD *)(v4 + 156) |= 0x80uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v4 + 36) = self->_slowWiFiSymptom;
  *(_QWORD *)(v4 + 156) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v4 + 16) = self->_dpsSymptom;
  *(_QWORD *)(v4 + 156) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)v4 + 12) = self->_crashTracerTrig;
  *(_QWORD *)(v4 + 156) |= 0x400uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_37;
LABEL_75:
    *((_DWORD *)v4 + 23) = self->_rc2Stats;
    *(_QWORD *)(v4 + 156) |= 0x200000uLL;
    if ((*(_QWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_74:
  *((_DWORD *)v4 + 22) = self->_rc1Stats;
  *(_QWORD *)(v4 + 156) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_75;
LABEL_37:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_38:
    *((_DWORD *)v4 + 17) = self->_escoTrafficInd;
    *(_QWORD *)(v4 + 156) |= 0x8000uLL;
  }
LABEL_39:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  $AFB9C266CFE0CD92D8803EB1297E3989 has;
  id v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_authSuccess;
    *(_QWORD *)(v4 + 156) |= 0x40uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 28) = self->_authFailed;
  *(_QWORD *)(v4 + 156) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v4 + 24) = self->_assocSuccess;
  *(_QWORD *)(v4 + 156) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v4 + 16) = self->_assocFailed;
  *(_QWORD *)(v4 + 156) |= 4uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v4 + 100) = self->_reassocSuccess;
  *(_QWORD *)(v4 + 156) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v4 + 96) = self->_reassocFailed;
  *(_QWORD *)(v4 + 156) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v4 + 76) = self->_linkChanged;
  *(_QWORD *)(v4 + 156) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v4 + 120) = self->_roamSuccess;
  *(_QWORD *)(v4 + 156) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v4 + 104) = self->_roamFailed;
  *(_QWORD *)(v4 + 156) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v4 + 12) = self->_assocDoneSuccess;
  *(_QWORD *)(v4 + 156) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v4 + 8) = self->_assocDoneFailed;
  *(_QWORD *)(v4 + 156) |= 1uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v4 + 20) = self->_assocReady;
  *(_QWORD *)(v4 + 156) |= 8uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v4 + 148) = self->_ssidChanged;
  *(_QWORD *)(v4 + 156) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v4 + 40) = self->_bssidChanged;
  *(_QWORD *)(v4 + 156) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v4 + 52) = self->_deauthReceived;
  *(_QWORD *)(v4 + 156) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v4 + 60) = self->_disassocReceived;
  *(_QWORD *)(v4 + 156) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v4 + 56) = self->_decryptError;
  *(_QWORD *)(v4 + 156) |= 0x1000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v4 + 84) = self->_pruned;
  *(_QWORD *)(v4 + 156) |= 0x80000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v4 + 152) = self->_supplicant;
  *(_QWORD *)(v4 + 156) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v4 + 80) = self->_macAddrChanged;
  *(_QWORD *)(v4 + 156) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v4 + 124) = self->_rssiChanged;
  *(_QWORD *)(v4 + 156) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v4 + 72) = self->_homeChanQualChanged;
  *(_QWORD *)(v4 + 156) |= 0x10000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v4 + 44) = self->_chanSwitchEvent;
  *(_QWORD *)(v4 + 156) |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v4 + 108) = self->_roamPrep;
  *(_QWORD *)(v4 + 156) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v4 + 116) = self->_roamScanStart;
  *(_QWORD *)(v4 + 156) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v4 + 112) = self->_roamScanEnd;
  *(_QWORD *)(v4 + 156) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v4 + 136) = self->_scanResults;
  *(_QWORD *)(v4 + 156) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v4 + 140) = self->_scanSummary;
  *(_QWORD *)(v4 + 156) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v4 + 128) = self->_scanDone;
  *(_QWORD *)(v4 + 156) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v4 + 132) = self->_scanInternalDone;
  *(_QWORD *)(v4 + 156) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v4 + 36) = self->_bssDisallowEvent;
  *(_QWORD *)(v4 + 156) |= 0x80uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v4 + 144) = self->_slowWiFiSymptom;
  *(_QWORD *)(v4 + 156) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v4 + 64) = self->_dpsSymptom;
  *(_QWORD *)(v4 + 156) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v4 + 48) = self->_crashTracerTrig;
  *(_QWORD *)(v4 + 156) |= 0x400uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_37;
LABEL_75:
    *(_DWORD *)(v4 + 92) = self->_rc2Stats;
    *(_QWORD *)(v4 + 156) |= 0x200000uLL;
    if ((*(_QWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_74:
  *(_DWORD *)(v4 + 88) = self->_rc1Stats;
  *(_QWORD *)(v4 + 156) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_75;
LABEL_37:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_38:
    *(_DWORD *)(v4 + 68) = self->_escoTrafficInd;
    *(_QWORD *)(v4 + 156) |= 0x8000uLL;
  }
LABEL_39:
  v6 = (id)v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  $AFB9C266CFE0CD92D8803EB1297E3989 has;
  uint64_t v6;
  BOOL v7;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_187;
  has = self->_has;
  v6 = *(_QWORD *)(v4 + 156);
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_authSuccess != *((_DWORD *)v4 + 8))
      goto LABEL_187;
  }
  else if ((v6 & 0x40) != 0)
  {
LABEL_187:
    v7 = 0;
    goto LABEL_188;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_authFailed != *((_DWORD *)v4 + 7))
      goto LABEL_187;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_assocSuccess != *((_DWORD *)v4 + 6))
      goto LABEL_187;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_assocFailed != *((_DWORD *)v4 + 4))
      goto LABEL_187;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_reassocSuccess != *((_DWORD *)v4 + 25))
      goto LABEL_187;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_reassocFailed != *((_DWORD *)v4 + 24))
      goto LABEL_187;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_linkChanged != *((_DWORD *)v4 + 19))
      goto LABEL_187;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_roamSuccess != *((_DWORD *)v4 + 30))
      goto LABEL_187;
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_roamFailed != *((_DWORD *)v4 + 26))
      goto LABEL_187;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_assocDoneSuccess != *((_DWORD *)v4 + 3))
      goto LABEL_187;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_assocDoneFailed != *((_DWORD *)v4 + 2))
      goto LABEL_187;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_assocReady != *((_DWORD *)v4 + 5))
      goto LABEL_187;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_ssidChanged != *((_DWORD *)v4 + 37))
      goto LABEL_187;
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_bssidChanged != *((_DWORD *)v4 + 10))
      goto LABEL_187;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_deauthReceived != *((_DWORD *)v4 + 13))
      goto LABEL_187;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_disassocReceived != *((_DWORD *)v4 + 15))
      goto LABEL_187;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_decryptError != *((_DWORD *)v4 + 14))
      goto LABEL_187;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_pruned != *((_DWORD *)v4 + 21))
      goto LABEL_187;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0 || self->_supplicant != *((_DWORD *)v4 + 38))
      goto LABEL_187;
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_macAddrChanged != *((_DWORD *)v4 + 20))
      goto LABEL_187;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_rssiChanged != *((_DWORD *)v4 + 31))
      goto LABEL_187;
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_homeChanQualChanged != *((_DWORD *)v4 + 18))
      goto LABEL_187;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_chanSwitchEvent != *((_DWORD *)v4 + 11))
      goto LABEL_187;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_roamPrep != *((_DWORD *)v4 + 27))
      goto LABEL_187;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_roamScanStart != *((_DWORD *)v4 + 29))
      goto LABEL_187;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_roamScanEnd != *((_DWORD *)v4 + 28))
      goto LABEL_187;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_scanResults != *((_DWORD *)v4 + 34))
      goto LABEL_187;
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0 || self->_scanSummary != *((_DWORD *)v4 + 35))
      goto LABEL_187;
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_scanDone != *((_DWORD *)v4 + 32))
      goto LABEL_187;
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_scanInternalDone != *((_DWORD *)v4 + 33))
      goto LABEL_187;
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_bssDisallowEvent != *((_DWORD *)v4 + 9))
      goto LABEL_187;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_slowWiFiSymptom != *((_DWORD *)v4 + 36))
      goto LABEL_187;
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_dpsSymptom != *((_DWORD *)v4 + 16))
      goto LABEL_187;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_crashTracerTrig != *((_DWORD *)v4 + 12))
      goto LABEL_187;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_rc1Stats != *((_DWORD *)v4 + 22))
      goto LABEL_187;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_rc2Stats != *((_DWORD *)v4 + 23))
      goto LABEL_187;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_187;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_escoTrafficInd != *((_DWORD *)v4 + 17))
      goto LABEL_187;
    v7 = 1;
  }
  else
  {
    v7 = (*(_QWORD *)(v4 + 156) & 0x8000) == 0;
  }
LABEL_188:

  return v7;
}

- (unint64_t)hash
{
  $AFB9C266CFE0CD92D8803EB1297E3989 has;
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

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    v40 = 2654435761 * self->_authSuccess;
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
LABEL_3:
      v39 = 2654435761 * self->_authFailed;
      if ((*(_BYTE *)&has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else
  {
    v40 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_3;
  }
  v39 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_4:
    v38 = 2654435761 * self->_assocSuccess;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  v38 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v37 = 2654435761 * self->_assocFailed;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  v37 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_6:
    v36 = 2654435761 * self->_reassocSuccess;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_7:
    v35 = 2654435761 * self->_reassocFailed;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_8:
    v34 = 2654435761 * self->_linkChanged;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_9:
    v33 = 2654435761 * self->_roamSuccess;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_10:
    v32 = 2654435761 * self->_roamFailed;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  v32 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_11:
    v31 = 2654435761 * self->_assocDoneSuccess;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  v31 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_12:
    v30 = 2654435761 * self->_assocDoneFailed;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  v30 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_13:
    v3 = 2654435761 * self->_assocReady;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  v3 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_14:
    v4 = 2654435761 * self->_ssidChanged;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  v4 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_15:
    v5 = 2654435761 * self->_bssidChanged;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  v5 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    v6 = 2654435761 * self->_deauthReceived;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  v6 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_17:
    v7 = 2654435761 * self->_disassocReceived;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  v7 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    v8 = 2654435761 * self->_decryptError;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_19:
    v9 = 2654435761 * self->_pruned;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  v9 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_20:
    v10 = 2654435761 * self->_supplicant;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_21:
    v11 = 2654435761 * self->_macAddrChanged;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_22:
    v12 = 2654435761 * self->_rssiChanged;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_23:
    v13 = 2654435761 * self->_homeChanQualChanged;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  v13 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_24:
    v14 = 2654435761 * self->_chanSwitchEvent;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_25:
    v15 = 2654435761 * self->_roamPrep;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_26:
    v16 = 2654435761 * self->_roamScanStart;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_27:
    v17 = 2654435761 * self->_roamScanEnd;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  v17 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_28:
    v18 = 2654435761 * self->_scanResults;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  v18 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_29:
    v19 = 2654435761 * self->_scanSummary;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_30:
    v20 = 2654435761 * self->_scanDone;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_31:
    v21 = 2654435761 * self->_scanInternalDone;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_32:
    v22 = 2654435761 * self->_bssDisallowEvent;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  v22 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_33:
    v23 = 2654435761 * self->_slowWiFiSymptom;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  v23 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_34:
    v24 = 2654435761 * self->_dpsSymptom;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  v24 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_35:
    v25 = 2654435761 * self->_crashTracerTrig;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_36;
    goto LABEL_73;
  }
LABEL_72:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_36:
    v26 = 2654435761 * self->_rc1Stats;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_37;
LABEL_74:
    v27 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_38;
LABEL_75:
    v28 = 0;
    return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_73:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x200000) == 0)
    goto LABEL_74;
LABEL_37:
  v27 = 2654435761 * self->_rc2Stats;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_75;
LABEL_38:
  v28 = 2654435761 * self->_escoTrafficInd;
  return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a3;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x40) != 0)
  {
    self->_authSuccess = *((_DWORD *)v4 + 8);
    *(_QWORD *)&self->_has |= 0x40uLL;
    v5 = *(_QWORD *)(v4 + 156);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_authFailed = *((_DWORD *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  self->_assocSuccess = *((_DWORD *)v4 + 6);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  self->_assocFailed = *((_DWORD *)v4 + 4);
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x800000) == 0)
  {
LABEL_6:
    if ((v5 & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  self->_reassocSuccess = *((_DWORD *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x400000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  self->_reassocFailed = *((_DWORD *)v4 + 24);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x20000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  self->_linkChanged = *((_DWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  self->_roamSuccess = *((_DWORD *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  self->_roamFailed = *((_DWORD *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 1) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  self->_assocDoneSuccess = *((_DWORD *)v4 + 3);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 1) == 0)
  {
LABEL_12:
    if ((v5 & 8) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  self->_assocDoneFailed = *((_DWORD *)v4 + 2);
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 8) == 0)
  {
LABEL_13:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  self->_assocReady = *((_DWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  self->_ssidChanged = *((_DWORD *)v4 + 37);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  self->_bssidChanged = *((_DWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x800) == 0)
  {
LABEL_16:
    if ((v5 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  self->_deauthReceived = *((_DWORD *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x2000) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  self->_disassocReceived = *((_DWORD *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  self->_decryptError = *((_DWORD *)v4 + 14);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x80000) == 0)
  {
LABEL_19:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  self->_pruned = *((_DWORD *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  self->_supplicant = *((_DWORD *)v4 + 38);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x40000) == 0)
  {
LABEL_21:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  self->_macAddrChanged = *((_DWORD *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  self->_rssiChanged = *((_DWORD *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x10000) == 0)
  {
LABEL_23:
    if ((v5 & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  self->_homeChanQualChanged = *((_DWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x200) == 0)
  {
LABEL_24:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  self->_chanSwitchEvent = *((_DWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  self->_roamPrep = *((_DWORD *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  self->_roamScanStart = *((_DWORD *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  self->_roamScanEnd = *((_DWORD *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  self->_scanResults = *((_DWORD *)v4 + 34);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  self->_scanSummary = *((_DWORD *)v4 + 35);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  self->_scanDone = *((_DWORD *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  self->_scanInternalDone = *((_DWORD *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x80) == 0)
  {
LABEL_32:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  self->_bssDisallowEvent = *((_DWORD *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  self->_slowWiFiSymptom = *((_DWORD *)v4 + 36);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x4000) == 0)
  {
LABEL_34:
    if ((v5 & 0x400) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  self->_dpsSymptom = *((_DWORD *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x400) == 0)
  {
LABEL_35:
    if ((v5 & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  self->_crashTracerTrig = *((_DWORD *)v4 + 12);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x100000) == 0)
  {
LABEL_36:
    if ((v5 & 0x200000) == 0)
      goto LABEL_37;
LABEL_75:
    self->_rc2Stats = *((_DWORD *)v4 + 23);
    *(_QWORD *)&self->_has |= 0x200000uLL;
    if ((*(_QWORD *)(v4 + 156) & 0x8000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_74:
  self->_rc1Stats = *((_DWORD *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *(_QWORD *)(v4 + 156);
  if ((v5 & 0x200000) != 0)
    goto LABEL_75;
LABEL_37:
  if ((v5 & 0x8000) != 0)
  {
LABEL_38:
    self->_escoTrafficInd = *((_DWORD *)v4 + 17);
    *(_QWORD *)&self->_has |= 0x8000uLL;
  }
LABEL_39:

}

- (unsigned)authSuccess
{
  return self->_authSuccess;
}

- (unsigned)authFailed
{
  return self->_authFailed;
}

- (unsigned)assocSuccess
{
  return self->_assocSuccess;
}

- (unsigned)assocFailed
{
  return self->_assocFailed;
}

- (unsigned)reassocSuccess
{
  return self->_reassocSuccess;
}

- (unsigned)reassocFailed
{
  return self->_reassocFailed;
}

- (unsigned)linkChanged
{
  return self->_linkChanged;
}

- (unsigned)roamSuccess
{
  return self->_roamSuccess;
}

- (unsigned)roamFailed
{
  return self->_roamFailed;
}

- (unsigned)assocDoneSuccess
{
  return self->_assocDoneSuccess;
}

- (unsigned)assocDoneFailed
{
  return self->_assocDoneFailed;
}

- (unsigned)assocReady
{
  return self->_assocReady;
}

- (unsigned)ssidChanged
{
  return self->_ssidChanged;
}

- (unsigned)bssidChanged
{
  return self->_bssidChanged;
}

- (unsigned)deauthReceived
{
  return self->_deauthReceived;
}

- (unsigned)disassocReceived
{
  return self->_disassocReceived;
}

- (unsigned)decryptError
{
  return self->_decryptError;
}

- (unsigned)pruned
{
  return self->_pruned;
}

- (unsigned)supplicant
{
  return self->_supplicant;
}

- (unsigned)macAddrChanged
{
  return self->_macAddrChanged;
}

- (unsigned)rssiChanged
{
  return self->_rssiChanged;
}

- (unsigned)homeChanQualChanged
{
  return self->_homeChanQualChanged;
}

- (unsigned)chanSwitchEvent
{
  return self->_chanSwitchEvent;
}

- (unsigned)roamPrep
{
  return self->_roamPrep;
}

- (unsigned)roamScanStart
{
  return self->_roamScanStart;
}

- (unsigned)roamScanEnd
{
  return self->_roamScanEnd;
}

- (unsigned)scanResults
{
  return self->_scanResults;
}

- (unsigned)scanSummary
{
  return self->_scanSummary;
}

- (unsigned)scanDone
{
  return self->_scanDone;
}

- (unsigned)scanInternalDone
{
  return self->_scanInternalDone;
}

- (unsigned)bssDisallowEvent
{
  return self->_bssDisallowEvent;
}

- (unsigned)slowWiFiSymptom
{
  return self->_slowWiFiSymptom;
}

- (unsigned)dpsSymptom
{
  return self->_dpsSymptom;
}

- (unsigned)crashTracerTrig
{
  return self->_crashTracerTrig;
}

- (unsigned)rc1Stats
{
  return self->_rc1Stats;
}

- (unsigned)rc2Stats
{
  return self->_rc2Stats;
}

- (unsigned)escoTrafficInd
{
  return self->_escoTrafficInd;
}

@end
