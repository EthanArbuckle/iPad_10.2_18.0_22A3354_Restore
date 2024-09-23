@implementation PEGASUSSchemaPEGASUSDomainCards

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setClockCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_clockCount = a3;
}

- (BOOL)hasClockCount
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasClockCount:(BOOL)a3
{
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)deleteClockCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setClockCount:](self, "setClockCount:", 0);
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setDictionaryCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_dictionaryCount = a3;
}

- (BOOL)hasDictionaryCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDictionaryCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)deleteDictionaryCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setDictionaryCount:](self, "setDictionaryCount:", 0);
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setKgCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_kgCount = a3;
}

- (BOOL)hasKgCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasKgCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)deleteKgCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setKgCount:](self, "setKgCount:", 0);
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setMapsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_mapsCount = a3;
}

- (BOOL)hasMapsCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasMapsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)deleteMapsCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setMapsCount:](self, "setMapsCount:", 0);
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setMathCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_mathCount = a3;
}

- (BOOL)hasMathCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasMathCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)deleteMathCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setMathCount:](self, "setMathCount:", 0);
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setMediaCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_mediaCount = a3;
}

- (BOOL)hasMediaCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasMediaCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)deleteMediaCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setMediaCount:](self, "setMediaCount:", 0);
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setMoviesCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_moviesCount = a3;
}

- (BOOL)hasMoviesCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasMoviesCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)deleteMoviesCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setMoviesCount:](self, "setMoviesCount:", 0);
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setNewsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_newsCount = a3;
}

- (BOOL)hasNewsCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasNewsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)deleteNewsCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setNewsCount:](self, "setNewsCount:", 0);
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setPrecomputedWebanswersCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_precomputedWebanswersCount = a3;
}

- (BOOL)hasPrecomputedWebanswersCount
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasPrecomputedWebanswersCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)deletePrecomputedWebanswersCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setPrecomputedWebanswersCount:](self, "setPrecomputedWebanswersCount:", 0);
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setSportsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_sportsCount = a3;
}

- (BOOL)hasSportsCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasSportsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)deleteSportsCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setSportsCount:](self, "setSportsCount:", 0);
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setStocksCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_stocksCount = a3;
}

- (BOOL)hasStocksCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasStocksCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)deleteStocksCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setStocksCount:](self, "setStocksCount:", 0);
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setTvCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_tvCount = a3;
}

- (BOOL)hasTvCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasTvCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)deleteTvCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setTvCount:](self, "setTvCount:", 0);
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setVideoCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_videoCount = a3;
}

- (BOOL)hasVideoCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasVideoCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)deleteVideoCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setVideoCount:](self, "setVideoCount:", 0);
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setWeatherCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_weatherCount = a3;
}

- (BOOL)hasWeatherCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasWeatherCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)deleteWeatherCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setWeatherCount:](self, "setWeatherCount:", 0);
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setWebCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_webCount = a3;
}

- (BOOL)hasWebCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasWebCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)deleteWebCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setWebCount:](self, "setWebCount:", 0);
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setWebImagesCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_webImagesCount = a3;
}

- (BOOL)hasWebImagesCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasWebImagesCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)deleteWebImagesCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setWebImagesCount:](self, "setWebImagesCount:", 0);
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setAmpVideoCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_ampVideoCount = a3;
}

- (BOOL)hasAmpVideoCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasAmpVideoCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)deleteAmpVideoCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setAmpVideoCount:](self, "setAmpVideoCount:", 0);
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setAppsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_appsCount = a3;
}

- (BOOL)hasAppsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasAppsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)deleteAppsCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setAppsCount:](self, "setAppsCount:", 0);
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setConversionsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_conversionsCount = a3;
}

- (BOOL)hasConversionsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasConversionsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)deleteConversionsCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setConversionsCount:](self, "setConversionsCount:", 0);
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setEdutainmentCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_edutainmentCount = a3;
}

- (BOOL)hasEdutainmentCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasEdutainmentCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)deleteEdutainmentCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setEdutainmentCount:](self, "setEdutainmentCount:", 0);
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setKgcnCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_kgcnCount = a3;
}

- (BOOL)hasKgcnCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasKgcnCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)deleteKgcnCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setKgcnCount:](self, "setKgcnCount:", 0);
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setWebVideoCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_webVideoCount = a3;
}

- (BOOL)hasWebVideoCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasWebVideoCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)deleteWebVideoCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setWebVideoCount:](self, "setWebVideoCount:", 0);
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setWritingsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_writingsCount = a3;
}

- (BOOL)hasWritingsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasWritingsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)deleteWritingsCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setWritingsCount:](self, "setWritingsCount:", 0);
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setFlightsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_flightsCount = a3;
}

- (BOOL)hasFlightsCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasFlightsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)deleteFlightsCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setFlightsCount:](self, "setFlightsCount:", 0);
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setAmpMusicCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_ampMusicCount = a3;
}

- (BOOL)hasAmpMusicCount
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasAmpMusicCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)deleteAmpMusicCount
{
  -[PEGASUSSchemaPEGASUSDomainCards setAmpMusicCount:](self, "setAmpMusicCount:", 0);
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSDomainCardsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $DF105F87EA65FC492C9EACDF3E8CDA6B has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_25;
LABEL_51:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
    goto LABEL_51;
LABEL_25:
  if ((*(_DWORD *)&has & 0x1000000) != 0)
LABEL_26:
    PBDataWriterWriteUint32Field();
LABEL_27:

}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  $DF105F87EA65FC492C9EACDF3E8CDA6B has;
  unsigned int v6;
  unsigned int clockCount;
  int v8;
  unsigned int dictionaryCount;
  int v10;
  unsigned int kgCount;
  int v12;
  unsigned int mapsCount;
  int v14;
  unsigned int mathCount;
  int v16;
  unsigned int mediaCount;
  int v18;
  unsigned int moviesCount;
  int v20;
  unsigned int newsCount;
  int v22;
  unsigned int precomputedWebanswersCount;
  int v24;
  unsigned int sportsCount;
  int v26;
  unsigned int stocksCount;
  int v28;
  unsigned int tvCount;
  int v30;
  unsigned int videoCount;
  int v32;
  unsigned int weatherCount;
  int v34;
  unsigned int webCount;
  int v36;
  unsigned int webImagesCount;
  int v38;
  unsigned int ampVideoCount;
  int v40;
  unsigned int appsCount;
  int v42;
  unsigned int conversionsCount;
  int v44;
  unsigned int edutainmentCount;
  int v46;
  unsigned int kgcnCount;
  int v48;
  unsigned int webVideoCount;
  int v50;
  unsigned int writingsCount;
  int v52;
  unsigned int flightsCount;
  int v54;
  unsigned int ampMusicCount;
  BOOL v56;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_102;
  has = self->_has;
  v6 = v4[27];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_102;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    clockCount = self->_clockCount;
    if (clockCount != objc_msgSend(v4, "clockCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_102;
  if (v8)
  {
    dictionaryCount = self->_dictionaryCount;
    if (dictionaryCount != objc_msgSend(v4, "dictionaryCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_102;
  if (v10)
  {
    kgCount = self->_kgCount;
    if (kgCount != objc_msgSend(v4, "kgCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_102;
  if (v12)
  {
    mapsCount = self->_mapsCount;
    if (mapsCount != objc_msgSend(v4, "mapsCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_102;
  if (v14)
  {
    mathCount = self->_mathCount;
    if (mathCount != objc_msgSend(v4, "mathCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_102;
  if (v16)
  {
    mediaCount = self->_mediaCount;
    if (mediaCount != objc_msgSend(v4, "mediaCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_102;
  if (v18)
  {
    moviesCount = self->_moviesCount;
    if (moviesCount != objc_msgSend(v4, "moviesCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_102;
  if (v20)
  {
    newsCount = self->_newsCount;
    if (newsCount != objc_msgSend(v4, "newsCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_102;
  if (v22)
  {
    precomputedWebanswersCount = self->_precomputedWebanswersCount;
    if (precomputedWebanswersCount != objc_msgSend(v4, "precomputedWebanswersCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_102;
  if (v24)
  {
    sportsCount = self->_sportsCount;
    if (sportsCount != objc_msgSend(v4, "sportsCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1))
    goto LABEL_102;
  if (v26)
  {
    stocksCount = self->_stocksCount;
    if (stocksCount != objc_msgSend(v4, "stocksCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1))
    goto LABEL_102;
  if (v28)
  {
    tvCount = self->_tvCount;
    if (tvCount != objc_msgSend(v4, "tvCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1))
    goto LABEL_102;
  if (v30)
  {
    videoCount = self->_videoCount;
    if (videoCount != objc_msgSend(v4, "videoCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1))
    goto LABEL_102;
  if (v32)
  {
    weatherCount = self->_weatherCount;
    if (weatherCount != objc_msgSend(v4, "weatherCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v34 = (*(unsigned int *)&has >> 14) & 1;
  if (v34 != ((v6 >> 14) & 1))
    goto LABEL_102;
  if (v34)
  {
    webCount = self->_webCount;
    if (webCount != objc_msgSend(v4, "webCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v36 = (*(unsigned int *)&has >> 15) & 1;
  if (v36 != ((v6 >> 15) & 1))
    goto LABEL_102;
  if (v36)
  {
    webImagesCount = self->_webImagesCount;
    if (webImagesCount != objc_msgSend(v4, "webImagesCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v38 = HIWORD(*(unsigned int *)&has) & 1;
  if (v38 != (HIWORD(v6) & 1))
    goto LABEL_102;
  if (v38)
  {
    ampVideoCount = self->_ampVideoCount;
    if (ampVideoCount != objc_msgSend(v4, "ampVideoCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v40 = (*(unsigned int *)&has >> 17) & 1;
  if (v40 != ((v6 >> 17) & 1))
    goto LABEL_102;
  if (v40)
  {
    appsCount = self->_appsCount;
    if (appsCount != objc_msgSend(v4, "appsCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v42 = (*(unsigned int *)&has >> 18) & 1;
  if (v42 != ((v6 >> 18) & 1))
    goto LABEL_102;
  if (v42)
  {
    conversionsCount = self->_conversionsCount;
    if (conversionsCount != objc_msgSend(v4, "conversionsCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v44 = (*(unsigned int *)&has >> 19) & 1;
  if (v44 != ((v6 >> 19) & 1))
    goto LABEL_102;
  if (v44)
  {
    edutainmentCount = self->_edutainmentCount;
    if (edutainmentCount != objc_msgSend(v4, "edutainmentCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v46 = (*(unsigned int *)&has >> 20) & 1;
  if (v46 != ((v6 >> 20) & 1))
    goto LABEL_102;
  if (v46)
  {
    kgcnCount = self->_kgcnCount;
    if (kgcnCount != objc_msgSend(v4, "kgcnCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v48 = (*(unsigned int *)&has >> 21) & 1;
  if (v48 != ((v6 >> 21) & 1))
    goto LABEL_102;
  if (v48)
  {
    webVideoCount = self->_webVideoCount;
    if (webVideoCount != objc_msgSend(v4, "webVideoCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v50 = (*(unsigned int *)&has >> 22) & 1;
  if (v50 != ((v6 >> 22) & 1))
    goto LABEL_102;
  if (v50)
  {
    writingsCount = self->_writingsCount;
    if (writingsCount != objc_msgSend(v4, "writingsCount"))
      goto LABEL_102;
    has = self->_has;
    v6 = v4[27];
  }
  v52 = (*(unsigned int *)&has >> 23) & 1;
  if (v52 != ((v6 >> 23) & 1))
    goto LABEL_102;
  if (v52)
  {
    flightsCount = self->_flightsCount;
    if (flightsCount == objc_msgSend(v4, "flightsCount"))
    {
      has = self->_has;
      v6 = v4[27];
      goto LABEL_98;
    }
LABEL_102:
    v56 = 0;
    goto LABEL_103;
  }
LABEL_98:
  v54 = HIBYTE(*(unsigned int *)&has) & 1;
  if (v54 != (HIBYTE(v6) & 1))
    goto LABEL_102;
  if (v54)
  {
    ampMusicCount = self->_ampMusicCount;
    if (ampMusicCount != objc_msgSend(v4, "ampMusicCount"))
      goto LABEL_102;
  }
  v56 = 1;
LABEL_103:

  return v56;
}

- (unint64_t)hash
{
  $DF105F87EA65FC492C9EACDF3E8CDA6B has;
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

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v3 = 2654435761 * self->_clockCount;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_dictionaryCount;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_kgCount;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  v5 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_mapsCount;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  v6 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_mathCount;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_mediaCount;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_moviesCount;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_newsCount;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  v10 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_precomputedWebanswersCount;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  v11 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_sportsCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  v12 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_stocksCount;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  v13 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_tvCount;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  v14 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_videoCount;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  v15 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_weatherCount;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  v16 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_webCount;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  v17 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_webImagesCount;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_ampVideoCount;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    v20 = 2654435761 * self->_appsCount;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    v21 = 2654435761 * self->_conversionsCount;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_21:
    v22 = 2654435761 * self->_edutainmentCount;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_22:
    v23 = 2654435761 * self->_kgcnCount;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_23:
    v24 = 2654435761 * self->_webVideoCount;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_24:
    v25 = 2654435761 * self->_writingsCount;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_25;
LABEL_50:
    v26 = 0;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_26;
LABEL_51:
    v27 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27;
  }
LABEL_49:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x800000) == 0)
    goto LABEL_50;
LABEL_25:
  v26 = 2654435761 * self->_flightsCount;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
    goto LABEL_51;
LABEL_26:
  v27 = 2654435761 * self->_ampMusicCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $DF105F87EA65FC492C9EACDF3E8CDA6B has;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards ampMusicCount](self, "ampMusicCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ampMusicCount"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards ampVideoCount](self, "ampVideoCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ampVideoCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards appsCount](self, "appsCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appsCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards clockCount](self, "clockCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("clockCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards conversionsCount](self, "conversionsCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("conversionsCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards dictionaryCount](self, "dictionaryCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("dictionaryCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards edutainmentCount](self, "edutainmentCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("edutainmentCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards flightsCount](self, "flightsCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("flightsCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards kgCount](self, "kgCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("kgCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards kgcnCount](self, "kgcnCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("kgcnCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards mapsCount](self, "mapsCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("mapsCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards mathCount](self, "mathCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("mathCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards mediaCount](self, "mediaCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("mediaCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards moviesCount](self, "moviesCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("moviesCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards newsCount](self, "newsCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("newsCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards precomputedWebanswersCount](self, "precomputedWebanswersCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("precomputedWebanswersCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards sportsCount](self, "sportsCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("sportsCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards stocksCount](self, "stocksCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("stocksCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards tvCount](self, "tvCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("tvCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards videoCount](self, "videoCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("videoCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards weatherCount](self, "weatherCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("weatherCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards webCount](self, "webCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("webCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_25;
LABEL_51:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards webVideoCount](self, "webVideoCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("webVideoCount"));

    if ((*(_DWORD *)&self->_has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards webImagesCount](self, "webImagesCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("webImagesCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
    goto LABEL_51;
LABEL_25:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards writingsCount](self, "writingsCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("writingsCount"));

  }
LABEL_27:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSDomainCards dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSDomainCards)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSDomainCards *v5;
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
    self = -[PEGASUSSchemaPEGASUSDomainCards initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSDomainCards)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSDomainCards *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  PEGASUSSchemaPEGASUSDomainCards *v36;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PEGASUSSchemaPEGASUSDomainCards;
  v5 = -[PEGASUSSchemaPEGASUSDomainCards init](&v56, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clockCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setClockCount:](v5, "setClockCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictionaryCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setDictionaryCount:](v5, "setDictionaryCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kgCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setKgCount:](v5, "setKgCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setMapsCount:](v5, "setMapsCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mathCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setMathCount:](v5, "setMathCount:", objc_msgSend(v10, "unsignedIntValue"));
    v48 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setMediaCount:](v5, "setMediaCount:", objc_msgSend(v11, "unsignedIntValue"));
    v44 = v11;
    v12 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("moviesCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setMoviesCount:](v5, "setMoviesCount:", objc_msgSend(v13, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("newsCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setNewsCount:](v5, "setNewsCount:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("precomputedWebanswersCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setPrecomputedWebanswersCount:](v5, "setPrecomputedWebanswersCount:", objc_msgSend(v15, "unsignedIntValue"));
    v42 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v16;
    v49 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setSportsCount:](v5, "setSportsCount:", objc_msgSend(v16, "unsignedIntValue"));
    v45 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stocksCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setStocksCount:](v5, "setStocksCount:", objc_msgSend(v17, "unsignedIntValue"));
    v18 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tvCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setTvCount:](v5, "setTvCount:", objc_msgSend(v19, "unsignedIntValue"));
    v20 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setVideoCount:](v5, "setVideoCount:", objc_msgSend(v21, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("weatherCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setWeatherCount:](v5, "setWeatherCount:", objc_msgSend(v22, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webCount"));
    v23 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = (void *)v23;
    v24 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setWebCount:](v5, "setWebCount:", objc_msgSend(v51, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webImagesCount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setWebImagesCount:](v5, "setWebImagesCount:", objc_msgSend(v25, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ampVideoCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setAmpVideoCount:](v5, "setAmpVideoCount:", objc_msgSend(v26, "unsignedIntValue"));
    v41 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appsCount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setAppsCount:](v5, "setAppsCount:", objc_msgSend(v27, "unsignedIntValue"));
    v47 = v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conversionsCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setConversionsCount:](v5, "setConversionsCount:", objc_msgSend(v28, "unsignedIntValue"));
    v38 = v28;
    v40 = v25;
    v46 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("edutainmentCount"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setEdutainmentCount:](v5, "setEdutainmentCount:", objc_msgSend(v29, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kgcnCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setKgcnCount:](v5, "setKgcnCount:", objc_msgSend(v30, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webVideoCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setWebVideoCount:](v5, "setWebVideoCount:", objc_msgSend(v31, "unsignedIntValue"));
    v39 = v27;
    v43 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("writingsCount"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setWritingsCount:](v5, "setWritingsCount:", objc_msgSend(v32, "unsignedIntValue"));
    v33 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flightsCount"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setFlightsCount:](v5, "setFlightsCount:", objc_msgSend(v34, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ampMusicCount"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSDomainCards setAmpMusicCount:](v5, "setAmpMusicCount:", objc_msgSend(v35, "unsignedIntValue"));
    v36 = v5;

  }
  return v5;
}

- (unsigned)clockCount
{
  return self->_clockCount;
}

- (unsigned)dictionaryCount
{
  return self->_dictionaryCount;
}

- (unsigned)kgCount
{
  return self->_kgCount;
}

- (unsigned)mapsCount
{
  return self->_mapsCount;
}

- (unsigned)mathCount
{
  return self->_mathCount;
}

- (unsigned)mediaCount
{
  return self->_mediaCount;
}

- (unsigned)moviesCount
{
  return self->_moviesCount;
}

- (unsigned)newsCount
{
  return self->_newsCount;
}

- (unsigned)precomputedWebanswersCount
{
  return self->_precomputedWebanswersCount;
}

- (unsigned)sportsCount
{
  return self->_sportsCount;
}

- (unsigned)stocksCount
{
  return self->_stocksCount;
}

- (unsigned)tvCount
{
  return self->_tvCount;
}

- (unsigned)videoCount
{
  return self->_videoCount;
}

- (unsigned)weatherCount
{
  return self->_weatherCount;
}

- (unsigned)webCount
{
  return self->_webCount;
}

- (unsigned)webImagesCount
{
  return self->_webImagesCount;
}

- (unsigned)ampVideoCount
{
  return self->_ampVideoCount;
}

- (unsigned)appsCount
{
  return self->_appsCount;
}

- (unsigned)conversionsCount
{
  return self->_conversionsCount;
}

- (unsigned)edutainmentCount
{
  return self->_edutainmentCount;
}

- (unsigned)kgcnCount
{
  return self->_kgcnCount;
}

- (unsigned)webVideoCount
{
  return self->_webVideoCount;
}

- (unsigned)writingsCount
{
  return self->_writingsCount;
}

- (unsigned)flightsCount
{
  return self->_flightsCount;
}

- (unsigned)ampMusicCount
{
  return self->_ampMusicCount;
}

@end
