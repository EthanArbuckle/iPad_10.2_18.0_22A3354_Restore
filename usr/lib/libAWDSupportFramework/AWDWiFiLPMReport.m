@implementation AWDWiFiLPMReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTimestamp
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setAssociatedDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_associatedDuration = a3;
}

- (void)setHasAssociatedDuration:(BOOL)a3
{
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAssociatedDuration
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSleepDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_sleepDuration = a3;
}

- (void)setHasSleepDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSleepDuration
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setRoamDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_roamDuration = a3;
}

- (void)setHasRoamDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasRoamDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPhyOffDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_phyOffDuration = a3;
}

- (void)setHasPhyOffDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPhyOffDuration
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTransmitDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_transmitDuration = a3;
}

- (void)setHasTransmitDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasTransmitDuration
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setReceiveDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_receiveDuration = a3;
}

- (void)setHasReceiveDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasReceiveDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTotalLPASDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_totalLPASDuration = a3;
}

- (void)setHasTotalLPASDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTotalLPASDuration
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setPowerConsumedInSelfManagedLPASMode:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_powerConsumedInSelfManagedLPASMode = a3;
}

- (void)setHasPowerConsumedInSelfManagedLPASMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPowerConsumedInSelfManagedLPASMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setPowerConsumptionDueToMac:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_powerConsumptionDueToMac = a3;
}

- (void)setHasPowerConsumptionDueToMac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPowerConsumptionDueToMac
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPowerConsumptionDueToRF:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_powerConsumptionDueToRF = a3;
}

- (void)setHasPowerConsumptionDueToRF:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToRF
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setPowerConsumptionDueToUserScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_powerConsumptionDueToUserScan = a3;
}

- (void)setHasPowerConsumptionDueToUserScan:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToUserScan
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPowerConsumptionDueToRoamScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_powerConsumptionDueToRoamScan = a3;
}

- (void)setHasPowerConsumptionDueToRoamScan:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToRoamScan
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPowerConsumptionDueToAssocScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_powerConsumptionDueToAssocScan = a3;
}

- (void)setHasPowerConsumptionDueToAssocScan:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToAssocScan
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setPowerConsumptionDueToEPNOScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_powerConsumptionDueToEPNOScan = a3;
}

- (void)setHasPowerConsumptionDueToEPNOScan:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToEPNOScan
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPowerConsumptionDueToTx:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_powerConsumptionDueToTx = a3;
}

- (void)setHasPowerConsumptionDueToTx:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToTx
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setPowerConsumptionDueToRx:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_powerConsumptionDueToRx = a3;
}

- (void)setHasPowerConsumptionDueToRx:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToRx
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPowerConsumptionDueToFRTS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_powerConsumptionDueToFRTS = a3;
}

- (void)setHasPowerConsumptionDueToFRTS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToFRTS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPowerConsumptionDueToAWDLTx:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_powerConsumptionDueToAWDLTx = a3;
}

- (void)setHasPowerConsumptionDueToAWDLTx:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPowerConsumptionDueToAWDLTx
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setPowerConsumptionDueToAWDLRx:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_powerConsumptionDueToAWDLRx = a3;
}

- (void)setHasPowerConsumptionDueToAWDLRx:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPowerConsumptionDueToAWDLRx
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBeaconReceivedInLpas:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_beaconReceivedInLpas = a3;
}

- (void)setHasBeaconReceivedInLpas:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBeaconReceivedInLpas
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBeaconsMissedInLpas:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_beaconsMissedInLpas = a3;
}

- (void)setHasBeaconsMissedInLpas:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBeaconsMissedInLpas
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBeaconsEarlyTerminatedInLpas:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_beaconsEarlyTerminatedInLpas = a3;
}

- (void)setHasBeaconsEarlyTerminatedInLpas:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBeaconsEarlyTerminatedInLpas
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBeaconsScheduledInLpas:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_beaconsScheduledInLpas = a3;
}

- (void)setHasBeaconsScheduledInLpas:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBeaconsScheduledInLpas
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTotalLpasPowerBudget:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_totalLpasPowerBudget = a3;
}

- (void)setHasTotalLpasPowerBudget:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTotalLpasPowerBudget
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setLpasPowerBudgetRemaining:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_lpasPowerBudgetRemaining = a3;
}

- (void)setHasLpasPowerBudgetRemaining:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLpasPowerBudgetRemaining
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTotalLpasPowerMonitoringPeriod:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_totalLpasPowerMonitoringPeriod = a3;
}

- (void)setHasTotalLpasPowerMonitoringPeriod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTotalLpasPowerMonitoringPeriod
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setLpasPowerPeriodRemaining:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lpasPowerPeriodRemaining = a3;
}

- (void)setHasLpasPowerPeriodRemaining:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLpasPowerPeriodRemaining
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setAssociatedSleepDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_associatedSleepDuration = a3;
}

- (void)setHasAssociatedSleepDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAssociatedSleepDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalTimeForBugetExpiry:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_totalTimeForBugetExpiry = a3;
}

- (void)setHasTotalTimeForBugetExpiry:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTotalTimeForBugetExpiry
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLPMReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiLPMReport description](&v3, sel_description), -[AWDWiFiLPMReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_associatedDuration), CFSTR("associatedDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sleepDuration), CFSTR("sleepDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_roamDuration), CFSTR("roamDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_phyOffDuration), CFSTR("phyOffDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_transmitDuration), CFSTR("transmitDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_receiveDuration), CFSTR("receiveDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalLPASDuration), CFSTR("totalLPASDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumedInSelfManagedLPASMode), CFSTR("powerConsumedInSelfManagedLPASMode"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToMac), CFSTR("powerConsumptionDueToMac"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToRF), CFSTR("powerConsumptionDueToRF"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToUserScan), CFSTR("powerConsumptionDueToUserScan"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToRoamScan), CFSTR("powerConsumptionDueToRoamScan"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToAssocScan), CFSTR("powerConsumptionDueToAssocScan"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToEPNOScan), CFSTR("powerConsumptionDueToEPNOScan"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToTx), CFSTR("powerConsumptionDueToTx"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToRx), CFSTR("powerConsumptionDueToRx"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToFRTS), CFSTR("powerConsumptionDueToFRTS"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToAWDLTx), CFSTR("powerConsumptionDueToAWDLTx"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_powerConsumptionDueToAWDLRx), CFSTR("powerConsumptionDueToAWDLRx"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beaconReceivedInLpas), CFSTR("beaconReceivedInLpas"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beaconsMissedInLpas), CFSTR("beaconsMissedInLpas"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beaconsEarlyTerminatedInLpas), CFSTR("beaconsEarlyTerminatedInLpas"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_beaconsScheduledInLpas), CFSTR("beaconsScheduledInLpas"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalLpasPowerBudget), CFSTR("totalLpasPowerBudget"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lpasPowerBudgetRemaining), CFSTR("lpasPowerBudgetRemaining"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalLpasPowerMonitoringPeriod), CFSTR("totalLpasPowerMonitoringPeriod"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_30;
LABEL_61:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_associatedSleepDuration), CFSTR("associatedSleepDuration"));
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      return v3;
    goto LABEL_31;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_lpasPowerPeriodRemaining), CFSTR("lpasPowerPeriodRemaining"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_61;
LABEL_30:
  if ((*(_DWORD *)&has & 0x10000000) != 0)
LABEL_31:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalTimeForBugetExpiry), CFSTR("totalTimeForBugetExpiry"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLPMReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $1BB6750C757AE8AC8B1C418F6E197DA9 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
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
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
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
  $1BB6750C757AE8AC8B1C418F6E197DA9 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    *((_QWORD *)a3 + 25) = self->_timestamp;
    *((_DWORD *)a3 + 62) |= 0x1000000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = self->_associatedDuration;
  *((_DWORD *)a3 + 62) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)a3 + 24) = self->_sleepDuration;
  *((_DWORD *)a3 + 62) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 23) = self->_roamDuration;
  *((_DWORD *)a3 + 62) |= 0x400000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 9) = self->_phyOffDuration;
  *((_DWORD *)a3 + 62) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)a3 + 30) = self->_transmitDuration;
  *((_DWORD *)a3 + 62) |= 0x20000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)a3 + 22) = self->_receiveDuration;
  *((_DWORD *)a3 + 62) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)a3 + 26) = self->_totalLPASDuration;
  *((_DWORD *)a3 + 62) |= 0x2000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)a3 + 10) = self->_powerConsumedInSelfManagedLPASMode;
  *((_DWORD *)a3 + 62) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)a3 + 16) = self->_powerConsumptionDueToMac;
  *((_DWORD *)a3 + 62) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)a3 + 17) = self->_powerConsumptionDueToRF;
  *((_DWORD *)a3 + 62) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)a3 + 21) = self->_powerConsumptionDueToUserScan;
  *((_DWORD *)a3 + 62) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)a3 + 18) = self->_powerConsumptionDueToRoamScan;
  *((_DWORD *)a3 + 62) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)a3 + 13) = self->_powerConsumptionDueToAssocScan;
  *((_DWORD *)a3 + 62) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)a3 + 14) = self->_powerConsumptionDueToEPNOScan;
  *((_DWORD *)a3 + 62) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)a3 + 20) = self->_powerConsumptionDueToTx;
  *((_DWORD *)a3 + 62) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)a3 + 19) = self->_powerConsumptionDueToRx;
  *((_DWORD *)a3 + 62) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)a3 + 15) = self->_powerConsumptionDueToFRTS;
  *((_DWORD *)a3 + 62) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)a3 + 12) = self->_powerConsumptionDueToAWDLTx;
  *((_DWORD *)a3 + 62) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)a3 + 11) = self->_powerConsumptionDueToAWDLRx;
  *((_DWORD *)a3 + 62) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)a3 + 3) = self->_beaconReceivedInLpas;
  *((_DWORD *)a3 + 62) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)a3 + 5) = self->_beaconsMissedInLpas;
  *((_DWORD *)a3 + 62) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)a3 + 4) = self->_beaconsEarlyTerminatedInLpas;
  *((_DWORD *)a3 + 62) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)a3 + 6) = self->_beaconsScheduledInLpas;
  *((_DWORD *)a3 + 62) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 27) = self->_totalLpasPowerBudget;
  *((_DWORD *)a3 + 62) |= 0x4000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 7) = self->_lpasPowerBudgetRemaining;
  *((_DWORD *)a3 + 62) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)a3 + 28) = self->_totalLpasPowerMonitoringPeriod;
  *((_DWORD *)a3 + 62) |= 0x8000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)a3 + 8) = self->_lpasPowerPeriodRemaining;
  *((_DWORD *)a3 + 62) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      return;
LABEL_61:
    *((_QWORD *)a3 + 29) = self->_totalTimeForBugetExpiry;
    *((_DWORD *)a3 + 62) |= 0x10000000u;
    return;
  }
LABEL_60:
  *((_QWORD *)a3 + 2) = self->_associatedSleepDuration;
  *((_DWORD *)a3 + 62) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
    goto LABEL_61;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    *((_QWORD *)result + 25) = self->_timestamp;
    *((_DWORD *)result + 62) |= 0x1000000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = self->_associatedDuration;
  *((_DWORD *)result + 62) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 24) = self->_sleepDuration;
  *((_DWORD *)result + 62) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 23) = self->_roamDuration;
  *((_DWORD *)result + 62) |= 0x400000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 9) = self->_phyOffDuration;
  *((_DWORD *)result + 62) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 30) = self->_transmitDuration;
  *((_DWORD *)result + 62) |= 0x20000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 22) = self->_receiveDuration;
  *((_DWORD *)result + 62) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 26) = self->_totalLPASDuration;
  *((_DWORD *)result + 62) |= 0x2000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)result + 10) = self->_powerConsumedInSelfManagedLPASMode;
  *((_DWORD *)result + 62) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)result + 16) = self->_powerConsumptionDueToMac;
  *((_DWORD *)result + 62) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)result + 17) = self->_powerConsumptionDueToRF;
  *((_DWORD *)result + 62) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)result + 21) = self->_powerConsumptionDueToUserScan;
  *((_DWORD *)result + 62) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)result + 18) = self->_powerConsumptionDueToRoamScan;
  *((_DWORD *)result + 62) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)result + 13) = self->_powerConsumptionDueToAssocScan;
  *((_DWORD *)result + 62) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)result + 14) = self->_powerConsumptionDueToEPNOScan;
  *((_DWORD *)result + 62) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)result + 20) = self->_powerConsumptionDueToTx;
  *((_DWORD *)result + 62) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)result + 19) = self->_powerConsumptionDueToRx;
  *((_DWORD *)result + 62) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)result + 15) = self->_powerConsumptionDueToFRTS;
  *((_DWORD *)result + 62) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)result + 12) = self->_powerConsumptionDueToAWDLTx;
  *((_DWORD *)result + 62) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)result + 11) = self->_powerConsumptionDueToAWDLRx;
  *((_DWORD *)result + 62) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)result + 3) = self->_beaconReceivedInLpas;
  *((_DWORD *)result + 62) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)result + 5) = self->_beaconsMissedInLpas;
  *((_DWORD *)result + 62) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)result + 4) = self->_beaconsEarlyTerminatedInLpas;
  *((_DWORD *)result + 62) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)result + 6) = self->_beaconsScheduledInLpas;
  *((_DWORD *)result + 62) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)result + 27) = self->_totalLpasPowerBudget;
  *((_DWORD *)result + 62) |= 0x4000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)result + 7) = self->_lpasPowerBudgetRemaining;
  *((_DWORD *)result + 62) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)result + 28) = self->_totalLpasPowerMonitoringPeriod;
  *((_DWORD *)result + 62) |= 0x8000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)result + 8) = self->_lpasPowerPeriodRemaining;
  *((_DWORD *)result + 62) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      return result;
    goto LABEL_31;
  }
LABEL_61:
  *((_QWORD *)result + 2) = self->_associatedSleepDuration;
  *((_DWORD *)result + 62) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
    return result;
LABEL_31:
  *((_QWORD *)result + 29) = self->_totalTimeForBugetExpiry;
  *((_DWORD *)result + 62) |= 0x10000000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 62);
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_timestamp != *((_QWORD *)a3 + 25))
        goto LABEL_151;
    }
    else if ((v7 & 0x1000000) != 0)
    {
LABEL_151:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_associatedDuration != *((_QWORD *)a3 + 1))
        goto LABEL_151;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_sleepDuration != *((_QWORD *)a3 + 24))
        goto LABEL_151;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_roamDuration != *((_QWORD *)a3 + 23))
        goto LABEL_151;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_phyOffDuration != *((_QWORD *)a3 + 9))
        goto LABEL_151;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_transmitDuration != *((_QWORD *)a3 + 30))
        goto LABEL_151;
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_receiveDuration != *((_QWORD *)a3 + 22))
        goto LABEL_151;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_totalLPASDuration != *((_QWORD *)a3 + 26))
        goto LABEL_151;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_powerConsumedInSelfManagedLPASMode != *((_QWORD *)a3 + 10))
        goto LABEL_151;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_powerConsumptionDueToMac != *((_QWORD *)a3 + 16))
        goto LABEL_151;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_powerConsumptionDueToRF != *((_QWORD *)a3 + 17))
        goto LABEL_151;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_powerConsumptionDueToUserScan != *((_QWORD *)a3 + 21))
        goto LABEL_151;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_powerConsumptionDueToRoamScan != *((_QWORD *)a3 + 18))
        goto LABEL_151;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_powerConsumptionDueToAssocScan != *((_QWORD *)a3 + 13))
        goto LABEL_151;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_powerConsumptionDueToEPNOScan != *((_QWORD *)a3 + 14))
        goto LABEL_151;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_powerConsumptionDueToTx != *((_QWORD *)a3 + 20))
        goto LABEL_151;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_powerConsumptionDueToRx != *((_QWORD *)a3 + 19))
        goto LABEL_151;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_powerConsumptionDueToFRTS != *((_QWORD *)a3 + 15))
        goto LABEL_151;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_powerConsumptionDueToAWDLTx != *((_QWORD *)a3 + 12))
        goto LABEL_151;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_powerConsumptionDueToAWDLRx != *((_QWORD *)a3 + 11))
        goto LABEL_151;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_beaconReceivedInLpas != *((_QWORD *)a3 + 3))
        goto LABEL_151;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_beaconsMissedInLpas != *((_QWORD *)a3 + 5))
        goto LABEL_151;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_beaconsEarlyTerminatedInLpas != *((_QWORD *)a3 + 4))
        goto LABEL_151;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_beaconsScheduledInLpas != *((_QWORD *)a3 + 6))
        goto LABEL_151;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_totalLpasPowerBudget != *((_QWORD *)a3 + 27))
        goto LABEL_151;
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_lpasPowerBudgetRemaining != *((_QWORD *)a3 + 7))
        goto LABEL_151;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_totalLpasPowerMonitoringPeriod != *((_QWORD *)a3 + 28))
        goto LABEL_151;
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_lpasPowerPeriodRemaining != *((_QWORD *)a3 + 8))
        goto LABEL_151;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_associatedSleepDuration != *((_QWORD *)a3 + 2))
        goto LABEL_151;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_151;
    }
    LOBYTE(v5) = (v7 & 0x10000000) == 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_totalTimeForBugetExpiry != *((_QWORD *)a3 + 29))
        goto LABEL_151;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $1BB6750C757AE8AC8B1C418F6E197DA9 has;
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
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    v33 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 1) != 0)
    {
LABEL_3:
      v32 = 2654435761u * self->_associatedDuration;
      if ((*(_DWORD *)&has & 0x800000) != 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else
  {
    v33 = 0;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_3;
  }
  v32 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_4:
    v31 = 2654435761u * self->_sleepDuration;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    v3 = 2654435761u * self->_roamDuration;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  v3 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_6:
    v4 = 2654435761u * self->_phyOffDuration;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_7:
    v5 = 2654435761u * self->_transmitDuration;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_8:
    v6 = 2654435761u * self->_receiveDuration;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_9:
    v7 = 2654435761u * self->_totalLPASDuration;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  v7 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    v8 = 2654435761u * self->_powerConsumedInSelfManagedLPASMode;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  v8 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_11:
    v9 = 2654435761u * self->_powerConsumptionDueToMac;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_12:
    v10 = 2654435761u * self->_powerConsumptionDueToRF;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_13:
    v11 = 2654435761u * self->_powerConsumptionDueToUserScan;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_14:
    v12 = 2654435761u * self->_powerConsumptionDueToRoamScan;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  v12 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_15:
    v13 = 2654435761u * self->_powerConsumptionDueToAssocScan;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  v13 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_16:
    v14 = 2654435761u * self->_powerConsumptionDueToEPNOScan;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_17:
    v15 = 2654435761u * self->_powerConsumptionDueToTx;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_18:
    v16 = 2654435761u * self->_powerConsumptionDueToRx;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  v16 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_19:
    v17 = 2654435761u * self->_powerConsumptionDueToFRTS;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  v17 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_20:
    v18 = 2654435761u * self->_powerConsumptionDueToAWDLTx;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  v18 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_21:
    v19 = 2654435761u * self->_powerConsumptionDueToAWDLRx;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  v19 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_22:
    v20 = 2654435761u * self->_beaconReceivedInLpas;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_23:
    v21 = 2654435761u * self->_beaconsMissedInLpas;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  v21 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_24:
    v22 = 2654435761u * self->_beaconsEarlyTerminatedInLpas;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_25:
    v23 = 2654435761u * self->_beaconsScheduledInLpas;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_26:
    v24 = 2654435761u * self->_totalLpasPowerBudget;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  v24 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_27:
    v25 = 2654435761u * self->_lpasPowerBudgetRemaining;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_28:
    v26 = 2654435761u * self->_totalLpasPowerMonitoringPeriod;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  v26 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_29:
    v27 = 2654435761u * self->_lpasPowerPeriodRemaining;
    if ((*(_BYTE *)&has & 2) != 0)
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
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_60;
LABEL_30:
  v28 = 2654435761u * self->_associatedSleepDuration;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
    goto LABEL_61;
LABEL_31:
  v29 = 2654435761u * self->_totalTimeForBugetExpiry;
  return v32 ^ v33 ^ v31 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x1000000) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 25);
    *(_DWORD *)&self->_has |= 0x1000000u;
    v3 = *((_DWORD *)a3 + 62);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_associatedDuration = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x800000) == 0)
  {
LABEL_4:
    if ((v3 & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  self->_sleepDuration = *((_QWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x400000) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  self->_roamDuration = *((_QWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x400000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  self->_phyOffDuration = *((_QWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x200000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  self->_transmitDuration = *((_QWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x20000000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x200000) == 0)
  {
LABEL_8:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  self->_receiveDuration = *((_QWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  self->_totalLPASDuration = *((_QWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  self->_powerConsumedInSelfManagedLPASMode = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x8000) == 0)
  {
LABEL_11:
    if ((v3 & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  self->_powerConsumptionDueToMac = *((_QWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x10000) == 0)
  {
LABEL_12:
    if ((v3 & 0x100000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  self->_powerConsumptionDueToRF = *((_QWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x100000) == 0)
  {
LABEL_13:
    if ((v3 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  self->_powerConsumptionDueToUserScan = *((_QWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20000) == 0)
  {
LABEL_14:
    if ((v3 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  self->_powerConsumptionDueToRoamScan = *((_QWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x1000) == 0)
  {
LABEL_15:
    if ((v3 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  self->_powerConsumptionDueToAssocScan = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x2000) == 0)
  {
LABEL_16:
    if ((v3 & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  self->_powerConsumptionDueToEPNOScan = *((_QWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x80000) == 0)
  {
LABEL_17:
    if ((v3 & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  self->_powerConsumptionDueToTx = *((_QWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x40000) == 0)
  {
LABEL_18:
    if ((v3 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  self->_powerConsumptionDueToRx = *((_QWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x4000) == 0)
  {
LABEL_19:
    if ((v3 & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  self->_powerConsumptionDueToFRTS = *((_QWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x800) == 0)
  {
LABEL_20:
    if ((v3 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  self->_powerConsumptionDueToAWDLTx = *((_QWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x400) == 0)
  {
LABEL_21:
    if ((v3 & 4) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  self->_powerConsumptionDueToAWDLRx = *((_QWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 4) == 0)
  {
LABEL_22:
    if ((v3 & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  self->_beaconReceivedInLpas = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x10) == 0)
  {
LABEL_23:
    if ((v3 & 8) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  self->_beaconsMissedInLpas = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 8) == 0)
  {
LABEL_24:
    if ((v3 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  self->_beaconsEarlyTerminatedInLpas = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20) == 0)
  {
LABEL_25:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  self->_beaconsScheduledInLpas = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  self->_totalLpasPowerBudget = *((_QWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x40) == 0)
  {
LABEL_27:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  self->_lpasPowerBudgetRemaining = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  self->_totalLpasPowerMonitoringPeriod = *((_QWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x80) == 0)
  {
LABEL_29:
    if ((v3 & 2) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  self->_lpasPowerPeriodRemaining = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 2) == 0)
  {
LABEL_30:
    if ((v3 & 0x10000000) == 0)
      return;
LABEL_61:
    self->_totalTimeForBugetExpiry = *((_QWORD *)a3 + 29);
    *(_DWORD *)&self->_has |= 0x10000000u;
    return;
  }
LABEL_60:
  self->_associatedSleepDuration = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 62) & 0x10000000) != 0)
    goto LABEL_61;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)associatedDuration
{
  return self->_associatedDuration;
}

- (unint64_t)sleepDuration
{
  return self->_sleepDuration;
}

- (unint64_t)roamDuration
{
  return self->_roamDuration;
}

- (unint64_t)phyOffDuration
{
  return self->_phyOffDuration;
}

- (unint64_t)transmitDuration
{
  return self->_transmitDuration;
}

- (unint64_t)receiveDuration
{
  return self->_receiveDuration;
}

- (unint64_t)totalLPASDuration
{
  return self->_totalLPASDuration;
}

- (unint64_t)powerConsumedInSelfManagedLPASMode
{
  return self->_powerConsumedInSelfManagedLPASMode;
}

- (unint64_t)powerConsumptionDueToMac
{
  return self->_powerConsumptionDueToMac;
}

- (unint64_t)powerConsumptionDueToRF
{
  return self->_powerConsumptionDueToRF;
}

- (unint64_t)powerConsumptionDueToUserScan
{
  return self->_powerConsumptionDueToUserScan;
}

- (unint64_t)powerConsumptionDueToRoamScan
{
  return self->_powerConsumptionDueToRoamScan;
}

- (unint64_t)powerConsumptionDueToAssocScan
{
  return self->_powerConsumptionDueToAssocScan;
}

- (unint64_t)powerConsumptionDueToEPNOScan
{
  return self->_powerConsumptionDueToEPNOScan;
}

- (unint64_t)powerConsumptionDueToTx
{
  return self->_powerConsumptionDueToTx;
}

- (unint64_t)powerConsumptionDueToRx
{
  return self->_powerConsumptionDueToRx;
}

- (unint64_t)powerConsumptionDueToFRTS
{
  return self->_powerConsumptionDueToFRTS;
}

- (unint64_t)powerConsumptionDueToAWDLTx
{
  return self->_powerConsumptionDueToAWDLTx;
}

- (unint64_t)powerConsumptionDueToAWDLRx
{
  return self->_powerConsumptionDueToAWDLRx;
}

- (unint64_t)beaconReceivedInLpas
{
  return self->_beaconReceivedInLpas;
}

- (unint64_t)beaconsMissedInLpas
{
  return self->_beaconsMissedInLpas;
}

- (unint64_t)beaconsEarlyTerminatedInLpas
{
  return self->_beaconsEarlyTerminatedInLpas;
}

- (unint64_t)beaconsScheduledInLpas
{
  return self->_beaconsScheduledInLpas;
}

- (unint64_t)totalLpasPowerBudget
{
  return self->_totalLpasPowerBudget;
}

- (unint64_t)lpasPowerBudgetRemaining
{
  return self->_lpasPowerBudgetRemaining;
}

- (unint64_t)totalLpasPowerMonitoringPeriod
{
  return self->_totalLpasPowerMonitoringPeriod;
}

- (unint64_t)lpasPowerPeriodRemaining
{
  return self->_lpasPowerPeriodRemaining;
}

- (unint64_t)associatedSleepDuration
{
  return self->_associatedSleepDuration;
}

- (unint64_t)totalTimeForBugetExpiry
{
  return self->_totalTimeForBugetExpiry;
}

@end
