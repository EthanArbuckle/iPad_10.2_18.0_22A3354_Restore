@implementation AWDWiFiMetricsManagerRoamStatus

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerRoamStatus setOriginOui:](self, "setOriginOui:", 0);
  -[AWDWiFiMetricsManagerRoamStatus setTargetOui:](self, "setTargetOui:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRoamStatus;
  -[AWDWiFiMetricsManagerRoamStatus dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setLatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setProfileType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_profileType = a3;
}

- (void)setHasProfileType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasProfileType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasStatus
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setOriginRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_originRssi = a3;
}

- (void)setHasOriginRssi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasOriginRssi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTargetRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_targetRssi = a3;
}

- (void)setHasTargetRssi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTargetRssi
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasOriginOui
{
  return self->_originOui != 0;
}

- (BOOL)hasTargetOui
{
  return self->_targetOui != 0;
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
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setOriginChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_originChannel = a3;
}

- (void)setHasOriginChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasOriginChannel
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTargetChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_targetChannel = a3;
}

- (void)setHasTargetChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTargetChannel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCcaTotal:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_ccaTotal = a3;
}

- (void)setHasCcaTotal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCcaTotal
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setCcaSelf:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_ccaSelf = a3;
}

- (void)setHasCcaSelf:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCcaSelf
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCcaOthers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_ccaOthers = a3;
}

- (void)setHasCcaOthers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCcaOthers
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCcaInt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_ccaInt = a3;
}

- (void)setHasCcaInt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCcaInt
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setOriginTxPer:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_originTxPer = a3;
}

- (void)setHasOriginTxPer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasOriginTxPer
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setOffChannelDt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_offChannelDt = a3;
}

- (void)setHasOffChannelDt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasOffChannelDt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRoamScanDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_roamScanDuration = a3;
}

- (void)setHasRoamScanDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRoamScanDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setAssociatedDur:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_associatedDur = a3;
}

- (void)setHasAssociatedDur:(BOOL)a3
{
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAssociatedDur
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHostReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hostReason = a3;
}

- (void)setHasHostReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHostReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMotionState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMotionState
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setVoipActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_voipActive = a3;
}

- (void)setHasVoipActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasVoipActive
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setLateRoam:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_lateRoam = a3;
}

- (void)setHasLateRoam:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasLateRoam
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setOriginBcnPer:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_originBcnPer = a3;
}

- (void)setHasOriginBcnPer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasOriginBcnPer
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setOriginFwTxPer:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_originFwTxPer = a3;
}

- (void)setHasOriginFwTxPer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasOriginFwTxPer
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setOriginEnhancedSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_originEnhancedSecurityType = a3;
}

- (void)setHasOriginEnhancedSecurityType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasOriginEnhancedSecurityType
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTargetEnhancedSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_targetEnhancedSecurityType = a3;
}

- (void)setHasTargetEnhancedSecurityType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTargetEnhancedSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setOriginAKMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_originAKMs = a3;
}

- (void)setHasOriginAKMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasOriginAKMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTargetAKMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_targetAKMs = a3;
}

- (void)setHasTargetAKMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTargetAKMs
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setOriginPhyMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_originPhyMode = a3;
}

- (void)setHasOriginPhyMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasOriginPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTargetPhyMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_targetPhyMode = a3;
}

- (void)setHasTargetPhyMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTargetPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRoamStatus;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerRoamStatus description](&v3, sel_description), -[AWDWiFiMetricsManagerRoamStatus dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has;
  NSData *originOui;
  NSData *targetOui;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_latency), CFSTR("latency"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_profileType), CFSTR("profileType"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType), CFSTR("securityType"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_status), CFSTR("status"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_reason), CFSTR("reason"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_originRssi), CFSTR("originRssi"));
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_targetRssi), CFSTR("targetRssi"));
LABEL_10:
  originOui = self->_originOui;
  if (originOui)
    objc_msgSend(v3, "setObject:forKey:", originOui, CFSTR("originOui"));
  targetOui = self->_targetOui;
  if (targetOui)
    objc_msgSend(v3, "setObject:forKey:", targetOui, CFSTR("targetOui"));
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags), CFSTR("flags"));
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x8000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v7 & 0x2000000) == 0)
        goto LABEL_17;
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_originChannel), CFSTR("originChannel"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_targetChannel), CFSTR("targetChannel"));
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaTotal), CFSTR("ccaTotal"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaSelf), CFSTR("ccaSelf"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaOthers), CFSTR("ccaOthers"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v7 & 8) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ccaInt), CFSTR("ccaInt"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_originTxPer), CFSTR("originTxPer"));
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_offChannelDt), CFSTR("offChannelDt"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v7 & 1) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_roamScanDuration), CFSTR("roamScanDuration"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_associatedDur), CFSTR("associatedDur"));
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v7 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hostReason), CFSTR("hostReason"));
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_motionState), CFSTR("motionState"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v7 & 0x20000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_voipActive), CFSTR("voipActive"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v7 & 2) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_lateRoam), CFSTR("lateRoam"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_originBcnPer), CFSTR("originBcnPer"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_originFwTxPer), CFSTR("originFwTxPer"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0)
      goto LABEL_33;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_originEnhancedSecurityType), CFSTR("originEnhancedSecurityType"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_targetEnhancedSecurityType), CFSTR("targetEnhancedSecurityType"));
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_originAKMs), CFSTR("originAKMs"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_36;
LABEL_68:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_originPhyMode), CFSTR("originPhyMode"));
    if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
      return v3;
    goto LABEL_37;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_targetAKMs), CFSTR("targetAKMs"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) != 0)
    goto LABEL_68;
LABEL_36:
  if ((*(_DWORD *)&v7 & 0x8000000) != 0)
LABEL_37:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_targetPhyMode), CFSTR("targetPhyMode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerRoamStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:
  if (self->_originOui)
    PBDataWriterWriteDataField();
  if (self->_targetOui)
    PBDataWriterWriteDataField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x8000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v5 & 0x2000000) == 0)
        goto LABEL_17;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v5 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v5 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x40) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v5 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v5 & 8) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v5 & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v5 & 1) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v5 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v5 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v5 & 0x40000000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x20000000) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v5 & 2) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 2) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v5 & 4) == 0)
      goto LABEL_31;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 4) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v5 & 0x10000) == 0)
      goto LABEL_32;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v5 & 0x4000000) == 0)
      goto LABEL_33;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v5 & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v5 & 0x8000000) == 0)
      return;
LABEL_68:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
    goto LABEL_68;
}

- (void)copyTo:(id)a3
{
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_timestamp;
    *((_DWORD *)a3 + 41) |= 0x10u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 18) = self->_latency;
  *((_DWORD *)a3 + 41) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 28) = self->_profileType;
  *((_DWORD *)a3 + 41) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 31) = self->_securityType;
  *((_DWORD *)a3 + 41) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 32) = self->_status;
  *((_DWORD *)a3 + 41) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 29) = self->_reason;
  *((_DWORD *)a3 + 41) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_45:
  *((_DWORD *)a3 + 27) = self->_originRssi;
  *((_DWORD *)a3 + 41) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_9:
    *((_DWORD *)a3 + 39) = self->_targetRssi;
    *((_DWORD *)a3 + 41) |= 0x10000000u;
  }
LABEL_10:
  if (self->_originOui)
    objc_msgSend(a3, "setOriginOui:");
  if (self->_targetOui)
    objc_msgSend(a3, "setTargetOui:");
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_flags;
    *((_DWORD *)a3 + 41) |= 0x200u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x8000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v6 & 0x2000000) == 0)
        goto LABEL_17;
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 22) = self->_originChannel;
  *((_DWORD *)a3 + 41) |= 0x8000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 34) = self->_targetChannel;
  *((_DWORD *)a3 + 41) |= 0x2000000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 15) = self->_ccaTotal;
  *((_DWORD *)a3 + 41) |= 0x100u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 14) = self->_ccaSelf;
  *((_DWORD *)a3 + 41) |= 0x80u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 13) = self->_ccaOthers;
  *((_DWORD *)a3 + 41) |= 0x40u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 12) = self->_ccaInt;
  *((_DWORD *)a3 + 41) |= 0x20u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)a3 + 4) = self->_originTxPer;
  *((_DWORD *)a3 + 41) |= 8u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 20) = self->_offChannelDt;
  *((_DWORD *)a3 + 41) |= 0x2000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 30) = self->_roamScanDuration;
  *((_DWORD *)a3 + 41) |= 0x200000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 1) = self->_associatedDur;
  *((_DWORD *)a3 + 41) |= 1u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 17) = self->_hostReason;
  *((_DWORD *)a3 + 41) |= 0x400u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x40000000) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 19) = self->_motionState;
  *((_DWORD *)a3 + 41) |= 0x1000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  *((_BYTE *)a3 + 161) = self->_voipActive;
  *((_DWORD *)a3 + 41) |= 0x40000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  *((_BYTE *)a3 + 160) = self->_lateRoam;
  *((_DWORD *)a3 + 41) |= 0x20000000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)a3 + 2) = self->_originBcnPer;
  *((_DWORD *)a3 + 41) |= 2u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)a3 + 3) = self->_originFwTxPer;
  *((_DWORD *)a3 + 41) |= 4u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0)
      goto LABEL_33;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 23) = self->_originEnhancedSecurityType;
  *((_DWORD *)a3 + 41) |= 0x10000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 35) = self->_targetEnhancedSecurityType;
  *((_DWORD *)a3 + 41) |= 0x4000000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 21) = self->_originAKMs;
  *((_DWORD *)a3 + 41) |= 0x4000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 33) = self->_targetAKMs;
  *((_DWORD *)a3 + 41) |= 0x1000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0)
      return;
    goto LABEL_37;
  }
LABEL_68:
  *((_DWORD *)a3 + 26) = self->_originPhyMode;
  *((_DWORD *)a3 + 41) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
    return;
LABEL_37:
  *((_DWORD *)a3 + 38) = self->_targetPhyMode;
  *((_DWORD *)a3 + 41) |= 0x8000000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_timestamp;
    *(_DWORD *)(v5 + 164) |= 0x10u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_latency;
  *(_DWORD *)(v5 + 164) |= 0x800u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 112) = self->_profileType;
  *(_DWORD *)(v5 + 164) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 124) = self->_securityType;
  *(_DWORD *)(v5 + 164) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 128) = self->_status;
  *(_DWORD *)(v5 + 164) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 116) = self->_reason;
  *(_DWORD *)(v5 + 164) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_41:
  *(_DWORD *)(v5 + 108) = self->_originRssi;
  *(_DWORD *)(v5 + 164) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 156) = self->_targetRssi;
    *(_DWORD *)(v5 + 164) |= 0x10000000u;
  }
LABEL_10:

  *(_QWORD *)(v6 + 96) = -[NSData copyWithZone:](self->_originOui, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 144) = -[NSData copyWithZone:](self->_targetOui, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_flags;
    *(_DWORD *)(v6 + 164) |= 0x200u;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x8000) == 0)
    {
LABEL_12:
      if ((*(_DWORD *)&v8 & 0x2000000) == 0)
        goto LABEL_13;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 88) = self->_originChannel;
  *(_DWORD *)(v6 + 164) |= 0x8000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v8 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 136) = self->_targetChannel;
  *(_DWORD *)(v6 + 164) |= 0x2000000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v8 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 60) = self->_ccaTotal;
  *(_DWORD *)(v6 + 164) |= 0x100u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 56) = self->_ccaSelf;
  *(_DWORD *)(v6 + 164) |= 0x80u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v8 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 52) = self->_ccaOthers;
  *(_DWORD *)(v6 + 164) |= 0x40u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v8 & 8) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v6 + 48) = self->_ccaInt;
  *(_DWORD *)(v6 + 164) |= 0x20u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v8 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  *(_QWORD *)(v6 + 32) = self->_originTxPer;
  *(_DWORD *)(v6 + 164) |= 8u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v8 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 80) = self->_offChannelDt;
  *(_DWORD *)(v6 + 164) |= 0x2000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v8 & 1) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 120) = self->_roamScanDuration;
  *(_DWORD *)(v6 + 164) |= 0x200000u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 1) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v8 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  *(_QWORD *)(v6 + 8) = self->_associatedDur;
  *(_DWORD *)(v6 + 164) |= 1u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v6 + 68) = self->_hostReason;
  *(_DWORD *)(v6 + 164) |= 0x400u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v8 & 0x40000000) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v6 + 76) = self->_motionState;
  *(_DWORD *)(v6 + 164) |= 0x1000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v8 & 0x20000000) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  *(_BYTE *)(v6 + 161) = self->_voipActive;
  *(_DWORD *)(v6 + 164) |= 0x40000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v8 & 2) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  *(_BYTE *)(v6 + 160) = self->_lateRoam;
  *(_DWORD *)(v6 + 164) |= 0x20000000u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 2) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  *(_QWORD *)(v6 + 16) = self->_originBcnPer;
  *(_DWORD *)(v6 + 164) |= 2u;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  *(_QWORD *)(v6 + 24) = self->_originFwTxPer;
  *(_DWORD *)(v6 + 164) |= 4u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v8 & 0x4000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v6 + 92) = self->_originEnhancedSecurityType;
  *(_DWORD *)(v6 + 164) |= 0x10000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v8 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v6 + 140) = self->_targetEnhancedSecurityType;
  *(_DWORD *)(v6 + 164) |= 0x4000000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v6 + 84) = self->_originAKMs;
  *(_DWORD *)(v6 + 164) |= 0x4000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v8 & 0x20000) == 0)
      goto LABEL_32;
LABEL_64:
    *(_DWORD *)(v6 + 104) = self->_originPhyMode;
    *(_DWORD *)(v6 + 164) |= 0x20000u;
    if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
      return (id)v6;
    goto LABEL_33;
  }
LABEL_63:
  *(_DWORD *)(v6 + 132) = self->_targetAKMs;
  *(_DWORD *)(v6 + 164) |= 0x1000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) != 0)
    goto LABEL_64;
LABEL_32:
  if ((*(_DWORD *)&v8 & 0x8000000) != 0)
  {
LABEL_33:
    *(_DWORD *)(v6 + 152) = self->_targetPhyMode;
    *(_DWORD *)(v6 + 164) |= 0x8000000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has;
  int v7;
  NSData *originOui;
  NSData *targetOui;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v10;
  int v11;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 41);
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 5))
        goto LABEL_166;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_latency != *((_DWORD *)a3 + 18))
        goto LABEL_166;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_profileType != *((_DWORD *)a3 + 28))
        goto LABEL_166;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_securityType != *((_DWORD *)a3 + 31))
        goto LABEL_166;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_status != *((_DWORD *)a3 + 32))
        goto LABEL_166;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_reason != *((_DWORD *)a3 + 29))
        goto LABEL_166;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_originRssi != *((_DWORD *)a3 + 27))
        goto LABEL_166;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_targetRssi != *((_DWORD *)a3 + 39))
        goto LABEL_166;
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_166;
    }
    originOui = self->_originOui;
    if (!((unint64_t)originOui | *((_QWORD *)a3 + 12)) || (v5 = -[NSData isEqual:](originOui, "isEqual:")) != 0)
    {
      targetOui = self->_targetOui;
      if (!((unint64_t)targetOui | *((_QWORD *)a3 + 18))
        || (v5 = -[NSData isEqual:](targetOui, "isEqual:")) != 0)
      {
        v10 = self->_has;
        v11 = *((_DWORD *)a3 + 41);
        if ((*(_WORD *)&v10 & 0x200) != 0)
        {
          if ((v11 & 0x200) == 0 || self->_flags != *((_DWORD *)a3 + 16))
            goto LABEL_166;
        }
        else if ((v11 & 0x200) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x8000) != 0)
        {
          if ((v11 & 0x8000) == 0 || self->_originChannel != *((_DWORD *)a3 + 22))
            goto LABEL_166;
        }
        else if ((v11 & 0x8000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_DWORD *)&v10 & 0x2000000) != 0)
        {
          if ((v11 & 0x2000000) == 0 || self->_targetChannel != *((_DWORD *)a3 + 34))
            goto LABEL_166;
        }
        else if ((v11 & 0x2000000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x100) != 0)
        {
          if ((v11 & 0x100) == 0 || self->_ccaTotal != *((_DWORD *)a3 + 15))
            goto LABEL_166;
        }
        else if ((v11 & 0x100) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_BYTE *)&v10 & 0x80) != 0)
        {
          if ((v11 & 0x80) == 0 || self->_ccaSelf != *((_DWORD *)a3 + 14))
            goto LABEL_166;
        }
        else if ((v11 & 0x80) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_BYTE *)&v10 & 0x40) != 0)
        {
          if ((v11 & 0x40) == 0 || self->_ccaOthers != *((_DWORD *)a3 + 13))
            goto LABEL_166;
        }
        else if ((v11 & 0x40) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_BYTE *)&v10 & 0x20) != 0)
        {
          if ((v11 & 0x20) == 0 || self->_ccaInt != *((_DWORD *)a3 + 12))
            goto LABEL_166;
        }
        else if ((v11 & 0x20) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_BYTE *)&v10 & 8) != 0)
        {
          if ((v11 & 8) == 0 || self->_originTxPer != *((_QWORD *)a3 + 4))
            goto LABEL_166;
        }
        else if ((v11 & 8) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x2000) != 0)
        {
          if ((v11 & 0x2000) == 0 || self->_offChannelDt != *((_DWORD *)a3 + 20))
            goto LABEL_166;
        }
        else if ((v11 & 0x2000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_DWORD *)&v10 & 0x200000) != 0)
        {
          if ((v11 & 0x200000) == 0 || self->_roamScanDuration != *((_DWORD *)a3 + 30))
            goto LABEL_166;
        }
        else if ((v11 & 0x200000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_BYTE *)&v10 & 1) != 0)
        {
          if ((v11 & 1) == 0 || self->_associatedDur != *((_QWORD *)a3 + 1))
            goto LABEL_166;
        }
        else if ((v11 & 1) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x400) != 0)
        {
          if ((v11 & 0x400) == 0 || self->_hostReason != *((_DWORD *)a3 + 17))
            goto LABEL_166;
        }
        else if ((v11 & 0x400) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x1000) != 0)
        {
          if ((v11 & 0x1000) == 0 || self->_motionState != *((_DWORD *)a3 + 19))
            goto LABEL_166;
        }
        else if ((v11 & 0x1000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_DWORD *)&v10 & 0x40000000) != 0)
        {
          if ((v11 & 0x40000000) == 0)
            goto LABEL_166;
          if (self->_voipActive)
          {
            if (!*((_BYTE *)a3 + 161))
              goto LABEL_166;
          }
          else if (*((_BYTE *)a3 + 161))
          {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x40000000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_DWORD *)&v10 & 0x20000000) == 0)
        {
          if ((v11 & 0x20000000) != 0)
            goto LABEL_166;
          goto LABEL_127;
        }
        if ((v11 & 0x20000000) != 0)
        {
          if (self->_lateRoam)
          {
            if (!*((_BYTE *)a3 + 160))
              goto LABEL_166;
            goto LABEL_127;
          }
          if (!*((_BYTE *)a3 + 160))
          {
LABEL_127:
            if ((*(_BYTE *)&v10 & 2) != 0)
            {
              if ((v11 & 2) == 0 || self->_originBcnPer != *((_QWORD *)a3 + 2))
                goto LABEL_166;
            }
            else if ((v11 & 2) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_BYTE *)&v10 & 4) != 0)
            {
              if ((v11 & 4) == 0 || self->_originFwTxPer != *((_QWORD *)a3 + 3))
                goto LABEL_166;
            }
            else if ((v11 & 4) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_DWORD *)&v10 & 0x10000) != 0)
            {
              if ((v11 & 0x10000) == 0 || self->_originEnhancedSecurityType != *((_DWORD *)a3 + 23))
                goto LABEL_166;
            }
            else if ((v11 & 0x10000) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_DWORD *)&v10 & 0x4000000) != 0)
            {
              if ((v11 & 0x4000000) == 0 || self->_targetEnhancedSecurityType != *((_DWORD *)a3 + 35))
                goto LABEL_166;
            }
            else if ((v11 & 0x4000000) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_WORD *)&v10 & 0x4000) != 0)
            {
              if ((v11 & 0x4000) == 0 || self->_originAKMs != *((_DWORD *)a3 + 21))
                goto LABEL_166;
            }
            else if ((v11 & 0x4000) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_DWORD *)&v10 & 0x1000000) != 0)
            {
              if ((v11 & 0x1000000) == 0 || self->_targetAKMs != *((_DWORD *)a3 + 33))
                goto LABEL_166;
            }
            else if ((v11 & 0x1000000) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_DWORD *)&v10 & 0x20000) != 0)
            {
              if ((v11 & 0x20000) == 0 || self->_originPhyMode != *((_DWORD *)a3 + 26))
                goto LABEL_166;
            }
            else if ((v11 & 0x20000) != 0)
            {
              goto LABEL_166;
            }
            LOBYTE(v5) = (v11 & 0x8000000) == 0;
            if ((*(_DWORD *)&v10 & 0x8000000) != 0)
            {
              if ((v11 & 0x8000000) == 0 || self->_targetPhyMode != *((_DWORD *)a3 + 38))
                goto LABEL_166;
              LOBYTE(v5) = 1;
            }
            return v5;
          }
        }
LABEL_166:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    v38 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x800) != 0)
    {
LABEL_3:
      v37 = 2654435761 * self->_latency;
      if ((*(_DWORD *)&has & 0x80000) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v38 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_3;
  }
  v37 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_4:
    v36 = 2654435761 * self->_profileType;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    v35 = 2654435761 * self->_securityType;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_6:
    v34 = 2654435761 * self->_status;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_7:
    v33 = 2654435761 * self->_reason;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_8;
LABEL_16:
    v32 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_15:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_16;
LABEL_8:
  v32 = 2654435761 * self->_originRssi;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_9:
    v4 = 2654435761 * self->_targetRssi;
    goto LABEL_18;
  }
LABEL_17:
  v4 = 0;
LABEL_18:
  v5 = -[NSData hash](self->_originOui, "hash");
  v6 = -[NSData hash](self->_targetOui, "hash");
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    v8 = 2654435761 * self->_flags;
    if ((*(_WORD *)&v7 & 0x8000) != 0)
    {
LABEL_20:
      v9 = 2654435761 * self->_originChannel;
      if ((*(_DWORD *)&v7 & 0x2000000) != 0)
        goto LABEL_21;
      goto LABEL_44;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_WORD *)&v7 & 0x8000) != 0)
      goto LABEL_20;
  }
  v9 = 0;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
LABEL_21:
    v10 = 2654435761 * self->_targetChannel;
    if ((*(_WORD *)&v7 & 0x100) != 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  v10 = 0;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
LABEL_22:
    v11 = 2654435761 * self->_ccaTotal;
    if ((*(_BYTE *)&v7 & 0x80) != 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  v11 = 0;
  if ((*(_BYTE *)&v7 & 0x80) != 0)
  {
LABEL_23:
    v12 = 2654435761 * self->_ccaSelf;
    if ((*(_BYTE *)&v7 & 0x40) != 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  v12 = 0;
  if ((*(_BYTE *)&v7 & 0x40) != 0)
  {
LABEL_24:
    v13 = 2654435761 * self->_ccaOthers;
    if ((*(_BYTE *)&v7 & 0x20) != 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  v13 = 0;
  if ((*(_BYTE *)&v7 & 0x20) != 0)
  {
LABEL_25:
    v14 = 2654435761 * self->_ccaInt;
    if ((*(_BYTE *)&v7 & 8) != 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  v14 = 0;
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
LABEL_26:
    v15 = 2654435761u * self->_originTxPer;
    if ((*(_WORD *)&v7 & 0x2000) != 0)
      goto LABEL_27;
    goto LABEL_50;
  }
LABEL_49:
  v15 = 0;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
LABEL_27:
    v16 = 2654435761 * self->_offChannelDt;
    if ((*(_DWORD *)&v7 & 0x200000) != 0)
      goto LABEL_28;
    goto LABEL_51;
  }
LABEL_50:
  v16 = 0;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
LABEL_28:
    v17 = 2654435761 * self->_roamScanDuration;
    if ((*(_BYTE *)&v7 & 1) != 0)
      goto LABEL_29;
    goto LABEL_52;
  }
LABEL_51:
  v17 = 0;
  if ((*(_BYTE *)&v7 & 1) != 0)
  {
LABEL_29:
    v18 = 2654435761u * self->_associatedDur;
    if ((*(_WORD *)&v7 & 0x400) != 0)
      goto LABEL_30;
    goto LABEL_53;
  }
LABEL_52:
  v18 = 0;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
LABEL_30:
    v19 = 2654435761 * self->_hostReason;
    if ((*(_WORD *)&v7 & 0x1000) != 0)
      goto LABEL_31;
    goto LABEL_54;
  }
LABEL_53:
  v19 = 0;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
LABEL_31:
    v20 = 2654435761 * self->_motionState;
    if ((*(_DWORD *)&v7 & 0x40000000) != 0)
      goto LABEL_32;
    goto LABEL_55;
  }
LABEL_54:
  v20 = 0;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
LABEL_32:
    v21 = 2654435761 * self->_voipActive;
    if ((*(_DWORD *)&v7 & 0x20000000) != 0)
      goto LABEL_33;
    goto LABEL_56;
  }
LABEL_55:
  v21 = 0;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
LABEL_33:
    v22 = 2654435761 * self->_lateRoam;
    if ((*(_BYTE *)&v7 & 2) != 0)
      goto LABEL_34;
    goto LABEL_57;
  }
LABEL_56:
  v22 = 0;
  if ((*(_BYTE *)&v7 & 2) != 0)
  {
LABEL_34:
    v23 = 2654435761u * self->_originBcnPer;
    if ((*(_BYTE *)&v7 & 4) != 0)
      goto LABEL_35;
    goto LABEL_58;
  }
LABEL_57:
  v23 = 0;
  if ((*(_BYTE *)&v7 & 4) != 0)
  {
LABEL_35:
    v24 = 2654435761u * self->_originFwTxPer;
    if ((*(_DWORD *)&v7 & 0x10000) != 0)
      goto LABEL_36;
    goto LABEL_59;
  }
LABEL_58:
  v24 = 0;
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
LABEL_36:
    v25 = 2654435761 * self->_originEnhancedSecurityType;
    if ((*(_DWORD *)&v7 & 0x4000000) != 0)
      goto LABEL_37;
    goto LABEL_60;
  }
LABEL_59:
  v25 = 0;
  if ((*(_DWORD *)&v7 & 0x4000000) != 0)
  {
LABEL_37:
    v26 = 2654435761 * self->_targetEnhancedSecurityType;
    if ((*(_WORD *)&v7 & 0x4000) != 0)
      goto LABEL_38;
    goto LABEL_61;
  }
LABEL_60:
  v26 = 0;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
LABEL_38:
    v27 = 2654435761 * self->_originAKMs;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0)
      goto LABEL_39;
    goto LABEL_62;
  }
LABEL_61:
  v27 = 0;
  if ((*(_DWORD *)&v7 & 0x1000000) != 0)
  {
LABEL_39:
    v28 = 2654435761 * self->_targetAKMs;
    if ((*(_DWORD *)&v7 & 0x20000) != 0)
      goto LABEL_40;
LABEL_63:
    v29 = 0;
    if ((*(_DWORD *)&v7 & 0x8000000) != 0)
      goto LABEL_41;
LABEL_64:
    v30 = 0;
    return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
  }
LABEL_62:
  v28 = 0;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
    goto LABEL_63;
LABEL_40:
  v29 = 2654435761 * self->_originPhyMode;
  if ((*(_DWORD *)&v7 & 0x8000000) == 0)
    goto LABEL_64;
LABEL_41:
  v30 = 2654435761 * self->_targetPhyMode;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  int v6;

  v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
    v5 = *((_DWORD *)a3 + 41);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_latency = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x80000) == 0)
  {
LABEL_4:
    if ((v5 & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  self->_profileType = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x400000) == 0)
  {
LABEL_5:
    if ((v5 & 0x800000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  self->_securityType = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x800000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  self->_status = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x100000) == 0)
  {
LABEL_7:
    if ((v5 & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  self->_reason = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x40000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_45:
  self->_originRssi = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)a3 + 41) & 0x10000000) != 0)
  {
LABEL_9:
    self->_targetRssi = *((_DWORD *)a3 + 39);
    *(_DWORD *)&self->_has |= 0x10000000u;
  }
LABEL_10:
  if (*((_QWORD *)a3 + 12))
    -[AWDWiFiMetricsManagerRoamStatus setOriginOui:](self, "setOriginOui:");
  if (*((_QWORD *)a3 + 18))
    -[AWDWiFiMetricsManagerRoamStatus setTargetOui:](self, "setTargetOui:");
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x200) != 0)
  {
    self->_flags = *((_DWORD *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x200u;
    v6 = *((_DWORD *)a3 + 41);
    if ((v6 & 0x8000) == 0)
    {
LABEL_16:
      if ((v6 & 0x2000000) == 0)
        goto LABEL_17;
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x8000) == 0)
  {
    goto LABEL_16;
  }
  self->_originChannel = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x8000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_17:
    if ((v6 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  self->_targetChannel = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  self->_ccaTotal = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x80) == 0)
  {
LABEL_19:
    if ((v6 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  self->_ccaSelf = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x40) == 0)
  {
LABEL_20:
    if ((v6 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  self->_ccaOthers = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x20) == 0)
  {
LABEL_21:
    if ((v6 & 8) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  self->_ccaInt = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x20u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 8) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  self->_originTxPer = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((v6 & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  self->_offChannelDt = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x2000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x200000) == 0)
  {
LABEL_24:
    if ((v6 & 1) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  self->_roamScanDuration = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x200000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 1) == 0)
  {
LABEL_25:
    if ((v6 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  self->_associatedDur = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x400) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_59;
  }
LABEL_58:
  self->_hostReason = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x1000) == 0)
  {
LABEL_27:
    if ((v6 & 0x40000000) == 0)
      goto LABEL_28;
    goto LABEL_60;
  }
LABEL_59:
  self->_motionState = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x1000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x20000000) == 0)
      goto LABEL_29;
    goto LABEL_61;
  }
LABEL_60:
  self->_voipActive = *((_BYTE *)a3 + 161);
  *(_DWORD *)&self->_has |= 0x40000000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_29:
    if ((v6 & 2) == 0)
      goto LABEL_30;
    goto LABEL_62;
  }
LABEL_61:
  self->_lateRoam = *((_BYTE *)a3 + 160);
  *(_DWORD *)&self->_has |= 0x20000000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 2) == 0)
  {
LABEL_30:
    if ((v6 & 4) == 0)
      goto LABEL_31;
    goto LABEL_63;
  }
LABEL_62:
  self->_originBcnPer = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 4) == 0)
  {
LABEL_31:
    if ((v6 & 0x10000) == 0)
      goto LABEL_32;
    goto LABEL_64;
  }
LABEL_63:
  self->_originFwTxPer = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x10000) == 0)
  {
LABEL_32:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_33;
    goto LABEL_65;
  }
LABEL_64:
  self->_originEnhancedSecurityType = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x10000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_33:
    if ((v6 & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_66;
  }
LABEL_65:
  self->_targetEnhancedSecurityType = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x4000) == 0)
  {
LABEL_34:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_67;
  }
LABEL_66:
  self->_originAKMs = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x4000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_68;
  }
LABEL_67:
  self->_targetAKMs = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x20000) == 0)
  {
LABEL_36:
    if ((v6 & 0x8000000) == 0)
      return;
    goto LABEL_37;
  }
LABEL_68:
  self->_originPhyMode = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)a3 + 41) & 0x8000000) == 0)
    return;
LABEL_37:
  self->_targetPhyMode = *((_DWORD *)a3 + 38);
  *(_DWORD *)&self->_has |= 0x8000000u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)latency
{
  return self->_latency;
}

- (unsigned)profileType
{
  return self->_profileType;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)reason
{
  return self->_reason;
}

- (int)originRssi
{
  return self->_originRssi;
}

- (int)targetRssi
{
  return self->_targetRssi;
}

- (NSData)originOui
{
  return self->_originOui;
}

- (void)setOriginOui:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSData)targetOui
{
  return self->_targetOui;
}

- (void)setTargetOui:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (unsigned)flags
{
  return self->_flags;
}

- (unsigned)originChannel
{
  return self->_originChannel;
}

- (unsigned)targetChannel
{
  return self->_targetChannel;
}

- (unsigned)ccaTotal
{
  return self->_ccaTotal;
}

- (unsigned)ccaSelf
{
  return self->_ccaSelf;
}

- (unsigned)ccaOthers
{
  return self->_ccaOthers;
}

- (unsigned)ccaInt
{
  return self->_ccaInt;
}

- (unint64_t)originTxPer
{
  return self->_originTxPer;
}

- (unsigned)offChannelDt
{
  return self->_offChannelDt;
}

- (unsigned)roamScanDuration
{
  return self->_roamScanDuration;
}

- (unint64_t)associatedDur
{
  return self->_associatedDur;
}

- (unsigned)hostReason
{
  return self->_hostReason;
}

- (unsigned)motionState
{
  return self->_motionState;
}

- (BOOL)voipActive
{
  return self->_voipActive;
}

- (BOOL)lateRoam
{
  return self->_lateRoam;
}

- (unint64_t)originBcnPer
{
  return self->_originBcnPer;
}

- (unint64_t)originFwTxPer
{
  return self->_originFwTxPer;
}

- (unsigned)originEnhancedSecurityType
{
  return self->_originEnhancedSecurityType;
}

- (unsigned)targetEnhancedSecurityType
{
  return self->_targetEnhancedSecurityType;
}

- (unsigned)originAKMs
{
  return self->_originAKMs;
}

- (unsigned)targetAKMs
{
  return self->_targetAKMs;
}

- (unsigned)originPhyMode
{
  return self->_originPhyMode;
}

- (unsigned)targetPhyMode
{
  return self->_targetPhyMode;
}

@end
