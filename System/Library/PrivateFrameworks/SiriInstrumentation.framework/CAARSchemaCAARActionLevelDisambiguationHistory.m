@implementation CAARSchemaCAARActionLevelDisambiguationHistory

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumActionDisambiguationsLastTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numActionDisambiguationsLastTwoMinutes = a3;
}

- (BOOL)hasNumActionDisambiguationsLastTwoMinutes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNumActionDisambiguationsLastTwoMinutes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteNumActionDisambiguationsLastTwoMinutes
{
  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastTwoMinutes:](self, "setNumActionDisambiguationsLastTwoMinutes:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setNumActionDisambiguationsLasTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numActionDisambiguationsLasTenMinutes = a3;
}

- (BOOL)hasNumActionDisambiguationsLasTenMinutes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasNumActionDisambiguationsLasTenMinutes:(BOOL)a3
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

- (void)deleteNumActionDisambiguationsLasTenMinutes
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLasTenMinutes:](self, "setNumActionDisambiguationsLasTenMinutes:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFD;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumActionDisambiguationsLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numActionDisambiguationsLastOneHour = a3;
}

- (BOOL)hasNumActionDisambiguationsLastOneHour
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasNumActionDisambiguationsLastOneHour:(BOOL)a3
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

- (void)deleteNumActionDisambiguationsLastOneHour
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastOneHour:](self, "setNumActionDisambiguationsLastOneHour:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFB;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumActionDisambiguationsLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numActionDisambiguationsLastSixHours = a3;
}

- (BOOL)hasNumActionDisambiguationsLastSixHours
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNumActionDisambiguationsLastSixHours:(BOOL)a3
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

- (void)deleteNumActionDisambiguationsLastSixHours
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastSixHours:](self, "setNumActionDisambiguationsLastSixHours:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFF7;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumActionDisambiguationsLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numActionDisambiguationsLastOneDay = a3;
}

- (BOOL)hasNumActionDisambiguationsLastOneDay
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumActionDisambiguationsLastOneDay:(BOOL)a3
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

- (void)deleteNumActionDisambiguationsLastOneDay
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastOneDay:](self, "setNumActionDisambiguationsLastOneDay:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFEF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumActionDisambiguationsLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numActionDisambiguationsLastSevenDays = a3;
}

- (BOOL)hasNumActionDisambiguationsLastSevenDays
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumActionDisambiguationsLastSevenDays:(BOOL)a3
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

- (void)deleteNumActionDisambiguationsLastSevenDays
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastSevenDays:](self, "setNumActionDisambiguationsLastSevenDays:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFDF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumActionDisambiguationsLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numActionDisambiguationsLastTwentyEightDays = a3;
}

- (BOOL)hasNumActionDisambiguationsLastTwentyEightDays
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumActionDisambiguationsLastTwentyEightDays:(BOOL)a3
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

- (void)deleteNumActionDisambiguationsLastTwentyEightDays
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastTwentyEightDays:](self, "setNumActionDisambiguationsLastTwentyEightDays:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFBF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumActionDisambiguationsLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numActionDisambiguationsLastInfinity = a3;
}

- (BOOL)hasNumActionDisambiguationsLastInfinity
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumActionDisambiguationsLastInfinity:(BOOL)a3
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

- (void)deleteNumActionDisambiguationsLastInfinity
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastInfinity:](self, "setNumActionDisambiguationsLastInfinity:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFF7F;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedActionDisambiguationsLastTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numSelectedActionDisambiguationsLastTwoMinutes = a3;
}

- (BOOL)hasNumSelectedActionDisambiguationsLastTwoMinutes
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumSelectedActionDisambiguationsLastTwoMinutes:(BOOL)a3
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

- (void)deleteNumSelectedActionDisambiguationsLastTwoMinutes
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTwoMinutes:](self, "setNumSelectedActionDisambiguationsLastTwoMinutes:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFEFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedActionDisambiguationsLastTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numSelectedActionDisambiguationsLastTenMinutes = a3;
}

- (BOOL)hasNumSelectedActionDisambiguationsLastTenMinutes
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasNumSelectedActionDisambiguationsLastTenMinutes:(BOOL)a3
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

- (void)deleteNumSelectedActionDisambiguationsLastTenMinutes
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTenMinutes:](self, "setNumSelectedActionDisambiguationsLastTenMinutes:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFDFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedActionDisambiguationsLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_numSelectedActionDisambiguationsLastOneHour = a3;
}

- (BOOL)hasNumSelectedActionDisambiguationsLastOneHour
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasNumSelectedActionDisambiguationsLastOneHour:(BOOL)a3
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

- (void)deleteNumSelectedActionDisambiguationsLastOneHour
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastOneHour:](self, "setNumSelectedActionDisambiguationsLastOneHour:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFBFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedActionDisambiguationsLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_numSelectedActionDisambiguationsLastSixHours = a3;
}

- (BOOL)hasNumSelectedActionDisambiguationsLastSixHours
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasNumSelectedActionDisambiguationsLastSixHours:(BOOL)a3
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

- (void)deleteNumSelectedActionDisambiguationsLastSixHours
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastSixHours:](self, "setNumSelectedActionDisambiguationsLastSixHours:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xF7FF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedActionDisambiguationsLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_numSelectedActionDisambiguationsLastOneDay = a3;
}

- (BOOL)hasNumSelectedActionDisambiguationsLastOneDay
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasNumSelectedActionDisambiguationsLastOneDay:(BOOL)a3
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

- (void)deleteNumSelectedActionDisambiguationsLastOneDay
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastOneDay:](self, "setNumSelectedActionDisambiguationsLastOneDay:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xEFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedActionDisambiguationsLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_numSelectedActionDisambiguationsLastSevenDays = a3;
}

- (BOOL)hasNumSelectedActionDisambiguationsLastSevenDays
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasNumSelectedActionDisambiguationsLastSevenDays:(BOOL)a3
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

- (void)deleteNumSelectedActionDisambiguationsLastSevenDays
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastSevenDays:](self, "setNumSelectedActionDisambiguationsLastSevenDays:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xDFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedActionDisambiguationsLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_numSelectedActionDisambiguationsLastTwentyEightDays = a3;
}

- (BOOL)hasNumSelectedActionDisambiguationsLastTwentyEightDays
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasNumSelectedActionDisambiguationsLastTwentyEightDays:(BOOL)a3
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

- (void)deleteNumSelectedActionDisambiguationsLastTwentyEightDays
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTwentyEightDays:](self, "setNumSelectedActionDisambiguationsLastTwentyEightDays:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xBFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedActionDisambiguationsLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_numSelectedActionDisambiguationsLastInfinity = a3;
}

- (BOOL)hasNumSelectedActionDisambiguationsLastInfinity
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasNumSelectedActionDisambiguationsLastInfinity:(BOOL)a3
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

- (void)deleteNumSelectedActionDisambiguationsLastInfinity
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastInfinity:](self, "setNumSelectedActionDisambiguationsLastInfinity:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0x7FFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setMinutesSinceLastDisambiguationSameActions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_minutesSinceLastDisambiguationSameActions = a3;
}

- (BOOL)hasMinutesSinceLastDisambiguationSameActions
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasMinutesSinceLastDisambiguationSameActions:(BOOL)a3
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

- (void)deleteMinutesSinceLastDisambiguationSameActions
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastDisambiguationSameActions:](self, "setMinutesSinceLastDisambiguationSameActions:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setMinutesSinceLastActionDisambiguationForThisAction:(unsigned int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_minutesSinceLastActionDisambiguationForThisAction = a3;
}

- (BOOL)hasMinutesSinceLastActionDisambiguationForThisAction
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasMinutesSinceLastActionDisambiguationForThisAction:(BOOL)a3
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

- (void)deleteMinutesSinceLastActionDisambiguationForThisAction
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastActionDisambiguationForThisAction:](self, "setMinutesSinceLastActionDisambiguationForThisAction:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setWasActionSelectedInLastDisambiguation:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x40000u) >> 16;
  self->_wasActionSelectedInLastDisambiguation = a3;
}

- (BOOL)hasWasActionSelectedInLastDisambiguation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasWasActionSelectedInLastDisambiguation:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteWasActionSelectedInLastDisambiguation
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setWasActionSelectedInLastDisambiguation:](self, "setWasActionSelectedInLastDisambiguation:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setMinutesSinceLastDisambiguationForSameActions:(unsigned int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x80000u) >> 16;
  self->_minutesSinceLastDisambiguationForSameActions = a3;
}

- (BOOL)hasMinutesSinceLastDisambiguationForSameActions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasMinutesSinceLastDisambiguationForSameActions:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteMinutesSinceLastDisambiguationForSameActions
{
  $0D61D09BE7FF1108964E27337A793345 has;
  unsigned int v4;

  -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastDisambiguationForSameActions:](self, "setMinutesSinceLastDisambiguationForSameActions:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARActionLevelDisambiguationHistoryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $0D61D09BE7FF1108964E27337A793345 has;
  int v5;
  $0D61D09BE7FF1108964E27337A793345 v6;
  id v7;

  v7 = a3;
  has = self->_has;
  v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = self->_has;
    v5 = *(_DWORD *)&v6 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0)
      goto LABEL_20;
LABEL_41:
    PBDataWriterWriteBOOLField();
    if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x40000) != 0)
    goto LABEL_41;
LABEL_20:
  if ((v5 & 0x80000) != 0)
LABEL_21:
    PBDataWriterWriteUint32Field();
LABEL_22:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int numActionDisambiguationsLastTwoMinutes;
  int v9;
  unsigned int numActionDisambiguationsLasTenMinutes;
  int v11;
  unsigned int numActionDisambiguationsLastOneHour;
  int v13;
  unsigned int numActionDisambiguationsLastSixHours;
  int v15;
  unsigned int numActionDisambiguationsLastOneDay;
  int v17;
  unsigned int numActionDisambiguationsLastSevenDays;
  int v19;
  unsigned int numActionDisambiguationsLastTwentyEightDays;
  int v21;
  unsigned int numActionDisambiguationsLastInfinity;
  int v23;
  unsigned int numSelectedActionDisambiguationsLastTwoMinutes;
  int v25;
  unsigned int numSelectedActionDisambiguationsLastTenMinutes;
  int v27;
  unsigned int numSelectedActionDisambiguationsLastOneHour;
  int v29;
  unsigned int numSelectedActionDisambiguationsLastSixHours;
  int v31;
  unsigned int numSelectedActionDisambiguationsLastOneDay;
  int v33;
  unsigned int numSelectedActionDisambiguationsLastSevenDays;
  int v35;
  unsigned int numSelectedActionDisambiguationsLastTwentyEightDays;
  int v37;
  unsigned int numSelectedActionDisambiguationsLastInfinity;
  int v39;
  int minutesSinceLastDisambiguationSameActions;
  int v41;
  unsigned int minutesSinceLastActionDisambiguationForThisAction;
  int v43;
  int wasActionSelectedInLastDisambiguation;
  int v45;
  unsigned int minutesSinceLastDisambiguationForSameActions;
  BOOL v47;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_82;
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  v6 = *(_WORD *)&self->_has & 1;
  v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  if (v6 != (v4[44] & 1))
    goto LABEL_82;
  if (v6)
  {
    numActionDisambiguationsLastTwoMinutes = self->_numActionDisambiguationsLastTwoMinutes;
    if (numActionDisambiguationsLastTwoMinutes != objc_msgSend(v4, "numActionDisambiguationsLastTwoMinutes"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v9 = (v5 >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1))
    goto LABEL_82;
  if (v9)
  {
    numActionDisambiguationsLasTenMinutes = self->_numActionDisambiguationsLasTenMinutes;
    if (numActionDisambiguationsLasTenMinutes != objc_msgSend(v4, "numActionDisambiguationsLasTenMinutes"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v11 = (v5 >> 2) & 1;
  if (v11 != ((v7 >> 2) & 1))
    goto LABEL_82;
  if (v11)
  {
    numActionDisambiguationsLastOneHour = self->_numActionDisambiguationsLastOneHour;
    if (numActionDisambiguationsLastOneHour != objc_msgSend(v4, "numActionDisambiguationsLastOneHour"))
      goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v13 = (v5 >> 3) & 1;
  if (v13 != ((v7 >> 3) & 1))
    goto LABEL_82;
  if (v13)
  {
    numActionDisambiguationsLastSixHours = self->_numActionDisambiguationsLastSixHours;
    if (numActionDisambiguationsLastSixHours != objc_msgSend(v4, "numActionDisambiguationsLastSixHours"))
      goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v15 = (v5 >> 4) & 1;
  if (v15 != ((v7 >> 4) & 1))
    goto LABEL_82;
  if (v15)
  {
    numActionDisambiguationsLastOneDay = self->_numActionDisambiguationsLastOneDay;
    if (numActionDisambiguationsLastOneDay != objc_msgSend(v4, "numActionDisambiguationsLastOneDay"))
      goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v17 = (v5 >> 5) & 1;
  if (v17 != ((v7 >> 5) & 1))
    goto LABEL_82;
  if (v17)
  {
    numActionDisambiguationsLastSevenDays = self->_numActionDisambiguationsLastSevenDays;
    if (numActionDisambiguationsLastSevenDays != objc_msgSend(v4, "numActionDisambiguationsLastSevenDays"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v19 = (v5 >> 6) & 1;
  if (v19 != ((v7 >> 6) & 1))
    goto LABEL_82;
  if (v19)
  {
    numActionDisambiguationsLastTwentyEightDays = self->_numActionDisambiguationsLastTwentyEightDays;
    if (numActionDisambiguationsLastTwentyEightDays != objc_msgSend(v4, "numActionDisambiguationsLastTwentyEightDays"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v21 = (v5 >> 7) & 1;
  if (v21 != ((v7 >> 7) & 1))
    goto LABEL_82;
  if (v21)
  {
    numActionDisambiguationsLastInfinity = self->_numActionDisambiguationsLastInfinity;
    if (numActionDisambiguationsLastInfinity != objc_msgSend(v4, "numActionDisambiguationsLastInfinity"))
      goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v23 = (v5 >> 8) & 1;
  if (v23 != ((v7 >> 8) & 1))
    goto LABEL_82;
  if (v23)
  {
    numSelectedActionDisambiguationsLastTwoMinutes = self->_numSelectedActionDisambiguationsLastTwoMinutes;
    if (numSelectedActionDisambiguationsLastTwoMinutes != objc_msgSend(v4, "numSelectedActionDisambiguationsLastTwoMinutes"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v25 = (v5 >> 9) & 1;
  if (v25 != ((v7 >> 9) & 1))
    goto LABEL_82;
  if (v25)
  {
    numSelectedActionDisambiguationsLastTenMinutes = self->_numSelectedActionDisambiguationsLastTenMinutes;
    if (numSelectedActionDisambiguationsLastTenMinutes != objc_msgSend(v4, "numSelectedActionDisambiguationsLastTenMinutes"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v27 = (v5 >> 10) & 1;
  if (v27 != ((v7 >> 10) & 1))
    goto LABEL_82;
  if (v27)
  {
    numSelectedActionDisambiguationsLastOneHour = self->_numSelectedActionDisambiguationsLastOneHour;
    if (numSelectedActionDisambiguationsLastOneHour != objc_msgSend(v4, "numSelectedActionDisambiguationsLastOneHour"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v29 = (v5 >> 11) & 1;
  if (v29 != ((v7 >> 11) & 1))
    goto LABEL_82;
  if (v29)
  {
    numSelectedActionDisambiguationsLastSixHours = self->_numSelectedActionDisambiguationsLastSixHours;
    if (numSelectedActionDisambiguationsLastSixHours != objc_msgSend(v4, "numSelectedActionDisambiguationsLastSixHours"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v31 = (v5 >> 12) & 1;
  if (v31 != ((v7 >> 12) & 1))
    goto LABEL_82;
  if (v31)
  {
    numSelectedActionDisambiguationsLastOneDay = self->_numSelectedActionDisambiguationsLastOneDay;
    if (numSelectedActionDisambiguationsLastOneDay != objc_msgSend(v4, "numSelectedActionDisambiguationsLastOneDay"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v33 = (v5 >> 13) & 1;
  if (v33 != ((v7 >> 13) & 1))
    goto LABEL_82;
  if (v33)
  {
    numSelectedActionDisambiguationsLastSevenDays = self->_numSelectedActionDisambiguationsLastSevenDays;
    if (numSelectedActionDisambiguationsLastSevenDays != objc_msgSend(v4, "numSelectedActionDisambiguationsLastSevenDays"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v35 = (v5 >> 14) & 1;
  if (v35 != ((v7 >> 14) & 1))
    goto LABEL_82;
  if (v35)
  {
    numSelectedActionDisambiguationsLastTwentyEightDays = self->_numSelectedActionDisambiguationsLastTwentyEightDays;
    if (numSelectedActionDisambiguationsLastTwentyEightDays != objc_msgSend(v4, "numSelectedActionDisambiguationsLastTwentyEightDays"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v37 = (v5 >> 15) & 1;
  if (v37 != ((v7 >> 15) & 1))
    goto LABEL_82;
  if (v37)
  {
    numSelectedActionDisambiguationsLastInfinity = self->_numSelectedActionDisambiguationsLastInfinity;
    if (numSelectedActionDisambiguationsLastInfinity != objc_msgSend(v4, "numSelectedActionDisambiguationsLastInfinity"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v39 = HIWORD(v5) & 1;
  if (v39 != (HIWORD(v7) & 1))
    goto LABEL_82;
  if (v39)
  {
    minutesSinceLastDisambiguationSameActions = self->_minutesSinceLastDisambiguationSameActions;
    if (minutesSinceLastDisambiguationSameActions != objc_msgSend(v4, "minutesSinceLastDisambiguationSameActions"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v41 = (v5 >> 17) & 1;
  if (v41 != ((v7 >> 17) & 1))
    goto LABEL_82;
  if (v41)
  {
    minutesSinceLastActionDisambiguationForThisAction = self->_minutesSinceLastActionDisambiguationForThisAction;
    if (minutesSinceLastActionDisambiguationForThisAction != objc_msgSend(v4, "minutesSinceLastActionDisambiguationForThisAction"))goto LABEL_82;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
  }
  v43 = (v5 >> 18) & 1;
  if (v43 != ((v7 >> 18) & 1))
    goto LABEL_82;
  if (v43)
  {
    wasActionSelectedInLastDisambiguation = self->_wasActionSelectedInLastDisambiguation;
    if (wasActionSelectedInLastDisambiguation == objc_msgSend(v4, "wasActionSelectedInLastDisambiguation"))
    {
      v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
      v7 = v4[44] | (*((unsigned __int8 *)v4 + 90) << 16);
      goto LABEL_78;
    }
LABEL_82:
    v47 = 0;
    goto LABEL_83;
  }
LABEL_78:
  v45 = (v5 >> 19) & 1;
  if (v45 != ((v7 >> 19) & 1))
    goto LABEL_82;
  if (v45)
  {
    minutesSinceLastDisambiguationForSameActions = self->_minutesSinceLastDisambiguationForSameActions;
    if (minutesSinceLastDisambiguationForSameActions != objc_msgSend(v4, "minutesSinceLastDisambiguationForSameActions"))goto LABEL_82;
  }
  v47 = 1;
LABEL_83:

  return v47;
}

- (unint64_t)hash
{
  $0D61D09BE7FF1108964E27337A793345 has;
  int v3;
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

  has = self->_has;
  v3 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4 = 2654435761 * self->_numActionDisambiguationsLastTwoMinutes;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_numActionDisambiguationsLasTenMinutes;
      if ((v3 & 4) != 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else
  {
    v4 = 0;
    if ((v3 & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_numActionDisambiguationsLastOneHour;
    if ((v3 & 8) != 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  v6 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_numActionDisambiguationsLastSixHours;
    if ((v3 & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  v7 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_numActionDisambiguationsLastOneDay;
    if ((v3 & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  v8 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_numActionDisambiguationsLastSevenDays;
    if ((v3 & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  v9 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_numActionDisambiguationsLastTwentyEightDays;
    if ((v3 & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  v10 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_9:
    v11 = 2654435761 * self->_numActionDisambiguationsLastInfinity;
    if ((v3 & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  v11 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_10:
    v12 = 2654435761 * self->_numSelectedActionDisambiguationsLastTwoMinutes;
    if ((v3 & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  v12 = 0;
  if ((v3 & 0x200) != 0)
  {
LABEL_11:
    v13 = 2654435761 * self->_numSelectedActionDisambiguationsLastTenMinutes;
    if ((v3 & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  v13 = 0;
  if ((v3 & 0x400) != 0)
  {
LABEL_12:
    v14 = 2654435761 * self->_numSelectedActionDisambiguationsLastOneHour;
    if ((v3 & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  v14 = 0;
  if ((v3 & 0x800) != 0)
  {
LABEL_13:
    v15 = 2654435761 * self->_numSelectedActionDisambiguationsLastSixHours;
    if ((v3 & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  v15 = 0;
  if ((v3 & 0x1000) != 0)
  {
LABEL_14:
    v16 = 2654435761 * self->_numSelectedActionDisambiguationsLastOneDay;
    if ((v3 & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  v16 = 0;
  if ((v3 & 0x2000) != 0)
  {
LABEL_15:
    v17 = 2654435761 * self->_numSelectedActionDisambiguationsLastSevenDays;
    if ((v3 & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  v17 = 0;
  if ((v3 & 0x4000) != 0)
  {
LABEL_16:
    v18 = 2654435761 * self->_numSelectedActionDisambiguationsLastTwentyEightDays;
    if ((v3 & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  v18 = 0;
  if ((v3 & 0x8000) != 0)
  {
LABEL_17:
    v19 = 2654435761 * self->_numSelectedActionDisambiguationsLastInfinity;
    if ((v3 & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  v19 = 0;
  if ((v3 & 0x10000) != 0)
  {
LABEL_18:
    v20 = 2654435761 * self->_minutesSinceLastDisambiguationSameActions;
    if ((v3 & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  v20 = 0;
  if ((v3 & 0x20000) != 0)
  {
LABEL_19:
    v21 = 2654435761 * self->_minutesSinceLastActionDisambiguationForThisAction;
    if ((v3 & 0x40000) != 0)
      goto LABEL_20;
LABEL_40:
    v22 = 0;
    if ((v3 & 0x80000) != 0)
      goto LABEL_21;
LABEL_41:
    v23 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_39:
  v21 = 0;
  if ((v3 & 0x40000) == 0)
    goto LABEL_40;
LABEL_20:
  v22 = 2654435761 * self->_wasActionSelectedInLastDisambiguation;
  if ((v3 & 0x80000) == 0)
    goto LABEL_41;
LABEL_21:
  v23 = 2654435761 * self->_minutesSinceLastDisambiguationForSameActions;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory minutesSinceLastActionDisambiguationForThisAction](self, "minutesSinceLastActionDisambiguationForThisAction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("minutesSinceLastActionDisambiguationForThisAction"));

    v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((v4 & 0x80000) == 0)
    {
LABEL_3:
      if ((v4 & 0x10000) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((v4 & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory minutesSinceLastDisambiguationForSameActions](self, "minutesSinceLastDisambiguationForSameActions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("minutesSinceLastDisambiguationForSameActions"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x10000) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionLevelDisambiguationHistory minutesSinceLastDisambiguationSameActions](self, "minutesSinceLastDisambiguationSameActions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("minutesSinceLastDisambiguationSameActions"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLasTenMinutes](self, "numActionDisambiguationsLasTenMinutes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numActionDisambiguationsLasTenMinutes"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_6:
    if ((v4 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastInfinity](self, "numActionDisambiguationsLastInfinity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numActionDisambiguationsLastInfinity"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_7:
    if ((v4 & 4) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastOneDay](self, "numActionDisambiguationsLastOneDay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numActionDisambiguationsLastOneDay"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastOneHour](self, "numActionDisambiguationsLastOneHour"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numActionDisambiguationsLastOneHour"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastSevenDays](self, "numActionDisambiguationsLastSevenDays"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numActionDisambiguationsLastSevenDays"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastSixHours](self, "numActionDisambiguationsLastSixHours"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("numActionDisambiguationsLastSixHours"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_11:
    if ((v4 & 1) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastTwentyEightDays](self, "numActionDisambiguationsLastTwentyEightDays"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("numActionDisambiguationsLastTwentyEightDays"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_12:
    if ((v4 & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numActionDisambiguationsLastTwoMinutes](self, "numActionDisambiguationsLastTwoMinutes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("numActionDisambiguationsLastTwoMinutes"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_13:
    if ((v4 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastInfinity](self, "numSelectedActionDisambiguationsLastInfinity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("numSelectedActionDisambiguationsLastInfinity"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v4 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastOneDay](self, "numSelectedActionDisambiguationsLastOneDay"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numSelectedActionDisambiguationsLastOneDay"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastOneHour](self, "numSelectedActionDisambiguationsLastOneHour"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numSelectedActionDisambiguationsLastOneHour"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_16:
    if ((v4 & 0x800) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastSevenDays](self, "numSelectedActionDisambiguationsLastSevenDays"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numSelectedActionDisambiguationsLastSevenDays"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_17:
    if ((v4 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastSixHours](self, "numSelectedActionDisambiguationsLastSixHours"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("numSelectedActionDisambiguationsLastSixHours"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_18:
    if ((v4 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastTenMinutes](self, "numSelectedActionDisambiguationsLastTenMinutes"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("numSelectedActionDisambiguationsLastTenMinutes"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_19:
    if ((v4 & 0x100) == 0)
      goto LABEL_20;
LABEL_41:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastTwoMinutes](self, "numSelectedActionDisambiguationsLastTwoMinutes"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("numSelectedActionDisambiguationsLastTwoMinutes"));

    if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARActionLevelDisambiguationHistory numSelectedActionDisambiguationsLastTwentyEightDays](self, "numSelectedActionDisambiguationsLastTwentyEightDays"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("numSelectedActionDisambiguationsLastTwentyEightDays"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_41;
LABEL_20:
  if ((v4 & 0x40000) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARActionLevelDisambiguationHistory wasActionSelectedInLastDisambiguation](self, "wasActionSelectedInLastDisambiguation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("wasActionSelectedInLastDisambiguation"));

  }
LABEL_22:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARActionLevelDisambiguationHistory dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARActionLevelDisambiguationHistory)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARActionLevelDisambiguationHistory *v5;
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
    self = -[CAARSchemaCAARActionLevelDisambiguationHistory initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARActionLevelDisambiguationHistory)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARActionLevelDisambiguationHistory *v5;
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
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
  CAARSchemaCAARActionLevelDisambiguationHistory *v31;
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
  void *v44;
  void *v45;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAARSchemaCAARActionLevelDisambiguationHistory;
  v5 = -[CAARSchemaCAARActionLevelDisambiguationHistory init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionDisambiguationsLastTwoMinutes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastTwoMinutes:](v5, "setNumActionDisambiguationsLastTwoMinutes:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionDisambiguationsLasTenMinutes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLasTenMinutes:](v5, "setNumActionDisambiguationsLasTenMinutes:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionDisambiguationsLastOneHour"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastOneHour:](v5, "setNumActionDisambiguationsLastOneHour:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionDisambiguationsLastSixHours"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastSixHours:](v5, "setNumActionDisambiguationsLastSixHours:", objc_msgSend(v9, "unsignedIntValue"));
    v35 = v9;
    v10 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionDisambiguationsLastOneDay"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastOneDay:](v5, "setNumActionDisambiguationsLastOneDay:", objc_msgSend(v11, "unsignedIntValue"));
    v38 = v11;
    v12 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionDisambiguationsLastSevenDays"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastSevenDays:](v5, "setNumActionDisambiguationsLastSevenDays:", objc_msgSend(v13, "unsignedIntValue"));
    v14 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionDisambiguationsLastTwentyEightDays"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastTwentyEightDays:](v5, "setNumActionDisambiguationsLastTwentyEightDays:", objc_msgSend(v15, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionDisambiguationsLastInfinity"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v45 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumActionDisambiguationsLastInfinity:](v5, "setNumActionDisambiguationsLastInfinity:", objc_msgSend(v16, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedActionDisambiguationsLastTwoMinutes"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v44 = (void *)v17;
    v18 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTwoMinutes:](v5, "setNumSelectedActionDisambiguationsLastTwoMinutes:", objc_msgSend(v44, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedActionDisambiguationsLastTenMinutes"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = (void *)v19;
    v20 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTenMinutes:](v5, "setNumSelectedActionDisambiguationsLastTenMinutes:", objc_msgSend(v43, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedActionDisambiguationsLastOneHour"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastOneHour:](v5, "setNumSelectedActionDisambiguationsLastOneHour:", objc_msgSend(v21, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedActionDisambiguationsLastSixHours"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastSixHours:](v5, "setNumSelectedActionDisambiguationsLastSixHours:", objc_msgSend(v22, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedActionDisambiguationsLastOneDay"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastOneDay:](v5, "setNumSelectedActionDisambiguationsLastOneDay:", objc_msgSend(v23, "unsignedIntValue"));
    v37 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedActionDisambiguationsLastSevenDays"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastSevenDays:](v5, "setNumSelectedActionDisambiguationsLastSevenDays:", objc_msgSend(v24, "unsignedIntValue"));
    v33 = v24;
    v36 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedActionDisambiguationsLastTwentyEightDays"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastTwentyEightDays:](v5, "setNumSelectedActionDisambiguationsLastTwentyEightDays:", objc_msgSend(v25, "unsignedIntValue"));
    v41 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedActionDisambiguationsLastInfinity"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setNumSelectedActionDisambiguationsLastInfinity:](v5, "setNumSelectedActionDisambiguationsLastInfinity:", objc_msgSend(v26, "unsignedIntValue"));
    v40 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minutesSinceLastDisambiguationSameActions"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastDisambiguationSameActions:](v5, "setMinutesSinceLastDisambiguationSameActions:", objc_msgSend(v27, "BOOLValue"));
    v34 = v21;
    v39 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minutesSinceLastActionDisambiguationForThisAction"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastActionDisambiguationForThisAction:](v5, "setMinutesSinceLastActionDisambiguationForThisAction:", objc_msgSend(v28, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasActionSelectedInLastDisambiguation"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setWasActionSelectedInLastDisambiguation:](v5, "setWasActionSelectedInLastDisambiguation:", objc_msgSend(v29, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minutesSinceLastDisambiguationForSameActions"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARActionLevelDisambiguationHistory setMinutesSinceLastDisambiguationForSameActions:](v5, "setMinutesSinceLastDisambiguationForSameActions:", objc_msgSend(v30, "unsignedIntValue"));
    v31 = v5;

  }
  return v5;
}

- (unsigned)numActionDisambiguationsLastTwoMinutes
{
  return self->_numActionDisambiguationsLastTwoMinutes;
}

- (unsigned)numActionDisambiguationsLasTenMinutes
{
  return self->_numActionDisambiguationsLasTenMinutes;
}

- (unsigned)numActionDisambiguationsLastOneHour
{
  return self->_numActionDisambiguationsLastOneHour;
}

- (unsigned)numActionDisambiguationsLastSixHours
{
  return self->_numActionDisambiguationsLastSixHours;
}

- (unsigned)numActionDisambiguationsLastOneDay
{
  return self->_numActionDisambiguationsLastOneDay;
}

- (unsigned)numActionDisambiguationsLastSevenDays
{
  return self->_numActionDisambiguationsLastSevenDays;
}

- (unsigned)numActionDisambiguationsLastTwentyEightDays
{
  return self->_numActionDisambiguationsLastTwentyEightDays;
}

- (unsigned)numActionDisambiguationsLastInfinity
{
  return self->_numActionDisambiguationsLastInfinity;
}

- (unsigned)numSelectedActionDisambiguationsLastTwoMinutes
{
  return self->_numSelectedActionDisambiguationsLastTwoMinutes;
}

- (unsigned)numSelectedActionDisambiguationsLastTenMinutes
{
  return self->_numSelectedActionDisambiguationsLastTenMinutes;
}

- (unsigned)numSelectedActionDisambiguationsLastOneHour
{
  return self->_numSelectedActionDisambiguationsLastOneHour;
}

- (unsigned)numSelectedActionDisambiguationsLastSixHours
{
  return self->_numSelectedActionDisambiguationsLastSixHours;
}

- (unsigned)numSelectedActionDisambiguationsLastOneDay
{
  return self->_numSelectedActionDisambiguationsLastOneDay;
}

- (unsigned)numSelectedActionDisambiguationsLastSevenDays
{
  return self->_numSelectedActionDisambiguationsLastSevenDays;
}

- (unsigned)numSelectedActionDisambiguationsLastTwentyEightDays
{
  return self->_numSelectedActionDisambiguationsLastTwentyEightDays;
}

- (unsigned)numSelectedActionDisambiguationsLastInfinity
{
  return self->_numSelectedActionDisambiguationsLastInfinity;
}

- (BOOL)minutesSinceLastDisambiguationSameActions
{
  return self->_minutesSinceLastDisambiguationSameActions;
}

- (unsigned)minutesSinceLastActionDisambiguationForThisAction
{
  return self->_minutesSinceLastActionDisambiguationForThisAction;
}

- (BOOL)wasActionSelectedInLastDisambiguation
{
  return self->_wasActionSelectedInLastDisambiguation;
}

- (unsigned)minutesSinceLastDisambiguationForSameActions
{
  return self->_minutesSinceLastDisambiguationForSameActions;
}

@end
