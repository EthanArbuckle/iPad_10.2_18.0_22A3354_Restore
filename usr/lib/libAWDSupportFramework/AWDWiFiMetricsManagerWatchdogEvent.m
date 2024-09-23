@implementation AWDWiFiMetricsManagerWatchdogEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerWatchdogEvent setReasonString:](self, "setReasonString:", 0);
  PBRepeatedUInt64Clear();
  -[AWDWiFiMetricsManagerWatchdogEvent setFileName:](self, "setFileName:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setFunction:](self, "setFunction:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setTrapInfo:](self, "setTrapInfo:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setJoinTimeoutInfo:](self, "setJoinTimeoutInfo:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsResponseType:](self, "setWpsResponseType:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsManufacturerElement:](self, "setWpsManufacturerElement:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsModelName:](self, "setWpsModelName:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsModelNumber:](self, "setWpsModelNumber:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsDeviceNameData:](self, "setWpsDeviceNameData:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setWpsConfigMethods:](self, "setWpsConfigMethods:", 0);
  -[AWDWiFiMetricsManagerWatchdogEvent setOui:](self, "setOui:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerWatchdogEvent;
  -[AWDWiFiMetricsManagerWatchdogEvent dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasVersion
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFlags
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAvailable:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_available = a3;
}

- (void)setHasAvailable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAvailable
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasReason
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSubreason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_subreason = a3;
}

- (void)setHasSubreason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSubreason
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setDeviceIdentifierMap:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_deviceIdentifierMap = a3;
}

- (void)setHasDeviceIdentifierMap:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDeviceIdentifierMap
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEventId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_eventId = a3;
}

- (void)setHasEventId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEventId
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMinorReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_minorReason = a3;
}

- (void)setHasMinorReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMinorReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasReasonString
{
  return self->_reasonString != 0;
}

- (void)setProgramCounter:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_programCounter = a3;
}

- (void)setHasProgramCounter:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasProgramCounter
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLinkRegister:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_linkRegister = a3;
}

- (void)setHasLinkRegister:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLinkRegister
{
  return *(_WORD *)&self->_has & 1;
}

- (unint64_t)backTracesCount
{
  return self->_backTraces.count;
}

- (unint64_t)backTraces
{
  return self->_backTraces.list;
}

- (void)clearBackTraces
{
  PBRepeatedUInt64Clear();
}

- (void)addBackTrace:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)backTraceAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_backTraces;
  unint64_t count;

  p_backTraces = &self->_backTraces;
  count = self->_backTraces.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_backTraces->list[a3];
}

- (void)setBackTraces:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (BOOL)hasFunction
{
  return self->_function != 0;
}

- (void)setLineNumber:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lineNumber = a3;
}

- (void)setHasLineNumber:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLineNumber
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasTrapInfo
{
  return self->_trapInfo != 0;
}

- (BOOL)hasJoinTimeoutInfo
{
  return self->_joinTimeoutInfo != 0;
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

- (void)setRecoveryLatency:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_recoveryLatency = a3;
}

- (void)setHasRecoveryLatency:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRecoveryLatency
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerWatchdogEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerWatchdogEvent description](&v3, sel_description), -[AWDWiFiMetricsManagerWatchdogEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *reasonString;
  __int16 v6;
  NSString *fileName;
  NSString *function;
  AWDWiFiMetricExtendedTrapInfo *trapInfo;
  AWDWiFiMetricJoinTimeout *joinTimeoutInfo;
  NSString *wpsResponseType;
  NSString *wpsManufacturerElement;
  NSString *wpsModelName;
  NSString *wpsModelNumber;
  NSString *wpsPrimaryDeviceTypeCategory;
  NSString *wpsPrimaryDeviceTypeSubCategory;
  NSString *wpsDeviceNameElement;
  NSString *wpsDeviceNameData;
  NSString *wpsConfigMethods;
  NSData *oui;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version), CFSTR("version"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags), CFSTR("flags"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_available), CFSTR("available"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_reason), CFSTR("reason"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_subreason), CFSTR("subreason"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_deviceIdentifierMap), CFSTR("deviceIdentifierMap"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_eventId), CFSTR("eventId"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_minorReason), CFSTR("minorReason"));
LABEL_11:
  reasonString = self->_reasonString;
  if (reasonString)
    objc_msgSend(v3, "setObject:forKey:", reasonString, CFSTR("reasonString"));
  v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_programCounter), CFSTR("programCounter"));
    v6 = (__int16)self->_has;
  }
  if ((v6 & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_linkRegister), CFSTR("linkRegister"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("backTrace"));
  fileName = self->_fileName;
  if (fileName)
    objc_msgSend(v3, "setObject:forKey:", fileName, CFSTR("fileName"));
  function = self->_function;
  if (function)
    objc_msgSend(v3, "setObject:forKey:", function, CFSTR("function"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lineNumber), CFSTR("lineNumber"));
  trapInfo = self->_trapInfo;
  if (trapInfo)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricExtendedTrapInfo dictionaryRepresentation](trapInfo, "dictionaryRepresentation"), CFSTR("trapInfo"));
  joinTimeoutInfo = self->_joinTimeoutInfo;
  if (joinTimeoutInfo)
    objc_msgSend(v3, "setObject:forKey:", -[AWDWiFiMetricJoinTimeout dictionaryRepresentation](joinTimeoutInfo, "dictionaryRepresentation"), CFSTR("joinTimeoutInfo"));
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
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_recoveryLatency), CFSTR("recoveryLatency"));
  oui = self->_oui;
  if (oui)
    objc_msgSend(v3, "setObject:forKey:", oui, CFSTR("oui"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerWatchdogEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  unint64_t v6;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
  if (self->_reasonString)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_backTraces.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_backTraces.count);
  }
  if (self->_fileName)
    PBDataWriterWriteStringField();
  if (self->_function)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_trapInfo)
    PBDataWriterWriteSubmessage();
  if (self->_joinTimeoutInfo)
    PBDataWriterWriteSubmessage();
  if (self->_wpsResponseType)
    PBDataWriterWriteStringField();
  if (self->_wpsManufacturerElement)
    PBDataWriterWriteStringField();
  if (self->_wpsModelName)
    PBDataWriterWriteStringField();
  if (self->_wpsModelNumber)
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
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_oui)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_timestamp;
    *((_WORD *)a3 + 116) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 38) = self->_version;
  *((_WORD *)a3 + 116) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 20) = self->_flags;
  *((_WORD *)a3 + 116) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 14) = self->_available;
  *((_WORD *)a3 + 116) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 30) = self->_reason;
  *((_WORD *)a3 + 116) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 35) = self->_subreason;
  *((_WORD *)a3 + 116) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 15) = self->_deviceIdentifierMap;
  *((_WORD *)a3 + 116) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_60:
  *((_DWORD *)a3 + 16) = self->_eventId;
  *((_WORD *)a3 + 116) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 27) = self->_minorReason;
    *((_WORD *)a3 + 116) |= 0x100u;
  }
LABEL_11:
  if (self->_reasonString)
    objc_msgSend(a3, "setReasonString:");
  v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_programCounter;
    *((_WORD *)a3 + 116) |= 2u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_linkRegister;
    *((_WORD *)a3 + 116) |= 1u;
  }
  if (-[AWDWiFiMetricsManagerWatchdogEvent backTracesCount](self, "backTracesCount"))
  {
    objc_msgSend(a3, "clearBackTraces");
    v7 = -[AWDWiFiMetricsManagerWatchdogEvent backTracesCount](self, "backTracesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(a3, "addBackTrace:", -[AWDWiFiMetricsManagerWatchdogEvent backTraceAtIndex:](self, "backTraceAtIndex:", i));
    }
  }
  if (self->_fileName)
    objc_msgSend(a3, "setFileName:");
  if (self->_function)
    objc_msgSend(a3, "setFunction:");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_lineNumber;
    *((_WORD *)a3 + 116) |= 0x80u;
  }
  if (self->_trapInfo)
    objc_msgSend(a3, "setTrapInfo:");
  if (self->_joinTimeoutInfo)
    objc_msgSend(a3, "setJoinTimeoutInfo:");
  if (self->_wpsResponseType)
    objc_msgSend(a3, "setWpsResponseType:");
  if (self->_wpsManufacturerElement)
    objc_msgSend(a3, "setWpsManufacturerElement:");
  if (self->_wpsModelName)
    objc_msgSend(a3, "setWpsModelName:");
  if (self->_wpsModelNumber)
    objc_msgSend(a3, "setWpsModelNumber:");
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
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_recoveryLatency;
    *((_WORD *)a3 + 116) |= 0x400u;
  }
  if (self->_oui)
    objc_msgSend(a3, "setOui:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_timestamp;
    *(_WORD *)(v5 + 232) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 152) = self->_version;
  *(_WORD *)(v5 + 232) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 80) = self->_flags;
  *(_WORD *)(v5 + 232) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 56) = self->_available;
  *(_WORD *)(v5 + 232) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 120) = self->_reason;
  *(_WORD *)(v5 + 232) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 140) = self->_subreason;
  *(_WORD *)(v5 + 232) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 60) = self->_deviceIdentifierMap;
  *(_WORD *)(v5 + 232) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_27:
  *(_DWORD *)(v5 + 64) = self->_eventId;
  *(_WORD *)(v5 + 232) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 108) = self->_minorReason;
    *(_WORD *)(v5 + 232) |= 0x100u;
  }
LABEL_11:

  *(_QWORD *)(v6 + 128) = -[NSString copyWithZone:](self->_reasonString, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    *(_QWORD *)(v6 + 40) = self->_programCounter;
    *(_WORD *)(v6 + 232) |= 2u;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 1) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_linkRegister;
    *(_WORD *)(v6 + 232) |= 1u;
  }
  PBRepeatedUInt64Copy();

  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_fileName, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 88) = -[NSString copyWithZone:](self->_function, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_lineNumber;
    *(_WORD *)(v6 + 232) |= 0x80u;
  }

  *(_QWORD *)(v6 + 144) = -[AWDWiFiMetricExtendedTrapInfo copyWithZone:](self->_trapInfo, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 96) = -[AWDWiFiMetricJoinTimeout copyWithZone:](self->_joinTimeoutInfo, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 224) = -[NSString copyWithZone:](self->_wpsResponseType, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 184) = -[NSString copyWithZone:](self->_wpsManufacturerElement, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 192) = -[NSString copyWithZone:](self->_wpsModelName, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 200) = -[NSString copyWithZone:](self->_wpsModelNumber, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 208) = -[NSString copyWithZone:](self->_wpsPrimaryDeviceTypeCategory, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 216) = -[NSString copyWithZone:](self->_wpsPrimaryDeviceTypeSubCategory, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 176) = -[NSString copyWithZone:](self->_wpsDeviceNameElement, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 168) = -[NSString copyWithZone:](self->_wpsDeviceNameData, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 160) = -[NSString copyWithZone:](self->_wpsConfigMethods, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_recoveryLatency;
    *(_WORD *)(v6 + 232) |= 0x400u;
  }

  *(_QWORD *)(v6 + 112) = -[NSData copyWithZone:](self->_oui, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  __int16 has;
  __int16 v7;
  NSString *reasonString;
  __int16 v9;
  NSString *fileName;
  NSString *function;
  __int16 v12;
  AWDWiFiMetricExtendedTrapInfo *trapInfo;
  AWDWiFiMetricJoinTimeout *joinTimeoutInfo;
  NSString *wpsResponseType;
  NSString *wpsManufacturerElement;
  NSString *wpsModelName;
  NSString *wpsModelNumber;
  NSString *wpsPrimaryDeviceTypeCategory;
  NSString *wpsPrimaryDeviceTypeSubCategory;
  NSString *wpsDeviceNameElement;
  NSString *wpsDeviceNameData;
  NSString *wpsConfigMethods;
  NSData *oui;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 116);
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 6))
        goto LABEL_99;
    }
    else if ((v7 & 4) != 0)
    {
LABEL_99:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 116) & 0x1000) == 0 || self->_version != *((_DWORD *)a3 + 38))
        goto LABEL_99;
    }
    else if ((*((_WORD *)a3 + 116) & 0x1000) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_flags != *((_DWORD *)a3 + 20))
        goto LABEL_99;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_available != *((_DWORD *)a3 + 14))
        goto LABEL_99;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 116) & 0x200) == 0 || self->_reason != *((_DWORD *)a3 + 30))
        goto LABEL_99;
    }
    else if ((*((_WORD *)a3 + 116) & 0x200) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 116) & 0x800) == 0 || self->_subreason != *((_DWORD *)a3 + 35))
        goto LABEL_99;
    }
    else if ((*((_WORD *)a3 + 116) & 0x800) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_deviceIdentifierMap != *((_DWORD *)a3 + 15))
        goto LABEL_99;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_eventId != *((_DWORD *)a3 + 16))
        goto LABEL_99;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 116) & 0x100) == 0 || self->_minorReason != *((_DWORD *)a3 + 27))
        goto LABEL_99;
    }
    else if ((*((_WORD *)a3 + 116) & 0x100) != 0)
    {
      goto LABEL_99;
    }
    reasonString = self->_reasonString;
    if ((unint64_t)reasonString | *((_QWORD *)a3 + 16))
    {
      IsEqual = -[NSString isEqual:](reasonString, "isEqual:");
      if (!IsEqual)
        return IsEqual;
      has = (__int16)self->_has;
    }
    v9 = *((_WORD *)a3 + 116);
    if ((has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_programCounter != *((_QWORD *)a3 + 5))
        goto LABEL_99;
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_99;
    }
    if ((has & 1) != 0)
    {
      if ((v9 & 1) == 0 || self->_linkRegister != *((_QWORD *)a3 + 4))
        goto LABEL_99;
    }
    else if ((v9 & 1) != 0)
    {
      goto LABEL_99;
    }
    IsEqual = PBRepeatedUInt64IsEqual();
    if (IsEqual)
    {
      fileName = self->_fileName;
      if (!((unint64_t)fileName | *((_QWORD *)a3 + 9))
        || (IsEqual = -[NSString isEqual:](fileName, "isEqual:")) != 0)
      {
        function = self->_function;
        if (!((unint64_t)function | *((_QWORD *)a3 + 11))
          || (IsEqual = -[NSString isEqual:](function, "isEqual:")) != 0)
        {
          v12 = *((_WORD *)a3 + 116);
          if ((*(_WORD *)&self->_has & 0x80) != 0)
          {
            if ((v12 & 0x80) == 0 || self->_lineNumber != *((_DWORD *)a3 + 26))
              goto LABEL_99;
          }
          else if ((v12 & 0x80) != 0)
          {
            goto LABEL_99;
          }
          trapInfo = self->_trapInfo;
          if (!((unint64_t)trapInfo | *((_QWORD *)a3 + 18))
            || (IsEqual = -[AWDWiFiMetricExtendedTrapInfo isEqual:](trapInfo, "isEqual:")) != 0)
          {
            joinTimeoutInfo = self->_joinTimeoutInfo;
            if (!((unint64_t)joinTimeoutInfo | *((_QWORD *)a3 + 12))
              || (IsEqual = -[AWDWiFiMetricJoinTimeout isEqual:](joinTimeoutInfo, "isEqual:")) != 0)
            {
              wpsResponseType = self->_wpsResponseType;
              if (!((unint64_t)wpsResponseType | *((_QWORD *)a3 + 28))
                || (IsEqual = -[NSString isEqual:](wpsResponseType, "isEqual:")) != 0)
              {
                wpsManufacturerElement = self->_wpsManufacturerElement;
                if (!((unint64_t)wpsManufacturerElement | *((_QWORD *)a3 + 23))
                  || (IsEqual = -[NSString isEqual:](wpsManufacturerElement, "isEqual:")) != 0)
                {
                  wpsModelName = self->_wpsModelName;
                  if (!((unint64_t)wpsModelName | *((_QWORD *)a3 + 24))
                    || (IsEqual = -[NSString isEqual:](wpsModelName, "isEqual:")) != 0)
                  {
                    wpsModelNumber = self->_wpsModelNumber;
                    if (!((unint64_t)wpsModelNumber | *((_QWORD *)a3 + 25))
                      || (IsEqual = -[NSString isEqual:](wpsModelNumber, "isEqual:")) != 0)
                    {
                      wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
                      if (!((unint64_t)wpsPrimaryDeviceTypeCategory | *((_QWORD *)a3 + 26))
                        || (IsEqual = -[NSString isEqual:](wpsPrimaryDeviceTypeCategory, "isEqual:")) != 0)
                      {
                        wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
                        if (!((unint64_t)wpsPrimaryDeviceTypeSubCategory | *((_QWORD *)a3 + 27))
                          || (IsEqual = -[NSString isEqual:](wpsPrimaryDeviceTypeSubCategory, "isEqual:")) != 0)
                        {
                          wpsDeviceNameElement = self->_wpsDeviceNameElement;
                          if (!((unint64_t)wpsDeviceNameElement | *((_QWORD *)a3 + 22))
                            || (IsEqual = -[NSString isEqual:](wpsDeviceNameElement, "isEqual:")) != 0)
                          {
                            wpsDeviceNameData = self->_wpsDeviceNameData;
                            if (!((unint64_t)wpsDeviceNameData | *((_QWORD *)a3 + 21))
                              || (IsEqual = -[NSString isEqual:](wpsDeviceNameData, "isEqual:")) != 0)
                            {
                              wpsConfigMethods = self->_wpsConfigMethods;
                              if (!((unint64_t)wpsConfigMethods | *((_QWORD *)a3 + 20))
                                || (IsEqual = -[NSString isEqual:](wpsConfigMethods, "isEqual:")) != 0)
                              {
                                if ((*(_WORD *)&self->_has & 0x400) != 0)
                                {
                                  if ((*((_WORD *)a3 + 116) & 0x400) == 0
                                    || self->_recoveryLatency != *((_DWORD *)a3 + 34))
                                  {
                                    goto LABEL_99;
                                  }
                                }
                                else if ((*((_WORD *)a3 + 116) & 0x400) != 0)
                                {
                                  goto LABEL_99;
                                }
                                oui = self->_oui;
                                if ((unint64_t)oui | *((_QWORD *)a3 + 14))
                                  LOBYTE(IsEqual) = -[NSData isEqual:](oui, "isEqual:");
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
  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v33 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      v32 = 2654435761 * self->_version;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v33 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_3;
  }
  v32 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v31 = 2654435761 * self->_flags;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v31 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v30 = 2654435761 * self->_available;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v30 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    v29 = 2654435761 * self->_reason;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v29 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    v28 = 2654435761 * self->_subreason;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v28 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v27 = 2654435761 * self->_deviceIdentifierMap;
    if ((has & 0x20) != 0)
      goto LABEL_9;
LABEL_18:
    v26 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v27 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_18;
LABEL_9:
  v26 = 2654435761 * self->_eventId;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v25 = 2654435761 * self->_minorReason;
    goto LABEL_20;
  }
LABEL_19:
  v25 = 0;
LABEL_20:
  v24 = -[NSString hash](self->_reasonString, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 2) != 0)
  {
    v23 = 2654435761u * self->_programCounter;
    if ((v4 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
    v23 = 0;
    if ((v4 & 1) != 0)
    {
LABEL_22:
      v22 = 2654435761u * self->_linkRegister;
      goto LABEL_25;
    }
  }
  v22 = 0;
LABEL_25:
  v21 = PBRepeatedUInt64Hash();
  v20 = -[NSString hash](self->_fileName, "hash");
  v19 = -[NSString hash](self->_function, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v18 = 2654435761 * self->_lineNumber;
  else
    v18 = 0;
  v17 = -[AWDWiFiMetricExtendedTrapInfo hash](self->_trapInfo, "hash");
  v16 = -[AWDWiFiMetricJoinTimeout hash](self->_joinTimeoutInfo, "hash");
  v5 = -[NSString hash](self->_wpsResponseType, "hash");
  v6 = -[NSString hash](self->_wpsManufacturerElement, "hash");
  v7 = -[NSString hash](self->_wpsModelName, "hash");
  v8 = -[NSString hash](self->_wpsModelNumber, "hash");
  v9 = -[NSString hash](self->_wpsPrimaryDeviceTypeCategory, "hash");
  v10 = -[NSString hash](self->_wpsPrimaryDeviceTypeSubCategory, "hash");
  v11 = -[NSString hash](self->_wpsDeviceNameElement, "hash");
  v12 = -[NSString hash](self->_wpsDeviceNameData, "hash");
  v13 = -[NSString hash](self->_wpsConfigMethods, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v14 = 2654435761 * self->_recoveryLatency;
  else
    v14 = 0;
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v23 ^ v22 ^ v21 ^ v24 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[NSData hash](self->_oui, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  AWDWiFiMetricExtendedTrapInfo *trapInfo;
  uint64_t v11;
  AWDWiFiMetricJoinTimeout *joinTimeoutInfo;
  uint64_t v13;

  v5 = *((_WORD *)a3 + 116);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 4u;
    v5 = *((_WORD *)a3 + 116);
    if ((v5 & 0x1000) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*((_WORD *)a3 + 116) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_DWORD *)a3 + 38);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  self->_flags = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 116);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  self->_available = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  self->_reason = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  self->_subreason = *((_DWORD *)a3 + 35);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  self->_deviceIdentifierMap = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 116);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_36:
  self->_eventId = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 116) & 0x100) != 0)
  {
LABEL_10:
    self->_minorReason = *((_DWORD *)a3 + 27);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_11:
  if (*((_QWORD *)a3 + 16))
    -[AWDWiFiMetricsManagerWatchdogEvent setReasonString:](self, "setReasonString:");
  v6 = *((_WORD *)a3 + 116);
  if ((v6 & 2) != 0)
  {
    self->_programCounter = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 2u;
    v6 = *((_WORD *)a3 + 116);
  }
  if ((v6 & 1) != 0)
  {
    self->_linkRegister = *((_QWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
  v7 = objc_msgSend(a3, "backTracesCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[AWDWiFiMetricsManagerWatchdogEvent addBackTrace:](self, "addBackTrace:", objc_msgSend(a3, "backTraceAtIndex:", i));
  }
  if (*((_QWORD *)a3 + 9))
    -[AWDWiFiMetricsManagerWatchdogEvent setFileName:](self, "setFileName:");
  if (*((_QWORD *)a3 + 11))
    -[AWDWiFiMetricsManagerWatchdogEvent setFunction:](self, "setFunction:");
  if ((*((_WORD *)a3 + 116) & 0x80) != 0)
  {
    self->_lineNumber = *((_DWORD *)a3 + 26);
    *(_WORD *)&self->_has |= 0x80u;
  }
  trapInfo = self->_trapInfo;
  v11 = *((_QWORD *)a3 + 18);
  if (trapInfo)
  {
    if (v11)
      -[AWDWiFiMetricExtendedTrapInfo mergeFrom:](trapInfo, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDWiFiMetricsManagerWatchdogEvent setTrapInfo:](self, "setTrapInfo:");
  }
  joinTimeoutInfo = self->_joinTimeoutInfo;
  v13 = *((_QWORD *)a3 + 12);
  if (joinTimeoutInfo)
  {
    if (v13)
      -[AWDWiFiMetricJoinTimeout mergeFrom:](joinTimeoutInfo, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDWiFiMetricsManagerWatchdogEvent setJoinTimeoutInfo:](self, "setJoinTimeoutInfo:");
  }
  if (*((_QWORD *)a3 + 28))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsResponseType:](self, "setWpsResponseType:");
  if (*((_QWORD *)a3 + 23))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsManufacturerElement:](self, "setWpsManufacturerElement:");
  if (*((_QWORD *)a3 + 24))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsModelName:](self, "setWpsModelName:");
  if (*((_QWORD *)a3 + 25))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsModelNumber:](self, "setWpsModelNumber:");
  if (*((_QWORD *)a3 + 26))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:");
  if (*((_QWORD *)a3 + 27))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:");
  if (*((_QWORD *)a3 + 22))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:");
  if (*((_QWORD *)a3 + 21))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsDeviceNameData:](self, "setWpsDeviceNameData:");
  if (*((_QWORD *)a3 + 20))
    -[AWDWiFiMetricsManagerWatchdogEvent setWpsConfigMethods:](self, "setWpsConfigMethods:");
  if ((*((_WORD *)a3 + 116) & 0x400) != 0)
  {
    self->_recoveryLatency = *((_DWORD *)a3 + 34);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)a3 + 14))
    -[AWDWiFiMetricsManagerWatchdogEvent setOui:](self, "setOui:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)flags
{
  return self->_flags;
}

- (int)available
{
  return self->_available;
}

- (int)reason
{
  return self->_reason;
}

- (unsigned)subreason
{
  return self->_subreason;
}

- (unsigned)deviceIdentifierMap
{
  return self->_deviceIdentifierMap;
}

- (unsigned)eventId
{
  return self->_eventId;
}

- (unsigned)minorReason
{
  return self->_minorReason;
}

- (NSString)reasonString
{
  return self->_reasonString;
}

- (void)setReasonString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (unint64_t)programCounter
{
  return self->_programCounter;
}

- (unint64_t)linkRegister
{
  return self->_linkRegister;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)function
{
  return self->_function;
}

- (void)setFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unsigned)lineNumber
{
  return self->_lineNumber;
}

- (AWDWiFiMetricExtendedTrapInfo)trapInfo
{
  return self->_trapInfo;
}

- (void)setTrapInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (AWDWiFiMetricJoinTimeout)joinTimeoutInfo
{
  return self->_joinTimeoutInfo;
}

- (void)setJoinTimeoutInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)wpsResponseType
{
  return self->_wpsResponseType;
}

- (void)setWpsResponseType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (NSString)wpsManufacturerElement
{
  return self->_wpsManufacturerElement;
}

- (void)setWpsManufacturerElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSString)wpsModelName
{
  return self->_wpsModelName;
}

- (void)setWpsModelName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSString)wpsModelNumber
{
  return self->_wpsModelNumber;
}

- (void)setWpsModelNumber:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSString)wpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory;
}

- (void)setWpsPrimaryDeviceTypeCategory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSString)wpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory;
}

- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (NSString)wpsDeviceNameElement
{
  return self->_wpsDeviceNameElement;
}

- (void)setWpsDeviceNameElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSString)wpsDeviceNameData
{
  return self->_wpsDeviceNameData;
}

- (void)setWpsDeviceNameData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSString)wpsConfigMethods
{
  return self->_wpsConfigMethods;
}

- (void)setWpsConfigMethods:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (unsigned)recoveryLatency
{
  return self->_recoveryLatency;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
