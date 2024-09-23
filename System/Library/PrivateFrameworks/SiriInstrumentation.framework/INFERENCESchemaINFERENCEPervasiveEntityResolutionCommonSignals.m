@implementation INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals modelVersion](self, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals deleteModelVersion](self, "deleteModelVersion");
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals trialTreatmentId](self, "trialTreatmentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals deleteTrialTreatmentId](self, "deleteTrialTreatmentId");

  return v5;
}

- (BOOL)hasUsecase
{
  return self->_usecase != 0;
}

- (void)deleteUsecase
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setUsecase:](self, "setUsecase:", 0);
}

- (void)setChoicesCount:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_choicesCount = a3;
}

- (BOOL)hasChoicesCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasChoicesCount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteChoicesCount
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setChoicesCount:](self, "setChoicesCount:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setTimestampSec:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timestampSec = a3;
}

- (BOOL)hasTimestampSec
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasTimestampSec:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteTimestampSec
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setTimestampSec:](self, "setTimestampSec:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFD;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setRawLanguage:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rawLanguage = a3;
}

- (BOOL)hasRawLanguage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasRawLanguage:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRawLanguage
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawLanguage:](self, "setRawLanguage:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFB;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setRawLocale:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rawLocale = a3;
}

- (BOOL)hasRawLocale
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasRawLocale:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRawLocale
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawLocale:](self, "setRawLocale:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFF7;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setRawStateOrProvince:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rawStateOrProvince = a3;
}

- (BOOL)hasRawStateOrProvince
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRawStateOrProvince:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRawStateOrProvince
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawStateOrProvince:](self, "setRawStateOrProvince:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFEF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setRawCountry:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rawCountry = a3;
}

- (BOOL)hasRawCountry
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasRawCountry:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRawCountry
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawCountry:](self, "setRawCountry:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFDF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setRawRequestDeviceCategory:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rawRequestDeviceCategory = a3;
}

- (BOOL)hasRawRequestDeviceCategory
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasRawRequestDeviceCategory:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRawRequestDeviceCategory
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawRequestDeviceCategory:](self, "setRawRequestDeviceCategory:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFBF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setCalendarHourOfDay:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_calendarHourOfDay = a3;
}

- (BOOL)hasCalendarHourOfDay
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasCalendarHourOfDay:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteCalendarHourOfDay
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarHourOfDay:](self, "setCalendarHourOfDay:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFF7F;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setCalendarDayOfWeek:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_calendarDayOfWeek = a3;
}

- (BOOL)hasCalendarDayOfWeek
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasCalendarDayOfWeek:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteCalendarDayOfWeek
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarDayOfWeek:](self, "setCalendarDayOfWeek:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFEFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setCalendarWeekOfMonth:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_calendarWeekOfMonth = a3;
}

- (BOOL)hasCalendarWeekOfMonth
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasCalendarWeekOfMonth:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteCalendarWeekOfMonth
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarWeekOfMonth:](self, "setCalendarWeekOfMonth:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFDFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setCalendarMonthOfYear:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_calendarMonthOfYear = a3;
}

- (BOOL)hasCalendarMonthOfYear
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasCalendarMonthOfYear:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteCalendarMonthOfYear
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarMonthOfYear:](self, "setCalendarMonthOfYear:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFBFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsClientDaylight:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isClientDaylight = a3;
}

- (BOOL)hasIsClientDaylight
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasIsClientDaylight:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsClientDaylight
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsClientDaylight:](self, "setIsClientDaylight:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xF7FF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsDeviceLockStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isDeviceLockStatus = a3;
}

- (BOOL)hasIsDeviceLockStatus
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasIsDeviceLockStatus:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsDeviceLockStatus
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsDeviceLockStatus:](self, "setIsDeviceLockStatus:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xEFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setDeviceMotionState:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_deviceMotionState = a3;
}

- (BOOL)hasDeviceMotionState
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasDeviceMotionState:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteDeviceMotionState
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setDeviceMotionState:](self, "setDeviceMotionState:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xDFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsClientNavigating:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isClientNavigating = a3;
}

- (BOOL)hasIsClientNavigating
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasIsClientNavigating:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsClientNavigating
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsClientNavigating:](self, "setIsClientNavigating:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xBFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setIsCarPlay:(int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_isCarPlay = a3;
}

- (BOOL)hasIsCarPlay
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasIsCarPlay:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteIsCarPlay
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsCarPlay:](self, "setIsCarPlay:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0x7FFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHistoricalDataCount:(int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_historicalDataCount = a3;
}

- (BOOL)hasHistoricalDataCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasHistoricalDataCount:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteHistoricalDataCount
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setHistoricalDataCount:](self, "setHistoricalDataCount:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setDisambiguationReason:(int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_disambiguationReason = a3;
}

- (BOOL)hasDisambiguationReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasDisambiguationReason:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteDisambiguationReason
{
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  unsigned int v4;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setDisambiguationReason:](self, "setDisambiguationReason:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelVersion
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setModelVersion:](self, "setModelVersion:", 0);
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (void)deleteTrialTreatmentId
{
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setTrialTreatmentId:](self, "setTrialTreatmentId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  $8D9D7F62C73E045CB788A899FADF9E76 v12;
  id v13;

  v13 = a3;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals usecase](self, "usecase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = self->_has;
  v6 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = self->_has;
    v6 = *(_DWORD *)&v12 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_BYTE *)&v12 & 2) == 0)
    {
LABEL_5:
      if ((v6 & 4) == 0)
        goto LABEL_6;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_6:
    if ((v6 & 8) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_9:
    if ((v6 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_10:
    if ((v6 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_13:
    if ((v6 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_14:
    if ((v6 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_15:
    if ((v6 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_16:
    if ((v6 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_17:
    if ((v6 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_18:
    if ((v6 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_19:
    if ((v6 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((v6 & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x20000) != 0)
LABEL_21:
    PBDataWriterWriteInt32Field();
LABEL_22:
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals modelVersion](self, "modelVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals modelVersion](self, "modelVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals trialTreatmentId](self, "trialTreatmentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (v9)
  {
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals trialTreatmentId](self, "trialTreatmentId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v10 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int choicesCount;
  int v16;
  int64_t timestampSec;
  int v18;
  int rawLanguage;
  int v20;
  int rawLocale;
  int v22;
  int rawStateOrProvince;
  int v24;
  int rawCountry;
  int v26;
  int rawRequestDeviceCategory;
  int v28;
  int calendarHourOfDay;
  int v30;
  int calendarDayOfWeek;
  int v32;
  int calendarWeekOfMonth;
  int v34;
  int calendarMonthOfYear;
  int v36;
  int isClientDaylight;
  int v38;
  int isDeviceLockStatus;
  int v40;
  int deviceMotionState;
  int v42;
  int isClientNavigating;
  int v44;
  int isCarPlay;
  int v46;
  int historicalDataCount;
  int v48;
  int disambiguationReason;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  BOOL v60;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_88;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals usecase](self, "usecase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usecase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_87;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals usecase](self, "usecase");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals usecase](self, "usecase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usecase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_88;
  }
  else
  {

  }
  v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  v13 = *(_WORD *)&self->_has & 1;
  v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  if (v13 != (v4[56] & 1))
    goto LABEL_88;
  if (v13)
  {
    choicesCount = self->_choicesCount;
    if (choicesCount != objc_msgSend(v4, "choicesCount"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v16 = (v12 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_88;
  if (v16)
  {
    timestampSec = self->_timestampSec;
    if (timestampSec != objc_msgSend(v4, "timestampSec"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v18 = (v12 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_88;
  if (v18)
  {
    rawLanguage = self->_rawLanguage;
    if (rawLanguage != objc_msgSend(v4, "rawLanguage"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v20 = (v12 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_88;
  if (v20)
  {
    rawLocale = self->_rawLocale;
    if (rawLocale != objc_msgSend(v4, "rawLocale"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v22 = (v12 >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_88;
  if (v22)
  {
    rawStateOrProvince = self->_rawStateOrProvince;
    if (rawStateOrProvince != objc_msgSend(v4, "rawStateOrProvince"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v24 = (v12 >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1))
    goto LABEL_88;
  if (v24)
  {
    rawCountry = self->_rawCountry;
    if (rawCountry != objc_msgSend(v4, "rawCountry"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v26 = (v12 >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1))
    goto LABEL_88;
  if (v26)
  {
    rawRequestDeviceCategory = self->_rawRequestDeviceCategory;
    if (rawRequestDeviceCategory != objc_msgSend(v4, "rawRequestDeviceCategory"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v28 = (v12 >> 7) & 1;
  if (v28 != ((v14 >> 7) & 1))
    goto LABEL_88;
  if (v28)
  {
    calendarHourOfDay = self->_calendarHourOfDay;
    if (calendarHourOfDay != objc_msgSend(v4, "calendarHourOfDay"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v30 = (v12 >> 8) & 1;
  if (v30 != ((v14 >> 8) & 1))
    goto LABEL_88;
  if (v30)
  {
    calendarDayOfWeek = self->_calendarDayOfWeek;
    if (calendarDayOfWeek != objc_msgSend(v4, "calendarDayOfWeek"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v32 = (v12 >> 9) & 1;
  if (v32 != ((v14 >> 9) & 1))
    goto LABEL_88;
  if (v32)
  {
    calendarWeekOfMonth = self->_calendarWeekOfMonth;
    if (calendarWeekOfMonth != objc_msgSend(v4, "calendarWeekOfMonth"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v34 = (v12 >> 10) & 1;
  if (v34 != ((v14 >> 10) & 1))
    goto LABEL_88;
  if (v34)
  {
    calendarMonthOfYear = self->_calendarMonthOfYear;
    if (calendarMonthOfYear != objc_msgSend(v4, "calendarMonthOfYear"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v36 = (v12 >> 11) & 1;
  if (v36 != ((v14 >> 11) & 1))
    goto LABEL_88;
  if (v36)
  {
    isClientDaylight = self->_isClientDaylight;
    if (isClientDaylight != objc_msgSend(v4, "isClientDaylight"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v38 = (v12 >> 12) & 1;
  if (v38 != ((v14 >> 12) & 1))
    goto LABEL_88;
  if (v38)
  {
    isDeviceLockStatus = self->_isDeviceLockStatus;
    if (isDeviceLockStatus != objc_msgSend(v4, "isDeviceLockStatus"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v40 = (v12 >> 13) & 1;
  if (v40 != ((v14 >> 13) & 1))
    goto LABEL_88;
  if (v40)
  {
    deviceMotionState = self->_deviceMotionState;
    if (deviceMotionState != objc_msgSend(v4, "deviceMotionState"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v42 = (v12 >> 14) & 1;
  if (v42 != ((v14 >> 14) & 1))
    goto LABEL_88;
  if (v42)
  {
    isClientNavigating = self->_isClientNavigating;
    if (isClientNavigating != objc_msgSend(v4, "isClientNavigating"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v44 = (v12 >> 15) & 1;
  if (v44 != ((v14 >> 15) & 1))
    goto LABEL_88;
  if (v44)
  {
    isCarPlay = self->_isCarPlay;
    if (isCarPlay != objc_msgSend(v4, "isCarPlay"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v46 = HIWORD(v12) & 1;
  if (v46 != (HIWORD(v14) & 1))
    goto LABEL_88;
  if (v46)
  {
    historicalDataCount = self->_historicalDataCount;
    if (historicalDataCount != objc_msgSend(v4, "historicalDataCount"))
      goto LABEL_88;
    v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  v48 = (v12 >> 17) & 1;
  if (v48 != ((v14 >> 17) & 1))
    goto LABEL_88;
  if (v48)
  {
    disambiguationReason = self->_disambiguationReason;
    if (disambiguationReason != objc_msgSend(v4, "disambiguationReason"))
      goto LABEL_88;
  }
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals modelVersion](self, "modelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_87;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals modelVersion](self, "modelVersion");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals modelVersion](self, "modelVersion");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelVersion");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqual:", v53);

    if (!v54)
      goto LABEL_88;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals trialTreatmentId](self, "trialTreatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trialTreatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_87:

    goto LABEL_88;
  }
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals trialTreatmentId](self, "trialTreatmentId");
  v55 = objc_claimAutoreleasedReturnValue();
  if (!v55)
  {

LABEL_91:
    v60 = 1;
    goto LABEL_89;
  }
  v56 = (void *)v55;
  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals trialTreatmentId](self, "trialTreatmentId");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trialTreatmentId");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v57, "isEqual:", v58);

  if ((v59 & 1) != 0)
    goto LABEL_91;
LABEL_88:
  v60 = 0;
LABEL_89:

  return v60;
}

- (unint64_t)hash
{
  NSUInteger v3;
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  int v5;
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
  NSUInteger v24;
  unint64_t v25;

  v3 = -[NSString hash](self->_usecase, "hash");
  has = self->_has;
  v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v6 = 2654435761 * self->_choicesCount;
    if ((v5 & 2) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_timestampSec;
      if ((v5 & 4) != 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else
  {
    v6 = 0;
    if ((v5 & 2) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((v5 & 4) != 0)
  {
LABEL_4:
    v8 = 2654435761 * self->_rawLanguage;
    if ((v5 & 8) != 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v8 = 0;
  if ((v5 & 8) != 0)
  {
LABEL_5:
    v9 = 2654435761 * self->_rawLocale;
    if ((v5 & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v9 = 0;
  if ((v5 & 0x10) != 0)
  {
LABEL_6:
    v10 = 2654435761 * self->_rawStateOrProvince;
    if ((v5 & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v10 = 0;
  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    v11 = 2654435761 * self->_rawCountry;
    if ((v5 & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v11 = 0;
  if ((v5 & 0x40) != 0)
  {
LABEL_8:
    v12 = 2654435761 * self->_rawRequestDeviceCategory;
    if ((v5 & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v12 = 0;
  if ((v5 & 0x80) != 0)
  {
LABEL_9:
    v13 = 2654435761 * self->_calendarHourOfDay;
    if ((v5 & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v13 = 0;
  if ((v5 & 0x100) != 0)
  {
LABEL_10:
    v14 = 2654435761 * self->_calendarDayOfWeek;
    if ((v5 & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v14 = 0;
  if ((v5 & 0x200) != 0)
  {
LABEL_11:
    v15 = 2654435761 * self->_calendarWeekOfMonth;
    if ((v5 & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v15 = 0;
  if ((v5 & 0x400) != 0)
  {
LABEL_12:
    v16 = 2654435761 * self->_calendarMonthOfYear;
    if ((v5 & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v16 = 0;
  if ((v5 & 0x800) != 0)
  {
LABEL_13:
    v17 = 2654435761 * self->_isClientDaylight;
    if ((v5 & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v17 = 0;
  if ((v5 & 0x1000) != 0)
  {
LABEL_14:
    v18 = 2654435761 * self->_isDeviceLockStatus;
    if ((v5 & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v18 = 0;
  if ((v5 & 0x2000) != 0)
  {
LABEL_15:
    v19 = 2654435761 * self->_deviceMotionState;
    if ((v5 & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  v19 = 0;
  if ((v5 & 0x4000) != 0)
  {
LABEL_16:
    v20 = 2654435761 * self->_isClientNavigating;
    if ((v5 & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  v20 = 0;
  if ((v5 & 0x8000) != 0)
  {
LABEL_17:
    v21 = 2654435761 * self->_isCarPlay;
    if ((v5 & 0x10000) != 0)
      goto LABEL_18;
LABEL_36:
    v22 = 0;
    if ((v5 & 0x20000) != 0)
      goto LABEL_19;
LABEL_37:
    v23 = 0;
    goto LABEL_38;
  }
LABEL_35:
  v21 = 0;
  if ((v5 & 0x10000) == 0)
    goto LABEL_36;
LABEL_18:
  v22 = 2654435761 * self->_historicalDataCount;
  if ((v5 & 0x20000) == 0)
    goto LABEL_37;
LABEL_19:
  v23 = 2654435761 * self->_disambiguationReason;
LABEL_38:
  v24 = v6 ^ v3 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  v25 = v20 ^ v21 ^ v22 ^ v23 ^ -[SISchemaVersion hash](self->_modelVersion, "hash");
  return v24 ^ v25 ^ -[SISchemaUUID hash](self->_trialTreatmentId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  $8D9D7F62C73E045CB788A899FADF9E76 has;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  $8D9D7F62C73E045CB788A899FADF9E76 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  __int16 v19;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals calendarDayOfWeek](self, "calendarDayOfWeek"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("calendarDayOfWeek"));

    v10 = self->_has;
    v5 = *(_DWORD *)&v10 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_BYTE *)&v10 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals calendarHourOfDay](self, "calendarHourOfDay"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("calendarHourOfDay"));

  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals calendarMonthOfYear](self, "calendarMonthOfYear"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("calendarMonthOfYear"));

  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals calendarWeekOfMonth](self, "calendarWeekOfMonth"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("calendarWeekOfMonth"));

  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals choicesCount](self, "choicesCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("choicesCount"));

  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals deviceMotionState](self, "deviceMotionState"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("deviceMotionState"));

  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x20000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_23:
  v16 = -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals disambiguationReason](self, "disambiguationReason")- 1;
  if (v16 > 2)
    v17 = CFSTR("INFERENCEENTITYRESOLUTIONTYPE_UNKNOWN");
  else
    v17 = off_1E563A4E0[v16];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("disambiguationReason"));
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x10000) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals historicalDataCount](self, "historicalDataCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("historicalDataCount"));

  LOWORD(v5) = self->_has;
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals isCarPlay](self, "isCarPlay"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("isCarPlay"));

  LOWORD(v5) = self->_has;
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals isClientDaylight](self, "isClientDaylight"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isClientDaylight"));

  LOWORD(v5) = self->_has;
  if ((v5 & 0x4000) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals isClientNavigating](self, "isClientNavigating"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("isClientNavigating"));

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals isDeviceLockStatus](self, "isDeviceLockStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isDeviceLockStatus"));

  }
LABEL_14:
  if (self->_modelVersion)
  {
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals modelVersion](self, "modelVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("modelVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("modelVersion"));

    }
  }
  LOBYTE(v19) = self->_has;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawCountry](self, "rawCountry"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("rawCountry"));

    LOBYTE(v19) = self->_has;
    if ((*(_WORD *)&self->_has & 4) == 0)
    {
LABEL_29:
      if ((v19 & 8) == 0)
        goto LABEL_30;
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&self->_has & 4) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawLanguage](self, "rawLanguage"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("rawLanguage"));

  v19 = (__int16)self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_30:
    if ((v19 & 0x40) == 0)
      goto LABEL_31;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawLocale](self, "rawLocale"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("rawLocale"));

  v19 = (__int16)self->_has;
  if ((v19 & 0x40) == 0)
  {
LABEL_31:
    if ((v19 & 0x10) == 0)
      goto LABEL_32;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawRequestDeviceCategory](self, "rawRequestDeviceCategory"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("rawRequestDeviceCategory"));

  v19 = (__int16)self->_has;
  if ((v19 & 0x10) == 0)
  {
LABEL_32:
    if ((v19 & 2) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawStateOrProvince](self, "rawStateOrProvince"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("rawStateOrProvince"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals timestampSec](self, "timestampSec"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("timestampSec"));

  }
LABEL_34:
  if (self->_trialTreatmentId)
  {
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals trialTreatmentId](self, "trialTreatmentId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("trialTreatmentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("trialTreatmentId"));

    }
  }
  if (self->_usecase)
  {
    -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals usecase](self, "usecase");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("usecase"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *v5;
  void *v6;
  void *v7;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SISchemaVersion *v32;
  void *v33;
  SISchemaUUID *v34;
  INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals;
  v5 = -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals init](&v51, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usecase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setUsecase:](v5, "setUsecase:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("choicesCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setChoicesCount:](v5, "setChoicesCount:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestampSec"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setTimestampSec:](v5, "setTimestampSec:", objc_msgSend(v9, "longLongValue"));
    v45 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawLanguage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawLanguage:](v5, "setRawLanguage:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawLocale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawLocale:](v5, "setRawLocale:", objc_msgSend(v11, "intValue"));
    v12 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawStateOrProvince"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawStateOrProvince:](v5, "setRawStateOrProvince:", objc_msgSend(v13, "intValue"));
    v14 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawCountry"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawCountry:](v5, "setRawCountry:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawRequestDeviceCategory"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawRequestDeviceCategory:](v5, "setRawRequestDeviceCategory:", objc_msgSend(v16, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarHourOfDay"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarHourOfDay:](v5, "setCalendarHourOfDay:", objc_msgSend(v17, "intValue"));
    v39 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarDayOfWeek"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = (void *)v18;
    v19 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarDayOfWeek:](v5, "setCalendarDayOfWeek:", objc_msgSend(v49, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarWeekOfMonth"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = (void *)v20;
    v21 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarWeekOfMonth:](v5, "setCalendarWeekOfMonth:", objc_msgSend(v48, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarMonthOfYear"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = (void *)v22;
    v23 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarMonthOfYear:](v5, "setCalendarMonthOfYear:", objc_msgSend(v47, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isClientDaylight"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsClientDaylight:](v5, "setIsClientDaylight:", objc_msgSend(v24, "intValue"));
    v41 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDeviceLockStatus"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsDeviceLockStatus:](v5, "setIsDeviceLockStatus:", objc_msgSend(v25, "intValue"));
    v40 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceMotionState"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setDeviceMotionState:](v5, "setDeviceMotionState:", objc_msgSend(v26, "intValue"));
    v38 = v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isClientNavigating"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsClientNavigating:](v5, "setIsClientNavigating:", objc_msgSend(v27, "intValue"));
    v46 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCarPlay"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsCarPlay:](v5, "setIsCarPlay:", objc_msgSend(v28, "intValue"));
    v44 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("historicalDataCount"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setHistoricalDataCount:](v5, "setHistoricalDataCount:", objc_msgSend(v29, "intValue"));
    v42 = v11;
    v43 = v23;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationReason"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setDisambiguationReason:](v5, "setDisambiguationReason:", objc_msgSend(v30, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v31);
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setModelVersion:](v5, "setModelVersion:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialTreatmentId"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v33);
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setTrialTreatmentId:](v5, "setTrialTreatmentId:", v34);

    }
    v35 = v5;

  }
  return v5;
}

- (NSString)usecase
{
  return self->_usecase;
}

- (void)setUsecase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)choicesCount
{
  return self->_choicesCount;
}

- (int64_t)timestampSec
{
  return self->_timestampSec;
}

- (int)rawLanguage
{
  return self->_rawLanguage;
}

- (int)rawLocale
{
  return self->_rawLocale;
}

- (int)rawStateOrProvince
{
  return self->_rawStateOrProvince;
}

- (int)rawCountry
{
  return self->_rawCountry;
}

- (int)rawRequestDeviceCategory
{
  return self->_rawRequestDeviceCategory;
}

- (int)calendarHourOfDay
{
  return self->_calendarHourOfDay;
}

- (int)calendarDayOfWeek
{
  return self->_calendarDayOfWeek;
}

- (int)calendarWeekOfMonth
{
  return self->_calendarWeekOfMonth;
}

- (int)calendarMonthOfYear
{
  return self->_calendarMonthOfYear;
}

- (int)isClientDaylight
{
  return self->_isClientDaylight;
}

- (int)isDeviceLockStatus
{
  return self->_isDeviceLockStatus;
}

- (int)deviceMotionState
{
  return self->_deviceMotionState;
}

- (int)isClientNavigating
{
  return self->_isClientNavigating;
}

- (int)isCarPlay
{
  return self->_isCarPlay;
}

- (int)historicalDataCount
{
  return self->_historicalDataCount;
}

- (int)disambiguationReason
{
  return self->_disambiguationReason;
}

- (SISchemaVersion)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (SISchemaUUID)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentId, a3);
}

- (void)setHasUsecase:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasUsecase = a3;
}

- (void)setHasTrialTreatmentId:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_usecase, 0);
}

@end
