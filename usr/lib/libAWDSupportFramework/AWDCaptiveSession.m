@implementation AWDCaptiveSession

- (void)dealloc
{
  objc_super v3;

  -[AWDCaptiveSession setInstalledCNPDisplayIDs:](self, "setInstalledCNPDisplayIDs:", 0);
  -[AWDCaptiveSession setHandlerCNP:](self, "setHandlerCNP:", 0);
  -[AWDCaptiveSession setAutoLoginCarrierID:](self, "setAutoLoginCarrierID:", 0);
  -[AWDCaptiveSession setAppTriggeredPassiveSymptom:](self, "setAppTriggeredPassiveSymptom:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCaptiveSession;
  -[AWDCaptiveSession dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setResult:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasResult
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setWebsheetProbeCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_websheetProbeCount = a3;
}

- (void)setHasWebsheetProbeCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasWebsheetProbeCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setWebsheetScraped:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_websheetScraped = a3;
}

- (void)setHasWebsheetScraped:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasWebsheetScraped
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setWebsheetScrapeResult:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_websheetScrapeResult = a3;
}

- (void)setHasWebsheetScrapeResult:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasWebsheetScrapeResult
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearInstalledCNPDisplayIDs
{
  -[NSMutableArray removeAllObjects](self->_installedCNPDisplayIDs, "removeAllObjects");
}

- (void)addInstalledCNPDisplayIDs:(id)a3
{
  NSMutableArray *installedCNPDisplayIDs;

  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  if (!installedCNPDisplayIDs)
  {
    installedCNPDisplayIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_installedCNPDisplayIDs = installedCNPDisplayIDs;
  }
  -[NSMutableArray addObject:](installedCNPDisplayIDs, "addObject:", a3);
}

- (unint64_t)installedCNPDisplayIDsCount
{
  return -[NSMutableArray count](self->_installedCNPDisplayIDs, "count");
}

- (id)installedCNPDisplayIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_installedCNPDisplayIDs, "objectAtIndex:", a3);
}

+ (Class)installedCNPDisplayIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHandlerCNP
{
  return self->_handlerCNP != 0;
}

- (void)setDetectedNotCaptiveHandledByCNP:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_detectedNotCaptiveHandledByCNP = a3;
}

- (void)setHasDetectedNotCaptiveHandledByCNP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDetectedNotCaptiveHandledByCNP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAutoLoginType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_autoLoginType = a3;
}

- (void)setHasAutoLoginType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAutoLoginType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAutoLoginFailed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_autoLoginFailed = a3;
}

- (void)setHasAutoLoginFailed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAutoLoginFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasAutoLoginCarrierID
{
  return self->_autoLoginCarrierID != 0;
}

- (void)setWisprDetected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_wisprDetected = a3;
}

- (void)setHasWisprDetected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWisprDetected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPassiveCaptivityDetected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_passiveCaptivityDetected = a3;
}

- (void)setHasPassiveCaptivityDetected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPassiveCaptivityDetected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPassiveCaptivityCorrectDetection:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_passiveCaptivityCorrectDetection = a3;
}

- (void)setHasPassiveCaptivityCorrectDetection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPassiveCaptivityCorrectDetection
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPassiveCaptivityIncorrectDetection:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_passiveCaptivityIncorrectDetection = a3;
}

- (void)setHasPassiveCaptivityIncorrectDetection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPassiveCaptivityIncorrectDetection
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHandlerCNPTriggeredLogOff:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_handlerCNPTriggeredLogOff = a3;
}

- (void)setHasHandlerCNPTriggeredLogOff:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasHandlerCNPTriggeredLogOff
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsDetectedCaptive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isDetectedCaptive = a3;
}

- (void)setHasIsDetectedCaptive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsDetectedCaptive
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setDurationOnNetwork:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_durationOnNetwork = a3;
}

- (void)setHasDurationOnNetwork:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDurationOnNetwork
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDurationNetworkNotCaptive:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_durationNetworkNotCaptive = a3;
}

- (void)setHasDurationNetworkNotCaptive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDurationNetworkNotCaptive
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPassiveCaptivitySymptom:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_passiveCaptivitySymptom = a3;
}

- (void)setHasPassiveCaptivitySymptom:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasPassiveCaptivitySymptom
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppTriggeredPassiveSymptom
{
  return self->_appTriggeredPassiveSymptom != 0;
}

- (void)setNonCaptiveDetectedAsCaptive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_nonCaptiveDetectedAsCaptive = a3;
}

- (void)setHasNonCaptiveDetectedAsCaptive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasNonCaptiveDetectedAsCaptive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)redirectURLType
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_redirectURLType;
  else
    return 0;
}

- (void)setRedirectURLType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_redirectURLType = a3;
}

- (void)setHasRedirectURLType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRedirectURLType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)redirectURLTypeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D7F0[a3];
}

- (int)StringAsRedirectURLType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("REDIRECT_URLTYPE_NONE")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("REDIRECT_URLTYPE_HTTP")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("REDIRECT_URLTYPE_HTTPS_TRUSTED_CERTIFICATE")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("REDIRECT_URLTYPE_HTTPS_UNTRUSTED_CERTIFICATE")))
    return 3;
  return 0;
}

- (int)whiteListProbeStatus
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_whiteListProbeStatus;
  else
    return 0;
}

- (void)setWhiteListProbeStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_whiteListProbeStatus = a3;
}

- (void)setHasWhiteListProbeStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWhiteListProbeStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)whiteListProbeStatusAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D810[a3];
}

- (int)StringAsWhiteListProbeStatus:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WHITELIST_PROBE_STATUS_NOT_PROBED")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WHITELIST_PROBE_STATUS_NOT_CAPTIVE")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WHITELIST_PROBE_STATUS_DETECTED_IMMEDIATELY")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("WHITELIST_PROBE_STATUS_DETECTED_WHEN_TRIGGERED")))
    return 3;
  return 0;
}

- (void)setWhiteListProbeCompletionTime:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_whiteListProbeCompletionTime = a3;
}

- (void)setHasWhiteListProbeCompletionTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasWhiteListProbeCompletionTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCaptiveSession;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCaptiveSession description](&v3, sel_description), -[AWDCaptiveSession dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $141559A2C58CD4ACBDC768E89B51DA90 has;
  NSMutableArray *installedCNPDisplayIDs;
  NSString *handlerCNP;
  $141559A2C58CD4ACBDC768E89B51DA90 v7;
  NSString *autoLoginCarrierID;
  $141559A2C58CD4ACBDC768E89B51DA90 v9;
  NSString *appTriggeredPassiveSymptom;
  $141559A2C58CD4ACBDC768E89B51DA90 v11;
  uint64_t redirectURLType;
  __CFString *v14;
  uint64_t whiteListProbeStatus;
  __CFString *v16;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_result), CFSTR("result"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_websheetProbeCount), CFSTR("websheetProbeCount"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_websheetScraped), CFSTR("websheetScraped"));
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_websheetScrapeResult), CFSTR("websheetScrapeResult"));
LABEL_7:
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  if (installedCNPDisplayIDs)
    objc_msgSend(v3, "setObject:forKey:", installedCNPDisplayIDs, CFSTR("installedCNPDisplayIDs"));
  handlerCNP = self->_handlerCNP;
  if (handlerCNP)
    objc_msgSend(v3, "setObject:forKey:", handlerCNP, CFSTR("handlerCNP"));
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_detectedNotCaptiveHandledByCNP), CFSTR("detectedNotCaptiveHandledByCNP"));
    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 2) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&v7 & 0x2000) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&v7 & 2) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_autoLoginType), CFSTR("autoLoginType"));
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_autoLoginFailed), CFSTR("autoLoginFailed"));
LABEL_15:
  autoLoginCarrierID = self->_autoLoginCarrierID;
  if (autoLoginCarrierID)
    objc_msgSend(v3, "setObject:forKey:", autoLoginCarrierID, CFSTR("autoLoginCarrierID"));
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wisprDetected), CFSTR("wisprDetected"));
    v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x40000) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&v9 & 0x10) == 0)
        goto LABEL_20;
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_passiveCaptivityDetected), CFSTR("passiveCaptivityDetected"));
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v9 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_passiveCaptivityCorrectDetection), CFSTR("passiveCaptivityCorrectDetection"));
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v9 & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_passiveCaptivityIncorrectDetection), CFSTR("passiveCaptivityIncorrectDetection"));
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_handlerCNPTriggeredLogOff), CFSTR("handlerCNPTriggeredLogOff"));
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v9 & 8) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDetectedCaptive), CFSTR("isDetectedCaptive"));
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 8) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v9 & 4) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durationOnNetwork), CFSTR("durationOnNetwork"));
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 4) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v9 & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durationNetworkNotCaptive), CFSTR("durationNetworkNotCaptive"));
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_26:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_passiveCaptivitySymptom), CFSTR("passiveCaptivitySymptom"));
LABEL_27:
  appTriggeredPassiveSymptom = self->_appTriggeredPassiveSymptom;
  if (appTriggeredPassiveSymptom)
    objc_msgSend(v3, "setObject:forKey:", appTriggeredPassiveSymptom, CFSTR("appTriggeredPassiveSymptom"));
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_nonCaptiveDetectedAsCaptive), CFSTR("nonCaptiveDetectedAsCaptive"));
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x80) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v11 & 0x1000) == 0)
        goto LABEL_32;
LABEL_57:
      whiteListProbeStatus = self->_whiteListProbeStatus;
      if (whiteListProbeStatus >= 4)
        v16 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_whiteListProbeStatus);
      else
        v16 = off_24C10D810[whiteListProbeStatus];
      objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("whiteListProbeStatus"));
      if ((*(_DWORD *)&self->_has & 0x800) != 0)
        goto LABEL_33;
      return v3;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  redirectURLType = self->_redirectURLType;
  if (redirectURLType >= 4)
    v14 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_redirectURLType);
  else
    v14 = off_24C10D7F0[redirectURLType];
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("redirectURLType"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
    goto LABEL_57;
LABEL_32:
  if ((*(_WORD *)&v11 & 0x800) != 0)
LABEL_33:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_whiteListProbeCompletionTime), CFSTR("whiteListProbeCompletionTime"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCaptiveSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $141559A2C58CD4ACBDC768E89B51DA90 has;
  NSMutableArray *installedCNPDisplayIDs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $141559A2C58CD4ACBDC768E89B51DA90 v10;
  $141559A2C58CD4ACBDC768E89B51DA90 v11;
  $141559A2C58CD4ACBDC768E89B51DA90 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](installedCNPDisplayIDs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(installedCNPDisplayIDs);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](installedCNPDisplayIDs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  if (self->_handlerCNP)
    PBDataWriterWriteStringField();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_has;
    if ((*(_BYTE *)&v10 & 2) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&v10 & 0x2000) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&v10 & 2) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
LABEL_19:
    PBDataWriterWriteBOOLField();
LABEL_20:
  if (self->_autoLoginCarrierID)
    PBDataWriterWriteStringField();
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x40000) == 0)
    {
LABEL_24:
      if ((*(_BYTE *)&v11 & 0x10) == 0)
        goto LABEL_25;
      goto LABEL_50;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x40000) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteBOOLField();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x10) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v11 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v11 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v11 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v11 & 8) == 0)
      goto LABEL_29;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 8) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v11 & 4) == 0)
      goto LABEL_30;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 4) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v11 & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_31:
    PBDataWriterWriteUint32Field();
LABEL_32:
  if (self->_appTriggeredPassiveSymptom)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
    if ((*(_BYTE *)&v12 & 0x80) == 0)
    {
LABEL_36:
      if ((*(_WORD *)&v12 & 0x1000) == 0)
        goto LABEL_37;
      goto LABEL_59;
    }
  }
  else if ((*(_BYTE *)&v12 & 0x80) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v12 & 0x800) == 0)
      return;
    goto LABEL_38;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    return;
LABEL_38:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $141559A2C58CD4ACBDC768E89B51DA90 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  $141559A2C58CD4ACBDC768E89B51DA90 v9;
  $141559A2C58CD4ACBDC768E89B51DA90 v10;
  $141559A2C58CD4ACBDC768E89B51DA90 v11;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 27) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 20) = self->_result;
  *((_DWORD *)a3 + 27) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
LABEL_40:
    *((_BYTE *)a3 + 106) = self->_websheetScraped;
    *((_DWORD *)a3 + 27) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_39:
  *((_DWORD *)a3 + 21) = self->_websheetProbeCount;
  *((_DWORD *)a3 + 27) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
    goto LABEL_40;
LABEL_5:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 22) = self->_websheetScrapeResult;
    *((_DWORD *)a3 + 27) |= 0x400u;
  }
LABEL_7:
  if (-[AWDCaptiveSession installedCNPDisplayIDsCount](self, "installedCNPDisplayIDsCount"))
  {
    objc_msgSend(a3, "clearInstalledCNPDisplayIDs");
    v6 = -[AWDCaptiveSession installedCNPDisplayIDsCount](self, "installedCNPDisplayIDsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addInstalledCNPDisplayIDs:", -[AWDCaptiveSession installedCNPDisplayIDsAtIndex:](self, "installedCNPDisplayIDsAtIndex:", i));
    }
  }
  if (self->_handlerCNP)
    objc_msgSend(a3, "setHandlerCNP:");
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    *((_BYTE *)a3 + 101) = self->_detectedNotCaptiveHandledByCNP;
    *((_DWORD *)a3 + 27) |= 0x4000u;
    v9 = self->_has;
    if ((*(_BYTE *)&v9 & 2) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v9 & 0x2000) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&v9 & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 8) = self->_autoLoginType;
  *((_DWORD *)a3 + 27) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_16:
    *((_BYTE *)a3 + 100) = self->_autoLoginFailed;
    *((_DWORD *)a3 + 27) |= 0x2000u;
  }
LABEL_17:
  if (self->_autoLoginCarrierID)
    objc_msgSend(a3, "setAutoLoginCarrierID:");
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    *((_BYTE *)a3 + 107) = self->_wisprDetected;
    *((_DWORD *)a3 + 27) |= 0x100000u;
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x40000) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v10 & 0x10) == 0)
        goto LABEL_22;
      goto LABEL_47;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  *((_BYTE *)a3 + 105) = self->_passiveCaptivityDetected;
  *((_DWORD *)a3 + 27) |= 0x40000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x10) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v10 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 16) = self->_passiveCaptivityCorrectDetection;
  *((_DWORD *)a3 + 27) |= 0x10u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v10 & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 17) = self->_passiveCaptivityIncorrectDetection;
  *((_DWORD *)a3 + 27) |= 0x20u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v10 & 0x10000) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  *((_BYTE *)a3 + 102) = self->_handlerCNPTriggeredLogOff;
  *((_DWORD *)a3 + 27) |= 0x8000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v10 & 8) == 0)
      goto LABEL_26;
    goto LABEL_51;
  }
LABEL_50:
  *((_BYTE *)a3 + 103) = self->_isDetectedCaptive;
  *((_DWORD *)a3 + 27) |= 0x10000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v10 & 4) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 10) = self->_durationOnNetwork;
  *((_DWORD *)a3 + 27) |= 8u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 4) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v10 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_52:
  *((_DWORD *)a3 + 9) = self->_durationNetworkNotCaptive;
  *((_DWORD *)a3 + 27) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_28:
    *((_DWORD *)a3 + 18) = self->_passiveCaptivitySymptom;
    *((_DWORD *)a3 + 27) |= 0x40u;
  }
LABEL_29:
  if (self->_appTriggeredPassiveSymptom)
    objc_msgSend(a3, "setAppTriggeredPassiveSymptom:");
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    *((_BYTE *)a3 + 104) = self->_nonCaptiveDetectedAsCaptive;
    *((_DWORD *)a3 + 27) |= 0x20000u;
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x80) == 0)
    {
LABEL_33:
      if ((*(_WORD *)&v11 & 0x1000) == 0)
        goto LABEL_34;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x80) == 0)
  {
    goto LABEL_33;
  }
  *((_DWORD *)a3 + 19) = self->_redirectURLType;
  *((_DWORD *)a3 + 27) |= 0x80u;
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v11 & 0x800) == 0)
      return;
    goto LABEL_35;
  }
LABEL_56:
  *((_DWORD *)a3 + 24) = self->_whiteListProbeStatus;
  *((_DWORD *)a3 + 27) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    return;
LABEL_35:
  *((_DWORD *)a3 + 23) = self->_whiteListProbeCompletionTime;
  *((_DWORD *)a3 + 27) |= 0x800u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $141559A2C58CD4ACBDC768E89B51DA90 has;
  NSMutableArray *installedCNPDisplayIDs;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  $141559A2C58CD4ACBDC768E89B51DA90 v14;
  $141559A2C58CD4ACBDC768E89B51DA90 v15;
  $141559A2C58CD4ACBDC768E89B51DA90 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 108) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 80) = self->_result;
  *(_DWORD *)(v5 + 108) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 84) = self->_websheetProbeCount;
  *(_DWORD *)(v5 + 108) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_37:
  *(_BYTE *)(v5 + 106) = self->_websheetScraped;
  *(_DWORD *)(v5 + 108) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 88) = self->_websheetScrapeResult;
    *(_DWORD *)(v5 + 108) |= 0x400u;
  }
LABEL_7:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](installedCNPDisplayIDs, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(installedCNPDisplayIDs);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addInstalledCNPDisplayIDs:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](installedCNPDisplayIDs, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_handlerCNP, "copyWithZone:", a3);
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    *(_BYTE *)(v6 + 101) = self->_detectedNotCaptiveHandledByCNP;
    *(_DWORD *)(v6 + 108) |= 0x4000u;
    v14 = self->_has;
    if ((*(_BYTE *)&v14 & 2) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v14 & 0x2000) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&v14 & 2) == 0)
  {
    goto LABEL_16;
  }
  *(_DWORD *)(v6 + 32) = self->_autoLoginType;
  *(_DWORD *)(v6 + 108) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_17:
    *(_BYTE *)(v6 + 100) = self->_autoLoginFailed;
    *(_DWORD *)(v6 + 108) |= 0x2000u;
  }
LABEL_18:

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_autoLoginCarrierID, "copyWithZone:", a3);
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x100000) != 0)
  {
    *(_BYTE *)(v6 + 107) = self->_wisprDetected;
    *(_DWORD *)(v6 + 108) |= 0x100000u;
    v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x40000) == 0)
    {
LABEL_20:
      if ((*(_BYTE *)&v15 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x40000) == 0)
  {
    goto LABEL_20;
  }
  *(_BYTE *)(v6 + 105) = self->_passiveCaptivityDetected;
  *(_DWORD *)(v6 + 108) |= 0x40000u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x10) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v15 & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 64) = self->_passiveCaptivityCorrectDetection;
  *(_DWORD *)(v6 + 108) |= 0x10u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x20) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v15 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 68) = self->_passiveCaptivityIncorrectDetection;
  *(_DWORD *)(v6 + 108) |= 0x20u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v15 & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  *(_BYTE *)(v6 + 102) = self->_handlerCNPTriggeredLogOff;
  *(_DWORD *)(v6 + 108) |= 0x8000u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v15 & 8) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(v6 + 103) = self->_isDetectedCaptive;
  *(_DWORD *)(v6 + 108) |= 0x10000u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 8) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v15 & 4) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 40) = self->_durationOnNetwork;
  *(_DWORD *)(v6 + 108) |= 8u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 4) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v15 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_49:
  *(_DWORD *)(v6 + 36) = self->_durationNetworkNotCaptive;
  *(_DWORD *)(v6 + 108) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    *(_DWORD *)(v6 + 72) = self->_passiveCaptivitySymptom;
    *(_DWORD *)(v6 + 108) |= 0x40u;
  }
LABEL_28:

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_appTriggeredPassiveSymptom, "copyWithZone:", a3);
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    *(_BYTE *)(v6 + 104) = self->_nonCaptiveDetectedAsCaptive;
    *(_DWORD *)(v6 + 108) |= 0x20000u;
    v16 = self->_has;
    if ((*(_BYTE *)&v16 & 0x80) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v16 & 0x1000) == 0)
        goto LABEL_31;
LABEL_53:
      *(_DWORD *)(v6 + 96) = self->_whiteListProbeStatus;
      *(_DWORD *)(v6 + 108) |= 0x1000u;
      if ((*(_DWORD *)&self->_has & 0x800) == 0)
        return (id)v6;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&v16 & 0x80) == 0)
  {
    goto LABEL_30;
  }
  *(_DWORD *)(v6 + 76) = self->_redirectURLType;
  *(_DWORD *)(v6 + 108) |= 0x80u;
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x1000) != 0)
    goto LABEL_53;
LABEL_31:
  if ((*(_WORD *)&v16 & 0x800) != 0)
  {
LABEL_32:
    *(_DWORD *)(v6 + 92) = self->_whiteListProbeCompletionTime;
    *(_DWORD *)(v6 + 108) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $141559A2C58CD4ACBDC768E89B51DA90 has;
  int v7;
  NSMutableArray *installedCNPDisplayIDs;
  NSString *handlerCNP;
  $141559A2C58CD4ACBDC768E89B51DA90 v10;
  int v11;
  NSString *autoLoginCarrierID;
  int v13;
  NSString *appTriggeredPassiveSymptom;
  int v15;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *((_DWORD *)a3 + 27);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_140;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_result != *((_DWORD *)a3 + 20))
      goto LABEL_140;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_websheetProbeCount != *((_DWORD *)a3 + 21))
      goto LABEL_140;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0)
      goto LABEL_140;
    if (self->_websheetScraped)
    {
      if (!*((_BYTE *)a3 + 106))
        goto LABEL_140;
    }
    else if (*((_BYTE *)a3 + 106))
    {
      goto LABEL_140;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_websheetScrapeResult != *((_DWORD *)a3 + 22))
      goto LABEL_140;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_140;
  }
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  if (!((unint64_t)installedCNPDisplayIDs | *((_QWORD *)a3 + 7))
    || (v5 = -[NSMutableArray isEqual:](installedCNPDisplayIDs, "isEqual:")) != 0)
  {
    handlerCNP = self->_handlerCNP;
    if (!((unint64_t)handlerCNP | *((_QWORD *)a3 + 6))
      || (v5 = -[NSString isEqual:](handlerCNP, "isEqual:")) != 0)
    {
      v10 = self->_has;
      v11 = *((_DWORD *)a3 + 27);
      if ((*(_WORD *)&v10 & 0x4000) != 0)
      {
        if ((v11 & 0x4000) == 0)
          goto LABEL_140;
        if (self->_detectedNotCaptiveHandledByCNP)
        {
          if (!*((_BYTE *)a3 + 101))
            goto LABEL_140;
        }
        else if (*((_BYTE *)a3 + 101))
        {
          goto LABEL_140;
        }
      }
      else if ((v11 & 0x4000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_BYTE *)&v10 & 2) != 0)
      {
        if ((v11 & 2) == 0 || self->_autoLoginType != *((_DWORD *)a3 + 8))
          goto LABEL_140;
      }
      else if ((v11 & 2) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_WORD *)&v10 & 0x2000) != 0)
      {
        if ((v11 & 0x2000) == 0)
          goto LABEL_140;
        if (self->_autoLoginFailed)
        {
          if (!*((_BYTE *)a3 + 100))
            goto LABEL_140;
        }
        else if (*((_BYTE *)a3 + 100))
        {
          goto LABEL_140;
        }
      }
      else if ((v11 & 0x2000) != 0)
      {
        goto LABEL_140;
      }
      autoLoginCarrierID = self->_autoLoginCarrierID;
      if ((unint64_t)autoLoginCarrierID | *((_QWORD *)a3 + 3))
      {
        v5 = -[NSString isEqual:](autoLoginCarrierID, "isEqual:");
        if (!v5)
          return v5;
        v10 = self->_has;
      }
      v13 = *((_DWORD *)a3 + 27);
      if ((*(_DWORD *)&v10 & 0x100000) != 0)
      {
        if ((v13 & 0x100000) == 0)
          goto LABEL_140;
        if (self->_wisprDetected)
        {
          if (!*((_BYTE *)a3 + 107))
            goto LABEL_140;
        }
        else if (*((_BYTE *)a3 + 107))
        {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x100000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_DWORD *)&v10 & 0x40000) != 0)
      {
        if ((v13 & 0x40000) == 0)
          goto LABEL_140;
        if (self->_passiveCaptivityDetected)
        {
          if (!*((_BYTE *)a3 + 105))
            goto LABEL_140;
        }
        else if (*((_BYTE *)a3 + 105))
        {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x40000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_BYTE *)&v10 & 0x10) != 0)
      {
        if ((v13 & 0x10) == 0 || self->_passiveCaptivityCorrectDetection != *((_DWORD *)a3 + 16))
          goto LABEL_140;
      }
      else if ((v13 & 0x10) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_BYTE *)&v10 & 0x20) != 0)
      {
        if ((v13 & 0x20) == 0 || self->_passiveCaptivityIncorrectDetection != *((_DWORD *)a3 + 17))
          goto LABEL_140;
      }
      else if ((v13 & 0x20) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_WORD *)&v10 & 0x8000) != 0)
      {
        if ((v13 & 0x8000) == 0)
          goto LABEL_140;
        if (self->_handlerCNPTriggeredLogOff)
        {
          if (!*((_BYTE *)a3 + 102))
            goto LABEL_140;
        }
        else if (*((_BYTE *)a3 + 102))
        {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x8000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_DWORD *)&v10 & 0x10000) != 0)
      {
        if ((v13 & 0x10000) == 0)
          goto LABEL_140;
        if (self->_isDetectedCaptive)
        {
          if (!*((_BYTE *)a3 + 103))
            goto LABEL_140;
        }
        else if (*((_BYTE *)a3 + 103))
        {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x10000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_BYTE *)&v10 & 8) != 0)
      {
        if ((v13 & 8) == 0 || self->_durationOnNetwork != *((_DWORD *)a3 + 10))
          goto LABEL_140;
      }
      else if ((v13 & 8) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_BYTE *)&v10 & 4) != 0)
      {
        if ((v13 & 4) == 0 || self->_durationNetworkNotCaptive != *((_DWORD *)a3 + 9))
          goto LABEL_140;
      }
      else if ((v13 & 4) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_BYTE *)&v10 & 0x40) != 0)
      {
        if ((v13 & 0x40) == 0 || self->_passiveCaptivitySymptom != *((_DWORD *)a3 + 18))
          goto LABEL_140;
      }
      else if ((v13 & 0x40) != 0)
      {
        goto LABEL_140;
      }
      appTriggeredPassiveSymptom = self->_appTriggeredPassiveSymptom;
      if ((unint64_t)appTriggeredPassiveSymptom | *((_QWORD *)a3 + 2))
      {
        v5 = -[NSString isEqual:](appTriggeredPassiveSymptom, "isEqual:");
        if (!v5)
          return v5;
        v10 = self->_has;
      }
      v15 = *((_DWORD *)a3 + 27);
      if ((*(_DWORD *)&v10 & 0x20000) == 0)
      {
        if ((v15 & 0x20000) != 0)
          goto LABEL_140;
        goto LABEL_126;
      }
      if ((v15 & 0x20000) != 0)
      {
        if (self->_nonCaptiveDetectedAsCaptive)
        {
          if (!*((_BYTE *)a3 + 104))
            goto LABEL_140;
          goto LABEL_126;
        }
        if (!*((_BYTE *)a3 + 104))
        {
LABEL_126:
          if ((*(_BYTE *)&v10 & 0x80) != 0)
          {
            if ((v15 & 0x80) == 0 || self->_redirectURLType != *((_DWORD *)a3 + 19))
              goto LABEL_140;
          }
          else if ((v15 & 0x80) != 0)
          {
            goto LABEL_140;
          }
          if ((*(_WORD *)&v10 & 0x1000) != 0)
          {
            if ((v15 & 0x1000) == 0 || self->_whiteListProbeStatus != *((_DWORD *)a3 + 24))
              goto LABEL_140;
          }
          else if ((v15 & 0x1000) != 0)
          {
            goto LABEL_140;
          }
          LOBYTE(v5) = (*((_DWORD *)a3 + 27) & 0x800) == 0;
          if ((*(_WORD *)&v10 & 0x800) != 0)
          {
            if ((v15 & 0x800) == 0 || self->_whiteListProbeCompletionTime != *((_DWORD *)a3 + 23))
              goto LABEL_140;
            LOBYTE(v5) = 1;
          }
          return v5;
        }
      }
LABEL_140:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $141559A2C58CD4ACBDC768E89B51DA90 has;
  $141559A2C58CD4ACBDC768E89B51DA90 v4;
  $141559A2C58CD4ACBDC768E89B51DA90 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  $141559A2C58CD4ACBDC768E89B51DA90 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v32 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      v31 = 2654435761 * self->_result;
      if ((*(_WORD *)&has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_3;
  }
  v31 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_4:
    v30 = 2654435761 * self->_websheetProbeCount;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_5;
LABEL_10:
    v29 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0)
    goto LABEL_10;
LABEL_5:
  v29 = 2654435761 * self->_websheetScraped;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    v28 = 2654435761 * self->_websheetScrapeResult;
    goto LABEL_12;
  }
LABEL_11:
  v28 = 0;
LABEL_12:
  v27 = -[NSMutableArray hash](self->_installedCNPDisplayIDs, "hash");
  v26 = -[NSString hash](self->_handlerCNP, "hash");
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
  {
    v25 = 0;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_14;
LABEL_17:
    v24 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_18;
  }
  v25 = 2654435761 * self->_detectedNotCaptiveHandledByCNP;
  if ((*(_BYTE *)&v4 & 2) == 0)
    goto LABEL_17;
LABEL_14:
  v24 = 2654435761 * self->_autoLoginType;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_15:
    v23 = 2654435761 * self->_autoLoginFailed;
    goto LABEL_19;
  }
LABEL_18:
  v23 = 0;
LABEL_19:
  v22 = -[NSString hash](self->_autoLoginCarrierID, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    v21 = 2654435761 * self->_wisprDetected;
    if ((*(_DWORD *)&v5 & 0x40000) != 0)
    {
LABEL_21:
      v20 = 2654435761 * self->_passiveCaptivityDetected;
      if ((*(_BYTE *)&v5 & 0x10) != 0)
        goto LABEL_22;
      goto LABEL_31;
    }
  }
  else
  {
    v21 = 0;
    if ((*(_DWORD *)&v5 & 0x40000) != 0)
      goto LABEL_21;
  }
  v20 = 0;
  if ((*(_BYTE *)&v5 & 0x10) != 0)
  {
LABEL_22:
    v6 = 2654435761 * self->_passiveCaptivityCorrectDetection;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
      goto LABEL_23;
    goto LABEL_32;
  }
LABEL_31:
  v6 = 0;
  if ((*(_BYTE *)&v5 & 0x20) != 0)
  {
LABEL_23:
    v7 = 2654435761 * self->_passiveCaptivityIncorrectDetection;
    if ((*(_WORD *)&v5 & 0x8000) != 0)
      goto LABEL_24;
    goto LABEL_33;
  }
LABEL_32:
  v7 = 0;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
LABEL_24:
    v8 = 2654435761 * self->_handlerCNPTriggeredLogOff;
    if ((*(_DWORD *)&v5 & 0x10000) != 0)
      goto LABEL_25;
    goto LABEL_34;
  }
LABEL_33:
  v8 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_25:
    v9 = 2654435761 * self->_isDetectedCaptive;
    if ((*(_BYTE *)&v5 & 8) != 0)
      goto LABEL_26;
    goto LABEL_35;
  }
LABEL_34:
  v9 = 0;
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
LABEL_26:
    v10 = 2654435761 * self->_durationOnNetwork;
    if ((*(_BYTE *)&v5 & 4) != 0)
      goto LABEL_27;
LABEL_36:
    v11 = 0;
    if ((*(_BYTE *)&v5 & 0x40) != 0)
      goto LABEL_28;
    goto LABEL_37;
  }
LABEL_35:
  v10 = 0;
  if ((*(_BYTE *)&v5 & 4) == 0)
    goto LABEL_36;
LABEL_27:
  v11 = 2654435761 * self->_durationNetworkNotCaptive;
  if ((*(_BYTE *)&v5 & 0x40) != 0)
  {
LABEL_28:
    v12 = 2654435761 * self->_passiveCaptivitySymptom;
    goto LABEL_38;
  }
LABEL_37:
  v12 = 0;
LABEL_38:
  v13 = -[NSString hash](self->_appTriggeredPassiveSymptom, "hash");
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    v15 = 2654435761 * self->_nonCaptiveDetectedAsCaptive;
    if ((*(_BYTE *)&v14 & 0x80) != 0)
    {
LABEL_40:
      v16 = 2654435761 * self->_redirectURLType;
      if ((*(_WORD *)&v14 & 0x1000) != 0)
        goto LABEL_41;
LABEL_45:
      v17 = 0;
      if ((*(_WORD *)&v14 & 0x800) != 0)
        goto LABEL_42;
LABEL_46:
      v18 = 0;
      return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
    }
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&v14 & 0x80) != 0)
      goto LABEL_40;
  }
  v16 = 0;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
    goto LABEL_45;
LABEL_41:
  v17 = 2654435761 * self->_whiteListProbeStatus;
  if ((*(_WORD *)&v14 & 0x800) == 0)
    goto LABEL_46;
LABEL_42:
  v18 = 2654435761 * self->_whiteListProbeCompletionTime;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = *((_DWORD *)a3 + 27);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)a3 + 27);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_result = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 27);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  self->_websheetProbeCount = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 27);
  if ((v5 & 0x80000) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_43:
  self->_websheetScraped = *((_BYTE *)a3 + 106);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 27) & 0x400) != 0)
  {
LABEL_6:
    self->_websheetScrapeResult = *((_DWORD *)a3 + 22);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_7:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 7);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[AWDCaptiveSession addInstalledCNPDisplayIDs:](self, "addInstalledCNPDisplayIDs:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDCaptiveSession setHandlerCNP:](self, "setHandlerCNP:");
  v11 = *((_DWORD *)a3 + 27);
  if ((v11 & 0x4000) != 0)
  {
    self->_detectedNotCaptiveHandledByCNP = *((_BYTE *)a3 + 101);
    *(_DWORD *)&self->_has |= 0x4000u;
    v11 = *((_DWORD *)a3 + 27);
    if ((v11 & 2) == 0)
    {
LABEL_18:
      if ((v11 & 0x2000) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_18;
  }
  self->_autoLoginType = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 27) & 0x2000) != 0)
  {
LABEL_19:
    self->_autoLoginFailed = *((_BYTE *)a3 + 100);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_20:
  if (*((_QWORD *)a3 + 3))
    -[AWDCaptiveSession setAutoLoginCarrierID:](self, "setAutoLoginCarrierID:");
  v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x100000) != 0)
  {
    self->_wisprDetected = *((_BYTE *)a3 + 107);
    *(_DWORD *)&self->_has |= 0x100000u;
    v12 = *((_DWORD *)a3 + 27);
    if ((v12 & 0x40000) == 0)
    {
LABEL_24:
      if ((v12 & 0x10) == 0)
        goto LABEL_25;
      goto LABEL_50;
    }
  }
  else if ((v12 & 0x40000) == 0)
  {
    goto LABEL_24;
  }
  self->_passiveCaptivityDetected = *((_BYTE *)a3 + 105);
  *(_DWORD *)&self->_has |= 0x40000u;
  v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x10) == 0)
  {
LABEL_25:
    if ((v12 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_51;
  }
LABEL_50:
  self->_passiveCaptivityCorrectDetection = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x10u;
  v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x20) == 0)
  {
LABEL_26:
    if ((v12 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_51:
  self->_passiveCaptivityIncorrectDetection = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x20u;
  v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x8000) == 0)
  {
LABEL_27:
    if ((v12 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_53;
  }
LABEL_52:
  self->_handlerCNPTriggeredLogOff = *((_BYTE *)a3 + 102);
  *(_DWORD *)&self->_has |= 0x8000u;
  v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x10000) == 0)
  {
LABEL_28:
    if ((v12 & 8) == 0)
      goto LABEL_29;
    goto LABEL_54;
  }
LABEL_53:
  self->_isDetectedCaptive = *((_BYTE *)a3 + 103);
  *(_DWORD *)&self->_has |= 0x10000u;
  v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 8) == 0)
  {
LABEL_29:
    if ((v12 & 4) == 0)
      goto LABEL_30;
    goto LABEL_55;
  }
LABEL_54:
  self->_durationOnNetwork = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 8u;
  v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 4) == 0)
  {
LABEL_30:
    if ((v12 & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_55:
  self->_durationNetworkNotCaptive = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)a3 + 27) & 0x40) != 0)
  {
LABEL_31:
    self->_passiveCaptivitySymptom = *((_DWORD *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_32:
  if (*((_QWORD *)a3 + 2))
    -[AWDCaptiveSession setAppTriggeredPassiveSymptom:](self, "setAppTriggeredPassiveSymptom:");
  v13 = *((_DWORD *)a3 + 27);
  if ((v13 & 0x20000) != 0)
  {
    self->_nonCaptiveDetectedAsCaptive = *((_BYTE *)a3 + 104);
    *(_DWORD *)&self->_has |= 0x20000u;
    v13 = *((_DWORD *)a3 + 27);
    if ((v13 & 0x80) == 0)
    {
LABEL_36:
      if ((v13 & 0x1000) == 0)
        goto LABEL_37;
      goto LABEL_59;
    }
  }
  else if ((v13 & 0x80) == 0)
  {
    goto LABEL_36;
  }
  self->_redirectURLType = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x80u;
  v13 = *((_DWORD *)a3 + 27);
  if ((v13 & 0x1000) == 0)
  {
LABEL_37:
    if ((v13 & 0x800) == 0)
      return;
    goto LABEL_38;
  }
LABEL_59:
  self->_whiteListProbeStatus = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)a3 + 27) & 0x800) == 0)
    return;
LABEL_38:
  self->_whiteListProbeCompletionTime = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x800u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)websheetProbeCount
{
  return self->_websheetProbeCount;
}

- (BOOL)websheetScraped
{
  return self->_websheetScraped;
}

- (unsigned)websheetScrapeResult
{
  return self->_websheetScrapeResult;
}

- (NSMutableArray)installedCNPDisplayIDs
{
  return self->_installedCNPDisplayIDs;
}

- (void)setInstalledCNPDisplayIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)handlerCNP
{
  return self->_handlerCNP;
}

- (void)setHandlerCNP:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)detectedNotCaptiveHandledByCNP
{
  return self->_detectedNotCaptiveHandledByCNP;
}

- (unsigned)autoLoginType
{
  return self->_autoLoginType;
}

- (BOOL)autoLoginFailed
{
  return self->_autoLoginFailed;
}

- (NSString)autoLoginCarrierID
{
  return self->_autoLoginCarrierID;
}

- (void)setAutoLoginCarrierID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)wisprDetected
{
  return self->_wisprDetected;
}

- (BOOL)passiveCaptivityDetected
{
  return self->_passiveCaptivityDetected;
}

- (unsigned)passiveCaptivityCorrectDetection
{
  return self->_passiveCaptivityCorrectDetection;
}

- (unsigned)passiveCaptivityIncorrectDetection
{
  return self->_passiveCaptivityIncorrectDetection;
}

- (BOOL)handlerCNPTriggeredLogOff
{
  return self->_handlerCNPTriggeredLogOff;
}

- (BOOL)isDetectedCaptive
{
  return self->_isDetectedCaptive;
}

- (unsigned)durationOnNetwork
{
  return self->_durationOnNetwork;
}

- (unsigned)durationNetworkNotCaptive
{
  return self->_durationNetworkNotCaptive;
}

- (unsigned)passiveCaptivitySymptom
{
  return self->_passiveCaptivitySymptom;
}

- (NSString)appTriggeredPassiveSymptom
{
  return self->_appTriggeredPassiveSymptom;
}

- (void)setAppTriggeredPassiveSymptom:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)nonCaptiveDetectedAsCaptive
{
  return self->_nonCaptiveDetectedAsCaptive;
}

- (unsigned)whiteListProbeCompletionTime
{
  return self->_whiteListProbeCompletionTime;
}

@end
