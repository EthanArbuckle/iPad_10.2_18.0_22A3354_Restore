@implementation INFERENCESchemaINFERENCEMusicTrainingIndependentSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setClientDayOfWeek:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_clientDayOfWeek = a3;
}

- (BOOL)hasClientDayOfWeek
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasClientDayOfWeek:(BOOL)a3
{
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)deleteClientDayOfWeek
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setClientDayOfWeek:](self, "setClientDayOfWeek:", 0);
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setRawClientHourOfDay:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_rawClientHourOfDay = a3;
}

- (BOOL)hasRawClientHourOfDay
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRawClientHourOfDay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)deleteRawClientHourOfDay
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawClientHourOfDay:](self, "setRawClientHourOfDay:", 0);
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setIsMediaAlbumPresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_isMediaAlbumPresent = a3;
}

- (BOOL)hasIsMediaAlbumPresent
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsMediaAlbumPresent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)deleteIsMediaAlbumPresent
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaAlbumPresent:](self, "setIsMediaAlbumPresent:", 0);
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setIsMediaArtistPresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_isMediaArtistPresent = a3;
}

- (BOOL)hasIsMediaArtistPresent
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsMediaArtistPresent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)deleteIsMediaArtistPresent
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaArtistPresent:](self, "setIsMediaArtistPresent:", 0);
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setIsMediaGenrePresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_isMediaGenrePresent = a3;
}

- (BOOL)hasIsMediaGenrePresent
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsMediaGenrePresent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)deleteIsMediaGenrePresent
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaGenrePresent:](self, "setIsMediaGenrePresent:", 0);
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setIsMediaMoodPresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_isMediaMoodPresent = a3;
}

- (BOOL)hasIsMediaMoodPresent
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsMediaMoodPresent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)deleteIsMediaMoodPresent
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaMoodPresent:](self, "setIsMediaMoodPresent:", 0);
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setIsMediaNamePresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_isMediaNamePresent = a3;
}

- (BOOL)hasIsMediaNamePresent
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasIsMediaNamePresent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)deleteIsMediaNamePresent
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaNamePresent:](self, "setIsMediaNamePresent:", 0);
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setIsMediaReleaseDatePresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_isMediaReleaseDatePresent = a3;
}

- (BOOL)hasIsMediaReleaseDatePresent
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasIsMediaReleaseDatePresent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)deleteIsMediaReleaseDatePresent
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaReleaseDatePresent:](self, "setIsMediaReleaseDatePresent:", 0);
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setNowPlayingLastBundleRecencyS:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_nowPlayingLastBundleRecencyS = a3;
}

- (BOOL)hasNowPlayingLastBundleRecencyS
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasNowPlayingLastBundleRecencyS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)deleteNowPlayingLastBundleRecencyS
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setNowPlayingLastBundleRecencyS:](self, "setNowPlayingLastBundleRecencyS:", 0);
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setRawLanguage:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rawLanguage = a3;
}

- (BOOL)hasRawLanguage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasRawLanguage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)deleteRawLanguage
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawLanguage:](self, "setRawLanguage:", 0);
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setRawLocale:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rawLocale = a3;
}

- (BOOL)hasRawLocale
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasRawLocale:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)deleteRawLocale
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawLocale:](self, "setRawLocale:", 0);
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setRawRegion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_rawRegion = a3;
}

- (BOOL)hasRawRegion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasRawRegion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)deleteRawRegion
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawRegion:](self, "setRawRegion:", 0);
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setIsClientDaylight:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isClientDaylight = a3;
}

- (BOOL)hasIsClientDaylight
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasIsClientDaylight:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)deleteIsClientDaylight
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientDaylight:](self, "setIsClientDaylight:", 0);
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setIsClientNavigating:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isClientNavigating = a3;
}

- (BOOL)hasIsClientNavigating
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasIsClientNavigating:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)deleteIsClientNavigating
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientNavigating:](self, "setIsClientNavigating:", 0);
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setIsClientWorkout:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isClientWorkout = a3;
}

- (BOOL)hasIsClientWorkout
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasIsClientWorkout:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)deleteIsClientWorkout
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientWorkout:](self, "setIsClientWorkout:", 0);
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setMediaType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_mediaType = a3;
}

- (BOOL)hasMediaType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasMediaType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)deleteMediaType
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setMediaType:](self, "setMediaType:", 0);
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setNowPlayingState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_nowPlayingState = a3;
}

- (BOOL)hasNowPlayingState
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasNowPlayingState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)deleteNowPlayingState
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setNowPlayingState:](self, "setNowPlayingState:", 0);
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setIsPireneRequest:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isPireneRequest = a3;
}

- (BOOL)hasIsPireneRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasIsPireneRequest:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)deleteIsPireneRequest
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsPireneRequest:](self, "setIsPireneRequest:", 0);
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setForegroundBundleRecencyS:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_foregroundBundleRecencyS = a3;
}

- (BOOL)hasForegroundBundleRecencyS
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasForegroundBundleRecencyS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)deleteForegroundBundleRecencyS
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setForegroundBundleRecencyS:](self, "setForegroundBundleRecencyS:", 0.0);
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setMediaParsecCategory:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_mediaParsecCategory = a3;
}

- (BOOL)hasMediaParsecCategory
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasMediaParsecCategory:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)deleteMediaParsecCategory
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setMediaParsecCategory:](self, "setMediaParsecCategory:", 0);
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setSirikitResponseCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_sirikitResponseCode = a3;
}

- (BOOL)hasSirikitResponseCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasSirikitResponseCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)deleteSirikitResponseCode
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setSirikitResponseCode:](self, "setSirikitResponseCode:", 0);
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setAppSelectionUses:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_appSelectionUses = a3;
}

- (BOOL)hasAppSelectionUses
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasAppSelectionUses:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)deleteAppSelectionUses
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setAppSelectionUses:](self, "setAppSelectionUses:", 0);
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_modelVersion = a3;
}

- (BOOL)hasModelVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasModelVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)deleteModelVersion
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setModelVersion:](self, "setModelVersion:", 0);
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setResolutionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_resolutionType = a3;
}

- (BOOL)hasResolutionType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasResolutionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)deleteResolutionType
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setResolutionType:](self, "setResolutionType:", 0);
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setRawNowPlayingState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_rawNowPlayingState = a3;
}

- (BOOL)hasRawNowPlayingState
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasRawNowPlayingState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)deleteRawNowPlayingState
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawNowPlayingState:](self, "setRawNowPlayingState:", 0);
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setCommonForegroundAppRecency:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_commonForegroundAppRecency = a3;
}

- (BOOL)hasCommonForegroundAppRecency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasCommonForegroundAppRecency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)deleteCommonForegroundAppRecency
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setCommonForegroundAppRecency:](self, "setCommonForegroundAppRecency:", 0);
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setIsContentFree:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isContentFree = a3;
}

- (BOOL)hasIsContentFree
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasIsContentFree:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (void)deleteIsContentFree
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsContentFree:](self, "setIsContentFree:", 0);
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setIsUserRecognized:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isUserRecognized = a3;
}

- (BOOL)hasIsUserRecognized
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasIsUserRecognized:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (void)deleteIsUserRecognized
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsUserRecognized:](self, "setIsUserRecognized:", 0);
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setServerSearchResultsMediaType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_serverSearchResultsMediaType = a3;
}

- (BOOL)hasServerSearchResultsMediaType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasServerSearchResultsMediaType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (void)deleteServerSearchResultsMediaType
{
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setServerSearchResultsMediaType:](self, "setServerSearchResultsMediaType:", 0);
  *(_DWORD *)&self->_has &= ~0x10000000u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEMusicTrainingIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_29;
LABEL_59:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
    goto LABEL_59;
LABEL_29:
  if ((*(_DWORD *)&has & 0x10000000) != 0)
LABEL_30:
    PBDataWriterWriteInt32Field();
LABEL_31:

}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has;
  unsigned int v6;
  int clientDayOfWeek;
  int v8;
  int rawClientHourOfDay;
  int v10;
  int isMediaAlbumPresent;
  int v12;
  int isMediaArtistPresent;
  int v14;
  int isMediaGenrePresent;
  int v16;
  int isMediaMoodPresent;
  int v18;
  int isMediaNamePresent;
  int v20;
  int isMediaReleaseDatePresent;
  int v22;
  int nowPlayingLastBundleRecencyS;
  int v24;
  int64_t rawLanguage;
  int v26;
  int64_t rawLocale;
  int v28;
  int64_t rawRegion;
  int v30;
  int isClientDaylight;
  int v32;
  int isClientNavigating;
  int v34;
  int isClientWorkout;
  int v36;
  int mediaType;
  int v38;
  int nowPlayingState;
  int v40;
  int isPireneRequest;
  int v42;
  double foregroundBundleRecencyS;
  double v44;
  int v45;
  int mediaParsecCategory;
  int v47;
  int sirikitResponseCode;
  int v49;
  int appSelectionUses;
  int v51;
  unsigned int modelVersion;
  int v53;
  int resolutionType;
  int v55;
  int rawNowPlayingState;
  int v57;
  int commonForegroundAppRecency;
  int v59;
  int isContentFree;
  int v61;
  int isUserRecognized;
  int v63;
  int serverSearchResultsMediaType;
  BOOL v65;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_118;
  has = self->_has;
  v6 = v4[29];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_118;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    clientDayOfWeek = self->_clientDayOfWeek;
    if (clientDayOfWeek != objc_msgSend(v4, "clientDayOfWeek"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_118;
  if (v8)
  {
    rawClientHourOfDay = self->_rawClientHourOfDay;
    if (rawClientHourOfDay != objc_msgSend(v4, "rawClientHourOfDay"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_118;
  if (v10)
  {
    isMediaAlbumPresent = self->_isMediaAlbumPresent;
    if (isMediaAlbumPresent != objc_msgSend(v4, "isMediaAlbumPresent"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_118;
  if (v12)
  {
    isMediaArtistPresent = self->_isMediaArtistPresent;
    if (isMediaArtistPresent != objc_msgSend(v4, "isMediaArtistPresent"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_118;
  if (v14)
  {
    isMediaGenrePresent = self->_isMediaGenrePresent;
    if (isMediaGenrePresent != objc_msgSend(v4, "isMediaGenrePresent"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_118;
  if (v16)
  {
    isMediaMoodPresent = self->_isMediaMoodPresent;
    if (isMediaMoodPresent != objc_msgSend(v4, "isMediaMoodPresent"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_118;
  if (v18)
  {
    isMediaNamePresent = self->_isMediaNamePresent;
    if (isMediaNamePresent != objc_msgSend(v4, "isMediaNamePresent"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_118;
  if (v20)
  {
    isMediaReleaseDatePresent = self->_isMediaReleaseDatePresent;
    if (isMediaReleaseDatePresent != objc_msgSend(v4, "isMediaReleaseDatePresent"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_118;
  if (v22)
  {
    nowPlayingLastBundleRecencyS = self->_nowPlayingLastBundleRecencyS;
    if (nowPlayingLastBundleRecencyS != objc_msgSend(v4, "nowPlayingLastBundleRecencyS"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_118;
  if (v24)
  {
    rawLanguage = self->_rawLanguage;
    if (rawLanguage != objc_msgSend(v4, "rawLanguage"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1))
    goto LABEL_118;
  if (v26)
  {
    rawLocale = self->_rawLocale;
    if (rawLocale != objc_msgSend(v4, "rawLocale"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1))
    goto LABEL_118;
  if (v28)
  {
    rawRegion = self->_rawRegion;
    if (rawRegion != objc_msgSend(v4, "rawRegion"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1))
    goto LABEL_118;
  if (v30)
  {
    isClientDaylight = self->_isClientDaylight;
    if (isClientDaylight != objc_msgSend(v4, "isClientDaylight"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1))
    goto LABEL_118;
  if (v32)
  {
    isClientNavigating = self->_isClientNavigating;
    if (isClientNavigating != objc_msgSend(v4, "isClientNavigating"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v34 = (*(unsigned int *)&has >> 14) & 1;
  if (v34 != ((v6 >> 14) & 1))
    goto LABEL_118;
  if (v34)
  {
    isClientWorkout = self->_isClientWorkout;
    if (isClientWorkout != objc_msgSend(v4, "isClientWorkout"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v36 = (*(unsigned int *)&has >> 15) & 1;
  if (v36 != ((v6 >> 15) & 1))
    goto LABEL_118;
  if (v36)
  {
    mediaType = self->_mediaType;
    if (mediaType != objc_msgSend(v4, "mediaType"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v38 = HIWORD(*(unsigned int *)&has) & 1;
  if (v38 != (HIWORD(v6) & 1))
    goto LABEL_118;
  if (v38)
  {
    nowPlayingState = self->_nowPlayingState;
    if (nowPlayingState != objc_msgSend(v4, "nowPlayingState"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v40 = (*(unsigned int *)&has >> 17) & 1;
  if (v40 != ((v6 >> 17) & 1))
    goto LABEL_118;
  if (v40)
  {
    isPireneRequest = self->_isPireneRequest;
    if (isPireneRequest != objc_msgSend(v4, "isPireneRequest"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v42 = (*(unsigned int *)&has >> 18) & 1;
  if (v42 != ((v6 >> 18) & 1))
    goto LABEL_118;
  if (v42)
  {
    foregroundBundleRecencyS = self->_foregroundBundleRecencyS;
    objc_msgSend(v4, "foregroundBundleRecencyS");
    if (foregroundBundleRecencyS != v44)
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v45 = (*(unsigned int *)&has >> 19) & 1;
  if (v45 != ((v6 >> 19) & 1))
    goto LABEL_118;
  if (v45)
  {
    mediaParsecCategory = self->_mediaParsecCategory;
    if (mediaParsecCategory != objc_msgSend(v4, "mediaParsecCategory"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v47 = (*(unsigned int *)&has >> 20) & 1;
  if (v47 != ((v6 >> 20) & 1))
    goto LABEL_118;
  if (v47)
  {
    sirikitResponseCode = self->_sirikitResponseCode;
    if (sirikitResponseCode != objc_msgSend(v4, "sirikitResponseCode"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v49 = (*(unsigned int *)&has >> 21) & 1;
  if (v49 != ((v6 >> 21) & 1))
    goto LABEL_118;
  if (v49)
  {
    appSelectionUses = self->_appSelectionUses;
    if (appSelectionUses != objc_msgSend(v4, "appSelectionUses"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v51 = (*(unsigned int *)&has >> 22) & 1;
  if (v51 != ((v6 >> 22) & 1))
    goto LABEL_118;
  if (v51)
  {
    modelVersion = self->_modelVersion;
    if (modelVersion != objc_msgSend(v4, "modelVersion"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v53 = (*(unsigned int *)&has >> 23) & 1;
  if (v53 != ((v6 >> 23) & 1))
    goto LABEL_118;
  if (v53)
  {
    resolutionType = self->_resolutionType;
    if (resolutionType != objc_msgSend(v4, "resolutionType"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v55 = HIBYTE(*(unsigned int *)&has) & 1;
  if (v55 != (HIBYTE(v6) & 1))
    goto LABEL_118;
  if (v55)
  {
    rawNowPlayingState = self->_rawNowPlayingState;
    if (rawNowPlayingState != objc_msgSend(v4, "rawNowPlayingState"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v57 = (*(unsigned int *)&has >> 25) & 1;
  if (v57 != ((v6 >> 25) & 1))
    goto LABEL_118;
  if (v57)
  {
    commonForegroundAppRecency = self->_commonForegroundAppRecency;
    if (commonForegroundAppRecency != objc_msgSend(v4, "commonForegroundAppRecency"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v59 = (*(unsigned int *)&has >> 26) & 1;
  if (v59 != ((v6 >> 26) & 1))
    goto LABEL_118;
  if (v59)
  {
    isContentFree = self->_isContentFree;
    if (isContentFree != objc_msgSend(v4, "isContentFree"))
      goto LABEL_118;
    has = self->_has;
    v6 = v4[29];
  }
  v61 = (*(unsigned int *)&has >> 27) & 1;
  if (v61 != ((v6 >> 27) & 1))
    goto LABEL_118;
  if (v61)
  {
    isUserRecognized = self->_isUserRecognized;
    if (isUserRecognized == objc_msgSend(v4, "isUserRecognized"))
    {
      has = self->_has;
      v6 = v4[29];
      goto LABEL_114;
    }
LABEL_118:
    v65 = 0;
    goto LABEL_119;
  }
LABEL_114:
  v63 = (*(unsigned int *)&has >> 28) & 1;
  if (v63 != ((v6 >> 28) & 1))
    goto LABEL_118;
  if (v63)
  {
    serverSearchResultsMediaType = self->_serverSearchResultsMediaType;
    if (serverSearchResultsMediaType != objc_msgSend(v4, "serverSearchResultsMediaType"))
      goto LABEL_118;
  }
  v65 = 1;
LABEL_119:

  return v65;
}

- (unint64_t)hash
{
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has;
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
  double foregroundBundleRecencyS;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4 = 2654435761 * self->_clientDayOfWeek;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_rawClientHourOfDay;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_isMediaAlbumPresent;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v6 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_isMediaArtistPresent;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isMediaGenrePresent;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_isMediaMoodPresent;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_isMediaNamePresent;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v10 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_9:
    v11 = 2654435761 * self->_isMediaReleaseDatePresent;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v12 = 2654435761 * self->_nowPlayingLastBundleRecencyS;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  v12 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v13 = 2654435761 * self->_rawLanguage;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  v13 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v14 = 2654435761 * self->_rawLocale;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  v14 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    v15 = 2654435761 * self->_rawRegion;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  v15 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    v16 = 2654435761 * self->_isClientDaylight;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v16 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    v17 = 2654435761 * self->_isClientNavigating;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v17 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    v18 = 2654435761 * self->_isClientWorkout;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v18 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    v52 = 2654435761 * self->_mediaType;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  v52 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_18:
    v51 = 2654435761 * self->_nowPlayingState;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_19;
LABEL_41:
    v50 = 0;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_20;
LABEL_42:
    v31 = 0;
    goto LABEL_45;
  }
LABEL_40:
  v51 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_41;
LABEL_19:
  v50 = 2654435761 * self->_isPireneRequest;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_42;
LABEL_20:
  v43 = v18;
  v44 = v17;
  v45 = v16;
  v46 = v15;
  v47 = v14;
  v48 = v13;
  v49 = v12;
  v19 = v11;
  v20 = v10;
  v21 = v9;
  v22 = v8;
  v23 = v7;
  v24 = v6;
  v25 = v5;
  v26 = v4;
  foregroundBundleRecencyS = self->_foregroundBundleRecencyS;
  v28 = -foregroundBundleRecencyS;
  if (foregroundBundleRecencyS >= 0.0)
    v28 = self->_foregroundBundleRecencyS;
  v29 = floor(v28 + 0.5);
  v30 = (v28 - v29) * 1.84467441e19;
  v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    v4 = v26;
    v5 = v25;
    v6 = v24;
    v7 = v23;
    v8 = v22;
    v9 = v21;
    v10 = v20;
    v11 = v19;
    v13 = v48;
    v12 = v49;
    v15 = v46;
    v14 = v47;
    v17 = v44;
    v16 = v45;
    v18 = v43;
    if (v30 > 0.0)
      v31 += (unint64_t)v30;
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
    v4 = v26;
    v5 = v25;
    v6 = v24;
    v7 = v23;
    v8 = v22;
    v9 = v21;
    v10 = v20;
    v11 = v19;
    v13 = v48;
    v12 = v49;
    v15 = v46;
    v14 = v47;
    v17 = v44;
    v16 = v45;
    v18 = v43;
  }
LABEL_45:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v32 = 2654435761 * self->_mediaParsecCategory;
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
LABEL_47:
      v33 = 2654435761 * self->_sirikitResponseCode;
      if ((*(_DWORD *)&has & 0x200000) != 0)
        goto LABEL_48;
      goto LABEL_58;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_47;
  }
  v33 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_48:
    v34 = 2654435761 * self->_appSelectionUses;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_49;
    goto LABEL_59;
  }
LABEL_58:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_49:
    v35 = 2654435761 * self->_modelVersion;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_50;
    goto LABEL_60;
  }
LABEL_59:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_50:
    v36 = 2654435761 * self->_resolutionType;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_51;
    goto LABEL_61;
  }
LABEL_60:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_51:
    v37 = 2654435761 * self->_rawNowPlayingState;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_52;
    goto LABEL_62;
  }
LABEL_61:
  v37 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_52:
    v38 = 2654435761 * self->_commonForegroundAppRecency;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_53;
    goto LABEL_63;
  }
LABEL_62:
  v38 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_53:
    v39 = 2654435761 * self->_isContentFree;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_54;
LABEL_64:
    v40 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_55;
LABEL_65:
    v41 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v52 ^ v51 ^ v50 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41;
  }
LABEL_63:
  v39 = 0;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
    goto LABEL_64;
LABEL_54:
  v40 = 2654435761 * self->_isUserRecognized;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
    goto LABEL_65;
LABEL_55:
  v41 = 2654435761 * self->_serverSearchResultsMediaType;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v52 ^ v51 ^ v50 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has;
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
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  const __CFString *v35;
  void *v36;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals appSelectionUses](self, "appSelectionUses"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("appSelectionUses"));

    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x2000000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals clientDayOfWeek](self, "clientDayOfWeek"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("clientDayOfWeek"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals commonForegroundAppRecency](self, "commonForegroundAppRecency"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("commonForegroundAppRecency"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals foregroundBundleRecencyS](self, "foregroundBundleRecencyS");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("foregroundBundleRecencyS"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isClientDaylight](self, "isClientDaylight"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isClientDaylight"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isClientNavigating](self, "isClientNavigating"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isClientNavigating"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isClientWorkout](self, "isClientWorkout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isClientWorkout"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isContentFree](self, "isContentFree"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isContentFree"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaAlbumPresent](self, "isMediaAlbumPresent"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("isMediaAlbumPresent"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaArtistPresent](self, "isMediaArtistPresent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("isMediaArtistPresent"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaGenrePresent](self, "isMediaGenrePresent"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("isMediaGenrePresent"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaMoodPresent](self, "isMediaMoodPresent"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isMediaMoodPresent"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaNamePresent](self, "isMediaNamePresent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("isMediaNamePresent"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaReleaseDatePresent](self, "isMediaReleaseDatePresent"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isMediaReleaseDatePresent"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isPireneRequest](self, "isPireneRequest"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isPireneRequest"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isUserRecognized](self, "isUserRecognized"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isUserRecognized"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals mediaParsecCategory](self, "mediaParsecCategory"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("mediaParsecCategory"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals mediaType](self, "mediaType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("mediaType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals modelVersion](self, "modelVersion"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("modelVersion"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals nowPlayingLastBundleRecencyS](self, "nowPlayingLastBundleRecencyS"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("nowPlayingLastBundleRecencyS"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals nowPlayingState](self, "nowPlayingState"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("nowPlayingState"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("rawClientHourOfDay"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawLanguage](self, "rawLanguage"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("rawLanguage"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawLocale](self, "rawLocale"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("rawLocale"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawNowPlayingState](self, "rawNowPlayingState"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("rawNowPlayingState"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_28;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawRegion](self, "rawRegion"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("rawRegion"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_29;
LABEL_62:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals serverSearchResultsMediaType](self, "serverSearchResultsMediaType"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("serverSearchResultsMediaType"));

    if ((*(_DWORD *)&self->_has & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_58:
  v34 = -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals resolutionType](self, "resolutionType") - 1;
  if (v34 > 9)
    v35 = CFSTR("INFERENCEAPPRESOLUTIONTYPE_UNKNOWN");
  else
    v35 = off_1E562FC58[v34];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("resolutionType"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
    goto LABEL_62;
LABEL_29:
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sirikitResponseCode"));

  }
LABEL_31:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEMusicTrainingIndependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEMusicTrainingIndependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *v5;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *v39;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  objc_super v63;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)INFERENCESchemaINFERENCEMusicTrainingIndependentSignals;
  v5 = -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals init](&v63, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientDayOfWeek"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setClientDayOfWeek:](v5, "setClientDayOfWeek:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawClientHourOfDay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawClientHourOfDay:](v5, "setRawClientHourOfDay:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaAlbumPresent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaAlbumPresent:](v5, "setIsMediaAlbumPresent:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaArtistPresent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaArtistPresent:](v5, "setIsMediaArtistPresent:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaGenrePresent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaGenrePresent:](v5, "setIsMediaGenrePresent:", objc_msgSend(v10, "BOOLValue"));
    v50 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaMoodPresent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaMoodPresent:](v5, "setIsMediaMoodPresent:", objc_msgSend(v11, "BOOLValue"));
    v12 = v9;
    v54 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaNamePresent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaNamePresent:](v5, "setIsMediaNamePresent:", objc_msgSend(v13, "BOOLValue"));
    v14 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaReleaseDatePresent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaReleaseDatePresent:](v5, "setIsMediaReleaseDatePresent:", objc_msgSend(v15, "BOOLValue"));
    v16 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingLastBundleRecencyS"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setNowPlayingLastBundleRecencyS:](v5, "setNowPlayingLastBundleRecencyS:", objc_msgSend(v17, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawLanguage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawLanguage:](v5, "setRawLanguage:", objc_msgSend(v18, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawLocale"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawLocale:](v5, "setRawLocale:", objc_msgSend(v19, "longLongValue"));
    v46 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawRegion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = v20;
    v53 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawRegion:](v5, "setRawRegion:", objc_msgSend(v20, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isClientDaylight"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v21;
    v52 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientDaylight:](v5, "setIsClientDaylight:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isClientNavigating"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = v22;
    v51 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientNavigating:](v5, "setIsClientNavigating:", objc_msgSend(v22, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isClientWorkout"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientWorkout:](v5, "setIsClientWorkout:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setMediaType:](v5, "setMediaType:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingState"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setNowPlayingState:](v5, "setNowPlayingState:", objc_msgSend(v25, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPireneRequest"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsPireneRequest:](v5, "setIsPireneRequest:", objc_msgSend(v26, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("foregroundBundleRecencyS"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v27, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setForegroundBundleRecencyS:](v5, "setForegroundBundleRecencyS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaParsecCategory"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setMediaParsecCategory:](v5, "setMediaParsecCategory:", objc_msgSend(v28, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sirikitResponseCode"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setSirikitResponseCode:](v5, "setSirikitResponseCode:", objc_msgSend(v29, "intValue"));
    v49 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appSelectionUses"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setAppSelectionUses:](v5, "setAppSelectionUses:", objc_msgSend(v30, "intValue"));
    v48 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setModelVersion:](v5, "setModelVersion:", objc_msgSend(v31, "unsignedIntValue"));
    v41 = v31;
    v47 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setResolutionType:](v5, "setResolutionType:", objc_msgSend(v32, "intValue"));
    v45 = v25;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingState"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawNowPlayingState:](v5, "setRawNowPlayingState:", objc_msgSend(v33, "intValue"));
    v44 = v27;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonForegroundAppRecency"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setCommonForegroundAppRecency:](v5, "setCommonForegroundAppRecency:", objc_msgSend(v34, "intValue"));
    v42 = v30;
    v43 = v29;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isContentFree"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsContentFree:](v5, "setIsContentFree:", objc_msgSend(v35, "BOOLValue"));
    v36 = v23;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isUserRecognized"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsUserRecognized:](v5, "setIsUserRecognized:", objc_msgSend(v37, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverSearchResultsMediaType"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setServerSearchResultsMediaType:](v5, "setServerSearchResultsMediaType:", objc_msgSend(v38, "intValue"));
    v39 = v5;

  }
  return v5;
}

- (int)clientDayOfWeek
{
  return self->_clientDayOfWeek;
}

- (int)rawClientHourOfDay
{
  return self->_rawClientHourOfDay;
}

- (BOOL)isMediaAlbumPresent
{
  return self->_isMediaAlbumPresent;
}

- (BOOL)isMediaArtistPresent
{
  return self->_isMediaArtistPresent;
}

- (BOOL)isMediaGenrePresent
{
  return self->_isMediaGenrePresent;
}

- (BOOL)isMediaMoodPresent
{
  return self->_isMediaMoodPresent;
}

- (BOOL)isMediaNamePresent
{
  return self->_isMediaNamePresent;
}

- (BOOL)isMediaReleaseDatePresent
{
  return self->_isMediaReleaseDatePresent;
}

- (int)nowPlayingLastBundleRecencyS
{
  return self->_nowPlayingLastBundleRecencyS;
}

- (int64_t)rawLanguage
{
  return self->_rawLanguage;
}

- (int64_t)rawLocale
{
  return self->_rawLocale;
}

- (int64_t)rawRegion
{
  return self->_rawRegion;
}

- (BOOL)isClientDaylight
{
  return self->_isClientDaylight;
}

- (BOOL)isClientNavigating
{
  return self->_isClientNavigating;
}

- (BOOL)isClientWorkout
{
  return self->_isClientWorkout;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)nowPlayingState
{
  return self->_nowPlayingState;
}

- (BOOL)isPireneRequest
{
  return self->_isPireneRequest;
}

- (double)foregroundBundleRecencyS
{
  return self->_foregroundBundleRecencyS;
}

- (int)mediaParsecCategory
{
  return self->_mediaParsecCategory;
}

- (int)sirikitResponseCode
{
  return self->_sirikitResponseCode;
}

- (int)appSelectionUses
{
  return self->_appSelectionUses;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (int)resolutionType
{
  return self->_resolutionType;
}

- (int)rawNowPlayingState
{
  return self->_rawNowPlayingState;
}

- (int)commonForegroundAppRecency
{
  return self->_commonForegroundAppRecency;
}

- (BOOL)isContentFree
{
  return self->_isContentFree;
}

- (BOOL)isUserRecognized
{
  return self->_isUserRecognized;
}

- (int)serverSearchResultsMediaType
{
  return self->_serverSearchResultsMediaType;
}

@end
