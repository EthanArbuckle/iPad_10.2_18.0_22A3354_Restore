@implementation AWDWRMLinkPrefChange1

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNCallIdle:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_nCallIdle = a3;
}

- (void)setHasNCallIdle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNCallIdle
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNCallActive:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_nCallActive = a3;
}

- (void)setHasNCallActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNCallActive
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNData:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_nData = a3;
}

- (void)setHasNData:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNData
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNVoice:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_nVoice = a3;
}

- (void)setHasNVoice:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNVoice
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setNStationary:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_nStationary = a3;
}

- (void)setHasNStationary:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNStationary
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setNWalking:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_nWalking = a3;
}

- (void)setHasNWalking:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasNWalking
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNRunning:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_nRunning = a3;
}

- (void)setHasNRunning:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNRunning
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setNVehicular:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_nVehicular = a3;
}

- (void)setHasNVehicular:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasNVehicular
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNWifiNotInit:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_nWifiNotInit = a3;
}

- (void)setHasNWifiNotInit:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasNWifiNotInit
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setNWifiNotReady:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_nWifiNotReady = a3;
}

- (void)setHasNWifiNotReady:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasNWifiNotReady
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setNWifiBadSNR:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_nWifiBadSNR = a3;
}

- (void)setHasNWifiBadSNR:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasNWifiBadSNR
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setNWifiBadRSSI:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_nWifiBadRSSI = a3;
}

- (void)setHasNWifiBadRSSI:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasNWifiBadRSSI
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setNWifiBadPER:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_nWifiBadPER = a3;
}

- (void)setHasNWifiBadPER:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasNWifiBadPER
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setNWifiBadTransportSymptom:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_nWifiBadTransportSymptom = a3;
}

- (void)setHasNWifiBadTransportSymptom:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasNWifiBadTransportSymptom
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setNWifiBadTransportRTP:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_nWifiBadTransportRTP = a3;
}

- (void)setHasNWifiBadTransportRTP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasNWifiBadTransportRTP
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setNWifiBadLoad:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_nWifiBadLoad = a3;
}

- (void)setHasNWifiBadLoad:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasNWifiBadLoad
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setNWifiBadBcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_nWifiBadBcn = a3;
}

- (void)setHasNWifiBadBcn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasNWifiBadBcn
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNCellularGood:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_nCellularGood = a3;
}

- (void)setHasNCellularGood:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNCellularGood
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNPositiveStatusUpdate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_nPositiveStatusUpdate = a3;
}

- (void)setHasNPositiveStatusUpdate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNPositiveStatusUpdate
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setNNegativeStatusUpdate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_nNegativeStatusUpdate = a3;
}

- (void)setHasNNegativeStatusUpdate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNNegativeStatusUpdate
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNUnknownStatusUpdat:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_nUnknownStatusUpdat = a3;
}

- (void)setHasNUnknownStatusUpdat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasNUnknownStatusUpdat
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setNStatusUpdateDelayBin1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_nStatusUpdateDelayBin1 = a3;
}

- (void)setHasNStatusUpdateDelayBin1:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNStatusUpdateDelayBin1
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNStatusUpdateDelayBin2:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_nStatusUpdateDelayBin2 = a3;
}

- (void)setHasNStatusUpdateDelayBin2:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNStatusUpdateDelayBin2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setNStatusUpdateDelayBin3:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_nStatusUpdateDelayBin3 = a3;
}

- (void)setHasNStatusUpdateDelayBin3:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNStatusUpdateDelayBin3
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNStatusUpdateDelayBin4:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_nStatusUpdateDelayBin4 = a3;
}

- (void)setHasNStatusUpdateDelayBin4:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNStatusUpdateDelayBin4
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNStatusUpdateDelayBin5:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_nStatusUpdateDelayBin5 = a3;
}

- (void)setHasNStatusUpdateDelayBin5:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNStatusUpdateDelayBin5
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setNStatusUpdateDelayBin6:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_nStatusUpdateDelayBin6 = a3;
}

- (void)setHasNStatusUpdateDelayBin6:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($EE292F88160448F9DA85FB1B30B53481)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasNStatusUpdateDelayBin6
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWRMLinkPrefChange1;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWRMLinkPrefChange1 description](&v3, sel_description), -[AWDWRMLinkPrefChange1 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $EE292F88160448F9DA85FB1B30B53481 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_count), CFSTR("count"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nCallIdle), CFSTR("nCallIdle"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nCallActive), CFSTR("nCallActive"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nData), CFSTR("nData"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nVoice), CFSTR("nVoice"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nStationary), CFSTR("nStationary"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWalking), CFSTR("nWalking"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nRunning), CFSTR("nRunning"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nVehicular), CFSTR("nVehicular"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiNotInit), CFSTR("nWifiNotInit"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiNotReady), CFSTR("nWifiNotReady"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiBadSNR), CFSTR("nWifiBadSNR"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiBadRSSI), CFSTR("nWifiBadRSSI"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiBadPER), CFSTR("nWifiBadPER"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiBadTransportSymptom), CFSTR("nWifiBadTransportSymptom"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiBadTransportRTP), CFSTR("nWifiBadTransportRTP"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiBadLoad), CFSTR("nWifiBadLoad"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nWifiBadBcn), CFSTR("nWifiBadBcn"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nCellularGood), CFSTR("nCellularGood"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nPositiveStatusUpdate), CFSTR("nPositiveStatusUpdate"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nNegativeStatusUpdate), CFSTR("nNegativeStatusUpdate"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nUnknownStatusUpdat), CFSTR("nUnknownStatusUpdat"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nStatusUpdateDelayBin1), CFSTR("nStatusUpdateDelayBin1"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nStatusUpdateDelayBin2), CFSTR("nStatusUpdateDelayBin2"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nStatusUpdateDelayBin3), CFSTR("nStatusUpdateDelayBin3"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_29;
LABEL_59:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nStatusUpdateDelayBin5), CFSTR("nStatusUpdateDelayBin5"));
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      return v3;
    goto LABEL_30;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nStatusUpdateDelayBin4), CFSTR("nStatusUpdateDelayBin4"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
    goto LABEL_59;
LABEL_29:
  if ((*(_WORD *)&has & 0x8000) != 0)
LABEL_30:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nStatusUpdateDelayBin6), CFSTR("nStatusUpdateDelayBin6"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMLinkPrefChange1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $EE292F88160448F9DA85FB1B30B53481 has;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x8000) == 0)
      return;
LABEL_59:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
    goto LABEL_59;
}

- (void)copyTo:(id)a3
{
  $EE292F88160448F9DA85FB1B30B53481 has;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 32) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_count;
  *((_DWORD *)a3 + 32) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 6) = self->_nCallIdle;
  *((_DWORD *)a3 + 32) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 5) = self->_nCallActive;
  *((_DWORD *)a3 + 32) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 8) = self->_nData;
  *((_DWORD *)a3 + 32) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 21) = self->_nVoice;
  *((_DWORD *)a3 + 32) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 12) = self->_nStationary;
  *((_DWORD *)a3 + 32) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 22) = self->_nWalking;
  *((_DWORD *)a3 + 32) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 11) = self->_nRunning;
  *((_DWORD *)a3 + 32) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 20) = self->_nVehicular;
  *((_DWORD *)a3 + 32) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 30) = self->_nWifiNotInit;
  *((_DWORD *)a3 + 32) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 31) = self->_nWifiNotReady;
  *((_DWORD *)a3 + 32) |= 0x10000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 27) = self->_nWifiBadSNR;
  *((_DWORD *)a3 + 32) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 26) = self->_nWifiBadRSSI;
  *((_DWORD *)a3 + 32) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 25) = self->_nWifiBadPER;
  *((_DWORD *)a3 + 32) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 29) = self->_nWifiBadTransportSymptom;
  *((_DWORD *)a3 + 32) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 28) = self->_nWifiBadTransportRTP;
  *((_DWORD *)a3 + 32) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 24) = self->_nWifiBadLoad;
  *((_DWORD *)a3 + 32) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 23) = self->_nWifiBadBcn;
  *((_DWORD *)a3 + 32) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 7) = self->_nCellularGood;
  *((_DWORD *)a3 + 32) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 10) = self->_nPositiveStatusUpdate;
  *((_DWORD *)a3 + 32) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 9) = self->_nNegativeStatusUpdate;
  *((_DWORD *)a3 + 32) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 19) = self->_nUnknownStatusUpdat;
  *((_DWORD *)a3 + 32) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 13) = self->_nStatusUpdateDelayBin1;
  *((_DWORD *)a3 + 32) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 14) = self->_nStatusUpdateDelayBin2;
  *((_DWORD *)a3 + 32) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 15) = self->_nStatusUpdateDelayBin3;
  *((_DWORD *)a3 + 32) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 16) = self->_nStatusUpdateDelayBin4;
  *((_DWORD *)a3 + 32) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x8000) == 0)
      return;
LABEL_59:
    *((_DWORD *)a3 + 18) = self->_nStatusUpdateDelayBin6;
    *((_DWORD *)a3 + 32) |= 0x8000u;
    return;
  }
LABEL_58:
  *((_DWORD *)a3 + 17) = self->_nStatusUpdateDelayBin5;
  *((_DWORD *)a3 + 32) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
    goto LABEL_59;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $EE292F88160448F9DA85FB1B30B53481 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 32) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_count;
  *((_DWORD *)result + 32) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 6) = self->_nCallIdle;
  *((_DWORD *)result + 32) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 5) = self->_nCallActive;
  *((_DWORD *)result + 32) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 8) = self->_nData;
  *((_DWORD *)result + 32) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 21) = self->_nVoice;
  *((_DWORD *)result + 32) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 12) = self->_nStationary;
  *((_DWORD *)result + 32) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 22) = self->_nWalking;
  *((_DWORD *)result + 32) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 11) = self->_nRunning;
  *((_DWORD *)result + 32) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 20) = self->_nVehicular;
  *((_DWORD *)result + 32) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 30) = self->_nWifiNotInit;
  *((_DWORD *)result + 32) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 31) = self->_nWifiNotReady;
  *((_DWORD *)result + 32) |= 0x10000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 27) = self->_nWifiBadSNR;
  *((_DWORD *)result + 32) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 26) = self->_nWifiBadRSSI;
  *((_DWORD *)result + 32) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 25) = self->_nWifiBadPER;
  *((_DWORD *)result + 32) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 29) = self->_nWifiBadTransportSymptom;
  *((_DWORD *)result + 32) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 28) = self->_nWifiBadTransportRTP;
  *((_DWORD *)result + 32) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 24) = self->_nWifiBadLoad;
  *((_DWORD *)result + 32) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 23) = self->_nWifiBadBcn;
  *((_DWORD *)result + 32) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 7) = self->_nCellularGood;
  *((_DWORD *)result + 32) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 10) = self->_nPositiveStatusUpdate;
  *((_DWORD *)result + 32) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 9) = self->_nNegativeStatusUpdate;
  *((_DWORD *)result + 32) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 19) = self->_nUnknownStatusUpdat;
  *((_DWORD *)result + 32) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 13) = self->_nStatusUpdateDelayBin1;
  *((_DWORD *)result + 32) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)result + 14) = self->_nStatusUpdateDelayBin2;
  *((_DWORD *)result + 32) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)result + 15) = self->_nStatusUpdateDelayBin3;
  *((_DWORD *)result + 32) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_29;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)result + 16) = self->_nStatusUpdateDelayBin4;
  *((_DWORD *)result + 32) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x8000) == 0)
      return result;
    goto LABEL_30;
  }
LABEL_59:
  *((_DWORD *)result + 17) = self->_nStatusUpdateDelayBin5;
  *((_DWORD *)result + 32) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
    return result;
LABEL_30:
  *((_DWORD *)result + 18) = self->_nStatusUpdateDelayBin6;
  *((_DWORD *)result + 32) |= 0x8000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $EE292F88160448F9DA85FB1B30B53481 has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 32);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_146;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_146:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_count != *((_DWORD *)a3 + 4))
        goto LABEL_146;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_nCallIdle != *((_DWORD *)a3 + 6))
        goto LABEL_146;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_nCallActive != *((_DWORD *)a3 + 5))
        goto LABEL_146;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_nData != *((_DWORD *)a3 + 8))
        goto LABEL_146;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_nVoice != *((_DWORD *)a3 + 21))
        goto LABEL_146;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_nStationary != *((_DWORD *)a3 + 12))
        goto LABEL_146;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_nWalking != *((_DWORD *)a3 + 22))
        goto LABEL_146;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_nRunning != *((_DWORD *)a3 + 11))
        goto LABEL_146;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_nVehicular != *((_DWORD *)a3 + 20))
        goto LABEL_146;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_nWifiNotInit != *((_DWORD *)a3 + 30))
        goto LABEL_146;
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_nWifiNotReady != *((_DWORD *)a3 + 31))
        goto LABEL_146;
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_nWifiBadSNR != *((_DWORD *)a3 + 27))
        goto LABEL_146;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_nWifiBadRSSI != *((_DWORD *)a3 + 26))
        goto LABEL_146;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_nWifiBadPER != *((_DWORD *)a3 + 25))
        goto LABEL_146;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_nWifiBadTransportSymptom != *((_DWORD *)a3 + 29))
        goto LABEL_146;
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_nWifiBadTransportRTP != *((_DWORD *)a3 + 28))
        goto LABEL_146;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_nWifiBadLoad != *((_DWORD *)a3 + 24))
        goto LABEL_146;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_nWifiBadBcn != *((_DWORD *)a3 + 23))
        goto LABEL_146;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_nCellularGood != *((_DWORD *)a3 + 7))
        goto LABEL_146;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_nPositiveStatusUpdate != *((_DWORD *)a3 + 10))
        goto LABEL_146;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_nNegativeStatusUpdate != *((_DWORD *)a3 + 9))
        goto LABEL_146;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_nUnknownStatusUpdat != *((_DWORD *)a3 + 19))
        goto LABEL_146;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_nStatusUpdateDelayBin1 != *((_DWORD *)a3 + 13))
        goto LABEL_146;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_nStatusUpdateDelayBin2 != *((_DWORD *)a3 + 14))
        goto LABEL_146;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_nStatusUpdateDelayBin3 != *((_DWORD *)a3 + 15))
        goto LABEL_146;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_nStatusUpdateDelayBin4 != *((_DWORD *)a3 + 16))
        goto LABEL_146;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_146;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_nStatusUpdateDelayBin5 != *((_DWORD *)a3 + 17))
        goto LABEL_146;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_146;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 32) & 0x8000) == 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_nStatusUpdateDelayBin6 != *((_DWORD *)a3 + 18))
        goto LABEL_146;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $EE292F88160448F9DA85FB1B30B53481 has;
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
  uint64_t v29;
  uint64_t v31;
  unint64_t v32;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v32 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v31 = 2654435761 * self->_count;
      if ((*(_BYTE *)&has & 8) != 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v31 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_4:
    v3 = 2654435761 * self->_nCallIdle;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  v3 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_nCallActive;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_nData;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_nVoice;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  v6 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_8:
    v7 = 2654435761 * self->_nStationary;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_nWalking;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  v8 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v9 = 2654435761 * self->_nRunning;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_11:
    v10 = 2654435761 * self->_nVehicular;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_12:
    v11 = 2654435761 * self->_nWifiNotInit;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_13:
    v12 = 2654435761 * self->_nWifiNotReady;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_14:
    v13 = 2654435761 * self->_nWifiBadSNR;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_15:
    v14 = 2654435761 * self->_nWifiBadRSSI;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_16:
    v15 = 2654435761 * self->_nWifiBadPER;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_17:
    v16 = 2654435761 * self->_nWifiBadTransportSymptom;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_18:
    v17 = 2654435761 * self->_nWifiBadTransportRTP;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_19:
    v18 = 2654435761 * self->_nWifiBadLoad;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_20:
    v19 = 2654435761 * self->_nWifiBadBcn;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  v19 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_21:
    v20 = 2654435761 * self->_nCellularGood;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_22:
    v21 = 2654435761 * self->_nPositiveStatusUpdate;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_23:
    v22 = 2654435761 * self->_nNegativeStatusUpdate;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_24:
    v23 = 2654435761 * self->_nUnknownStatusUpdat;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  v23 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_25:
    v24 = 2654435761 * self->_nStatusUpdateDelayBin1;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  v24 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_26:
    v25 = 2654435761 * self->_nStatusUpdateDelayBin2;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  v25 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_27:
    v26 = 2654435761 * self->_nStatusUpdateDelayBin3;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  v26 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_28:
    v27 = 2654435761 * self->_nStatusUpdateDelayBin4;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_29;
LABEL_58:
    v28 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_30;
LABEL_59:
    v29 = 0;
    return v31 ^ v32 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_57:
  v27 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0)
    goto LABEL_58;
LABEL_29:
  v28 = 2654435761 * self->_nStatusUpdateDelayBin5;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_59;
LABEL_30:
  v29 = 2654435761 * self->_nStatusUpdateDelayBin6;
  return v31 ^ v32 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v3 = *((_DWORD *)a3 + 32);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_count = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  self->_nCallIdle = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  self->_nCallActive = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  self->_nData = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x40000) == 0)
  {
LABEL_7:
    if ((v3 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  self->_nVoice = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x200) == 0)
  {
LABEL_8:
    if ((v3 & 0x80000) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  self->_nStationary = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x80000) == 0)
  {
LABEL_9:
    if ((v3 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  self->_nWalking = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x80000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x100) == 0)
  {
LABEL_10:
    if ((v3 & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  self->_nRunning = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x20000) == 0)
  {
LABEL_11:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  self->_nVehicular = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_12:
    if ((v3 & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  self->_nWifiNotInit = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_13:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  self->_nWifiNotReady = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x10000000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_14:
    if ((v3 & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  self->_nWifiBadSNR = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x800000) == 0)
  {
LABEL_15:
    if ((v3 & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  self->_nWifiBadRSSI = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x800000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x400000) == 0)
  {
LABEL_16:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  self->_nWifiBadPER = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x400000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_17:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  self->_nWifiBadTransportSymptom = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_18:
    if ((v3 & 0x200000) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  self->_nWifiBadTransportRTP = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x200000) == 0)
  {
LABEL_19:
    if ((v3 & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  self->_nWifiBadLoad = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x200000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x100000) == 0)
  {
LABEL_20:
    if ((v3 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  self->_nWifiBadBcn = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x100000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_21:
    if ((v3 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  self->_nCellularGood = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x80) == 0)
  {
LABEL_22:
    if ((v3 & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  self->_nPositiveStatusUpdate = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x40) == 0)
  {
LABEL_23:
    if ((v3 & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  self->_nNegativeStatusUpdate = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x10000) == 0)
  {
LABEL_24:
    if ((v3 & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  self->_nUnknownStatusUpdat = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x400) == 0)
  {
LABEL_25:
    if ((v3 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  self->_nStatusUpdateDelayBin1 = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x800) == 0)
  {
LABEL_26:
    if ((v3 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  self->_nStatusUpdateDelayBin2 = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x1000) == 0)
  {
LABEL_27:
    if ((v3 & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  self->_nStatusUpdateDelayBin3 = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x2000) == 0)
  {
LABEL_28:
    if ((v3 & 0x4000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  self->_nStatusUpdateDelayBin4 = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 32);
  if ((v3 & 0x4000) == 0)
  {
LABEL_29:
    if ((v3 & 0x8000) == 0)
      return;
LABEL_59:
    self->_nStatusUpdateDelayBin6 = *((_DWORD *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x8000u;
    return;
  }
LABEL_58:
  self->_nStatusUpdateDelayBin5 = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)a3 + 32) & 0x8000) != 0)
    goto LABEL_59;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)count
{
  return self->_count;
}

- (unsigned)nCallIdle
{
  return self->_nCallIdle;
}

- (unsigned)nCallActive
{
  return self->_nCallActive;
}

- (unsigned)nData
{
  return self->_nData;
}

- (unsigned)nVoice
{
  return self->_nVoice;
}

- (unsigned)nStationary
{
  return self->_nStationary;
}

- (unsigned)nWalking
{
  return self->_nWalking;
}

- (unsigned)nRunning
{
  return self->_nRunning;
}

- (unsigned)nVehicular
{
  return self->_nVehicular;
}

- (unsigned)nWifiNotInit
{
  return self->_nWifiNotInit;
}

- (unsigned)nWifiNotReady
{
  return self->_nWifiNotReady;
}

- (unsigned)nWifiBadSNR
{
  return self->_nWifiBadSNR;
}

- (unsigned)nWifiBadRSSI
{
  return self->_nWifiBadRSSI;
}

- (unsigned)nWifiBadPER
{
  return self->_nWifiBadPER;
}

- (unsigned)nWifiBadTransportSymptom
{
  return self->_nWifiBadTransportSymptom;
}

- (unsigned)nWifiBadTransportRTP
{
  return self->_nWifiBadTransportRTP;
}

- (unsigned)nWifiBadLoad
{
  return self->_nWifiBadLoad;
}

- (unsigned)nWifiBadBcn
{
  return self->_nWifiBadBcn;
}

- (unsigned)nCellularGood
{
  return self->_nCellularGood;
}

- (unsigned)nPositiveStatusUpdate
{
  return self->_nPositiveStatusUpdate;
}

- (unsigned)nNegativeStatusUpdate
{
  return self->_nNegativeStatusUpdate;
}

- (unsigned)nUnknownStatusUpdat
{
  return self->_nUnknownStatusUpdat;
}

- (unsigned)nStatusUpdateDelayBin1
{
  return self->_nStatusUpdateDelayBin1;
}

- (unsigned)nStatusUpdateDelayBin2
{
  return self->_nStatusUpdateDelayBin2;
}

- (unsigned)nStatusUpdateDelayBin3
{
  return self->_nStatusUpdateDelayBin3;
}

- (unsigned)nStatusUpdateDelayBin4
{
  return self->_nStatusUpdateDelayBin4;
}

- (unsigned)nStatusUpdateDelayBin5
{
  return self->_nStatusUpdateDelayBin5;
}

- (unsigned)nStatusUpdateDelayBin6
{
  return self->_nStatusUpdateDelayBin6;
}

@end
