@implementation CAARSchemaCAARAppLevelDisambiguationHistory

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumAppDisambiguationsLastTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numAppDisambiguationsLastTwoMinutes = a3;
}

- (BOOL)hasNumAppDisambiguationsLastTwoMinutes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNumAppDisambiguationsLastTwoMinutes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteNumAppDisambiguationsLastTwoMinutes
{
  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTwoMinutes:](self, "setNumAppDisambiguationsLastTwoMinutes:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setNumAppDisambiguationsLastTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numAppDisambiguationsLastTenMinutes = a3;
}

- (BOOL)hasNumAppDisambiguationsLastTenMinutes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasNumAppDisambiguationsLastTenMinutes:(BOOL)a3
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

- (void)deleteNumAppDisambiguationsLastTenMinutes
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTenMinutes:](self, "setNumAppDisambiguationsLastTenMinutes:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFD;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumAppDisambiguationsLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numAppDisambiguationsLastOneHour = a3;
}

- (BOOL)hasNumAppDisambiguationsLastOneHour
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasNumAppDisambiguationsLastOneHour:(BOOL)a3
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

- (void)deleteNumAppDisambiguationsLastOneHour
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastOneHour:](self, "setNumAppDisambiguationsLastOneHour:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFB;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumAppDisambiguationsLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numAppDisambiguationsLastSixHours = a3;
}

- (BOOL)hasNumAppDisambiguationsLastSixHours
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasNumAppDisambiguationsLastSixHours:(BOOL)a3
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

- (void)deleteNumAppDisambiguationsLastSixHours
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastSixHours:](self, "setNumAppDisambiguationsLastSixHours:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFF7;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumAppDisambiguationsLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numAppDisambiguationsLastOneDay = a3;
}

- (BOOL)hasNumAppDisambiguationsLastOneDay
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasNumAppDisambiguationsLastOneDay:(BOOL)a3
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

- (void)deleteNumAppDisambiguationsLastOneDay
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastOneDay:](self, "setNumAppDisambiguationsLastOneDay:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFEF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumAppDisambiguationsLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numAppDisambiguationsLastSevenDays = a3;
}

- (BOOL)hasNumAppDisambiguationsLastSevenDays
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasNumAppDisambiguationsLastSevenDays:(BOOL)a3
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

- (void)deleteNumAppDisambiguationsLastSevenDays
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastSevenDays:](self, "setNumAppDisambiguationsLastSevenDays:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFDF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumAppDisambiguationsLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numAppDisambiguationsLastTwentyEightDays = a3;
}

- (BOOL)hasNumAppDisambiguationsLastTwentyEightDays
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNumAppDisambiguationsLastTwentyEightDays:(BOOL)a3
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

- (void)deleteNumAppDisambiguationsLastTwentyEightDays
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTwentyEightDays:](self, "setNumAppDisambiguationsLastTwentyEightDays:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFBF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumAppDisambiguationsLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numAppDisambiguationsLastInfinity = a3;
}

- (BOOL)hasNumAppDisambiguationsLastInfinity
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasNumAppDisambiguationsLastInfinity:(BOOL)a3
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

- (void)deleteNumAppDisambiguationsLastInfinity
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastInfinity:](self, "setNumAppDisambiguationsLastInfinity:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFF7F;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedAppDisambiguationsTwoMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numSelectedAppDisambiguationsTwoMinutes = a3;
}

- (BOOL)hasNumSelectedAppDisambiguationsTwoMinutes
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasNumSelectedAppDisambiguationsTwoMinutes:(BOOL)a3
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

- (void)deleteNumSelectedAppDisambiguationsTwoMinutes
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsTwoMinutes:](self, "setNumSelectedAppDisambiguationsTwoMinutes:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFEFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedAppDisambiguationsLastTenMinutes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numSelectedAppDisambiguationsLastTenMinutes = a3;
}

- (BOOL)hasNumSelectedAppDisambiguationsLastTenMinutes
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasNumSelectedAppDisambiguationsLastTenMinutes:(BOOL)a3
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

- (void)deleteNumSelectedAppDisambiguationsLastTenMinutes
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastTenMinutes:](self, "setNumSelectedAppDisambiguationsLastTenMinutes:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFDFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedAppDisambiguationsLastOneHour:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_numSelectedAppDisambiguationsLastOneHour = a3;
}

- (BOOL)hasNumSelectedAppDisambiguationsLastOneHour
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasNumSelectedAppDisambiguationsLastOneHour:(BOOL)a3
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

- (void)deleteNumSelectedAppDisambiguationsLastOneHour
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastOneHour:](self, "setNumSelectedAppDisambiguationsLastOneHour:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFBFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedAppDisambiguationsLastSixHours:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_numSelectedAppDisambiguationsLastSixHours = a3;
}

- (BOOL)hasNumSelectedAppDisambiguationsLastSixHours
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasNumSelectedAppDisambiguationsLastSixHours:(BOOL)a3
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

- (void)deleteNumSelectedAppDisambiguationsLastSixHours
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastSixHours:](self, "setNumSelectedAppDisambiguationsLastSixHours:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xF7FF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedAppDisambiguationsLastOneDay:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_numSelectedAppDisambiguationsLastOneDay = a3;
}

- (BOOL)hasNumSelectedAppDisambiguationsLastOneDay
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasNumSelectedAppDisambiguationsLastOneDay:(BOOL)a3
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

- (void)deleteNumSelectedAppDisambiguationsLastOneDay
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastOneDay:](self, "setNumSelectedAppDisambiguationsLastOneDay:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xEFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedAppDisambiguationsLastSevenDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_numSelectedAppDisambiguationsLastSevenDays = a3;
}

- (BOOL)hasNumSelectedAppDisambiguationsLastSevenDays
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasNumSelectedAppDisambiguationsLastSevenDays:(BOOL)a3
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

- (void)deleteNumSelectedAppDisambiguationsLastSevenDays
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastSevenDays:](self, "setNumSelectedAppDisambiguationsLastSevenDays:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xDFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedAppDisambiguationsLastTwentyEightDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_numSelectedAppDisambiguationsLastTwentyEightDays = a3;
}

- (BOOL)hasNumSelectedAppDisambiguationsLastTwentyEightDays
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasNumSelectedAppDisambiguationsLastTwentyEightDays:(BOOL)a3
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

- (void)deleteNumSelectedAppDisambiguationsLastTwentyEightDays
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastTwentyEightDays:](self, "setNumSelectedAppDisambiguationsLastTwentyEightDays:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xBFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setNumSelectedAppDisambiguationsLastInfinity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_numSelectedAppDisambiguationsLastInfinity = a3;
}

- (BOOL)hasNumSelectedAppDisambiguationsLastInfinity
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasNumSelectedAppDisambiguationsLastInfinity:(BOOL)a3
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

- (void)deleteNumSelectedAppDisambiguationsLastInfinity
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastInfinity:](self, "setNumSelectedAppDisambiguationsLastInfinity:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0x7FFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setWasAppSelectedInLastDisambiguation:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_wasAppSelectedInLastDisambiguation = a3;
}

- (BOOL)hasWasAppSelectedInLastDisambiguation
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasWasAppSelectedInLastDisambiguation:(BOOL)a3
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

- (void)deleteWasAppSelectedInLastDisambiguation
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setWasAppSelectedInLastDisambiguation:](self, "setWasAppSelectedInLastDisambiguation:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setMinutesSinceLastDisambiguationSameApps:(unsigned int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_minutesSinceLastDisambiguationSameApps = a3;
}

- (BOOL)hasMinutesSinceLastDisambiguationSameApps
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasMinutesSinceLastDisambiguationSameApps:(BOOL)a3
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

- (void)deleteMinutesSinceLastDisambiguationSameApps
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  unsigned int v4;

  -[CAARSchemaCAARAppLevelDisambiguationHistory setMinutesSinceLastDisambiguationSameApps:](self, "setMinutesSinceLastDisambiguationSameApps:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARAppLevelDisambiguationHistoryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
  int v5;
  $01D7AFD5F24F374F3B3634AAFDC003B7 v6;
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
      goto LABEL_23;
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
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0)
      goto LABEL_18;
LABEL_37:
    PBDataWriterWriteBOOLField();
    if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x10000) != 0)
    goto LABEL_37;
LABEL_18:
  if ((v5 & 0x20000) != 0)
LABEL_19:
    PBDataWriterWriteUint32Field();
LABEL_20:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int numAppDisambiguationsLastTwoMinutes;
  int v9;
  unsigned int numAppDisambiguationsLastTenMinutes;
  int v11;
  unsigned int numAppDisambiguationsLastOneHour;
  int v13;
  unsigned int numAppDisambiguationsLastSixHours;
  int v15;
  unsigned int numAppDisambiguationsLastOneDay;
  int v17;
  unsigned int numAppDisambiguationsLastSevenDays;
  int v19;
  unsigned int numAppDisambiguationsLastTwentyEightDays;
  int v21;
  unsigned int numAppDisambiguationsLastInfinity;
  int v23;
  unsigned int numSelectedAppDisambiguationsTwoMinutes;
  int v25;
  unsigned int numSelectedAppDisambiguationsLastTenMinutes;
  int v27;
  unsigned int numSelectedAppDisambiguationsLastOneHour;
  int v29;
  unsigned int numSelectedAppDisambiguationsLastSixHours;
  int v31;
  unsigned int numSelectedAppDisambiguationsLastOneDay;
  int v33;
  unsigned int numSelectedAppDisambiguationsLastSevenDays;
  int v35;
  unsigned int numSelectedAppDisambiguationsLastTwentyEightDays;
  int v37;
  unsigned int numSelectedAppDisambiguationsLastInfinity;
  int v39;
  int wasAppSelectedInLastDisambiguation;
  int v41;
  unsigned int minutesSinceLastDisambiguationSameApps;
  BOOL v43;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_74;
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  v6 = *(_WORD *)&self->_has & 1;
  v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  if (v6 != (v4[40] & 1))
    goto LABEL_74;
  if (v6)
  {
    numAppDisambiguationsLastTwoMinutes = self->_numAppDisambiguationsLastTwoMinutes;
    if (numAppDisambiguationsLastTwoMinutes != objc_msgSend(v4, "numAppDisambiguationsLastTwoMinutes"))
      goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v9 = (v5 >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1))
    goto LABEL_74;
  if (v9)
  {
    numAppDisambiguationsLastTenMinutes = self->_numAppDisambiguationsLastTenMinutes;
    if (numAppDisambiguationsLastTenMinutes != objc_msgSend(v4, "numAppDisambiguationsLastTenMinutes"))
      goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v11 = (v5 >> 2) & 1;
  if (v11 != ((v7 >> 2) & 1))
    goto LABEL_74;
  if (v11)
  {
    numAppDisambiguationsLastOneHour = self->_numAppDisambiguationsLastOneHour;
    if (numAppDisambiguationsLastOneHour != objc_msgSend(v4, "numAppDisambiguationsLastOneHour"))
      goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v13 = (v5 >> 3) & 1;
  if (v13 != ((v7 >> 3) & 1))
    goto LABEL_74;
  if (v13)
  {
    numAppDisambiguationsLastSixHours = self->_numAppDisambiguationsLastSixHours;
    if (numAppDisambiguationsLastSixHours != objc_msgSend(v4, "numAppDisambiguationsLastSixHours"))
      goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v15 = (v5 >> 4) & 1;
  if (v15 != ((v7 >> 4) & 1))
    goto LABEL_74;
  if (v15)
  {
    numAppDisambiguationsLastOneDay = self->_numAppDisambiguationsLastOneDay;
    if (numAppDisambiguationsLastOneDay != objc_msgSend(v4, "numAppDisambiguationsLastOneDay"))
      goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v17 = (v5 >> 5) & 1;
  if (v17 != ((v7 >> 5) & 1))
    goto LABEL_74;
  if (v17)
  {
    numAppDisambiguationsLastSevenDays = self->_numAppDisambiguationsLastSevenDays;
    if (numAppDisambiguationsLastSevenDays != objc_msgSend(v4, "numAppDisambiguationsLastSevenDays"))
      goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v19 = (v5 >> 6) & 1;
  if (v19 != ((v7 >> 6) & 1))
    goto LABEL_74;
  if (v19)
  {
    numAppDisambiguationsLastTwentyEightDays = self->_numAppDisambiguationsLastTwentyEightDays;
    if (numAppDisambiguationsLastTwentyEightDays != objc_msgSend(v4, "numAppDisambiguationsLastTwentyEightDays"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v21 = (v5 >> 7) & 1;
  if (v21 != ((v7 >> 7) & 1))
    goto LABEL_74;
  if (v21)
  {
    numAppDisambiguationsLastInfinity = self->_numAppDisambiguationsLastInfinity;
    if (numAppDisambiguationsLastInfinity != objc_msgSend(v4, "numAppDisambiguationsLastInfinity"))
      goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v23 = (v5 >> 8) & 1;
  if (v23 != ((v7 >> 8) & 1))
    goto LABEL_74;
  if (v23)
  {
    numSelectedAppDisambiguationsTwoMinutes = self->_numSelectedAppDisambiguationsTwoMinutes;
    if (numSelectedAppDisambiguationsTwoMinutes != objc_msgSend(v4, "numSelectedAppDisambiguationsTwoMinutes"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v25 = (v5 >> 9) & 1;
  if (v25 != ((v7 >> 9) & 1))
    goto LABEL_74;
  if (v25)
  {
    numSelectedAppDisambiguationsLastTenMinutes = self->_numSelectedAppDisambiguationsLastTenMinutes;
    if (numSelectedAppDisambiguationsLastTenMinutes != objc_msgSend(v4, "numSelectedAppDisambiguationsLastTenMinutes"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v27 = (v5 >> 10) & 1;
  if (v27 != ((v7 >> 10) & 1))
    goto LABEL_74;
  if (v27)
  {
    numSelectedAppDisambiguationsLastOneHour = self->_numSelectedAppDisambiguationsLastOneHour;
    if (numSelectedAppDisambiguationsLastOneHour != objc_msgSend(v4, "numSelectedAppDisambiguationsLastOneHour"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v29 = (v5 >> 11) & 1;
  if (v29 != ((v7 >> 11) & 1))
    goto LABEL_74;
  if (v29)
  {
    numSelectedAppDisambiguationsLastSixHours = self->_numSelectedAppDisambiguationsLastSixHours;
    if (numSelectedAppDisambiguationsLastSixHours != objc_msgSend(v4, "numSelectedAppDisambiguationsLastSixHours"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v31 = (v5 >> 12) & 1;
  if (v31 != ((v7 >> 12) & 1))
    goto LABEL_74;
  if (v31)
  {
    numSelectedAppDisambiguationsLastOneDay = self->_numSelectedAppDisambiguationsLastOneDay;
    if (numSelectedAppDisambiguationsLastOneDay != objc_msgSend(v4, "numSelectedAppDisambiguationsLastOneDay"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v33 = (v5 >> 13) & 1;
  if (v33 != ((v7 >> 13) & 1))
    goto LABEL_74;
  if (v33)
  {
    numSelectedAppDisambiguationsLastSevenDays = self->_numSelectedAppDisambiguationsLastSevenDays;
    if (numSelectedAppDisambiguationsLastSevenDays != objc_msgSend(v4, "numSelectedAppDisambiguationsLastSevenDays"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v35 = (v5 >> 14) & 1;
  if (v35 != ((v7 >> 14) & 1))
    goto LABEL_74;
  if (v35)
  {
    numSelectedAppDisambiguationsLastTwentyEightDays = self->_numSelectedAppDisambiguationsLastTwentyEightDays;
    if (numSelectedAppDisambiguationsLastTwentyEightDays != objc_msgSend(v4, "numSelectedAppDisambiguationsLastTwentyEightDays"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v37 = (v5 >> 15) & 1;
  if (v37 != ((v7 >> 15) & 1))
    goto LABEL_74;
  if (v37)
  {
    numSelectedAppDisambiguationsLastInfinity = self->_numSelectedAppDisambiguationsLastInfinity;
    if (numSelectedAppDisambiguationsLastInfinity != objc_msgSend(v4, "numSelectedAppDisambiguationsLastInfinity"))goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
  }
  v39 = HIWORD(v5) & 1;
  if (v39 != (HIWORD(v7) & 1))
    goto LABEL_74;
  if (v39)
  {
    wasAppSelectedInLastDisambiguation = self->_wasAppSelectedInLastDisambiguation;
    if (wasAppSelectedInLastDisambiguation == objc_msgSend(v4, "wasAppSelectedInLastDisambiguation"))
    {
      v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
      v7 = v4[40] | (*((unsigned __int8 *)v4 + 82) << 16);
      goto LABEL_70;
    }
LABEL_74:
    v43 = 0;
    goto LABEL_75;
  }
LABEL_70:
  v41 = (v5 >> 17) & 1;
  if (v41 != ((v7 >> 17) & 1))
    goto LABEL_74;
  if (v41)
  {
    minutesSinceLastDisambiguationSameApps = self->_minutesSinceLastDisambiguationSameApps;
    if (minutesSinceLastDisambiguationSameApps != objc_msgSend(v4, "minutesSinceLastDisambiguationSameApps"))goto LABEL_74;
  }
  v43 = 1;
LABEL_75:

  return v43;
}

- (unint64_t)hash
{
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
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

  has = self->_has;
  v3 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4 = 2654435761 * self->_numAppDisambiguationsLastTwoMinutes;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_numAppDisambiguationsLastTenMinutes;
      if ((v3 & 4) != 0)
        goto LABEL_4;
      goto LABEL_22;
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
    v6 = 2654435761 * self->_numAppDisambiguationsLastOneHour;
    if ((v3 & 8) != 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  v6 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_numAppDisambiguationsLastSixHours;
    if ((v3 & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  v7 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_numAppDisambiguationsLastOneDay;
    if ((v3 & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  v8 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_numAppDisambiguationsLastSevenDays;
    if ((v3 & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v9 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_numAppDisambiguationsLastTwentyEightDays;
    if ((v3 & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v10 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_9:
    v11 = 2654435761 * self->_numAppDisambiguationsLastInfinity;
    if ((v3 & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v11 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_10:
    v12 = 2654435761 * self->_numSelectedAppDisambiguationsTwoMinutes;
    if ((v3 & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v12 = 0;
  if ((v3 & 0x200) != 0)
  {
LABEL_11:
    v13 = 2654435761 * self->_numSelectedAppDisambiguationsLastTenMinutes;
    if ((v3 & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v13 = 0;
  if ((v3 & 0x400) != 0)
  {
LABEL_12:
    v14 = 2654435761 * self->_numSelectedAppDisambiguationsLastOneHour;
    if ((v3 & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v14 = 0;
  if ((v3 & 0x800) != 0)
  {
LABEL_13:
    v15 = 2654435761 * self->_numSelectedAppDisambiguationsLastSixHours;
    if ((v3 & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v15 = 0;
  if ((v3 & 0x1000) != 0)
  {
LABEL_14:
    v16 = 2654435761 * self->_numSelectedAppDisambiguationsLastOneDay;
    if ((v3 & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v16 = 0;
  if ((v3 & 0x2000) != 0)
  {
LABEL_15:
    v17 = 2654435761 * self->_numSelectedAppDisambiguationsLastSevenDays;
    if ((v3 & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  v17 = 0;
  if ((v3 & 0x4000) != 0)
  {
LABEL_16:
    v18 = 2654435761 * self->_numSelectedAppDisambiguationsLastTwentyEightDays;
    if ((v3 & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  v18 = 0;
  if ((v3 & 0x8000) != 0)
  {
LABEL_17:
    v19 = 2654435761 * self->_numSelectedAppDisambiguationsLastInfinity;
    if ((v3 & 0x10000) != 0)
      goto LABEL_18;
LABEL_36:
    v20 = 0;
    if ((v3 & 0x20000) != 0)
      goto LABEL_19;
LABEL_37:
    v21 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_35:
  v19 = 0;
  if ((v3 & 0x10000) == 0)
    goto LABEL_36;
LABEL_18:
  v20 = 2654435761 * self->_wasAppSelectedInLastDisambiguation;
  if ((v3 & 0x20000) == 0)
    goto LABEL_37;
LABEL_19:
  v21 = 2654435761 * self->_minutesSinceLastDisambiguationSameApps;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  void *v5;
  void *v7;
  $01D7AFD5F24F374F3B3634AAFDC003B7 has;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory minutesSinceLastDisambiguationSameApps](self, "minutesSinceLastDisambiguationSameApps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("minutesSinceLastDisambiguationSameApps"));

    has = self->_has;
    v4 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_BYTE *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastInfinity](self, "numAppDisambiguationsLastInfinity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numAppDisambiguationsLastInfinity"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastOneDay](self, "numAppDisambiguationsLastOneDay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numAppDisambiguationsLastOneDay"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastOneHour](self, "numAppDisambiguationsLastOneHour"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numAppDisambiguationsLastOneHour"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastSevenDays](self, "numAppDisambiguationsLastSevenDays"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numAppDisambiguationsLastSevenDays"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_7:
    if ((v4 & 2) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastSixHours](self, "numAppDisambiguationsLastSixHours"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("numAppDisambiguationsLastSixHours"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 2) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastTenMinutes](self, "numAppDisambiguationsLastTenMinutes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numAppDisambiguationsLastTenMinutes"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 1) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastTwentyEightDays](self, "numAppDisambiguationsLastTwentyEightDays"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("numAppDisambiguationsLastTwentyEightDays"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_10:
    if ((v4 & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numAppDisambiguationsLastTwoMinutes](self, "numAppDisambiguationsLastTwoMinutes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("numAppDisambiguationsLastTwoMinutes"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_11:
    if ((v4 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastInfinity](self, "numSelectedAppDisambiguationsLastInfinity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("numSelectedAppDisambiguationsLastInfinity"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_12:
    if ((v4 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastOneDay](self, "numSelectedAppDisambiguationsLastOneDay"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("numSelectedAppDisambiguationsLastOneDay"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastOneHour](self, "numSelectedAppDisambiguationsLastOneHour"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numSelectedAppDisambiguationsLastOneHour"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_14:
    if ((v4 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastSevenDays](self, "numSelectedAppDisambiguationsLastSevenDays"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numSelectedAppDisambiguationsLastSevenDays"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_15:
    if ((v4 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastSixHours](self, "numSelectedAppDisambiguationsLastSixHours"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numSelectedAppDisambiguationsLastSixHours"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_16:
    if ((v4 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastTenMinutes](self, "numSelectedAppDisambiguationsLastTenMinutes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("numSelectedAppDisambiguationsLastTenMinutes"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_17:
    if ((v4 & 0x100) == 0)
      goto LABEL_18;
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsTwoMinutes](self, "numSelectedAppDisambiguationsTwoMinutes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("numSelectedAppDisambiguationsTwoMinutes"));

    if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAARSchemaCAARAppLevelDisambiguationHistory numSelectedAppDisambiguationsLastTwentyEightDays](self, "numSelectedAppDisambiguationsLastTwentyEightDays"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("numSelectedAppDisambiguationsLastTwentyEightDays"));

  v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    goto LABEL_37;
LABEL_18:
  if ((v4 & 0x10000) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CAARSchemaCAARAppLevelDisambiguationHistory wasAppSelectedInLastDisambiguation](self, "wasAppSelectedInLastDisambiguation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("wasAppSelectedInLastDisambiguation"));

  }
LABEL_20:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAARSchemaCAARAppLevelDisambiguationHistory dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAARSchemaCAARAppLevelDisambiguationHistory)initWithJSON:(id)a3
{
  void *v4;
  CAARSchemaCAARAppLevelDisambiguationHistory *v5;
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
    self = -[CAARSchemaCAARAppLevelDisambiguationHistory initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAARSchemaCAARAppLevelDisambiguationHistory)initWithDictionary:(id)a3
{
  id v4;
  CAARSchemaCAARAppLevelDisambiguationHistory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  CAARSchemaCAARAppLevelDisambiguationHistory *v27;
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
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CAARSchemaCAARAppLevelDisambiguationHistory;
  v5 = -[CAARSchemaCAARAppLevelDisambiguationHistory init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppDisambiguationsLastTwoMinutes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTwoMinutes:](v5, "setNumAppDisambiguationsLastTwoMinutes:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppDisambiguationsLastTenMinutes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTenMinutes:](v5, "setNumAppDisambiguationsLastTenMinutes:", objc_msgSend(v7, "unsignedIntValue"));
    v30 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppDisambiguationsLastOneHour"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastOneHour:](v5, "setNumAppDisambiguationsLastOneHour:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppDisambiguationsLastSixHours"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastSixHours:](v5, "setNumAppDisambiguationsLastSixHours:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppDisambiguationsLastOneDay"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastOneDay:](v5, "setNumAppDisambiguationsLastOneDay:", objc_msgSend(v10, "unsignedIntValue"));
    v35 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppDisambiguationsLastSevenDays"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastSevenDays:](v5, "setNumAppDisambiguationsLastSevenDays:", objc_msgSend(v11, "unsignedIntValue"));
    v12 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppDisambiguationsLastTwentyEightDays"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastTwentyEightDays:](v5, "setNumAppDisambiguationsLastTwentyEightDays:", objc_msgSend(v13, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numAppDisambiguationsLastInfinity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumAppDisambiguationsLastInfinity:](v5, "setNumAppDisambiguationsLastInfinity:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAppDisambiguationsTwoMinutes"));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = (void *)v15;
    v16 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsTwoMinutes:](v5, "setNumSelectedAppDisambiguationsTwoMinutes:", objc_msgSend(v38, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAppDisambiguationsLastTenMinutes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastTenMinutes:](v5, "setNumSelectedAppDisambiguationsLastTenMinutes:", objc_msgSend(v17, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAppDisambiguationsLastOneHour"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastOneHour:](v5, "setNumSelectedAppDisambiguationsLastOneHour:", objc_msgSend(v18, "unsignedIntValue"));
    v34 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAppDisambiguationsLastSixHours"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastSixHours:](v5, "setNumSelectedAppDisambiguationsLastSixHours:", objc_msgSend(v19, "unsignedIntValue"));
    v33 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAppDisambiguationsLastOneDay"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastOneDay:](v5, "setNumSelectedAppDisambiguationsLastOneDay:", objc_msgSend(v20, "unsignedIntValue"));
    v32 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAppDisambiguationsLastSevenDays"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastSevenDays:](v5, "setNumSelectedAppDisambiguationsLastSevenDays:", objc_msgSend(v21, "unsignedIntValue"));
    v31 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAppDisambiguationsLastTwentyEightDays"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastTwentyEightDays:](v5, "setNumSelectedAppDisambiguationsLastTwentyEightDays:", objc_msgSend(v22, "unsignedIntValue"));
    v29 = v19;
    v36 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSelectedAppDisambiguationsLastInfinity"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setNumSelectedAppDisambiguationsLastInfinity:](v5, "setNumSelectedAppDisambiguationsLastInfinity:", objc_msgSend(v23, "unsignedIntValue"));
    v24 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasAppSelectedInLastDisambiguation"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setWasAppSelectedInLastDisambiguation:](v5, "setWasAppSelectedInLastDisambiguation:", objc_msgSend(v25, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minutesSinceLastDisambiguationSameApps"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAARSchemaCAARAppLevelDisambiguationHistory setMinutesSinceLastDisambiguationSameApps:](v5, "setMinutesSinceLastDisambiguationSameApps:", objc_msgSend(v26, "unsignedIntValue"));
    v27 = v5;

  }
  return v5;
}

- (unsigned)numAppDisambiguationsLastTwoMinutes
{
  return self->_numAppDisambiguationsLastTwoMinutes;
}

- (unsigned)numAppDisambiguationsLastTenMinutes
{
  return self->_numAppDisambiguationsLastTenMinutes;
}

- (unsigned)numAppDisambiguationsLastOneHour
{
  return self->_numAppDisambiguationsLastOneHour;
}

- (unsigned)numAppDisambiguationsLastSixHours
{
  return self->_numAppDisambiguationsLastSixHours;
}

- (unsigned)numAppDisambiguationsLastOneDay
{
  return self->_numAppDisambiguationsLastOneDay;
}

- (unsigned)numAppDisambiguationsLastSevenDays
{
  return self->_numAppDisambiguationsLastSevenDays;
}

- (unsigned)numAppDisambiguationsLastTwentyEightDays
{
  return self->_numAppDisambiguationsLastTwentyEightDays;
}

- (unsigned)numAppDisambiguationsLastInfinity
{
  return self->_numAppDisambiguationsLastInfinity;
}

- (unsigned)numSelectedAppDisambiguationsTwoMinutes
{
  return self->_numSelectedAppDisambiguationsTwoMinutes;
}

- (unsigned)numSelectedAppDisambiguationsLastTenMinutes
{
  return self->_numSelectedAppDisambiguationsLastTenMinutes;
}

- (unsigned)numSelectedAppDisambiguationsLastOneHour
{
  return self->_numSelectedAppDisambiguationsLastOneHour;
}

- (unsigned)numSelectedAppDisambiguationsLastSixHours
{
  return self->_numSelectedAppDisambiguationsLastSixHours;
}

- (unsigned)numSelectedAppDisambiguationsLastOneDay
{
  return self->_numSelectedAppDisambiguationsLastOneDay;
}

- (unsigned)numSelectedAppDisambiguationsLastSevenDays
{
  return self->_numSelectedAppDisambiguationsLastSevenDays;
}

- (unsigned)numSelectedAppDisambiguationsLastTwentyEightDays
{
  return self->_numSelectedAppDisambiguationsLastTwentyEightDays;
}

- (unsigned)numSelectedAppDisambiguationsLastInfinity
{
  return self->_numSelectedAppDisambiguationsLastInfinity;
}

- (BOOL)wasAppSelectedInLastDisambiguation
{
  return self->_wasAppSelectedInLastDisambiguation;
}

- (unsigned)minutesSinceLastDisambiguationSameApps
{
  return self->_minutesSinceLastDisambiguationSameApps;
}

@end
