@implementation AWDWRMFacetimeRecommendation

- (void)dealloc
{
  objc_super v3;

  -[AWDWRMFacetimeRecommendation setRatType:](self, "setRatType:", 0);
  -[AWDWRMFacetimeRecommendation setIRATRecommendation:](self, "setIRATRecommendation:", 0);
  -[AWDWRMFacetimeRecommendation setIRATRecommendationReason:](self, "setIRATRecommendationReason:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMFacetimeRecommendation;
  -[AWDWRMFacetimeRecommendation dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWifiRssi:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasWifiRssi
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWifiTxPER:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_wifiTxPER = a3;
}

- (void)setHasWifiTxPER:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasWifiTxPER
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setWifiSNR:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_wifiSNR = a3;
}

- (void)setHasWifiSNR:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasWifiSNR
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCaptiveNetworks:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_captiveNetworks = a3;
}

- (void)setHasCaptiveNetworks:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasCaptiveNetworks
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setWifiRxRetry:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_wifiRxRetry = a3;
}

- (void)setHasWifiRxRetry:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasWifiRxRetry
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setWifiEstimatedBandwitdh:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_wifiEstimatedBandwitdh = a3;
}

- (void)setHasWifiEstimatedBandwitdh:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasWifiEstimatedBandwitdh
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setWifiTxPhyRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_wifiTxPhyRate = a3;
}

- (void)setHasWifiTxPhyRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasWifiTxPhyRate
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setWifiRxPhyRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_wifiRxPhyRate = a3;
}

- (void)setHasWifiRxPhyRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWifiRxPhyRate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setQbssLoad:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_qbssLoad = a3;
}

- (void)setHasQbssLoad:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasQbssLoad
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCca:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_cca = a3;
}

- (void)setHasCca:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCca
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setStationCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_stationCount = a3;
}

- (void)setHasStationCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasStationCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setDataLQM:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_dataLQM = a3;
}

- (void)setHasDataLQM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasDataLQM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBssLoad:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_bssLoad = a3;
}

- (void)setHasBssLoad:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBssLoad
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setVoiceLQM:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_voiceLQM = a3;
}

- (void)setHasVoiceLQM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVoiceLQM
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSignalBar:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_signalBar = a3;
}

- (void)setHasSignalBar:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSignalBar
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasRatType
{
  return self->_ratType != 0;
}

- (BOOL)hasIRATRecommendation
{
  return self->_iRATRecommendation != 0;
}

- (BOOL)hasIRATRecommendationReason
{
  return self->_iRATRecommendationReason != 0;
}

- (void)setFacetimePacketLoss:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_facetimePacketLoss = a3;
}

- (void)setHasFacetimePacketLoss:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasFacetimePacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFacetimeAction:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_facetimeAction = a3;
}

- (void)setHasFacetimeAction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasFacetimeAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setFacetimeTimeDelay:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_facetimeTimeDelay = a3;
}

- (void)setHasFacetimeTimeDelay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasFacetimeTimeDelay
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCounter:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_counter = a3;
}

- (void)setHasCounter:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasCounter
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAlertedMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_alertedMode = a3;
}

- (void)setHasAlertedMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasAlertedMode
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setIsStallDetected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_isStallDetected = a3;
}

- (void)setHasIsStallDetected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasIsStallDetected
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setIsPCDetected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isPCDetected = a3;
}

- (void)setHasIsPCDetected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsPCDetected
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setVideoErasure:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_videoErasure = a3;
}

- (void)setHasVideoErasure:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasVideoErasure
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAudioErasure:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_audioErasure = a3;
}

- (void)setHasAudioErasure:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAudioErasure
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCellRsrp:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cellRsrp = a3;
}

- (void)setHasCellRsrp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCellRsrp
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCellRsrq:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cellRsrq = a3;
}

- (void)setHasCellRsrq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCellRsrq
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCellSnr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_cellSnr = a3;
}

- (void)setHasCellSnr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCellSnr
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setCellMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_cellMode = a3;
}

- (void)setHasCellMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasCellMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWRMFacetimeRecommendation;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWRMFacetimeRecommendation description](&v3, sel_description), -[AWDWRMFacetimeRecommendation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $F57CBE7E82B36495573539A3C92CBBA7 has;
  NSString *ratType;
  NSString *iRATRecommendation;
  NSString *iRATRecommendationReason;
  $F57CBE7E82B36495573539A3C92CBBA7 v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_wifiRssi), CFSTR("wifiRssi"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiTxPER), CFSTR("wifiTxPER"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_wifiSNR), CFSTR("wifiSNR"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_captiveNetworks), CFSTR("captiveNetworks"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiRxRetry), CFSTR("wifiRxRetry"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiEstimatedBandwitdh), CFSTR("wifiEstimatedBandwitdh"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiTxPhyRate), CFSTR("wifiTxPhyRate"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifiRxPhyRate), CFSTR("wifiRxPhyRate"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_qbssLoad), CFSTR("qbssLoad"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_cca), CFSTR("cca"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stationCount), CFSTR("stationCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dataLQM), CFSTR("dataLQM"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bssLoad), CFSTR("bssLoad"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_voiceLQM), CFSTR("voiceLQM"));
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_signalBar), CFSTR("signalBar"));
LABEL_18:
  ratType = self->_ratType;
  if (ratType)
    objc_msgSend(v3, "setObject:forKey:", ratType, CFSTR("ratType"));
  iRATRecommendation = self->_iRATRecommendation;
  if (iRATRecommendation)
    objc_msgSend(v3, "setObject:forKey:", iRATRecommendation, CFSTR("iRATRecommendation"));
  iRATRecommendationReason = self->_iRATRecommendationReason;
  if (iRATRecommendationReason)
    objc_msgSend(v3, "setObject:forKey:", iRATRecommendationReason, CFSTR("iRATRecommendationReason"));
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_facetimePacketLoss), CFSTR("facetimePacketLoss"));
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x800) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v8 & 0x2000) == 0)
        goto LABEL_27;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_facetimeAction), CFSTR("facetimeAction"));
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v8 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_facetimeTimeDelay), CFSTR("facetimeTimeDelay"));
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_counter), CFSTR("counter"));
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_alertedMode), CFSTR("alertedMode"));
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0)
      goto LABEL_31;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isStallDetected), CFSTR("isStallDetected"));
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v8 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPCDetected), CFSTR("isPCDetected"));
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v8 & 8) == 0)
      goto LABEL_33;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_videoErasure), CFSTR("videoErasure"));
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_audioErasure), CFSTR("audioErasure"));
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v8 & 0x80) == 0)
      goto LABEL_35;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellRsrp), CFSTR("cell_rsrp"));
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v8 & 0x100) == 0)
      goto LABEL_36;
LABEL_66:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellSnr), CFSTR("cell_snr"));
    if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
      return v3;
    goto LABEL_37;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellRsrq), CFSTR("cell_rsrq"));
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0)
    goto LABEL_66;
LABEL_36:
  if ((*(_DWORD *)&v8 & 0x4000000) != 0)
LABEL_37:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cellMode), CFSTR("cellMode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMFacetimeRecommendationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $F57CBE7E82B36495573539A3C92CBBA7 has;
  $F57CBE7E82B36495573539A3C92CBBA7 v5;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteSint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_ratType)
    PBDataWriterWriteStringField();
  if (self->_iRATRecommendation)
    PBDataWriterWriteStringField();
  if (self->_iRATRecommendationReason)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x800) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v5 & 0x2000) == 0)
        goto LABEL_27;
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&v5 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v5 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v5 & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v5 & 0x8000000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x8000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v5 & 8) == 0)
      goto LABEL_33;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v5 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v5 & 0x80) == 0)
      goto LABEL_35;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteSint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x80) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v5 & 0x100) == 0)
      goto LABEL_36;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteSint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v5 & 0x4000000) == 0)
      return;
LABEL_66:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_65:
  PBDataWriterWriteSint32Field();
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
    goto LABEL_66;
}

- (void)copyTo:(id)a3
{
  $F57CBE7E82B36495573539A3C92CBBA7 has;
  $F57CBE7E82B36495573539A3C92CBBA7 v6;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 39) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_wifiRssi;
  *((_DWORD *)a3 + 39) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 35) = self->_wifiTxPER;
  *((_DWORD *)a3 + 39) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)a3 + 3) = self->_wifiSNR;
  *((_DWORD *)a3 + 39) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  *((_BYTE *)a3 + 149) = self->_captiveNetworks;
  *((_DWORD *)a3 + 39) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 34) = self->_wifiRxRetry;
  *((_DWORD *)a3 + 39) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 32) = self->_wifiEstimatedBandwitdh;
  *((_DWORD *)a3 + 39) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 36) = self->_wifiTxPhyRate;
  *((_DWORD *)a3 + 39) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 33) = self->_wifiRxPhyRate;
  *((_DWORD *)a3 + 39) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 24) = self->_qbssLoad;
  *((_DWORD *)a3 + 39) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 10) = self->_cca;
  *((_DWORD *)a3 + 39) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 29) = self->_stationCount;
  *((_DWORD *)a3 + 39) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 15) = self->_dataLQM;
  *((_DWORD *)a3 + 39) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 9) = self->_bssLoad;
  *((_DWORD *)a3 + 39) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_53:
  *((_DWORD *)a3 + 31) = self->_voiceLQM;
  *((_DWORD *)a3 + 39) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 28) = self->_signalBar;
    *((_DWORD *)a3 + 39) |= 0x8000u;
  }
LABEL_18:
  if (self->_ratType)
    objc_msgSend(a3, "setRatType:");
  if (self->_iRATRecommendation)
    objc_msgSend(a3, "setIRATRecommendation:");
  if (self->_iRATRecommendationReason)
    objc_msgSend(a3, "setIRATRecommendationReason:");
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_facetimePacketLoss;
    *((_DWORD *)a3 + 39) |= 0x1000u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v6 & 0x2000) == 0)
        goto LABEL_27;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)a3 + 16) = self->_facetimeAction;
  *((_DWORD *)a3 + 39) |= 0x800u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 18) = self->_facetimeTimeDelay;
  *((_DWORD *)a3 + 39) |= 0x2000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 14) = self->_counter;
  *((_DWORD *)a3 + 39) |= 0x200u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  *((_BYTE *)a3 + 148) = self->_alertedMode;
  *((_DWORD *)a3 + 39) |= 0x1000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0)
      goto LABEL_31;
    goto LABEL_61;
  }
LABEL_60:
  *((_BYTE *)a3 + 152) = self->_isStallDetected;
  *((_DWORD *)a3 + 39) |= 0x10000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_62;
  }
LABEL_61:
  *((_BYTE *)a3 + 151) = self->_isPCDetected;
  *((_DWORD *)a3 + 39) |= 0x8000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_33;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 30) = self->_videoErasure;
  *((_DWORD *)a3 + 39) |= 0x20000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 8) = self->_audioErasure;
  *((_DWORD *)a3 + 39) |= 8u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_35;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 11) = self->_cellRsrp;
  *((_DWORD *)a3 + 39) |= 0x40u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_36;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 12) = self->_cellRsrq;
  *((_DWORD *)a3 + 39) |= 0x80u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0)
      return;
    goto LABEL_37;
  }
LABEL_66:
  *((_DWORD *)a3 + 13) = self->_cellSnr;
  *((_DWORD *)a3 + 39) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
    return;
LABEL_37:
  *((_BYTE *)a3 + 150) = self->_cellMode;
  *((_DWORD *)a3 + 39) |= 0x4000000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $F57CBE7E82B36495573539A3C92CBBA7 has;
  $F57CBE7E82B36495573539A3C92CBBA7 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 156) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_wifiRssi;
  *(_DWORD *)(v5 + 156) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 140) = self->_wifiTxPER;
  *(_DWORD *)(v5 + 156) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  *(_QWORD *)(v5 + 24) = self->_wifiSNR;
  *(_DWORD *)(v5 + 156) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  *(_BYTE *)(v5 + 149) = self->_captiveNetworks;
  *(_DWORD *)(v5 + 156) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 136) = self->_wifiRxRetry;
  *(_DWORD *)(v5 + 156) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 128) = self->_wifiEstimatedBandwitdh;
  *(_DWORD *)(v5 + 156) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 144) = self->_wifiTxPhyRate;
  *(_DWORD *)(v5 + 156) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 132) = self->_wifiRxPhyRate;
  *(_DWORD *)(v5 + 156) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 96) = self->_qbssLoad;
  *(_DWORD *)(v5 + 156) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 40) = self->_cca;
  *(_DWORD *)(v5 + 156) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 116) = self->_stationCount;
  *(_DWORD *)(v5 + 156) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 60) = self->_dataLQM;
  *(_DWORD *)(v5 + 156) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 36) = self->_bssLoad;
  *(_DWORD *)(v5 + 156) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_47:
  *(_DWORD *)(v5 + 124) = self->_voiceLQM;
  *(_DWORD *)(v5 + 156) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    *(_DWORD *)(v5 + 112) = self->_signalBar;
    *(_DWORD *)(v5 + 156) |= 0x8000u;
  }
LABEL_18:

  *(_QWORD *)(v6 + 104) = -[NSString copyWithZone:](self->_ratType, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_iRATRecommendation, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 88) = -[NSString copyWithZone:](self->_iRATRecommendationReason, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_facetimePacketLoss;
    *(_DWORD *)(v6 + 156) |= 0x1000u;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x800) == 0)
    {
LABEL_20:
      if ((*(_WORD *)&v8 & 0x2000) == 0)
        goto LABEL_21;
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    goto LABEL_20;
  }
  *(_DWORD *)(v6 + 64) = self->_facetimeAction;
  *(_DWORD *)(v6 + 156) |= 0x800u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v8 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 72) = self->_facetimeTimeDelay;
  *(_DWORD *)(v6 + 156) |= 0x2000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 56) = self->_counter;
  *(_DWORD *)(v6 + 156) |= 0x200u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  *(_BYTE *)(v6 + 148) = self->_alertedMode;
  *(_DWORD *)(v6 + 156) |= 0x1000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  *(_BYTE *)(v6 + 152) = self->_isStallDetected;
  *(_DWORD *)(v6 + 156) |= 0x10000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v8 & 0x20000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  *(_BYTE *)(v6 + 151) = self->_isPCDetected;
  *(_DWORD *)(v6 + 156) |= 0x8000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v8 & 8) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v6 + 120) = self->_videoErasure;
  *(_DWORD *)(v6 + 156) |= 0x20000u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v6 + 32) = self->_audioErasure;
  *(_DWORD *)(v6 + 156) |= 8u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v8 & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 44) = self->_cellRsrp;
  *(_DWORD *)(v6 + 156) |= 0x40u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v8 & 0x100) == 0)
      goto LABEL_30;
LABEL_60:
    *(_DWORD *)(v6 + 52) = self->_cellSnr;
    *(_DWORD *)(v6 + 156) |= 0x100u;
    if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
      return (id)v6;
    goto LABEL_31;
  }
LABEL_59:
  *(_DWORD *)(v6 + 48) = self->_cellRsrq;
  *(_DWORD *)(v6 + 156) |= 0x80u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0)
    goto LABEL_60;
LABEL_30:
  if ((*(_DWORD *)&v8 & 0x4000000) != 0)
  {
LABEL_31:
    *(_BYTE *)(v6 + 150) = self->_cellMode;
    *(_DWORD *)(v6 + 156) |= 0x4000000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $F57CBE7E82B36495573539A3C92CBBA7 has;
  int v7;
  NSString *ratType;
  NSString *iRATRecommendation;
  NSString *iRATRecommendationReason;
  $F57CBE7E82B36495573539A3C92CBBA7 v11;
  int v12;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *((_DWORD *)a3 + 39);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_162;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_wifiRssi != *((_QWORD *)a3 + 2))
      goto LABEL_162;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_wifiTxPER != *((_DWORD *)a3 + 35))
      goto LABEL_162;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_wifiSNR != *((_QWORD *)a3 + 3))
      goto LABEL_162;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0)
      goto LABEL_162;
    if (self->_captiveNetworks)
    {
      if (!*((_BYTE *)a3 + 149))
        goto LABEL_162;
    }
    else if (*((_BYTE *)a3 + 149))
    {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_wifiRxRetry != *((_DWORD *)a3 + 34))
      goto LABEL_162;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_wifiEstimatedBandwitdh != *((_DWORD *)a3 + 32))
      goto LABEL_162;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_wifiTxPhyRate != *((_DWORD *)a3 + 36))
      goto LABEL_162;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_wifiRxPhyRate != *((_DWORD *)a3 + 33))
      goto LABEL_162;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_qbssLoad != *((_DWORD *)a3 + 24))
      goto LABEL_162;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_cca != *((_DWORD *)a3 + 10))
      goto LABEL_162;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_stationCount != *((_DWORD *)a3 + 29))
      goto LABEL_162;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_dataLQM != *((_DWORD *)a3 + 15))
      goto LABEL_162;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_bssLoad != *((_DWORD *)a3 + 9))
      goto LABEL_162;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_voiceLQM != *((_DWORD *)a3 + 31))
      goto LABEL_162;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_signalBar != *((_DWORD *)a3 + 28))
      goto LABEL_162;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_162;
  }
  ratType = self->_ratType;
  if ((unint64_t)ratType | *((_QWORD *)a3 + 13))
  {
    v5 = -[NSString isEqual:](ratType, "isEqual:");
    if (!v5)
      return v5;
  }
  iRATRecommendation = self->_iRATRecommendation;
  if ((unint64_t)iRATRecommendation | *((_QWORD *)a3 + 10))
  {
    v5 = -[NSString isEqual:](iRATRecommendation, "isEqual:");
    if (!v5)
      return v5;
  }
  iRATRecommendationReason = self->_iRATRecommendationReason;
  if ((unint64_t)iRATRecommendationReason | *((_QWORD *)a3 + 11))
  {
    v5 = -[NSString isEqual:](iRATRecommendationReason, "isEqual:");
    if (!v5)
      return v5;
  }
  v11 = self->_has;
  v12 = *((_DWORD *)a3 + 39);
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_facetimePacketLoss != *((_DWORD *)a3 + 17))
      goto LABEL_162;
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_facetimeAction != *((_DWORD *)a3 + 16))
      goto LABEL_162;
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_facetimeTimeDelay != *((_DWORD *)a3 + 18))
      goto LABEL_162;
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0 || self->_counter != *((_DWORD *)a3 + 14))
      goto LABEL_162;
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v11 & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0)
      goto LABEL_162;
    if (self->_alertedMode)
    {
      if (!*((_BYTE *)a3 + 148))
        goto LABEL_162;
    }
    else if (*((_BYTE *)a3 + 148))
    {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v11 & 0x10000000) != 0)
  {
    if ((v12 & 0x10000000) == 0)
      goto LABEL_162;
    if (self->_isStallDetected)
    {
      if (!*((_BYTE *)a3 + 152))
        goto LABEL_162;
    }
    else if (*((_BYTE *)a3 + 152))
    {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x10000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v11 & 0x8000000) != 0)
  {
    if ((v12 & 0x8000000) != 0)
    {
      if (self->_isPCDetected)
      {
        if (!*((_BYTE *)a3 + 151))
          goto LABEL_162;
        goto LABEL_135;
      }
      if (!*((_BYTE *)a3 + 151))
        goto LABEL_135;
    }
LABEL_162:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v12 & 0x8000000) != 0)
    goto LABEL_162;
LABEL_135:
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    if ((v12 & 0x20000) == 0 || self->_videoErasure != *((_DWORD *)a3 + 30))
      goto LABEL_162;
  }
  else if ((v12 & 0x20000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_audioErasure != *((_DWORD *)a3 + 8))
      goto LABEL_162;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_cellRsrp != *((_DWORD *)a3 + 11))
      goto LABEL_162;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_cellRsrq != *((_DWORD *)a3 + 12))
      goto LABEL_162;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_cellSnr != *((_DWORD *)a3 + 13))
      goto LABEL_162;
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_162;
  }
  LOBYTE(v5) = (v12 & 0x4000000) == 0;
  if ((*(_DWORD *)&v11 & 0x4000000) != 0)
  {
    if ((v12 & 0x4000000) == 0)
      goto LABEL_162;
    if (self->_cellMode)
    {
      if (!*((_BYTE *)a3 + 150))
        goto LABEL_162;
    }
    else if (*((_BYTE *)a3 + 150))
    {
      goto LABEL_162;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $F57CBE7E82B36495573539A3C92CBBA7 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  $F57CBE7E82B36495573539A3C92CBBA7 v12;
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
  unint64_t v37;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v37 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v36 = 2654435761 * self->_wifiRssi;
      if ((*(_DWORD *)&has & 0x400000) != 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else
  {
    v37 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v36 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_4:
    v35 = 2654435761 * self->_wifiTxPER;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v35 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v34 = 2654435761 * self->_wifiSNR;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_6:
    v33 = 2654435761 * self->_captiveNetworks;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_7:
    v32 = 2654435761 * self->_wifiRxRetry;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_8:
    v31 = 2654435761 * self->_wifiEstimatedBandwitdh;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_9:
    v30 = 2654435761 * self->_wifiTxPhyRate;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_10:
    v29 = 2654435761 * self->_wifiRxPhyRate;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v29 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_11:
    v28 = 2654435761 * self->_qbssLoad;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v28 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_12:
    v27 = 2654435761 * self->_cca;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v27 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    v4 = 2654435761 * self->_stationCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  v4 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_14:
    v5 = 2654435761 * self->_dataLQM;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_15:
    v6 = 2654435761 * self->_bssLoad;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_16;
LABEL_32:
    v7 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_31:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_32;
LABEL_16:
  v7 = 2654435761 * self->_voiceLQM;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    v8 = 2654435761 * self->_signalBar;
    goto LABEL_34;
  }
LABEL_33:
  v8 = 0;
LABEL_34:
  v9 = -[NSString hash](self->_ratType, "hash");
  v10 = -[NSString hash](self->_iRATRecommendation, "hash");
  v11 = -[NSString hash](self->_iRATRecommendationReason, "hash");
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    v13 = 2654435761 * self->_facetimePacketLoss;
    if ((*(_WORD *)&v12 & 0x800) != 0)
    {
LABEL_36:
      v14 = 2654435761 * self->_facetimeAction;
      if ((*(_WORD *)&v12 & 0x2000) != 0)
        goto LABEL_37;
      goto LABEL_50;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&v12 & 0x800) != 0)
      goto LABEL_36;
  }
  v14 = 0;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
LABEL_37:
    v15 = 2654435761 * self->_facetimeTimeDelay;
    if ((*(_WORD *)&v12 & 0x200) != 0)
      goto LABEL_38;
    goto LABEL_51;
  }
LABEL_50:
  v15 = 0;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
LABEL_38:
    v16 = 2654435761 * self->_counter;
    if ((*(_DWORD *)&v12 & 0x1000000) != 0)
      goto LABEL_39;
    goto LABEL_52;
  }
LABEL_51:
  v16 = 0;
  if ((*(_DWORD *)&v12 & 0x1000000) != 0)
  {
LABEL_39:
    v17 = 2654435761 * self->_alertedMode;
    if ((*(_DWORD *)&v12 & 0x10000000) != 0)
      goto LABEL_40;
    goto LABEL_53;
  }
LABEL_52:
  v17 = 0;
  if ((*(_DWORD *)&v12 & 0x10000000) != 0)
  {
LABEL_40:
    v18 = 2654435761 * self->_isStallDetected;
    if ((*(_DWORD *)&v12 & 0x8000000) != 0)
      goto LABEL_41;
    goto LABEL_54;
  }
LABEL_53:
  v18 = 0;
  if ((*(_DWORD *)&v12 & 0x8000000) != 0)
  {
LABEL_41:
    v19 = 2654435761 * self->_isPCDetected;
    if ((*(_DWORD *)&v12 & 0x20000) != 0)
      goto LABEL_42;
    goto LABEL_55;
  }
LABEL_54:
  v19 = 0;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
LABEL_42:
    v20 = 2654435761 * self->_videoErasure;
    if ((*(_BYTE *)&v12 & 8) != 0)
      goto LABEL_43;
    goto LABEL_56;
  }
LABEL_55:
  v20 = 0;
  if ((*(_BYTE *)&v12 & 8) != 0)
  {
LABEL_43:
    v21 = 2654435761 * self->_audioErasure;
    if ((*(_BYTE *)&v12 & 0x40) != 0)
      goto LABEL_44;
    goto LABEL_57;
  }
LABEL_56:
  v21 = 0;
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
LABEL_44:
    v22 = 2654435761 * self->_cellRsrp;
    if ((*(_BYTE *)&v12 & 0x80) != 0)
      goto LABEL_45;
    goto LABEL_58;
  }
LABEL_57:
  v22 = 0;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
LABEL_45:
    v23 = 2654435761 * self->_cellRsrq;
    if ((*(_WORD *)&v12 & 0x100) != 0)
      goto LABEL_46;
LABEL_59:
    v24 = 0;
    if ((*(_DWORD *)&v12 & 0x4000000) != 0)
      goto LABEL_47;
LABEL_60:
    v25 = 0;
    return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
  }
LABEL_58:
  v23 = 0;
  if ((*(_WORD *)&v12 & 0x100) == 0)
    goto LABEL_59;
LABEL_46:
  v24 = 2654435761 * self->_cellSnr;
  if ((*(_DWORD *)&v12 & 0x4000000) == 0)
    goto LABEL_60;
LABEL_47:
  v25 = 2654435761 * self->_cellMode;
  return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  int v6;

  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)a3 + 39);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x400000) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiRssi = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x400000) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  self->_wifiTxPER = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  self->_wifiSNR = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  self->_captiveNetworks = *((_BYTE *)a3 + 149);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x200000) == 0)
  {
LABEL_7:
    if ((v5 & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  self->_wifiRxRetry = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x80000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  self->_wifiEstimatedBandwitdh = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  self->_wifiTxPhyRate = *((_DWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x100000) == 0)
  {
LABEL_10:
    if ((v5 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  self->_wifiRxPhyRate = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x4000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  self->_qbssLoad = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  self->_cca = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x10000) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  self->_stationCount = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  self->_dataLQM = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x10) == 0)
  {
LABEL_15:
    if ((v5 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  self->_bssLoad = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x40000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_53:
  self->_voiceLQM = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)a3 + 39) & 0x8000) != 0)
  {
LABEL_17:
    self->_signalBar = *((_DWORD *)a3 + 28);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_18:
  if (*((_QWORD *)a3 + 13))
    -[AWDWRMFacetimeRecommendation setRatType:](self, "setRatType:");
  if (*((_QWORD *)a3 + 10))
    -[AWDWRMFacetimeRecommendation setIRATRecommendation:](self, "setIRATRecommendation:");
  if (*((_QWORD *)a3 + 11))
    -[AWDWRMFacetimeRecommendation setIRATRecommendationReason:](self, "setIRATRecommendationReason:");
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x1000) != 0)
  {
    self->_facetimePacketLoss = *((_DWORD *)a3 + 17);
    *(_DWORD *)&self->_has |= 0x1000u;
    v6 = *((_DWORD *)a3 + 39);
    if ((v6 & 0x800) == 0)
    {
LABEL_26:
      if ((v6 & 0x2000) == 0)
        goto LABEL_27;
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  self->_facetimeAction = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x2000) == 0)
  {
LABEL_27:
    if ((v6 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  self->_facetimeTimeDelay = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x200) == 0)
  {
LABEL_28:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  self->_counter = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_29:
    if ((v6 & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  self->_alertedMode = *((_BYTE *)a3 + 148);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_30:
    if ((v6 & 0x8000000) == 0)
      goto LABEL_31;
    goto LABEL_61;
  }
LABEL_60:
  self->_isStallDetected = *((_BYTE *)a3 + 152);
  *(_DWORD *)&self->_has |= 0x10000000u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x20000) == 0)
      goto LABEL_32;
    goto LABEL_62;
  }
LABEL_61:
  self->_isPCDetected = *((_BYTE *)a3 + 151);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x20000) == 0)
  {
LABEL_32:
    if ((v6 & 8) == 0)
      goto LABEL_33;
    goto LABEL_63;
  }
LABEL_62:
  self->_videoErasure = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 8) == 0)
  {
LABEL_33:
    if ((v6 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_64;
  }
LABEL_63:
  self->_audioErasure = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x40) == 0)
  {
LABEL_34:
    if ((v6 & 0x80) == 0)
      goto LABEL_35;
    goto LABEL_65;
  }
LABEL_64:
  self->_cellRsrp = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x80) == 0)
  {
LABEL_35:
    if ((v6 & 0x100) == 0)
      goto LABEL_36;
    goto LABEL_66;
  }
LABEL_65:
  self->_cellRsrq = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x100) == 0)
  {
LABEL_36:
    if ((v6 & 0x4000000) == 0)
      return;
    goto LABEL_37;
  }
LABEL_66:
  self->_cellSnr = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)a3 + 39) & 0x4000000) == 0)
    return;
LABEL_37:
  self->_cellMode = *((_BYTE *)a3 + 150);
  *(_DWORD *)&self->_has |= 0x4000000u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)wifiRssi
{
  return self->_wifiRssi;
}

- (unsigned)wifiTxPER
{
  return self->_wifiTxPER;
}

- (int64_t)wifiSNR
{
  return self->_wifiSNR;
}

- (BOOL)captiveNetworks
{
  return self->_captiveNetworks;
}

- (unsigned)wifiRxRetry
{
  return self->_wifiRxRetry;
}

- (unsigned)wifiEstimatedBandwitdh
{
  return self->_wifiEstimatedBandwitdh;
}

- (unsigned)wifiTxPhyRate
{
  return self->_wifiTxPhyRate;
}

- (unsigned)wifiRxPhyRate
{
  return self->_wifiRxPhyRate;
}

- (unsigned)qbssLoad
{
  return self->_qbssLoad;
}

- (unsigned)cca
{
  return self->_cca;
}

- (unsigned)stationCount
{
  return self->_stationCount;
}

- (unsigned)dataLQM
{
  return self->_dataLQM;
}

- (unsigned)bssLoad
{
  return self->_bssLoad;
}

- (unsigned)voiceLQM
{
  return self->_voiceLQM;
}

- (unsigned)signalBar
{
  return self->_signalBar;
}

- (NSString)ratType
{
  return self->_ratType;
}

- (void)setRatType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSString)iRATRecommendation
{
  return self->_iRATRecommendation;
}

- (void)setIRATRecommendation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)iRATRecommendationReason
{
  return self->_iRATRecommendationReason;
}

- (void)setIRATRecommendationReason:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unsigned)facetimePacketLoss
{
  return self->_facetimePacketLoss;
}

- (unsigned)facetimeAction
{
  return self->_facetimeAction;
}

- (unsigned)facetimeTimeDelay
{
  return self->_facetimeTimeDelay;
}

- (unsigned)counter
{
  return self->_counter;
}

- (BOOL)alertedMode
{
  return self->_alertedMode;
}

- (BOOL)isStallDetected
{
  return self->_isStallDetected;
}

- (BOOL)isPCDetected
{
  return self->_isPCDetected;
}

- (unsigned)videoErasure
{
  return self->_videoErasure;
}

- (unsigned)audioErasure
{
  return self->_audioErasure;
}

- (int)cellRsrp
{
  return self->_cellRsrp;
}

- (int)cellRsrq
{
  return self->_cellRsrq;
}

- (int)cellSnr
{
  return self->_cellSnr;
}

- (BOOL)cellMode
{
  return self->_cellMode;
}

@end
