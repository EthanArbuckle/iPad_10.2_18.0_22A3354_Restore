@implementation INFERENCESchemaINFERENCEMusicTrainingDependentSignals

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsClientForegroundActiveBundle:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_isClientForegroundActiveBundle = a3;
}

- (BOOL)hasIsClientForegroundActiveBundle
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasIsClientForegroundActiveBundle:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)deleteIsClientForegroundActiveBundle
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsClientForegroundActiveBundle:](self, "setIsClientForegroundActiveBundle:", 0);
  *(_QWORD *)&self->_has &= ~1uLL;
}

- (void)setCompoundActiveBundleScore:(double)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_compoundActiveBundleScore = a3;
}

- (BOOL)hasCompoundActiveBundleScore
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (void)setHasCompoundActiveBundleScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (void)deleteCompoundActiveBundleScore
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCompoundActiveBundleScore:](self, "setCompoundActiveBundleScore:", 0.0);
  *(_QWORD *)&self->_has &= ~2uLL;
}

- (void)setCompoundMediaTypeBundleScore:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_compoundMediaTypeBundleScore = a3;
}

- (BOOL)hasCompoundMediaTypeBundleScore
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (void)setHasCompoundMediaTypeBundleScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (void)deleteCompoundMediaTypeBundleScore
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCompoundMediaTypeBundleScore:](self, "setCompoundMediaTypeBundleScore:", 0.0);
  *(_QWORD *)&self->_has &= ~4uLL;
}

- (void)setEntitySearchBundleRecencyS:(double)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_entitySearchBundleRecencyS = a3;
}

- (BOOL)hasEntitySearchBundleRecencyS
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (void)setHasEntitySearchBundleRecencyS:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (void)deleteEntitySearchBundleRecencyS
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleRecencyS:](self, "setEntitySearchBundleRecencyS:", 0.0);
  *(_QWORD *)&self->_has &= ~8uLL;
}

- (void)setEntitySearchBundleScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_entitySearchBundleScore = a3;
}

- (BOOL)hasEntitySearchBundleScore
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (void)setHasEntitySearchBundleScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (void)deleteEntitySearchBundleScore
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleScore:](self, "setEntitySearchBundleScore:", 0.0);
  *(_QWORD *)&self->_has &= ~0x10uLL;
}

- (void)setIsForegroundBundle:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_isForegroundBundle = a3;
}

- (BOOL)hasIsForegroundBundle
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (void)setHasIsForegroundBundle:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (void)deleteIsForegroundBundle
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsForegroundBundle:](self, "setIsForegroundBundle:", 0);
  *(_QWORD *)&self->_has &= ~0x20uLL;
}

- (void)setIsNowPlayingBundle:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_isNowPlayingBundle = a3;
}

- (BOOL)hasIsNowPlayingBundle
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsNowPlayingBundle:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (void)deleteIsNowPlayingBundle
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundle:](self, "setIsNowPlayingBundle:", 0);
  *(_QWORD *)&self->_has &= ~0x40uLL;
}

- (void)setNowPlayingBundleCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_nowPlayingBundleCount = a3;
}

- (BOOL)hasNowPlayingBundleCount
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setHasNowPlayingBundleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (void)deleteNowPlayingBundleCount
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleCount:](self, "setNowPlayingBundleCount:", 0);
  *(_QWORD *)&self->_has &= ~0x80uLL;
}

- (void)setNowPlayingBundleRecencyS:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_nowPlayingBundleRecencyS = a3;
}

- (BOOL)hasNowPlayingBundleRecencyS
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setHasNowPlayingBundleRecencyS:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (void)deleteNowPlayingBundleRecencyS
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleRecencyS:](self, "setNowPlayingBundleRecencyS:", 0.0);
  *(_QWORD *)&self->_has &= ~0x100uLL;
}

- (void)setNowPlayingBundleScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_nowPlayingBundleScore = a3;
}

- (BOOL)hasNowPlayingBundleScore
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (void)setHasNowPlayingBundleScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (void)deleteNowPlayingBundleScore
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleScore:](self, "setNowPlayingBundleScore:", 0.0);
  *(_QWORD *)&self->_has &= ~0x200uLL;
}

- (void)setIsNowPlayingLastBundle:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_isNowPlayingLastBundle = a3;
}

- (BOOL)hasIsNowPlayingLastBundle
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (void)setHasIsNowPlayingLastBundle:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (void)deleteIsNowPlayingLastBundle
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingLastBundle:](self, "setIsNowPlayingLastBundle:", 0);
  *(_QWORD *)&self->_has &= ~0x400uLL;
}

- (void)setNowPlayingUsage1Day:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_nowPlayingUsage1Day = a3;
}

- (BOOL)hasNowPlayingUsage1Day
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (void)setHasNowPlayingUsage1Day:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (void)deleteNowPlayingUsage1Day
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage1Day:](self, "setNowPlayingUsage1Day:", 0);
  *(_QWORD *)&self->_has &= ~0x800uLL;
}

- (void)setNowPlayingUsage7Days:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_nowPlayingUsage7Days = a3;
}

- (BOOL)hasNowPlayingUsage7Days
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (void)setHasNowPlayingUsage7Days:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (void)deleteNowPlayingUsage7Days
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage7Days:](self, "setNowPlayingUsage7Days:", 0);
  *(_QWORD *)&self->_has &= ~0x1000uLL;
}

- (void)setNowPlayingUsage14Days:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_nowPlayingUsage14Days = a3;
}

- (BOOL)hasNowPlayingUsage14Days
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (void)setHasNowPlayingUsage14Days:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (void)deleteNowPlayingUsage14Days
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage14Days:](self, "setNowPlayingUsage14Days:", 0);
  *(_QWORD *)&self->_has &= ~0x2000uLL;
}

- (void)setIsRawLastNowPlayingCoreDuet:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_isRawLastNowPlayingCoreDuet = a3;
}

- (BOOL)hasIsRawLastNowPlayingCoreDuet
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (void)setHasIsRawLastNowPlayingCoreDuet:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (void)deleteIsRawLastNowPlayingCoreDuet
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlayingCoreDuet:](self, "setIsRawLastNowPlayingCoreDuet:", 0);
  *(_QWORD *)&self->_has &= ~0x4000uLL;
}

- (void)setIsRawMediaCategoryAudiobookSignal:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_isRawMediaCategoryAudiobookSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryAudiobookSignal
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (void)setHasIsRawMediaCategoryAudiobookSignal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (void)deleteIsRawMediaCategoryAudiobookSignal
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryAudiobookSignal:](self, "setIsRawMediaCategoryAudiobookSignal:", 0);
  *(_QWORD *)&self->_has &= ~0x8000uLL;
}

- (void)setIsRawMediaCategoryMusicSignal:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_isRawMediaCategoryMusicSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryMusicSignal
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (void)setHasIsRawMediaCategoryMusicSignal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (void)deleteIsRawMediaCategoryMusicSignal
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryMusicSignal:](self, "setIsRawMediaCategoryMusicSignal:", 0);
  *(_QWORD *)&self->_has &= ~0x10000uLL;
}

- (void)setIsRawMediaCategoryPodcastSignal:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_isRawMediaCategoryPodcastSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryPodcastSignal
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (void)setHasIsRawMediaCategoryPodcastSignal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (void)deleteIsRawMediaCategoryPodcastSignal
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryPodcastSignal:](self, "setIsRawMediaCategoryPodcastSignal:", 0);
  *(_QWORD *)&self->_has &= ~0x20000uLL;
}

- (void)setIsRawMediaCategoryRadioSignal:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_isRawMediaCategoryRadioSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryRadioSignal
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (void)setHasIsRawMediaCategoryRadioSignal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (void)deleteIsRawMediaCategoryRadioSignal
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryRadioSignal:](self, "setIsRawMediaCategoryRadioSignal:", 0);
  *(_QWORD *)&self->_has &= ~0x40000uLL;
}

- (void)setIsRawMediaCategoryVideoSignal:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_isRawMediaCategoryVideoSignal = a3;
}

- (BOOL)hasIsRawMediaCategoryVideoSignal
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (void)setHasIsRawMediaCategoryVideoSignal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (void)deleteIsRawMediaCategoryVideoSignal
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryVideoSignal:](self, "setIsRawMediaCategoryVideoSignal:", 0);
  *(_QWORD *)&self->_has &= ~0x80000uLL;
}

- (void)setRawMediaTypeUsageSignalBook:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_rawMediaTypeUsageSignalBook = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalBook
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (void)setHasRawMediaTypeUsageSignalBook:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (void)deleteRawMediaTypeUsageSignalBook
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalBook:](self, "setRawMediaTypeUsageSignalBook:", 0);
  *(_QWORD *)&self->_has &= ~0x100000uLL;
}

- (void)setRawMediaTypeUsageSignalMusic:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_rawMediaTypeUsageSignalMusic = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalMusic
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (void)setHasRawMediaTypeUsageSignalMusic:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (void)deleteRawMediaTypeUsageSignalMusic
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalMusic:](self, "setRawMediaTypeUsageSignalMusic:", 0);
  *(_QWORD *)&self->_has &= ~0x200000uLL;
}

- (void)setRawMediaTypeUsageSignalPodcast:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_rawMediaTypeUsageSignalPodcast = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalPodcast
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (void)setHasRawMediaTypeUsageSignalPodcast:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (void)deleteRawMediaTypeUsageSignalPodcast
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalPodcast:](self, "setRawMediaTypeUsageSignalPodcast:", 0);
  *(_QWORD *)&self->_has &= ~0x400000uLL;
}

- (void)setRawMediaTypeUsageSignalVideo:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_rawMediaTypeUsageSignalVideo = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalVideo
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (void)setHasRawMediaTypeUsageSignalVideo:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (void)deleteRawMediaTypeUsageSignalVideo
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalVideo:](self, "setRawMediaTypeUsageSignalVideo:", 0);
  *(_QWORD *)&self->_has &= ~0x800000uLL;
}

- (void)setRawNowPlayingCountCoreDuet10Min:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_rawNowPlayingCountCoreDuet10Min = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet10Min
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
}

- (void)setHasRawNowPlayingCountCoreDuet10Min:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingCountCoreDuet10Min
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet10Min:](self, "setRawNowPlayingCountCoreDuet10Min:", 0);
  *(_QWORD *)&self->_has &= ~0x1000000uLL;
}

- (void)setRawNowPlayingCountCoreDuet1Day:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_rawNowPlayingCountCoreDuet1Day = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet1Day
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (void)setHasRawNowPlayingCountCoreDuet1Day:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingCountCoreDuet1Day
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet1Day:](self, "setRawNowPlayingCountCoreDuet1Day:", 0);
  *(_QWORD *)&self->_has &= ~0x2000000uLL;
}

- (void)setRawNowPlayingCountCoreDuet1Hr:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_rawNowPlayingCountCoreDuet1Hr = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet1Hr
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (void)setHasRawNowPlayingCountCoreDuet1Hr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingCountCoreDuet1Hr
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet1Hr:](self, "setRawNowPlayingCountCoreDuet1Hr:", 0);
  *(_QWORD *)&self->_has &= ~0x4000000uLL;
}

- (void)setRawNowPlayingCountCoreDuet28Day:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_rawNowPlayingCountCoreDuet28Day = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet28Day
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (void)setHasRawNowPlayingCountCoreDuet28Day:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (void)deleteRawNowPlayingCountCoreDuet28Day
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet28Day:](self, "setRawNowPlayingCountCoreDuet28Day:", 0);
  *(_QWORD *)&self->_has &= ~0x8000000uLL;
}

- (void)setRawNowPlayingCountCoreDuet2Min:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_rawNowPlayingCountCoreDuet2Min = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet2Min
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (void)setHasRawNowPlayingCountCoreDuet2Min:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingCountCoreDuet2Min
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet2Min:](self, "setRawNowPlayingCountCoreDuet2Min:", 0);
  *(_QWORD *)&self->_has &= ~0x10000000uLL;
}

- (void)setRawNowPlayingCountCoreDuet6Hr:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_rawNowPlayingCountCoreDuet6Hr = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet6Hr
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (void)setHasRawNowPlayingCountCoreDuet6Hr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingCountCoreDuet6Hr
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet6Hr:](self, "setRawNowPlayingCountCoreDuet6Hr:", 0);
  *(_QWORD *)&self->_has &= ~0x20000000uLL;
}

- (void)setRawNowPlayingCountCoreDuet7Day:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_rawNowPlayingCountCoreDuet7Day = a3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet7Day
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (void)setHasRawNowPlayingCountCoreDuet7Day:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingCountCoreDuet7Day
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet7Day:](self, "setRawNowPlayingCountCoreDuet7Day:", 0);
  *(_QWORD *)&self->_has &= ~0x40000000uLL;
}

- (void)setRawNowPlayingRecencyCD:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_rawNowPlayingRecencyCD = a3;
}

- (BOOL)hasRawNowPlayingRecencyCD
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (void)setHasRawNowPlayingRecencyCD:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingRecencyCD
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingRecencyCD:](self, "setRawNowPlayingRecencyCD:", 0);
  *(_QWORD *)&self->_has &= ~0x80000000uLL;
}

- (void)setRawEntitySearchRecency:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_rawEntitySearchRecency = a3;
}

- (BOOL)hasRawEntitySearchRecency
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setHasRawEntitySearchRecency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (void)deleteRawEntitySearchRecency
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawEntitySearchRecency:](self, "setRawEntitySearchRecency:", 0);
  *(_QWORD *)&self->_has &= ~0x100000000uLL;
}

- (void)setUsageScoreBooks:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_usageScoreBooks = a3;
}

- (BOOL)hasUsageScoreBooks
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (void)setHasUsageScoreBooks:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (void)deleteUsageScoreBooks
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreBooks:](self, "setUsageScoreBooks:", 0.0);
  *(_QWORD *)&self->_has &= ~0x200000000uLL;
}

- (void)setUsageScoreMusic:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_usageScoreMusic = a3;
}

- (BOOL)hasUsageScoreMusic
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (void)setHasUsageScoreMusic:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (void)deleteUsageScoreMusic
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusic:](self, "setUsageScoreMusic:", 0.0);
  *(_QWORD *)&self->_has &= ~0x400000000uLL;
}

- (void)setUsageScorePodcasts:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_usageScorePodcasts = a3;
}

- (BOOL)hasUsageScorePodcasts
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
}

- (void)setHasUsageScorePodcasts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (void)deleteUsageScorePodcasts
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScorePodcasts:](self, "setUsageScorePodcasts:", 0.0);
  *(_QWORD *)&self->_has &= ~0x800000000uLL;
}

- (void)setIsAppFirstParty:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_isAppFirstParty = a3;
}

- (BOOL)hasIsAppFirstParty
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (void)setHasIsAppFirstParty:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (void)deleteIsAppFirstParty
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsAppFirstParty:](self, "setIsAppFirstParty:", 0);
  *(_QWORD *)&self->_has &= ~0x1000000000uLL;
}

- (void)setIsRequestedApp:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_isRequestedApp = a3;
}

- (BOOL)hasIsRequestedApp
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (void)setHasIsRequestedApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (void)deleteIsRequestedApp
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRequestedApp:](self, "setIsRequestedApp:", 0);
  *(_QWORD *)&self->_has &= ~0x2000000000uLL;
}

- (void)setIsNowPlayingBundlePSE1:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_isNowPlayingBundlePSE1 = a3;
}

- (BOOL)hasIsNowPlayingBundlePSE1
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (void)setHasIsNowPlayingBundlePSE1:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)deleteIsNowPlayingBundlePSE1
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundlePSE1:](self, "setIsNowPlayingBundlePSE1:", 0);
  *(_QWORD *)&self->_has &= ~0x4000000000uLL;
}

- (void)setIsNowPlayingBundlePSE2:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_isNowPlayingBundlePSE2 = a3;
}

- (BOOL)hasIsNowPlayingBundlePSE2
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (void)setHasIsNowPlayingBundlePSE2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (void)deleteIsNowPlayingBundlePSE2
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundlePSE2:](self, "setIsNowPlayingBundlePSE2:", 0);
  *(_QWORD *)&self->_has &= ~0x8000000000uLL;
}

- (void)setVq21Score:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_vq21Score = a3;
}

- (BOOL)hasVq21Score
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (void)setHasVq21Score:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (void)deleteVq21Score
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setVq21Score:](self, "setVq21Score:", 0.0);
  *(_QWORD *)&self->_has &= ~0x10000000000uLL;
}

- (void)setIsSupportedFlag:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_isSupportedFlag = a3;
}

- (BOOL)hasIsSupportedFlag
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (void)setHasIsSupportedFlag:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (void)deleteIsSupportedFlag
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsSupportedFlag:](self, "setIsSupportedFlag:", 0);
  *(_QWORD *)&self->_has &= ~0x20000000000uLL;
}

- (void)setIsUnicornFlag:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_isUnicornFlag = a3;
}

- (BOOL)hasIsUnicornFlag
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
}

- (void)setHasIsUnicornFlag:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (void)deleteIsUnicornFlag
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsUnicornFlag:](self, "setIsUnicornFlag:", 0);
  *(_QWORD *)&self->_has &= ~0x40000000000uLL;
}

- (void)setIsSupportedUnicornMatchFlag:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_isSupportedUnicornMatchFlag = a3;
}

- (BOOL)hasIsSupportedUnicornMatchFlag
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (void)setHasIsSupportedUnicornMatchFlag:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (void)deleteIsSupportedUnicornMatchFlag
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsSupportedUnicornMatchFlag:](self, "setIsSupportedUnicornMatchFlag:", 0);
  *(_QWORD *)&self->_has &= ~0x80000000000uLL;
}

- (void)setIsDisambiguationSelectedApp:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_isDisambiguationSelectedApp = a3;
}

- (BOOL)hasIsDisambiguationSelectedApp
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (void)setHasIsDisambiguationSelectedApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (void)deleteIsDisambiguationSelectedApp
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsDisambiguationSelectedApp:](self, "setIsDisambiguationSelectedApp:", 0);
  *(_QWORD *)&self->_has &= ~0x100000000000uLL;
}

- (void)setIsModelPredictedApp:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_isModelPredictedApp = a3;
}

- (BOOL)hasIsModelPredictedApp
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (void)setHasIsModelPredictedApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (void)deleteIsModelPredictedApp
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsModelPredictedApp:](self, "setIsModelPredictedApp:", 0);
  *(_QWORD *)&self->_has &= ~0x200000000000uLL;
}

- (void)setUsageScoreRadio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_usageScoreRadio = a3;
}

- (BOOL)hasUsageScoreRadio
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (void)setHasUsageScoreRadio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (void)deleteUsageScoreRadio
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreRadio:](self, "setUsageScoreRadio:", 0.0);
  *(_QWORD *)&self->_has &= ~0x400000000000uLL;
}

- (void)setUsageScoreMusicWithoutRadio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_usageScoreMusicWithoutRadio = a3;
}

- (BOOL)hasUsageScoreMusicWithoutRadio
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (void)setHasUsageScoreMusicWithoutRadio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (void)deleteUsageScoreMusicWithoutRadio
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusicWithoutRadio:](self, "setUsageScoreMusicWithoutRadio:", 0.0);
  *(_QWORD *)&self->_has &= ~0x800000000000uLL;
}

- (void)setRawMediaTypeUsageSignalRadio:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_rawMediaTypeUsageSignalRadio = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalRadio
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setHasRawMediaTypeUsageSignalRadio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawMediaTypeUsageSignalRadio
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalRadio:](self, "setRawMediaTypeUsageSignalRadio:", 0);
  *(_QWORD *)&self->_has &= ~0x1000000000000uLL;
}

- (void)setRawMediaTypeUsageSignalMusicWithoutRadio:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_rawMediaTypeUsageSignalMusicWithoutRadio = a3;
}

- (BOOL)hasRawMediaTypeUsageSignalMusicWithoutRadio
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (void)setHasRawMediaTypeUsageSignalMusicWithoutRadio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawMediaTypeUsageSignalMusicWithoutRadio
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalMusicWithoutRadio:](self, "setRawMediaTypeUsageSignalMusicWithoutRadio:", 0);
  *(_QWORD *)&self->_has &= ~0x2000000000000uLL;
}

- (void)setSubscriptionStatus:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_subscriptionStatus = a3;
}

- (BOOL)hasSubscriptionStatus
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (void)setHasSubscriptionStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (void)deleteSubscriptionStatus
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setSubscriptionStatus:](self, "setSubscriptionStatus:", 0);
  *(_QWORD *)&self->_has &= ~0x4000000000000uLL;
}

- (void)setIsRawNowPlayingBundle:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_isRawNowPlayingBundle = a3;
}

- (BOOL)hasIsRawNowPlayingBundle
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (void)setHasIsRawNowPlayingBundle:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (void)deleteIsRawNowPlayingBundle
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawNowPlayingBundle:](self, "setIsRawNowPlayingBundle:", 0);
  *(_QWORD *)&self->_has &= ~0x8000000000000uLL;
}

- (void)setRawNowPlayingTotal:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_rawNowPlayingTotal = a3;
}

- (BOOL)hasRawNowPlayingTotal
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (void)setHasRawNowPlayingTotal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingTotal
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingTotal:](self, "setRawNowPlayingTotal:", 0);
  *(_QWORD *)&self->_has &= ~0x10000000000000uLL;
}

- (void)setRawNowPlayingBundleScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_rawNowPlayingBundleScore = a3;
}

- (BOOL)hasRawNowPlayingBundleScore
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (void)setHasRawNowPlayingBundleScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlayingBundleScore
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingBundleScore:](self, "setRawNowPlayingBundleScore:", 0.0);
  *(_QWORD *)&self->_has &= ~0x20000000000000uLL;
}

- (void)setIsRawLastNowPlaying:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_isRawLastNowPlaying = a3;
}

- (BOOL)hasIsRawLastNowPlaying
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (void)setHasIsRawLastNowPlaying:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (void)deleteIsRawLastNowPlaying
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlaying:](self, "setIsRawLastNowPlaying:", 0.0);
  *(_QWORD *)&self->_has &= ~0x40000000000000uLL;
}

- (void)setRawNowPlaying2Minutes:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_rawNowPlaying2Minutes = a3;
}

- (BOOL)hasRawNowPlaying2Minutes
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)setHasRawNowPlaying2Minutes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlaying2Minutes
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying2Minutes:](self, "setRawNowPlaying2Minutes:", 0);
  *(_QWORD *)&self->_has &= ~0x80000000000000uLL;
}

- (void)setRawNowPlaying10Minutes:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_rawNowPlaying10Minutes = a3;
}

- (BOOL)hasRawNowPlaying10Minutes
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (void)setHasRawNowPlaying10Minutes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlaying10Minutes
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying10Minutes:](self, "setRawNowPlaying10Minutes:", 0);
  *(_QWORD *)&self->_has &= ~0x100000000000000uLL;
}

- (void)setRawNowPlaying1Hour:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_rawNowPlaying1Hour = a3;
}

- (BOOL)hasRawNowPlaying1Hour
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (void)setHasRawNowPlaying1Hour:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlaying1Hour
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying1Hour:](self, "setRawNowPlaying1Hour:", 0);
  *(_QWORD *)&self->_has &= ~0x200000000000000uLL;
}

- (void)setRawNowPlaying6Hours:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_rawNowPlaying6Hours = a3;
}

- (BOOL)hasRawNowPlaying6Hours
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
}

- (void)setHasRawNowPlaying6Hours:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlaying6Hours
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying6Hours:](self, "setRawNowPlaying6Hours:", 0);
  *(_QWORD *)&self->_has &= ~0x400000000000000uLL;
}

- (void)setRawNowPlaying1Day:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_rawNowPlaying1Day = a3;
}

- (BOOL)hasRawNowPlaying1Day
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (void)setHasRawNowPlaying1Day:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlaying1Day
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying1Day:](self, "setRawNowPlaying1Day:", 0);
  *(_QWORD *)&self->_has &= ~0x800000000000000uLL;
}

- (void)setRawNowPlaying7Days:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_rawNowPlaying7Days = a3;
}

- (BOOL)hasRawNowPlaying7Days
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (void)setHasRawNowPlaying7Days:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlaying7Days
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying7Days:](self, "setRawNowPlaying7Days:", 0);
  *(_QWORD *)&self->_has &= ~0x1000000000000000uLL;
}

- (void)setRawNowPlaying28Days:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_rawNowPlaying28Days = a3;
}

- (BOOL)hasRawNowPlaying28Days
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (void)setHasRawNowPlaying28Days:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawNowPlaying28Days
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying28Days:](self, "setRawNowPlaying28Days:", 0);
  *(_QWORD *)&self->_has &= ~0x2000000000000000uLL;
}

- (void)setRawLastNowPlayingRecency:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_rawLastNowPlayingRecency = a3;
}

- (BOOL)hasRawLastNowPlayingRecency
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (void)setHasRawLastNowPlayingRecency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteRawLastNowPlayingRecency
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawLastNowPlayingRecency:](self, "setRawLastNowPlayingRecency:", 0);
  *(_QWORD *)&self->_has &= ~0x4000000000000000uLL;
}

- (void)setCommonForegroundBundleApp:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_commonForegroundBundleApp = a3;
}

- (BOOL)hasCommonForegroundBundleApp
{
  return *(_QWORD *)&self->_has >> 63;
}

- (void)setHasCommonForegroundBundleApp:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (void)deleteCommonForegroundBundleApp
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCommonForegroundBundleApp:](self, "setCommonForegroundBundleApp:", 0);
  *(_QWORD *)&self->_has &= ~0x8000000000000000;
}

- (void)setIsRawLastNowPlayingBoolean:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 1u;
  self->_isRawLastNowPlayingBoolean = a3;
}

- (BOOL)hasIsRawLastNowPlayingBoolean
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (void)setHasIsRawLastNowPlayingBoolean:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (void)deleteIsRawLastNowPlayingBoolean
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlayingBoolean:](self, "setIsRawLastNowPlayingBoolean:", 0);
  *((_WORD *)&self->_has + 4) &= ~1u;
}

- (void)setIsCommonForegroundApp:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 2u;
  self->_isCommonForegroundApp = a3;
}

- (BOOL)hasIsCommonForegroundApp
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHasIsCommonForegroundApp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v3;
}

- (void)deleteIsCommonForegroundApp
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsCommonForegroundApp:](self, "setIsCommonForegroundApp:", 0);
  *((_WORD *)&self->_has + 4) &= ~2u;
}

- (void)setIsBoltEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 4u;
  self->_isBoltEnabled = a3;
}

- (BOOL)hasIsBoltEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (void)setHasIsBoltEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v3;
}

- (void)deleteIsBoltEnabled
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsBoltEnabled:](self, "setIsBoltEnabled:", 0);
  *((_WORD *)&self->_has + 4) &= ~4u;
}

- (void)setUsageScoreMusicWithoutRadioRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 8u;
  self->_usageScoreMusicWithoutRadioRemote = a3;
}

- (BOOL)hasUsageScoreMusicWithoutRadioRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setHasUsageScoreMusicWithoutRadioRemote:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v3;
}

- (void)deleteUsageScoreMusicWithoutRadioRemote
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusicWithoutRadioRemote:](self, "setUsageScoreMusicWithoutRadioRemote:", 0.0);
  *((_WORD *)&self->_has + 4) &= ~8u;
}

- (void)setUsageScoreBooksRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x10u;
  self->_usageScoreBooksRemote = a3;
}

- (BOOL)hasUsageScoreBooksRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)setHasUsageScoreBooksRemote:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v3;
}

- (void)deleteUsageScoreBooksRemote
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreBooksRemote:](self, "setUsageScoreBooksRemote:", 0.0);
  *((_WORD *)&self->_has + 4) &= ~0x10u;
}

- (void)setUsageScoreRadioRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x20u;
  self->_usageScoreRadioRemote = a3;
}

- (BOOL)hasUsageScoreRadioRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (void)setHasUsageScoreRadioRemote:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v3;
}

- (void)deleteUsageScoreRadioRemote
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreRadioRemote:](self, "setUsageScoreRadioRemote:", 0.0);
  *((_WORD *)&self->_has + 4) &= ~0x20u;
}

- (void)setUsageScorePodcastsRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x40u;
  self->_usageScorePodcastsRemote = a3;
}

- (BOOL)hasUsageScorePodcastsRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (void)setHasUsageScorePodcastsRemote:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v3;
}

- (void)deleteUsageScorePodcastsRemote
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScorePodcastsRemote:](self, "setUsageScorePodcastsRemote:", 0.0);
  *((_WORD *)&self->_has + 4) &= ~0x40u;
}

- (void)setEntitySearchBundleScoreRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x80u;
  self->_entitySearchBundleScoreRemote = a3;
}

- (BOOL)hasEntitySearchBundleScoreRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (void)setHasEntitySearchBundleScoreRemote:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v3;
}

- (void)deleteEntitySearchBundleScoreRemote
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleScoreRemote:](self, "setEntitySearchBundleScoreRemote:", 0.0);
  *((_WORD *)&self->_has + 4) &= ~0x80u;
}

- (void)setUsageScoreMusicRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x100u;
  self->_usageScoreMusicRemote = a3;
}

- (BOOL)hasUsageScoreMusicRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (void)setHasUsageScoreMusicRemote:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v3;
}

- (void)deleteUsageScoreMusicRemote
{
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusicRemote:](self, "setUsageScoreMusicRemote:", 0.0);
  *((_WORD *)&self->_has + 4) &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEMusicTrainingDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  uint64_t has;
  __int16 v6;
  id v7;

  v4 = a3;
  has = (uint64_t)self->_has;
  v7 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    has = (uint64_t)self->_has;
  }
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    has = (uint64_t)self->_has;
    v6 = *((_WORD *)&self->_has + 4);
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_79;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000) == 0)
  {
LABEL_16:
    if ((has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000) == 0)
  {
LABEL_17:
    if ((has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000) == 0)
  {
LABEL_18:
    if ((has & 0x10000) == 0)
      goto LABEL_19;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000) == 0)
  {
LABEL_19:
    if ((has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000) == 0)
  {
LABEL_20:
    if ((has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000) == 0)
  {
LABEL_21:
    if ((has & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000) == 0)
  {
LABEL_22:
    if ((has & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000) == 0)
  {
LABEL_23:
    if ((has & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000) == 0)
  {
LABEL_24:
    if ((has & 0x400000) == 0)
      goto LABEL_25;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x1000000) == 0)
      goto LABEL_27;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000) == 0)
  {
LABEL_27:
    if ((has & 0x2000000) == 0)
      goto LABEL_28;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000) == 0)
  {
LABEL_28:
    if ((has & 0x4000000) == 0)
      goto LABEL_29;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000) == 0)
  {
LABEL_29:
    if ((has & 0x8000000) == 0)
      goto LABEL_30;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000) == 0)
  {
LABEL_30:
    if ((has & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000) == 0)
  {
LABEL_31:
    if ((has & 0x20000000) == 0)
      goto LABEL_32;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000) == 0)
  {
LABEL_32:
    if ((has & 0x40000000) == 0)
      goto LABEL_33;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000) == 0)
  {
LABEL_33:
    if ((has & 0x80000000) == 0)
      goto LABEL_34;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000) == 0)
  {
LABEL_34:
    if ((has & 0x100000000) == 0)
      goto LABEL_35;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000) == 0)
  {
LABEL_35:
    if ((has & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000) == 0)
  {
LABEL_36:
    if ((has & 0x400000000) == 0)
      goto LABEL_37;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000) == 0)
  {
LABEL_37:
    if ((has & 0x800000000) == 0)
      goto LABEL_38;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000) == 0)
  {
LABEL_38:
    if ((has & 0x1000000000) == 0)
      goto LABEL_39;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000) == 0)
  {
LABEL_39:
    if ((has & 0x2000000000) == 0)
      goto LABEL_40;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000) == 0)
  {
LABEL_40:
    if ((has & 0x4000000000) == 0)
      goto LABEL_41;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000) == 0)
  {
LABEL_41:
    if ((has & 0x8000000000) == 0)
      goto LABEL_42;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000000) == 0)
  {
LABEL_42:
    if ((has & 0x10000000000) == 0)
      goto LABEL_43;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000000) == 0)
  {
LABEL_43:
    if ((has & 0x20000000000) == 0)
      goto LABEL_44;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0)
      goto LABEL_45;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x80000000000) == 0)
      goto LABEL_46;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000000) == 0)
  {
LABEL_46:
    if ((has & 0x100000000000) == 0)
      goto LABEL_47;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000) == 0)
  {
LABEL_47:
    if ((has & 0x200000000000) == 0)
      goto LABEL_48;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000000) == 0)
  {
LABEL_48:
    if ((has & 0x400000000000) == 0)
      goto LABEL_49;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000000) == 0)
  {
LABEL_49:
    if ((has & 0x800000000000) == 0)
      goto LABEL_50;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000000) == 0)
  {
LABEL_50:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_51;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_52;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_53;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_53:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_54;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_55;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_55:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_56;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_56:
    if ((has & 0x40000000000000) == 0)
      goto LABEL_57;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x80000000000000) == 0)
      goto LABEL_58;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_58:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_59;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_59:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_60;
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_60:
    if ((has & 0x400000000000000) == 0)
      goto LABEL_61;
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_61:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_62;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_63;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_63:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_64;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_64:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_65;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_66;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) == 0)
  {
LABEL_66:
    if ((v6 & 1) == 0)
      goto LABEL_67;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 1) == 0)
  {
LABEL_67:
    if ((v6 & 2) == 0)
      goto LABEL_68;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 2) == 0)
  {
LABEL_68:
    if ((v6 & 4) == 0)
      goto LABEL_69;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 4) == 0)
  {
LABEL_69:
    if ((v6 & 8) == 0)
      goto LABEL_70;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 8) == 0)
  {
LABEL_70:
    if ((v6 & 0x10) == 0)
      goto LABEL_71;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x10) == 0)
  {
LABEL_71:
    if ((v6 & 0x20) == 0)
      goto LABEL_72;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x20) == 0)
  {
LABEL_72:
    if ((v6 & 0x40) == 0)
      goto LABEL_73;
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x40) == 0)
  {
LABEL_73:
    if ((v6 & 0x80) == 0)
      goto LABEL_74;
LABEL_147:
    PBDataWriterWriteDoubleField();
    v4 = v7;
    if ((*((_WORD *)&self->_has + 4) & 0x100) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_146:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x80) != 0)
    goto LABEL_147;
LABEL_74:
  if ((v6 & 0x100) != 0)
  {
LABEL_75:
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
LABEL_76:

}

- (BOOL)isEqual:(id)a3
{
  unint64_t *v4;
  unint64_t has;
  unint64_t v6;
  unint64_t v7;
  int v8;
  int isClientForegroundActiveBundle;
  unsigned int v10;
  double compoundActiveBundleScore;
  double v12;
  unsigned int v13;
  double compoundMediaTypeBundleScore;
  double v15;
  unsigned int v16;
  double entitySearchBundleRecencyS;
  double v18;
  unsigned int v19;
  double entitySearchBundleScore;
  double v21;
  unsigned int v22;
  int isForegroundBundle;
  unsigned int v24;
  int isNowPlayingBundle;
  unsigned int v26;
  int nowPlayingBundleCount;
  unsigned int v28;
  double nowPlayingBundleRecencyS;
  double v30;
  unsigned int v31;
  double nowPlayingBundleScore;
  double v33;
  unsigned int v34;
  int isNowPlayingLastBundle;
  unsigned int v36;
  int nowPlayingUsage1Day;
  unsigned int v38;
  int nowPlayingUsage7Days;
  unsigned int v40;
  int nowPlayingUsage14Days;
  unsigned int v42;
  int isRawLastNowPlayingCoreDuet;
  unsigned int v44;
  int isRawMediaCategoryAudiobookSignal;
  unsigned int v46;
  int isRawMediaCategoryMusicSignal;
  unsigned int v48;
  int isRawMediaCategoryPodcastSignal;
  unsigned int v50;
  int isRawMediaCategoryRadioSignal;
  unsigned int v52;
  int isRawMediaCategoryVideoSignal;
  unsigned int v54;
  int rawMediaTypeUsageSignalBook;
  unsigned int v56;
  int rawMediaTypeUsageSignalMusic;
  unsigned int v58;
  int rawMediaTypeUsageSignalPodcast;
  unsigned int v60;
  int rawMediaTypeUsageSignalVideo;
  unsigned int v62;
  int rawNowPlayingCountCoreDuet10Min;
  unsigned int v64;
  int rawNowPlayingCountCoreDuet1Day;
  unsigned int v66;
  int rawNowPlayingCountCoreDuet1Hr;
  unsigned int v68;
  int rawNowPlayingCountCoreDuet28Day;
  unsigned int v70;
  int rawNowPlayingCountCoreDuet2Min;
  unsigned int v72;
  int rawNowPlayingCountCoreDuet6Hr;
  unsigned int v74;
  int rawNowPlayingCountCoreDuet7Day;
  unint64_t v76;
  uint64_t v77;
  char v78;
  char v79;
  char v80;
  char v81;
  char v82;
  unint64_t v83;
  char v84;
  char v85;
  uint64_t v86;
  char v87;
  char v88;
  char v89;
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  unint64_t v96;
  char v97;
  unint64_t v98;
  unint64_t v99;
  char v100;
  int rawNowPlayingRecencyCD;
  unint64_t v102;
  unint64_t v103;
  int v104;
  int rawEntitySearchRecency;
  unint64_t v106;
  unint64_t v107;
  int v108;
  double usageScoreBooks;
  double v110;
  unint64_t v111;
  unint64_t v112;
  double usageScoreMusic;
  double v114;
  unint64_t v115;
  unint64_t v116;
  double usageScorePodcasts;
  double v118;
  unint64_t v119;
  unint64_t v120;
  int isAppFirstParty;
  unint64_t v122;
  unint64_t v123;
  int isRequestedApp;
  unint64_t v125;
  unint64_t v126;
  int isNowPlayingBundlePSE1;
  unint64_t v128;
  unint64_t v129;
  int isNowPlayingBundlePSE2;
  unint64_t v131;
  unint64_t v132;
  double vq21Score;
  double v134;
  unint64_t v135;
  unint64_t v136;
  int v137;
  int isSupportedFlag;
  unint64_t v139;
  unint64_t v140;
  int isUnicornFlag;
  unint64_t v142;
  unint64_t v143;
  int isSupportedUnicornMatchFlag;
  unint64_t v145;
  unint64_t v146;
  int isDisambiguationSelectedApp;
  unint64_t v148;
  unint64_t v149;
  int isModelPredictedApp;
  unint64_t v151;
  unint64_t v152;
  double usageScoreRadio;
  double v154;
  unint64_t v155;
  unint64_t v156;
  double usageScoreMusicWithoutRadio;
  double v158;
  unint64_t v159;
  unint64_t v160;
  int rawMediaTypeUsageSignalRadio;
  unint64_t v162;
  unint64_t v163;
  int rawMediaTypeUsageSignalMusicWithoutRadio;
  unint64_t v165;
  unint64_t v166;
  int subscriptionStatus;
  unint64_t v168;
  unint64_t v169;
  int isRawNowPlayingBundle;
  unint64_t v171;
  unint64_t v172;
  int rawNowPlayingTotal;
  unint64_t v174;
  unint64_t v175;
  double rawNowPlayingBundleScore;
  double v177;
  unint64_t v178;
  unint64_t v179;
  double isRawLastNowPlaying;
  double v181;
  unint64_t v182;
  unint64_t v183;
  int rawNowPlaying2Minutes;
  unint64_t v185;
  unint64_t v186;
  int rawNowPlaying10Minutes;
  unint64_t v188;
  unint64_t v189;
  int rawNowPlaying1Hour;
  unint64_t v191;
  unint64_t v192;
  int rawNowPlaying6Hours;
  unint64_t v194;
  unint64_t v195;
  int rawNowPlaying1Day;
  unint64_t v197;
  unint64_t v198;
  int rawNowPlaying7Days;
  uint64_t v200;
  uint64_t v201;
  int rawNowPlaying28Days;
  uint64_t v203;
  uint64_t v204;
  int rawLastNowPlayingRecency;
  int commonForegroundBundleApp;
  int isRawLastNowPlayingBoolean;
  unint64_t v208;
  unint64_t v209;
  int isCommonForegroundApp;
  int isBoltEnabled;
  unint64_t v212;
  unsigned int v213;
  unint64_t v214;
  unint64_t v215;
  unint64_t v216;
  unint64_t v217;
  unint64_t v218;
  unint64_t v219;
  unint64_t v220;
  unint64_t v221;
  unint64_t v222;
  unint64_t v223;
  unint64_t v224;
  double usageScoreMusicWithoutRadioRemote;
  double v226;
  unint64_t v227;
  unint64_t v228;
  unint64_t v229;
  int v230;
  double usageScoreBooksRemote;
  double v232;
  unint64_t v233;
  unint64_t v234;
  unint64_t v235;
  int v236;
  double usageScoreRadioRemote;
  double v238;
  unint64_t v239;
  unint64_t v240;
  unint64_t v241;
  double usageScorePodcastsRemote;
  double v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  double entitySearchBundleScoreRemote;
  double v248;
  double usageScoreMusicRemote;
  double v250;
  BOOL v251;
  char v253;
  char v254;
  char v255;
  char v256;
  char v257;
  char v258;
  char v259;
  char v260;
  char v261;
  char v262;
  char v263;
  char v264;
  char v265;
  char v266;
  char v267;
  char v268;
  char v269;
  char v270;
  char v271;
  char v272;
  char v273;
  char v274;
  char v275;
  char v276;
  char v277;
  char v278;
  char v279;
  char v280;
  char v281;
  char v282;
  char v283;
  char v284;
  char v285;
  char v286;
  char v287;
  char v288;
  char v289;
  char v290;
  char v291;
  char v292;
  unint64_t v293;
  unint64_t v294;
  char v295;
  char v296;

  v4 = (unint64_t *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_295;
  has = (unint64_t)self->_has;
  v6 = v4[43];
  if ((has & 1) != (v4[43] & 1))
    goto LABEL_295;
  if ((has & 1) != 0)
  {
    isClientForegroundActiveBundle = self->_isClientForegroundActiveBundle;
    if (isClientForegroundActiveBundle != objc_msgSend(v4, "isClientForegroundActiveBundle"))
      goto LABEL_295;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 176);
    v6 = v4[43];
  }
  else
  {
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
    v8 = *((unsigned __int16 *)v4 + 176);
  }
  v10 = (has >> 1) & 1;
  if (v10 == ((v6 >> 1) & 1))
  {
    if (v10)
    {
      compoundActiveBundleScore = self->_compoundActiveBundleScore;
      objc_msgSend(v4, "compoundActiveBundleScore");
      if (compoundActiveBundleScore != v12)
        goto LABEL_295;
      LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
      has = (unint64_t)self->_has;
      v8 = *((unsigned __int16 *)v4 + 176);
      v6 = v4[43];
    }
    v13 = (has >> 2) & 1;
    if (v13 == ((v6 >> 2) & 1))
    {
      if (v13)
      {
        compoundMediaTypeBundleScore = self->_compoundMediaTypeBundleScore;
        objc_msgSend(v4, "compoundMediaTypeBundleScore");
        if (compoundMediaTypeBundleScore != v15)
          goto LABEL_295;
        LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
        has = (unint64_t)self->_has;
        v8 = *((unsigned __int16 *)v4 + 176);
        v6 = v4[43];
      }
      v16 = (has >> 3) & 1;
      if (v16 == ((v6 >> 3) & 1))
      {
        if (v16)
        {
          entitySearchBundleRecencyS = self->_entitySearchBundleRecencyS;
          objc_msgSend(v4, "entitySearchBundleRecencyS");
          if (entitySearchBundleRecencyS != v18)
            goto LABEL_295;
          LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
          has = (unint64_t)self->_has;
          v8 = *((unsigned __int16 *)v4 + 176);
          v6 = v4[43];
        }
        v19 = (has >> 4) & 1;
        if (v19 == ((v6 >> 4) & 1))
        {
          if (v19)
          {
            entitySearchBundleScore = self->_entitySearchBundleScore;
            objc_msgSend(v4, "entitySearchBundleScore");
            if (entitySearchBundleScore != v21)
              goto LABEL_295;
            LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
            has = (unint64_t)self->_has;
            v8 = *((unsigned __int16 *)v4 + 176);
            v6 = v4[43];
          }
          v22 = (has >> 5) & 1;
          if (v22 == ((v6 >> 5) & 1))
          {
            if (v22)
            {
              isForegroundBundle = self->_isForegroundBundle;
              if (isForegroundBundle != objc_msgSend(v4, "isForegroundBundle"))
                goto LABEL_295;
              LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
              has = (unint64_t)self->_has;
              v8 = *((unsigned __int16 *)v4 + 176);
              v6 = v4[43];
            }
            v24 = (has >> 6) & 1;
            if (v24 == ((v6 >> 6) & 1))
            {
              if (v24)
              {
                isNowPlayingBundle = self->_isNowPlayingBundle;
                if (isNowPlayingBundle != objc_msgSend(v4, "isNowPlayingBundle"))
                  goto LABEL_295;
                LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                has = (unint64_t)self->_has;
                v8 = *((unsigned __int16 *)v4 + 176);
                v6 = v4[43];
              }
              v26 = (has >> 7) & 1;
              if (v26 == ((v6 >> 7) & 1))
              {
                if (v26)
                {
                  nowPlayingBundleCount = self->_nowPlayingBundleCount;
                  if (nowPlayingBundleCount != objc_msgSend(v4, "nowPlayingBundleCount"))
                    goto LABEL_295;
                  LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                  has = (unint64_t)self->_has;
                  v8 = *((unsigned __int16 *)v4 + 176);
                  v6 = v4[43];
                }
                v28 = (has >> 8) & 1;
                if (v28 == ((v6 >> 8) & 1))
                {
                  if (v28)
                  {
                    nowPlayingBundleRecencyS = self->_nowPlayingBundleRecencyS;
                    objc_msgSend(v4, "nowPlayingBundleRecencyS");
                    if (nowPlayingBundleRecencyS != v30)
                      goto LABEL_295;
                    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                    has = (unint64_t)self->_has;
                    v8 = *((unsigned __int16 *)v4 + 176);
                    v6 = v4[43];
                  }
                  v31 = (has >> 9) & 1;
                  if (v31 == ((v6 >> 9) & 1))
                  {
                    if (v31)
                    {
                      nowPlayingBundleScore = self->_nowPlayingBundleScore;
                      objc_msgSend(v4, "nowPlayingBundleScore");
                      if (nowPlayingBundleScore != v33)
                        goto LABEL_295;
                      LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                      has = (unint64_t)self->_has;
                      v8 = *((unsigned __int16 *)v4 + 176);
                      v6 = v4[43];
                    }
                    v34 = (has >> 10) & 1;
                    if (v34 == ((v6 >> 10) & 1))
                    {
                      if (v34)
                      {
                        isNowPlayingLastBundle = self->_isNowPlayingLastBundle;
                        if (isNowPlayingLastBundle != objc_msgSend(v4, "isNowPlayingLastBundle"))
                          goto LABEL_295;
                        LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                        has = (unint64_t)self->_has;
                        v8 = *((unsigned __int16 *)v4 + 176);
                        v6 = v4[43];
                      }
                      v36 = (has >> 11) & 1;
                      if (v36 == ((v6 >> 11) & 1))
                      {
                        if (v36)
                        {
                          nowPlayingUsage1Day = self->_nowPlayingUsage1Day;
                          if (nowPlayingUsage1Day != objc_msgSend(v4, "nowPlayingUsage1Day"))
                            goto LABEL_295;
                          LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                          has = (unint64_t)self->_has;
                          v8 = *((unsigned __int16 *)v4 + 176);
                          v6 = v4[43];
                        }
                        v38 = (has >> 12) & 1;
                        if (v38 == ((v6 >> 12) & 1))
                        {
                          if (v38)
                          {
                            nowPlayingUsage7Days = self->_nowPlayingUsage7Days;
                            if (nowPlayingUsage7Days != objc_msgSend(v4, "nowPlayingUsage7Days"))
                              goto LABEL_295;
                            LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                            has = (unint64_t)self->_has;
                            v8 = *((unsigned __int16 *)v4 + 176);
                            v6 = v4[43];
                          }
                          v40 = (has >> 13) & 1;
                          if (v40 == ((v6 >> 13) & 1))
                          {
                            if (v40)
                            {
                              nowPlayingUsage14Days = self->_nowPlayingUsage14Days;
                              if (nowPlayingUsage14Days != objc_msgSend(v4, "nowPlayingUsage14Days"))
                                goto LABEL_295;
                              LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                              has = (unint64_t)self->_has;
                              v8 = *((unsigned __int16 *)v4 + 176);
                              v6 = v4[43];
                            }
                            v42 = (has >> 14) & 1;
                            if (v42 == ((v6 >> 14) & 1))
                            {
                              if (v42)
                              {
                                isRawLastNowPlayingCoreDuet = self->_isRawLastNowPlayingCoreDuet;
                                if (isRawLastNowPlayingCoreDuet != objc_msgSend(v4, "isRawLastNowPlayingCoreDuet"))goto LABEL_295;
                                LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                has = (unint64_t)self->_has;
                                v8 = *((unsigned __int16 *)v4 + 176);
                                v6 = v4[43];
                              }
                              v44 = (has >> 15) & 1;
                              if (v44 == ((v6 >> 15) & 1))
                              {
                                if (v44)
                                {
                                  isRawMediaCategoryAudiobookSignal = self->_isRawMediaCategoryAudiobookSignal;
                                  if (isRawMediaCategoryAudiobookSignal != objc_msgSend(v4, "isRawMediaCategoryAudiobookSignal"))goto LABEL_295;
                                  LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                  has = (unint64_t)self->_has;
                                  v8 = *((unsigned __int16 *)v4 + 176);
                                  v6 = v4[43];
                                }
                                v46 = WORD1(has) & 1;
                                if (v46 == (WORD1(v6) & 1))
                                {
                                  if (v46)
                                  {
                                    isRawMediaCategoryMusicSignal = self->_isRawMediaCategoryMusicSignal;
                                    if (isRawMediaCategoryMusicSignal != objc_msgSend(v4, "isRawMediaCategoryMusicSignal"))goto LABEL_295;
                                    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                    has = (unint64_t)self->_has;
                                    v8 = *((unsigned __int16 *)v4 + 176);
                                    v6 = v4[43];
                                  }
                                  v48 = (has >> 17) & 1;
                                  if (v48 == ((v6 >> 17) & 1))
                                  {
                                    if (v48)
                                    {
                                      isRawMediaCategoryPodcastSignal = self->_isRawMediaCategoryPodcastSignal;
                                      if (isRawMediaCategoryPodcastSignal != objc_msgSend(v4, "isRawMediaCategoryPodcastSignal"))goto LABEL_295;
                                      LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                      has = (unint64_t)self->_has;
                                      v8 = *((unsigned __int16 *)v4 + 176);
                                      v6 = v4[43];
                                    }
                                    v50 = (has >> 18) & 1;
                                    if (v50 == ((v6 >> 18) & 1))
                                    {
                                      if (v50)
                                      {
                                        isRawMediaCategoryRadioSignal = self->_isRawMediaCategoryRadioSignal;
                                        if (isRawMediaCategoryRadioSignal != objc_msgSend(v4, "isRawMediaCategoryRadioSignal"))goto LABEL_295;
                                        LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                        has = (unint64_t)self->_has;
                                        v8 = *((unsigned __int16 *)v4 + 176);
                                        v6 = v4[43];
                                      }
                                      v52 = (has >> 19) & 1;
                                      if (v52 == ((v6 >> 19) & 1))
                                      {
                                        if (v52)
                                        {
                                          isRawMediaCategoryVideoSignal = self->_isRawMediaCategoryVideoSignal;
                                          if (isRawMediaCategoryVideoSignal != objc_msgSend(v4, "isRawMediaCategoryVideoSignal"))goto LABEL_295;
                                          LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                          has = (unint64_t)self->_has;
                                          v8 = *((unsigned __int16 *)v4 + 176);
                                          v6 = v4[43];
                                        }
                                        v54 = (has >> 20) & 1;
                                        if (v54 == ((v6 >> 20) & 1))
                                        {
                                          if (v54)
                                          {
                                            rawMediaTypeUsageSignalBook = self->_rawMediaTypeUsageSignalBook;
                                            if (rawMediaTypeUsageSignalBook != objc_msgSend(v4, "rawMediaTypeUsageSignalBook"))goto LABEL_295;
                                            LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                            has = (unint64_t)self->_has;
                                            v8 = *((unsigned __int16 *)v4 + 176);
                                            v6 = v4[43];
                                          }
                                          v56 = (has >> 21) & 1;
                                          if (v56 == ((v6 >> 21) & 1))
                                          {
                                            if (v56)
                                            {
                                              rawMediaTypeUsageSignalMusic = self->_rawMediaTypeUsageSignalMusic;
                                              if (rawMediaTypeUsageSignalMusic != objc_msgSend(v4, "rawMediaTypeUsageSignalMusic"))goto LABEL_295;
                                              LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                              has = (unint64_t)self->_has;
                                              v8 = *((unsigned __int16 *)v4 + 176);
                                              v6 = v4[43];
                                            }
                                            v58 = (has >> 22) & 1;
                                            if (v58 == ((v6 >> 22) & 1))
                                            {
                                              if (v58)
                                              {
                                                rawMediaTypeUsageSignalPodcast = self->_rawMediaTypeUsageSignalPodcast;
                                                if (rawMediaTypeUsageSignalPodcast != objc_msgSend(v4, "rawMediaTypeUsageSignalPodcast"))
                                                  goto LABEL_295;
                                                LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                has = (unint64_t)self->_has;
                                                v8 = *((unsigned __int16 *)v4 + 176);
                                                v6 = v4[43];
                                              }
                                              v60 = (has >> 23) & 1;
                                              if (v60 == ((v6 >> 23) & 1))
                                              {
                                                if (v60)
                                                {
                                                  rawMediaTypeUsageSignalVideo = self->_rawMediaTypeUsageSignalVideo;
                                                  if (rawMediaTypeUsageSignalVideo != objc_msgSend(v4, "rawMediaTypeUsageSignalVideo"))
                                                    goto LABEL_295;
                                                  LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                  has = (unint64_t)self->_has;
                                                  v8 = *((unsigned __int16 *)v4 + 176);
                                                  v6 = v4[43];
                                                }
                                                v62 = BYTE3(has) & 1;
                                                if (v62 == (BYTE3(v6) & 1))
                                                {
                                                  if (v62)
                                                  {
                                                    rawNowPlayingCountCoreDuet10Min = self->_rawNowPlayingCountCoreDuet10Min;
                                                    if (rawNowPlayingCountCoreDuet10Min != objc_msgSend(v4, "rawNowPlayingCountCoreDuet10Min"))
                                                      goto LABEL_295;
                                                    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                    has = (unint64_t)self->_has;
                                                    v8 = *((unsigned __int16 *)v4 + 176);
                                                    v6 = v4[43];
                                                  }
                                                  v64 = (has >> 25) & 1;
                                                  if (v64 == ((v6 >> 25) & 1))
                                                  {
                                                    if (v64)
                                                    {
                                                      rawNowPlayingCountCoreDuet1Day = self->_rawNowPlayingCountCoreDuet1Day;
                                                      if (rawNowPlayingCountCoreDuet1Day != objc_msgSend(v4, "rawNowPlayingCountCoreDuet1Day"))
                                                        goto LABEL_295;
                                                      LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                      has = (unint64_t)self->_has;
                                                      v8 = *((unsigned __int16 *)v4 + 176);
                                                      v6 = v4[43];
                                                    }
                                                    v66 = (has >> 26) & 1;
                                                    if (v66 == ((v6 >> 26) & 1))
                                                    {
                                                      if (v66)
                                                      {
                                                        rawNowPlayingCountCoreDuet1Hr = self->_rawNowPlayingCountCoreDuet1Hr;
                                                        if (rawNowPlayingCountCoreDuet1Hr != objc_msgSend(v4, "rawNowPlayingCountCoreDuet1Hr"))
                                                          goto LABEL_295;
                                                        LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                        has = (unint64_t)self->_has;
                                                        v8 = *((unsigned __int16 *)v4 + 176);
                                                        v6 = v4[43];
                                                      }
                                                      v68 = (has >> 27) & 1;
                                                      if (v68 == ((v6 >> 27) & 1))
                                                      {
                                                        if (v68)
                                                        {
                                                          rawNowPlayingCountCoreDuet28Day = self->_rawNowPlayingCountCoreDuet28Day;
                                                          if (rawNowPlayingCountCoreDuet28Day != objc_msgSend(v4, "rawNowPlayingCountCoreDuet28Day"))
                                                            goto LABEL_295;
                                                          LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                          has = (unint64_t)self->_has;
                                                          v8 = *((unsigned __int16 *)v4 + 176);
                                                          v6 = v4[43];
                                                        }
                                                        v70 = (has >> 28) & 1;
                                                        if (v70 == ((v6 >> 28) & 1))
                                                        {
                                                          if (v70)
                                                          {
                                                            rawNowPlayingCountCoreDuet2Min = self->_rawNowPlayingCountCoreDuet2Min;
                                                            if (rawNowPlayingCountCoreDuet2Min != objc_msgSend(v4, "rawNowPlayingCountCoreDuet2Min"))
                                                              goto LABEL_295;
                                                            LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                            has = (unint64_t)self->_has;
                                                            v8 = *((unsigned __int16 *)v4 + 176);
                                                            v6 = v4[43];
                                                          }
                                                          v72 = (has >> 29) & 1;
                                                          if (v72 == ((v6 >> 29) & 1))
                                                          {
                                                            if (v72)
                                                            {
                                                              rawNowPlayingCountCoreDuet6Hr = self->_rawNowPlayingCountCoreDuet6Hr;
                                                              if (rawNowPlayingCountCoreDuet6Hr != objc_msgSend(v4, "rawNowPlayingCountCoreDuet6Hr"))
                                                                goto LABEL_295;
                                                              LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                              has = (unint64_t)self->_has;
                                                              v8 = *((unsigned __int16 *)v4 + 176);
                                                              v6 = v4[43];
                                                            }
                                                            v74 = (has >> 30) & 1;
                                                            if (v74 == ((v6 >> 30) & 1))
                                                            {
                                                              if (v74)
                                                              {
                                                                rawNowPlayingCountCoreDuet7Day = self->_rawNowPlayingCountCoreDuet7Day;
                                                                if (rawNowPlayingCountCoreDuet7Day != objc_msgSend(v4, "rawNowPlayingCountCoreDuet7Day"))
                                                                  goto LABEL_295;
                                                                has = (unint64_t)self->_has;
                                                                LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                                v6 = v4[43];
                                                                v8 = *((unsigned __int16 *)v4 + 176);
                                                              }
                                                              if (((v6 ^ has) & 0x80000000) == 0)
                                                              {
                                                                if ((has & 0x80000000) != 0)
                                                                {
                                                                  rawNowPlayingRecencyCD = self->_rawNowPlayingRecencyCD;
                                                                  if (rawNowPlayingRecencyCD != objc_msgSend(v4, "rawNowPlayingRecencyCD"))
                                                                    goto LABEL_295;
                                                                  v102 = v4[43];
                                                                  v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                  v76 = *((unsigned __int16 *)v4 + 176);
                                                                  v77 = (v102 >> 33) | ((_DWORD)v76 << 31);
                                                                  v103 = (unint64_t)self->_has;
                                                                  v78 = v102 >> 34;
                                                                  v79 = v102 >> 35;
                                                                  v80 = v102 >> 36;
                                                                  v81 = v102 >> 37;
                                                                  v82 = v102 >> 38;
                                                                  v296 = v102 >> 39;
                                                                  v295 = BYTE5(v102);
                                                                  v265 = v102 >> 41;
                                                                  v255 = v102 >> 42;
                                                                  v253 = v102 >> 43;
                                                                  v256 = v102 >> 44;
                                                                  v257 = v102 >> 45;
                                                                  v259 = v102 >> 46;
                                                                  v261 = v102 >> 47;
                                                                  v263 = BYTE6(v102);
                                                                  v266 = v102 >> 49;
                                                                  v268 = v102 >> 50;
                                                                  v270 = v102 >> 51;
                                                                  v272 = v102 >> 52;
                                                                  v274 = v102 >> 53;
                                                                  v276 = v102 >> 54;
                                                                  v278 = v102 >> 55;
                                                                  v280 = HIBYTE(v102);
                                                                  v282 = (v102 >> 57) | ((_BYTE)v76 << 7);
                                                                  v284 = (v102 >> 58) | ((_BYTE)v76 << 6);
                                                                  v286 = (v102 >> 59) | (32 * v76);
                                                                  v288 = (v102 >> 60) | (16 * v76);
                                                                  v290 = (v102 >> 61) | (8 * v76);
                                                                  v83 = HIDWORD(v102);
                                                                  v291 = (v102 >> 62) | (4 * v76);
                                                                  v292 = ((v102 & 0x8000000000000000) != 0) | (2 * v76);
                                                                  v84 = v103 >> 33;
                                                                  v85 = v103 >> 34;
                                                                  v86 = (v103 >> 35) | ((_DWORD)v96 << 29);
                                                                  v87 = v103 >> 36;
                                                                  v88 = v103 >> 37;
                                                                  v89 = v103 >> 38;
                                                                  v90 = v103 >> 39;
                                                                  v91 = BYTE5(v103);
                                                                  v92 = v103 >> 41;
                                                                  v93 = v103 >> 42;
                                                                  v94 = v103 >> 43;
                                                                  v95 = v103 >> 44;
                                                                  v254 = v103 >> 45;
                                                                  v258 = v103 >> 46;
                                                                  v260 = v103 >> 47;
                                                                  v262 = BYTE6(v103);
                                                                  v264 = v103 >> 49;
                                                                  v267 = v103 >> 50;
                                                                  v269 = v103 >> 51;
                                                                  v271 = v103 >> 52;
                                                                  v273 = v103 >> 53;
                                                                  v275 = v103 >> 54;
                                                                  v277 = v103 >> 55;
                                                                  v279 = HIBYTE(v103);
                                                                  v281 = (v103 >> 57) | ((_BYTE)v96 << 7);
                                                                  v283 = (v103 >> 58) | ((_BYTE)v96 << 6);
                                                                  v285 = (v103 >> 59) | (32 * v96);
                                                                  v287 = (v103 >> 60) | (16 * v96);
                                                                  v289 = (v103 >> 61) | (8 * v96);
                                                                  v97 = (v103 >> 62) | (4 * v96);
                                                                  v293 = v76 >> 1;
                                                                  v294 = v76 >> 2;
                                                                  v98 = HIDWORD(v103);
                                                                  v100 = ((v103 & 0x8000000000000000) != 0) | (2 * v96);
                                                                  has = v96 >> 1;
                                                                  v7 = v96 >> 2;
                                                                }
                                                                else
                                                                {
                                                                  LOBYTE(v76) = v8;
                                                                  v77 = (v6 >> 33) | (v8 << 31);
                                                                  v78 = v6 >> 34;
                                                                  v79 = v6 >> 35;
                                                                  v80 = v6 >> 36;
                                                                  v81 = v6 >> 37;
                                                                  v82 = v6 >> 38;
                                                                  v295 = BYTE5(v6);
                                                                  v296 = v6 >> 39;
                                                                  v265 = v6 >> 41;
                                                                  v253 = v6 >> 43;
                                                                  v255 = v6 >> 42;
                                                                  v256 = v6 >> 44;
                                                                  v257 = v6 >> 45;
                                                                  v259 = v6 >> 46;
                                                                  v261 = v6 >> 47;
                                                                  v263 = BYTE6(v6);
                                                                  v266 = v6 >> 49;
                                                                  v268 = v6 >> 50;
                                                                  v270 = v6 >> 51;
                                                                  v272 = v6 >> 52;
                                                                  v274 = v6 >> 53;
                                                                  v276 = v6 >> 54;
                                                                  v278 = v6 >> 55;
                                                                  v280 = HIBYTE(v6);
                                                                  v282 = (v6 >> 57) | ((_BYTE)v8 << 7);
                                                                  v284 = (v6 >> 58) | ((_BYTE)v8 << 6);
                                                                  v286 = (v6 >> 59) | (32 * v8);
                                                                  v288 = (v6 >> 60) | (16 * v8);
                                                                  v290 = (v6 >> 61) | (8 * v8);
                                                                  v291 = (v6 >> 62) | (4 * v8);
                                                                  v83 = HIDWORD(v6);
                                                                  v292 = ((v6 & 0x8000000000000000) != 0) | (2 * v8);
                                                                  LOWORD(v293) = (unsigned __int16)v8 >> 1;
                                                                  LOWORD(v294) = (unsigned __int16)v8 >> 2;
                                                                  v84 = has >> 33;
                                                                  v85 = has >> 34;
                                                                  v86 = (has >> 35) | ((_DWORD)v7 << 29);
                                                                  v87 = has >> 36;
                                                                  v88 = has >> 37;
                                                                  v89 = has >> 38;
                                                                  v90 = has >> 39;
                                                                  v91 = BYTE5(has);
                                                                  v92 = has >> 41;
                                                                  v93 = has >> 42;
                                                                  v94 = has >> 43;
                                                                  v95 = has >> 44;
                                                                  v254 = has >> 45;
                                                                  v258 = has >> 46;
                                                                  v260 = has >> 47;
                                                                  v262 = BYTE6(has);
                                                                  LOBYTE(v96) = v7;
                                                                  v264 = has >> 49;
                                                                  v267 = has >> 50;
                                                                  v269 = has >> 51;
                                                                  v271 = has >> 52;
                                                                  v273 = has >> 53;
                                                                  v275 = has >> 54;
                                                                  v277 = has >> 55;
                                                                  v279 = HIBYTE(has);
                                                                  v281 = (has >> 57) | ((_BYTE)v7 << 7);
                                                                  v283 = (has >> 58) | ((_BYTE)v7 << 6);
                                                                  v285 = (has >> 59) | (32 * v7);
                                                                  v287 = (has >> 60) | (16 * v7);
                                                                  v289 = (has >> 61) | (8 * v7);
                                                                  v97 = (has >> 62) | (4 * v7);
                                                                  v98 = HIDWORD(has);
                                                                  v99 = has >> 63;
                                                                  LOWORD(has) = (unsigned __int16)v7 >> 1;
                                                                  LOWORD(v7) = (unsigned __int16)v7 >> 2;
                                                                  v100 = v99 | (2 * v96);
                                                                }
                                                                v104 = v98 & 1;
                                                                if (v104 == (v83 & 1))
                                                                {
                                                                  if (v104)
                                                                  {
                                                                    rawEntitySearchRecency = self->_rawEntitySearchRecency;
                                                                    if (rawEntitySearchRecency != objc_msgSend(v4, "rawEntitySearchRecency", v86, v77))
                                                                      goto LABEL_295;
                                                                    v106 = v4[43];
                                                                    v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                    v76 = *((unsigned __int16 *)v4 + 176);
                                                                    LOBYTE(v77) = v106 >> 33;
                                                                    v107 = (unint64_t)self->_has;
                                                                    v78 = v106 >> 34;
                                                                    v79 = v106 >> 35;
                                                                    v80 = v106 >> 36;
                                                                    v81 = v106 >> 37;
                                                                    v82 = v106 >> 38;
                                                                    v296 = v106 >> 39;
                                                                    v295 = BYTE5(v106);
                                                                    v265 = v106 >> 41;
                                                                    v255 = v106 >> 42;
                                                                    v253 = v106 >> 43;
                                                                    v256 = v106 >> 44;
                                                                    v257 = v106 >> 45;
                                                                    v259 = v106 >> 46;
                                                                    v261 = v106 >> 47;
                                                                    v263 = BYTE6(v106);
                                                                    v266 = v106 >> 49;
                                                                    v268 = v106 >> 50;
                                                                    v270 = v106 >> 51;
                                                                    v272 = v106 >> 52;
                                                                    v274 = v106 >> 53;
                                                                    v276 = v106 >> 54;
                                                                    v278 = v106 >> 55;
                                                                    v280 = HIBYTE(v106);
                                                                    v282 = (v106 >> 57) | ((_BYTE)v76 << 7);
                                                                    v284 = (v106 >> 58) | ((_BYTE)v76 << 6);
                                                                    v286 = (v106 >> 59) | (32 * v76);
                                                                    v288 = (v106 >> 60) | (16 * v76);
                                                                    v290 = (v106 >> 61) | (8 * v76);
                                                                    v291 = (v106 >> 62) | (4 * v76);
                                                                    v292 = ((v106 & 0x8000000000000000) != 0) | (2 * v76);
                                                                    v84 = v107 >> 33;
                                                                    v85 = v107 >> 34;
                                                                    v86 = (v107 >> 35) | ((_DWORD)v96 << 29);
                                                                    v87 = v107 >> 36;
                                                                    v88 = v107 >> 37;
                                                                    v89 = v107 >> 38;
                                                                    v90 = v107 >> 39;
                                                                    v91 = BYTE5(v107);
                                                                    v92 = v107 >> 41;
                                                                    v93 = v107 >> 42;
                                                                    v94 = v107 >> 43;
                                                                    v95 = v107 >> 44;
                                                                    v254 = v107 >> 45;
                                                                    v258 = v107 >> 46;
                                                                    v260 = v107 >> 47;
                                                                    v262 = BYTE6(v107);
                                                                    v264 = v107 >> 49;
                                                                    v267 = v107 >> 50;
                                                                    v269 = v107 >> 51;
                                                                    v271 = v107 >> 52;
                                                                    v273 = v107 >> 53;
                                                                    v275 = v107 >> 54;
                                                                    v277 = v107 >> 55;
                                                                    v279 = HIBYTE(v107);
                                                                    v281 = (v107 >> 57) | ((_BYTE)v96 << 7);
                                                                    v283 = (v107 >> 58) | ((_BYTE)v96 << 6);
                                                                    v285 = (v107 >> 59) | (32 * v96);
                                                                    v287 = (v107 >> 60) | (16 * v96);
                                                                    v289 = (v107 >> 61) | (8 * v96);
                                                                    v97 = (v107 >> 62) | (4 * v96);
                                                                    v293 = v76 >> 1;
                                                                    v294 = v76 >> 2;
                                                                    v100 = ((v107 & 0x8000000000000000) != 0) | (2 * v96);
                                                                    has = v96 >> 1;
                                                                    v7 = v96 >> 2;
                                                                  }
                                                                  v108 = v84 & 1;
                                                                  if (v108 == (v77 & 1))
                                                                  {
                                                                    if (v108)
                                                                    {
                                                                      usageScoreBooks = self->_usageScoreBooks;
                                                                      objc_msgSend(v4, "usageScoreBooks", v86);
                                                                      if (usageScoreBooks != v110)
                                                                        goto LABEL_295;
                                                                      v111 = v4[43];
                                                                      v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                      v76 = *((unsigned __int16 *)v4 + 176);
                                                                      v78 = v111 >> 34;
                                                                      v112 = (unint64_t)self->_has;
                                                                      v79 = v111 >> 35;
                                                                      v80 = v111 >> 36;
                                                                      v81 = v111 >> 37;
                                                                      v82 = v111 >> 38;
                                                                      v296 = v111 >> 39;
                                                                      v295 = BYTE5(v111);
                                                                      v265 = v111 >> 41;
                                                                      v255 = v111 >> 42;
                                                                      v253 = v111 >> 43;
                                                                      v256 = v111 >> 44;
                                                                      v257 = v111 >> 45;
                                                                      v259 = v111 >> 46;
                                                                      v261 = v111 >> 47;
                                                                      v263 = BYTE6(v111);
                                                                      v266 = v111 >> 49;
                                                                      v268 = v111 >> 50;
                                                                      v270 = v111 >> 51;
                                                                      v272 = v111 >> 52;
                                                                      v274 = v111 >> 53;
                                                                      v276 = v111 >> 54;
                                                                      v278 = v111 >> 55;
                                                                      v280 = HIBYTE(v111);
                                                                      v282 = (v111 >> 57) | ((_BYTE)v76 << 7);
                                                                      v284 = (v111 >> 58) | ((_BYTE)v76 << 6);
                                                                      v286 = (v111 >> 59) | (32 * v76);
                                                                      v288 = (v111 >> 60) | (16 * v76);
                                                                      v290 = (v111 >> 61) | (8 * v76);
                                                                      v291 = (v111 >> 62) | (4 * v76);
                                                                      v292 = ((v111 & 0x8000000000000000) != 0) | (2 * v76);
                                                                      v85 = v112 >> 34;
                                                                      v86 = (v112 >> 35) | ((_DWORD)v96 << 29);
                                                                      v87 = v112 >> 36;
                                                                      v88 = v112 >> 37;
                                                                      v89 = v112 >> 38;
                                                                      v90 = v112 >> 39;
                                                                      v91 = BYTE5(v112);
                                                                      v92 = v112 >> 41;
                                                                      v93 = v112 >> 42;
                                                                      v94 = v112 >> 43;
                                                                      v95 = v112 >> 44;
                                                                      v254 = v112 >> 45;
                                                                      v258 = v112 >> 46;
                                                                      v260 = v112 >> 47;
                                                                      v262 = BYTE6(v112);
                                                                      v264 = v112 >> 49;
                                                                      v267 = v112 >> 50;
                                                                      v269 = v112 >> 51;
                                                                      v271 = v112 >> 52;
                                                                      v273 = v112 >> 53;
                                                                      v275 = v112 >> 54;
                                                                      v277 = v112 >> 55;
                                                                      v279 = HIBYTE(v112);
                                                                      v281 = (v112 >> 57) | ((_BYTE)v96 << 7);
                                                                      v283 = (v112 >> 58) | ((_BYTE)v96 << 6);
                                                                      v285 = (v112 >> 59) | (32 * v96);
                                                                      v287 = (v112 >> 60) | (16 * v96);
                                                                      v289 = (v112 >> 61) | (8 * v96);
                                                                      v97 = (v112 >> 62) | (4 * v96);
                                                                      v293 = v76 >> 1;
                                                                      v294 = v76 >> 2;
                                                                      v100 = ((v112 & 0x8000000000000000) != 0) | (2 * v96);
                                                                      has = v96 >> 1;
                                                                      v7 = v96 >> 2;
                                                                    }
                                                                    if ((v85 & 1) == (v78 & 1))
                                                                    {
                                                                      if ((v85 & 1) != 0)
                                                                      {
                                                                        usageScoreMusic = self->_usageScoreMusic;
                                                                        objc_msgSend(v4, "usageScoreMusic", v86);
                                                                        if (usageScoreMusic != v114)
                                                                          goto LABEL_295;
                                                                        v115 = v4[43];
                                                                        v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                        v76 = *((unsigned __int16 *)v4 + 176);
                                                                        v79 = v115 >> 35;
                                                                        v116 = (unint64_t)self->_has;
                                                                        v80 = v115 >> 36;
                                                                        v81 = v115 >> 37;
                                                                        v82 = v115 >> 38;
                                                                        v296 = v115 >> 39;
                                                                        v295 = BYTE5(v115);
                                                                        v265 = v115 >> 41;
                                                                        v255 = v115 >> 42;
                                                                        v253 = v115 >> 43;
                                                                        v256 = v115 >> 44;
                                                                        v257 = v115 >> 45;
                                                                        v259 = v115 >> 46;
                                                                        v261 = v115 >> 47;
                                                                        v263 = BYTE6(v115);
                                                                        v266 = v115 >> 49;
                                                                        v268 = v115 >> 50;
                                                                        v270 = v115 >> 51;
                                                                        v272 = v115 >> 52;
                                                                        v274 = v115 >> 53;
                                                                        v276 = v115 >> 54;
                                                                        v278 = v115 >> 55;
                                                                        v280 = HIBYTE(v115);
                                                                        v282 = (v115 >> 57) | ((_BYTE)v76 << 7);
                                                                        v284 = (v115 >> 58) | ((_BYTE)v76 << 6);
                                                                        v286 = (v115 >> 59) | (32 * v76);
                                                                        v288 = (v115 >> 60) | (16 * v76);
                                                                        v290 = (v115 >> 61) | (8 * v76);
                                                                        v291 = (v115 >> 62) | (4 * v76);
                                                                        v292 = ((v115 & 0x8000000000000000) != 0) | (2 * v76);
                                                                        LOBYTE(v86) = v116 >> 35;
                                                                        v87 = v116 >> 36;
                                                                        v88 = v116 >> 37;
                                                                        v89 = v116 >> 38;
                                                                        v90 = v116 >> 39;
                                                                        v91 = BYTE5(v116);
                                                                        v92 = v116 >> 41;
                                                                        v93 = v116 >> 42;
                                                                        v94 = v116 >> 43;
                                                                        v95 = v116 >> 44;
                                                                        v254 = v116 >> 45;
                                                                        v258 = v116 >> 46;
                                                                        v260 = v116 >> 47;
                                                                        v262 = BYTE6(v116);
                                                                        v264 = v116 >> 49;
                                                                        v267 = v116 >> 50;
                                                                        v269 = v116 >> 51;
                                                                        v271 = v116 >> 52;
                                                                        v273 = v116 >> 53;
                                                                        v275 = v116 >> 54;
                                                                        v277 = v116 >> 55;
                                                                        v279 = HIBYTE(v116);
                                                                        v281 = (v116 >> 57) | ((_BYTE)v96 << 7);
                                                                        v283 = (v116 >> 58) | ((_BYTE)v96 << 6);
                                                                        v285 = (v116 >> 59) | (32 * v96);
                                                                        v287 = (v116 >> 60) | (16 * v96);
                                                                        v289 = (v116 >> 61) | (8 * v96);
                                                                        v97 = (v116 >> 62) | (4 * v96);
                                                                        v293 = v76 >> 1;
                                                                        v294 = v76 >> 2;
                                                                        v100 = ((v116 & 0x8000000000000000) != 0) | (2 * v96);
                                                                        has = v96 >> 1;
                                                                        v7 = v96 >> 2;
                                                                      }
                                                                      if ((v86 & 1) == (v79 & 1))
                                                                      {
                                                                        if ((v86 & 1) != 0)
                                                                        {
                                                                          usageScorePodcasts = self->_usageScorePodcasts;
                                                                          objc_msgSend(v4, "usageScorePodcasts");
                                                                          if (usageScorePodcasts != v118)
                                                                            goto LABEL_295;
                                                                          v119 = v4[43];
                                                                          v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                          v76 = *((unsigned __int16 *)v4 + 176);
                                                                          v80 = v119 >> 36;
                                                                          v120 = (unint64_t)self->_has;
                                                                          v81 = v119 >> 37;
                                                                          v82 = v119 >> 38;
                                                                          v296 = v119 >> 39;
                                                                          v295 = BYTE5(v119);
                                                                          v265 = v119 >> 41;
                                                                          v255 = v119 >> 42;
                                                                          v253 = v119 >> 43;
                                                                          v256 = v119 >> 44;
                                                                          v257 = v119 >> 45;
                                                                          v259 = v119 >> 46;
                                                                          v261 = v119 >> 47;
                                                                          v263 = BYTE6(v119);
                                                                          v266 = v119 >> 49;
                                                                          v268 = v119 >> 50;
                                                                          v270 = v119 >> 51;
                                                                          v272 = v119 >> 52;
                                                                          v274 = v119 >> 53;
                                                                          v276 = v119 >> 54;
                                                                          v278 = v119 >> 55;
                                                                          v280 = HIBYTE(v119);
                                                                          v282 = (v119 >> 57) | ((_BYTE)v76 << 7);
                                                                          v284 = (v119 >> 58) | ((_BYTE)v76 << 6);
                                                                          v286 = (v119 >> 59) | (32 * v76);
                                                                          v288 = (v119 >> 60) | (16 * v76);
                                                                          v290 = (v119 >> 61) | (8 * v76);
                                                                          v291 = (v119 >> 62) | (4 * v76);
                                                                          v292 = ((v119 & 0x8000000000000000) != 0) | (2 * v76);
                                                                          v87 = v120 >> 36;
                                                                          v88 = v120 >> 37;
                                                                          v89 = v120 >> 38;
                                                                          v90 = v120 >> 39;
                                                                          v91 = BYTE5(v120);
                                                                          v92 = v120 >> 41;
                                                                          v93 = v120 >> 42;
                                                                          v94 = v120 >> 43;
                                                                          v95 = v120 >> 44;
                                                                          v254 = v120 >> 45;
                                                                          v258 = v120 >> 46;
                                                                          v260 = v120 >> 47;
                                                                          v262 = BYTE6(v120);
                                                                          v264 = v120 >> 49;
                                                                          v267 = v120 >> 50;
                                                                          v269 = v120 >> 51;
                                                                          v271 = v120 >> 52;
                                                                          v273 = v120 >> 53;
                                                                          v275 = v120 >> 54;
                                                                          v277 = v120 >> 55;
                                                                          v279 = HIBYTE(v120);
                                                                          v281 = (v120 >> 57) | ((_BYTE)v96 << 7);
                                                                          v283 = (v120 >> 58) | ((_BYTE)v96 << 6);
                                                                          v285 = (v120 >> 59) | (32 * v96);
                                                                          v287 = (v120 >> 60) | (16 * v96);
                                                                          v289 = (v120 >> 61) | (8 * v96);
                                                                          v97 = (v120 >> 62) | (4 * v96);
                                                                          v293 = v76 >> 1;
                                                                          v294 = v76 >> 2;
                                                                          v100 = ((v120 & 0x8000000000000000) != 0) | (2 * v96);
                                                                          has = v96 >> 1;
                                                                          v7 = v96 >> 2;
                                                                        }
                                                                        if ((v87 & 1) == (v80 & 1))
                                                                        {
                                                                          if ((v87 & 1) != 0)
                                                                          {
                                                                            isAppFirstParty = self->_isAppFirstParty;
                                                                            if (isAppFirstParty != objc_msgSend(v4, "isAppFirstParty"))
                                                                              goto LABEL_295;
                                                                            v122 = v4[43];
                                                                            v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                            v76 = *((unsigned __int16 *)v4 + 176);
                                                                            v81 = v122 >> 37;
                                                                            v123 = (unint64_t)self->_has;
                                                                            v82 = v122 >> 38;
                                                                            v296 = v122 >> 39;
                                                                            v295 = BYTE5(v122);
                                                                            v265 = v122 >> 41;
                                                                            v255 = v122 >> 42;
                                                                            v253 = v122 >> 43;
                                                                            v256 = v122 >> 44;
                                                                            v257 = v122 >> 45;
                                                                            v259 = v122 >> 46;
                                                                            v261 = v122 >> 47;
                                                                            v263 = BYTE6(v122);
                                                                            v266 = v122 >> 49;
                                                                            v268 = v122 >> 50;
                                                                            v270 = v122 >> 51;
                                                                            v272 = v122 >> 52;
                                                                            v274 = v122 >> 53;
                                                                            v276 = v122 >> 54;
                                                                            v278 = v122 >> 55;
                                                                            v280 = HIBYTE(v122);
                                                                            v282 = (v122 >> 57) | ((_BYTE)v76 << 7);
                                                                            v284 = (v122 >> 58) | ((_BYTE)v76 << 6);
                                                                            v286 = (v122 >> 59) | (32 * v76);
                                                                            v288 = (v122 >> 60) | (16 * v76);
                                                                            v290 = (v122 >> 61) | (8 * v76);
                                                                            v291 = (v122 >> 62) | (4 * v76);
                                                                            v292 = ((v122 & 0x8000000000000000) != 0) | (2 * v76);
                                                                            v88 = v123 >> 37;
                                                                            v89 = v123 >> 38;
                                                                            v90 = v123 >> 39;
                                                                            v91 = BYTE5(v123);
                                                                            v92 = v123 >> 41;
                                                                            v93 = v123 >> 42;
                                                                            v94 = v123 >> 43;
                                                                            v95 = v123 >> 44;
                                                                            v254 = v123 >> 45;
                                                                            v258 = v123 >> 46;
                                                                            v260 = v123 >> 47;
                                                                            v262 = BYTE6(v123);
                                                                            v264 = v123 >> 49;
                                                                            v267 = v123 >> 50;
                                                                            v269 = v123 >> 51;
                                                                            v271 = v123 >> 52;
                                                                            v273 = v123 >> 53;
                                                                            v275 = v123 >> 54;
                                                                            v277 = v123 >> 55;
                                                                            v279 = HIBYTE(v123);
                                                                            v281 = (v123 >> 57) | ((_BYTE)v96 << 7);
                                                                            v283 = (v123 >> 58) | ((_BYTE)v96 << 6);
                                                                            v285 = (v123 >> 59) | (32 * v96);
                                                                            v287 = (v123 >> 60) | (16 * v96);
                                                                            v289 = (v123 >> 61) | (8 * v96);
                                                                            v97 = (v123 >> 62) | (4 * v96);
                                                                            v293 = v76 >> 1;
                                                                            v294 = v76 >> 2;
                                                                            v100 = ((v123 & 0x8000000000000000) != 0) | (2 * v96);
                                                                            has = v96 >> 1;
                                                                            v7 = v96 >> 2;
                                                                          }
                                                                          if ((v88 & 1) == (v81 & 1))
                                                                          {
                                                                            if ((v88 & 1) != 0)
                                                                            {
                                                                              isRequestedApp = self->_isRequestedApp;
                                                                              if (isRequestedApp != objc_msgSend(v4, "isRequestedApp"))
                                                                                goto LABEL_295;
                                                                              v125 = v4[43];
                                                                              v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                              v76 = *((unsigned __int16 *)v4 + 176);
                                                                              v82 = v125 >> 38;
                                                                              v126 = (unint64_t)self->_has;
                                                                              v295 = BYTE5(v125);
                                                                              v296 = v125 >> 39;
                                                                              v265 = v125 >> 41;
                                                                              v253 = v125 >> 43;
                                                                              v255 = v125 >> 42;
                                                                              v256 = v125 >> 44;
                                                                              v257 = v125 >> 45;
                                                                              v259 = v125 >> 46;
                                                                              v261 = v125 >> 47;
                                                                              v263 = BYTE6(v125);
                                                                              v266 = v125 >> 49;
                                                                              v268 = v125 >> 50;
                                                                              v270 = v125 >> 51;
                                                                              v272 = v125 >> 52;
                                                                              v274 = v125 >> 53;
                                                                              v276 = v125 >> 54;
                                                                              v278 = v125 >> 55;
                                                                              v280 = HIBYTE(v125);
                                                                              v282 = (v125 >> 57) | ((_BYTE)v76 << 7);
                                                                              v284 = (v125 >> 58) | ((_BYTE)v76 << 6);
                                                                              v286 = (v125 >> 59) | (32 * v76);
                                                                              v288 = (v125 >> 60) | (16 * v76);
                                                                              v290 = (v125 >> 61) | (8 * v76);
                                                                              v291 = (v125 >> 62) | (4 * v76);
                                                                              v292 = ((v125 & 0x8000000000000000) != 0) | (2 * v76);
                                                                              v89 = v126 >> 38;
                                                                              v90 = v126 >> 39;
                                                                              v91 = BYTE5(v126);
                                                                              v92 = v126 >> 41;
                                                                              v93 = v126 >> 42;
                                                                              v94 = v126 >> 43;
                                                                              v95 = v126 >> 44;
                                                                              v254 = v126 >> 45;
                                                                              v258 = v126 >> 46;
                                                                              v260 = v126 >> 47;
                                                                              v262 = BYTE6(v126);
                                                                              v264 = v126 >> 49;
                                                                              v267 = v126 >> 50;
                                                                              v269 = v126 >> 51;
                                                                              v271 = v126 >> 52;
                                                                              v273 = v126 >> 53;
                                                                              v275 = v126 >> 54;
                                                                              v277 = v126 >> 55;
                                                                              v279 = HIBYTE(v126);
                                                                              v281 = (v126 >> 57) | ((_BYTE)v96 << 7);
                                                                              v283 = (v126 >> 58) | ((_BYTE)v96 << 6);
                                                                              v285 = (v126 >> 59) | (32 * v96);
                                                                              v287 = (v126 >> 60) | (16 * v96);
                                                                              v289 = (v126 >> 61) | (8 * v96);
                                                                              v97 = (v126 >> 62) | (4 * v96);
                                                                              v293 = v76 >> 1;
                                                                              v294 = v76 >> 2;
                                                                              v100 = ((v126 & 0x8000000000000000) != 0) | (2 * v96);
                                                                              has = v96 >> 1;
                                                                              v7 = v96 >> 2;
                                                                            }
                                                                            if ((v89 & 1) == (v82 & 1))
                                                                            {
                                                                              if ((v89 & 1) != 0)
                                                                              {
                                                                                isNowPlayingBundlePSE1 = self->_isNowPlayingBundlePSE1;
                                                                                if (isNowPlayingBundlePSE1 != objc_msgSend(v4, "isNowPlayingBundlePSE1"))
                                                                                  goto LABEL_295;
                                                                                v128 = v4[43];
                                                                                v96 = *((unsigned __int16 *)&self->_has
                                                                                      + 4);
                                                                                v76 = *((unsigned __int16 *)v4 + 176);
                                                                                v296 = v128 >> 39;
                                                                                v129 = (unint64_t)self->_has;
                                                                                v295 = BYTE5(v128);
                                                                                v265 = v128 >> 41;
                                                                                v253 = v128 >> 43;
                                                                                v255 = v128 >> 42;
                                                                                v256 = v128 >> 44;
                                                                                v257 = v128 >> 45;
                                                                                v259 = v128 >> 46;
                                                                                v261 = v128 >> 47;
                                                                                v263 = BYTE6(v128);
                                                                                v266 = v128 >> 49;
                                                                                v268 = v128 >> 50;
                                                                                v270 = v128 >> 51;
                                                                                v272 = v128 >> 52;
                                                                                v274 = v128 >> 53;
                                                                                v276 = v128 >> 54;
                                                                                v278 = v128 >> 55;
                                                                                v280 = HIBYTE(v128);
                                                                                v282 = (v128 >> 57) | ((_BYTE)v76 << 7);
                                                                                v284 = (v128 >> 58) | ((_BYTE)v76 << 6);
                                                                                v286 = (v128 >> 59) | (32 * v76);
                                                                                v288 = (v128 >> 60) | (16 * v76);
                                                                                v290 = (v128 >> 61) | (8 * v76);
                                                                                v291 = (v128 >> 62) | (4 * v76);
                                                                                v292 = ((v128 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                v90 = v129 >> 39;
                                                                                v91 = BYTE5(v129);
                                                                                v92 = v129 >> 41;
                                                                                v93 = v129 >> 42;
                                                                                v94 = v129 >> 43;
                                                                                v95 = v129 >> 44;
                                                                                v254 = v129 >> 45;
                                                                                v258 = v129 >> 46;
                                                                                v260 = v129 >> 47;
                                                                                v262 = BYTE6(v129);
                                                                                v264 = v129 >> 49;
                                                                                v267 = v129 >> 50;
                                                                                v269 = v129 >> 51;
                                                                                v271 = v129 >> 52;
                                                                                v273 = v129 >> 53;
                                                                                v275 = v129 >> 54;
                                                                                v277 = v129 >> 55;
                                                                                v279 = HIBYTE(v129);
                                                                                v281 = (v129 >> 57) | ((_BYTE)v96 << 7);
                                                                                v283 = (v129 >> 58) | ((_BYTE)v96 << 6);
                                                                                v285 = (v129 >> 59) | (32 * v96);
                                                                                v287 = (v129 >> 60) | (16 * v96);
                                                                                v289 = (v129 >> 61) | (8 * v96);
                                                                                v97 = (v129 >> 62) | (4 * v96);
                                                                                v293 = v76 >> 1;
                                                                                v294 = v76 >> 2;
                                                                                v100 = ((v129 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                has = v96 >> 1;
                                                                                v7 = v96 >> 2;
                                                                              }
                                                                              if ((v90 & 1) == (v296 & 1))
                                                                              {
                                                                                if ((v90 & 1) != 0)
                                                                                {
                                                                                  isNowPlayingBundlePSE2 = self->_isNowPlayingBundlePSE2;
                                                                                  if (isNowPlayingBundlePSE2 != objc_msgSend(v4, "isNowPlayingBundlePSE2"))
                                                                                    goto LABEL_295;
                                                                                  v131 = v4[43];
                                                                                  v96 = *((unsigned __int16 *)&self->_has
                                                                                        + 4);
                                                                                  v76 = *((unsigned __int16 *)v4 + 176);
                                                                                  v295 = BYTE5(v131);
                                                                                  v132 = (unint64_t)self->_has;
                                                                                  v265 = v131 >> 41;
                                                                                  v253 = v131 >> 43;
                                                                                  v255 = v131 >> 42;
                                                                                  v256 = v131 >> 44;
                                                                                  v257 = v131 >> 45;
                                                                                  v259 = v131 >> 46;
                                                                                  v261 = v131 >> 47;
                                                                                  v263 = BYTE6(v131);
                                                                                  v266 = v131 >> 49;
                                                                                  v268 = v131 >> 50;
                                                                                  v270 = v131 >> 51;
                                                                                  v272 = v131 >> 52;
                                                                                  v274 = v131 >> 53;
                                                                                  v276 = v131 >> 54;
                                                                                  v278 = v131 >> 55;
                                                                                  v280 = HIBYTE(v131);
                                                                                  v282 = (v131 >> 57) | ((_BYTE)v76 << 7);
                                                                                  v284 = (v131 >> 58) | ((_BYTE)v76 << 6);
                                                                                  v286 = (v131 >> 59) | (32 * v76);
                                                                                  v288 = (v131 >> 60) | (16 * v76);
                                                                                  v290 = (v131 >> 61) | (8 * v76);
                                                                                  v291 = (v131 >> 62) | (4 * v76);
                                                                                  v292 = ((v131 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                  v91 = BYTE5(v132);
                                                                                  v92 = v132 >> 41;
                                                                                  v93 = v132 >> 42;
                                                                                  v94 = v132 >> 43;
                                                                                  v95 = v132 >> 44;
                                                                                  v254 = v132 >> 45;
                                                                                  v258 = v132 >> 46;
                                                                                  v260 = v132 >> 47;
                                                                                  v262 = BYTE6(v132);
                                                                                  v264 = v132 >> 49;
                                                                                  v267 = v132 >> 50;
                                                                                  v269 = v132 >> 51;
                                                                                  v271 = v132 >> 52;
                                                                                  v273 = v132 >> 53;
                                                                                  v275 = v132 >> 54;
                                                                                  v277 = v132 >> 55;
                                                                                  v279 = HIBYTE(v132);
                                                                                  v281 = (v132 >> 57) | ((_BYTE)v96 << 7);
                                                                                  v283 = (v132 >> 58) | ((_BYTE)v96 << 6);
                                                                                  v285 = (v132 >> 59) | (32 * v96);
                                                                                  v287 = (v132 >> 60) | (16 * v96);
                                                                                  v289 = (v132 >> 61) | (8 * v96);
                                                                                  v97 = (v132 >> 62) | (4 * v96);
                                                                                  v293 = v76 >> 1;
                                                                                  v294 = v76 >> 2;
                                                                                  v100 = ((v132 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                  has = v96 >> 1;
                                                                                  v7 = v96 >> 2;
                                                                                }
                                                                                if ((v91 & 1) == (v295 & 1))
                                                                                {
                                                                                  if ((v91 & 1) != 0)
                                                                                  {
                                                                                    vq21Score = self->_vq21Score;
                                                                                    objc_msgSend(v4, "vq21Score");
                                                                                    if (vq21Score != v134)
                                                                                      goto LABEL_295;
                                                                                    v135 = v4[43];
                                                                                    v96 = *((unsigned __int16 *)&self->_has
                                                                                          + 4);
                                                                                    v76 = *((unsigned __int16 *)v4 + 176);
                                                                                    v265 = v135 >> 41;
                                                                                    v136 = (unint64_t)self->_has;
                                                                                    v253 = v135 >> 43;
                                                                                    v255 = v135 >> 42;
                                                                                    v256 = v135 >> 44;
                                                                                    v257 = v135 >> 45;
                                                                                    v259 = v135 >> 46;
                                                                                    v261 = v135 >> 47;
                                                                                    v263 = BYTE6(v135);
                                                                                    v266 = v135 >> 49;
                                                                                    v268 = v135 >> 50;
                                                                                    v270 = v135 >> 51;
                                                                                    v272 = v135 >> 52;
                                                                                    v274 = v135 >> 53;
                                                                                    v276 = v135 >> 54;
                                                                                    v278 = v135 >> 55;
                                                                                    v280 = HIBYTE(v135);
                                                                                    v282 = (v135 >> 57) | ((_BYTE)v76 << 7);
                                                                                    v284 = (v135 >> 58) | ((_BYTE)v76 << 6);
                                                                                    v286 = (v135 >> 59) | (32 * v76);
                                                                                    v288 = (v135 >> 60) | (16 * v76);
                                                                                    v290 = (v135 >> 61) | (8 * v76);
                                                                                    v291 = (v135 >> 62) | (4 * v76);
                                                                                    v292 = ((v135 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                    v92 = v136 >> 41;
                                                                                    v93 = v136 >> 42;
                                                                                    v94 = v136 >> 43;
                                                                                    v95 = v136 >> 44;
                                                                                    v254 = v136 >> 45;
                                                                                    v258 = v136 >> 46;
                                                                                    v260 = v136 >> 47;
                                                                                    v262 = BYTE6(v136);
                                                                                    v264 = v136 >> 49;
                                                                                    v267 = v136 >> 50;
                                                                                    v269 = v136 >> 51;
                                                                                    v271 = v136 >> 52;
                                                                                    v273 = v136 >> 53;
                                                                                    v275 = v136 >> 54;
                                                                                    v277 = v136 >> 55;
                                                                                    v279 = HIBYTE(v136);
                                                                                    v281 = (v136 >> 57) | ((_BYTE)v96 << 7);
                                                                                    v283 = (v136 >> 58) | ((_BYTE)v96 << 6);
                                                                                    v285 = (v136 >> 59) | (32 * v96);
                                                                                    v287 = (v136 >> 60) | (16 * v96);
                                                                                    v289 = (v136 >> 61) | (8 * v96);
                                                                                    v97 = (v136 >> 62) | (4 * v96);
                                                                                    v293 = v76 >> 1;
                                                                                    v294 = v76 >> 2;
                                                                                    v100 = ((v136 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                    has = v96 >> 1;
                                                                                    v7 = v96 >> 2;
                                                                                  }
                                                                                  v137 = v92 & 1;
                                                                                  if (v137 == (v265 & 1))
                                                                                  {
                                                                                    if (v137)
                                                                                    {
                                                                                      isSupportedFlag = self->_isSupportedFlag;
                                                                                      if (isSupportedFlag != objc_msgSend(v4, "isSupportedFlag"))
                                                                                        goto LABEL_295;
                                                                                      v139 = v4[43];
                                                                                      v96 = *((unsigned __int16 *)&self->_has
                                                                                            + 4);
                                                                                      v76 = *((unsigned __int16 *)v4
                                                                                            + 176);
                                                                                      v255 = v139 >> 42;
                                                                                      v140 = (unint64_t)self->_has;
                                                                                      v253 = v139 >> 43;
                                                                                      v256 = v139 >> 44;
                                                                                      v257 = v139 >> 45;
                                                                                      v259 = v139 >> 46;
                                                                                      v261 = v139 >> 47;
                                                                                      v263 = BYTE6(v139);
                                                                                      v266 = v139 >> 49;
                                                                                      v268 = v139 >> 50;
                                                                                      v270 = v139 >> 51;
                                                                                      v272 = v139 >> 52;
                                                                                      v274 = v139 >> 53;
                                                                                      v276 = v139 >> 54;
                                                                                      v278 = v139 >> 55;
                                                                                      v280 = HIBYTE(v139);
                                                                                      v282 = (v139 >> 57) | ((_BYTE)v76 << 7);
                                                                                      v284 = (v139 >> 58) | ((_BYTE)v76 << 6);
                                                                                      v286 = (v139 >> 59) | (32 * v76);
                                                                                      v288 = (v139 >> 60) | (16 * v76);
                                                                                      v290 = (v139 >> 61) | (8 * v76);
                                                                                      v291 = (v139 >> 62) | (4 * v76);
                                                                                      v292 = ((v139 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                      v93 = v140 >> 42;
                                                                                      v94 = v140 >> 43;
                                                                                      v95 = v140 >> 44;
                                                                                      v254 = v140 >> 45;
                                                                                      v258 = v140 >> 46;
                                                                                      v260 = v140 >> 47;
                                                                                      v262 = BYTE6(v140);
                                                                                      v264 = v140 >> 49;
                                                                                      v267 = v140 >> 50;
                                                                                      v269 = v140 >> 51;
                                                                                      v271 = v140 >> 52;
                                                                                      v273 = v140 >> 53;
                                                                                      v275 = v140 >> 54;
                                                                                      v277 = v140 >> 55;
                                                                                      v279 = HIBYTE(v140);
                                                                                      v281 = (v140 >> 57) | ((_BYTE)v96 << 7);
                                                                                      v283 = (v140 >> 58) | ((_BYTE)v96 << 6);
                                                                                      v285 = (v140 >> 59) | (32 * v96);
                                                                                      v287 = (v140 >> 60) | (16 * v96);
                                                                                      v289 = (v140 >> 61) | (8 * v96);
                                                                                      v97 = (v140 >> 62) | (4 * v96);
                                                                                      v293 = v76 >> 1;
                                                                                      v294 = v76 >> 2;
                                                                                      v100 = ((v140 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                      has = v96 >> 1;
                                                                                      v7 = v96 >> 2;
                                                                                    }
                                                                                    if ((v93 & 1) == (v255 & 1))
                                                                                    {
                                                                                      if ((v93 & 1) != 0)
                                                                                      {
                                                                                        isUnicornFlag = self->_isUnicornFlag;
                                                                                        if (isUnicornFlag != objc_msgSend(v4, "isUnicornFlag"))
                                                                                          goto LABEL_295;
                                                                                        v142 = v4[43];
                                                                                        v96 = *((unsigned __int16 *)&self->_has
                                                                                              + 4);
                                                                                        v76 = *((unsigned __int16 *)v4
                                                                                              + 176);
                                                                                        v253 = v142 >> 43;
                                                                                        v143 = (unint64_t)self->_has;
                                                                                        v256 = v142 >> 44;
                                                                                        v257 = v142 >> 45;
                                                                                        v259 = v142 >> 46;
                                                                                        v261 = v142 >> 47;
                                                                                        v263 = BYTE6(v142);
                                                                                        v266 = v142 >> 49;
                                                                                        v268 = v142 >> 50;
                                                                                        v270 = v142 >> 51;
                                                                                        v272 = v142 >> 52;
                                                                                        v274 = v142 >> 53;
                                                                                        v276 = v142 >> 54;
                                                                                        v278 = v142 >> 55;
                                                                                        v280 = HIBYTE(v142);
                                                                                        v282 = (v142 >> 57) | ((_BYTE)v76 << 7);
                                                                                        v284 = (v142 >> 58) | ((_BYTE)v76 << 6);
                                                                                        v286 = (v142 >> 59) | (32 * v76);
                                                                                        v288 = (v142 >> 60) | (16 * v76);
                                                                                        v290 = (v142 >> 61) | (8 * v76);
                                                                                        v291 = (v142 >> 62) | (4 * v76);
                                                                                        v292 = ((v142 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                        v94 = v143 >> 43;
                                                                                        v95 = v143 >> 44;
                                                                                        v254 = v143 >> 45;
                                                                                        v258 = v143 >> 46;
                                                                                        v260 = v143 >> 47;
                                                                                        v262 = BYTE6(v143);
                                                                                        v264 = v143 >> 49;
                                                                                        v267 = v143 >> 50;
                                                                                        v269 = v143 >> 51;
                                                                                        v271 = v143 >> 52;
                                                                                        v273 = v143 >> 53;
                                                                                        v275 = v143 >> 54;
                                                                                        v277 = v143 >> 55;
                                                                                        v279 = HIBYTE(v143);
                                                                                        v281 = (v143 >> 57) | ((_BYTE)v96 << 7);
                                                                                        v283 = (v143 >> 58) | ((_BYTE)v96 << 6);
                                                                                        v285 = (v143 >> 59) | (32 * v96);
                                                                                        v287 = (v143 >> 60) | (16 * v96);
                                                                                        v289 = (v143 >> 61) | (8 * v96);
                                                                                        v97 = (v143 >> 62) | (4 * v96);
                                                                                        v293 = v76 >> 1;
                                                                                        v294 = v76 >> 2;
                                                                                        v100 = ((v143 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                        has = v96 >> 1;
                                                                                        v7 = v96 >> 2;
                                                                                      }
                                                                                      if ((v94 & 1) == (v253 & 1))
                                                                                      {
                                                                                        if ((v94 & 1) != 0)
                                                                                        {
                                                                                          isSupportedUnicornMatchFlag = self->_isSupportedUnicornMatchFlag;
                                                                                          if (isSupportedUnicornMatchFlag != objc_msgSend(v4, "isSupportedUnicornMatchFlag"))
                                                                                            goto LABEL_295;
                                                                                          v145 = v4[43];
                                                                                          v96 = *((unsigned __int16 *)&self->_has
                                                                                                + 4);
                                                                                          v76 = *((unsigned __int16 *)v4
                                                                                                + 176);
                                                                                          v256 = v145 >> 44;
                                                                                          v146 = (unint64_t)self->_has;
                                                                                          v257 = v145 >> 45;
                                                                                          v259 = v145 >> 46;
                                                                                          v261 = v145 >> 47;
                                                                                          v263 = BYTE6(v145);
                                                                                          v266 = v145 >> 49;
                                                                                          v268 = v145 >> 50;
                                                                                          v270 = v145 >> 51;
                                                                                          v272 = v145 >> 52;
                                                                                          v274 = v145 >> 53;
                                                                                          v276 = v145 >> 54;
                                                                                          v278 = v145 >> 55;
                                                                                          v280 = HIBYTE(v145);
                                                                                          v282 = (v145 >> 57) | ((_BYTE)v76 << 7);
                                                                                          v284 = (v145 >> 58) | ((_BYTE)v76 << 6);
                                                                                          v286 = (v145 >> 59) | (32 * v76);
                                                                                          v288 = (v145 >> 60) | (16 * v76);
                                                                                          v290 = (v145 >> 61) | (8 * v76);
                                                                                          v291 = (v145 >> 62) | (4 * v76);
                                                                                          v292 = ((v145 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                          v95 = v146 >> 44;
                                                                                          v254 = v146 >> 45;
                                                                                          v258 = v146 >> 46;
                                                                                          v260 = v146 >> 47;
                                                                                          v262 = BYTE6(v146);
                                                                                          v264 = v146 >> 49;
                                                                                          v267 = v146 >> 50;
                                                                                          v269 = v146 >> 51;
                                                                                          v271 = v146 >> 52;
                                                                                          v273 = v146 >> 53;
                                                                                          v275 = v146 >> 54;
                                                                                          v277 = v146 >> 55;
                                                                                          v279 = HIBYTE(v146);
                                                                                          v281 = (v146 >> 57) | ((_BYTE)v96 << 7);
                                                                                          v283 = (v146 >> 58) | ((_BYTE)v96 << 6);
                                                                                          v285 = (v146 >> 59) | (32 * v96);
                                                                                          v287 = (v146 >> 60) | (16 * v96);
                                                                                          v289 = (v146 >> 61) | (8 * v96);
                                                                                          v97 = (v146 >> 62) | (4 * v96);
                                                                                          v293 = v76 >> 1;
                                                                                          v294 = v76 >> 2;
                                                                                          v100 = ((v146 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                          has = v96 >> 1;
                                                                                          v7 = v96 >> 2;
                                                                                        }
                                                                                        if ((v95 & 1) == (v256 & 1))
                                                                                        {
                                                                                          if ((v95 & 1) != 0)
                                                                                          {
                                                                                            isDisambiguationSelectedApp = self->_isDisambiguationSelectedApp;
                                                                                            if (isDisambiguationSelectedApp != objc_msgSend(v4, "isDisambiguationSelectedApp"))
                                                                                              goto LABEL_295;
                                                                                            v148 = v4[43];
                                                                                            v96 = *((unsigned __int16 *)&self->_has
                                                                                                  + 4);
                                                                                            v76 = *((unsigned __int16 *)v4
                                                                                                  + 176);
                                                                                            v257 = v148 >> 45;
                                                                                            v149 = (unint64_t)self->_has;
                                                                                            v259 = v148 >> 46;
                                                                                            v261 = v148 >> 47;
                                                                                            v263 = BYTE6(v148);
                                                                                            v266 = v148 >> 49;
                                                                                            v268 = v148 >> 50;
                                                                                            v270 = v148 >> 51;
                                                                                            v272 = v148 >> 52;
                                                                                            v274 = v148 >> 53;
                                                                                            v276 = v148 >> 54;
                                                                                            v278 = v148 >> 55;
                                                                                            v280 = HIBYTE(v148);
                                                                                            v282 = (v148 >> 57) | ((_BYTE)v76 << 7);
                                                                                            v284 = (v148 >> 58) | ((_BYTE)v76 << 6);
                                                                                            v286 = (v148 >> 59) | (32 * v76);
                                                                                            v288 = (v148 >> 60) | (16 * v76);
                                                                                            v290 = (v148 >> 61) | (8 * v76);
                                                                                            v291 = (v148 >> 62) | (4 * v76);
                                                                                            v292 = ((v148 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                            v254 = v149 >> 45;
                                                                                            v258 = v149 >> 46;
                                                                                            v260 = v149 >> 47;
                                                                                            v262 = BYTE6(v149);
                                                                                            v264 = v149 >> 49;
                                                                                            v267 = v149 >> 50;
                                                                                            v269 = v149 >> 51;
                                                                                            v271 = v149 >> 52;
                                                                                            v273 = v149 >> 53;
                                                                                            v275 = v149 >> 54;
                                                                                            v277 = v149 >> 55;
                                                                                            v279 = HIBYTE(v149);
                                                                                            v281 = (v149 >> 57) | ((_BYTE)v96 << 7);
                                                                                            v283 = (v149 >> 58) | ((_BYTE)v96 << 6);
                                                                                            v285 = (v149 >> 59) | (32 * v96);
                                                                                            v287 = (v149 >> 60) | (16 * v96);
                                                                                            v289 = (v149 >> 61) | (8 * v96);
                                                                                            v97 = (v149 >> 62) | (4 * v96);
                                                                                            v293 = v76 >> 1;
                                                                                            v294 = v76 >> 2;
                                                                                            v100 = ((v149 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                            has = v96 >> 1;
                                                                                            v7 = v96 >> 2;
                                                                                          }
                                                                                          if ((v254 & 1) == (v257 & 1))
                                                                                          {
                                                                                            if ((v254 & 1) != 0)
                                                                                            {
                                                                                              isModelPredictedApp = self->_isModelPredictedApp;
                                                                                              if (isModelPredictedApp != objc_msgSend(v4, "isModelPredictedApp"))
                                                                                                goto LABEL_295;
                                                                                              v151 = v4[43];
                                                                                              v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                              v76 = *((unsigned __int16 *)v4 + 176);
                                                                                              v259 = v151 >> 46;
                                                                                              v152 = (unint64_t)self->_has;
                                                                                              v261 = v151 >> 47;
                                                                                              v263 = BYTE6(v151);
                                                                                              v266 = v151 >> 49;
                                                                                              v268 = v151 >> 50;
                                                                                              v270 = v151 >> 51;
                                                                                              v272 = v151 >> 52;
                                                                                              v274 = v151 >> 53;
                                                                                              v276 = v151 >> 54;
                                                                                              v278 = v151 >> 55;
                                                                                              v280 = HIBYTE(v151);
                                                                                              v282 = (v151 >> 57) | ((_BYTE)v76 << 7);
                                                                                              v284 = (v151 >> 58) | ((_BYTE)v76 << 6);
                                                                                              v286 = (v151 >> 59) | (32 * v76);
                                                                                              v288 = (v151 >> 60) | (16 * v76);
                                                                                              v290 = (v151 >> 61) | (8 * v76);
                                                                                              v291 = (v151 >> 62) | (4 * v76);
                                                                                              v292 = ((v151 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                              v258 = v152 >> 46;
                                                                                              v260 = v152 >> 47;
                                                                                              v262 = BYTE6(v152);
                                                                                              v264 = v152 >> 49;
                                                                                              v267 = v152 >> 50;
                                                                                              v269 = v152 >> 51;
                                                                                              v271 = v152 >> 52;
                                                                                              v273 = v152 >> 53;
                                                                                              v275 = v152 >> 54;
                                                                                              v277 = v152 >> 55;
                                                                                              v279 = HIBYTE(v152);
                                                                                              v281 = (v152 >> 57) | ((_BYTE)v96 << 7);
                                                                                              v283 = (v152 >> 58) | ((_BYTE)v96 << 6);
                                                                                              v285 = (v152 >> 59) | (32 * v96);
                                                                                              v287 = (v152 >> 60) | (16 * v96);
                                                                                              v289 = (v152 >> 61) | (8 * v96);
                                                                                              v97 = (v152 >> 62) | (4 * v96);
                                                                                              v293 = v76 >> 1;
                                                                                              v294 = v76 >> 2;
                                                                                              v100 = ((v152 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                              has = v96 >> 1;
                                                                                              v7 = v96 >> 2;
                                                                                            }
                                                                                            if ((v258 & 1) == (v259 & 1))
                                                                                            {
                                                                                              if ((v258 & 1) != 0)
                                                                                              {
                                                                                                usageScoreRadio = self->_usageScoreRadio;
                                                                                                objc_msgSend(v4, "usageScoreRadio");
                                                                                                if (usageScoreRadio != v154)
                                                                                                  goto LABEL_295;
                                                                                                v155 = v4[43];
                                                                                                v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                v261 = v155 >> 47;
                                                                                                v156 = (unint64_t)self->_has;
                                                                                                v263 = BYTE6(v155);
                                                                                                v266 = v155 >> 49;
                                                                                                v268 = v155 >> 50;
                                                                                                v270 = v155 >> 51;
                                                                                                v272 = v155 >> 52;
                                                                                                v274 = v155 >> 53;
                                                                                                v276 = v155 >> 54;
                                                                                                v278 = v155 >> 55;
                                                                                                v280 = HIBYTE(v155);
                                                                                                v282 = (v155 >> 57) | ((_BYTE)v76 << 7);
                                                                                                v284 = (v155 >> 58) | ((_BYTE)v76 << 6);
                                                                                                v286 = (v155 >> 59) | (32 * v76);
                                                                                                v288 = (v155 >> 60) | (16 * v76);
                                                                                                v290 = (v155 >> 61) | (8 * v76);
                                                                                                v291 = (v155 >> 62) | (4 * v76);
                                                                                                v292 = ((v155 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                v260 = v156 >> 47;
                                                                                                v262 = BYTE6(v156);
                                                                                                v264 = v156 >> 49;
                                                                                                v267 = v156 >> 50;
                                                                                                v269 = v156 >> 51;
                                                                                                v271 = v156 >> 52;
                                                                                                v273 = v156 >> 53;
                                                                                                v275 = v156 >> 54;
                                                                                                v277 = v156 >> 55;
                                                                                                v279 = HIBYTE(v156);
                                                                                                v281 = (v156 >> 57) | ((_BYTE)v96 << 7);
                                                                                                v283 = (v156 >> 58) | ((_BYTE)v96 << 6);
                                                                                                v285 = (v156 >> 59) | (32 * v96);
                                                                                                v287 = (v156 >> 60) | (16 * v96);
                                                                                                v289 = (v156 >> 61) | (8 * v96);
                                                                                                v97 = (v156 >> 62) | (4 * v96);
                                                                                                v293 = v76 >> 1;
                                                                                                v294 = v76 >> 2;
                                                                                                v100 = ((v156 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                has = v96 >> 1;
                                                                                                v7 = v96 >> 2;
                                                                                              }
                                                                                              if ((v260 & 1) == (v261 & 1))
                                                                                              {
                                                                                                if ((v260 & 1) != 0)
                                                                                                {
                                                                                                  usageScoreMusicWithoutRadio = self->_usageScoreMusicWithoutRadio;
                                                                                                  objc_msgSend(v4, "usageScoreMusicWithoutRadio");
                                                                                                  if (usageScoreMusicWithoutRadio != v158)
                                                                                                    goto LABEL_295;
                                                                                                  v159 = v4[43];
                                                                                                  v160 = (unint64_t)self->_has;
                                                                                                  v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                  v263 = BYTE6(v159);
                                                                                                  v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                  v266 = v159 >> 49;
                                                                                                  v268 = v159 >> 50;
                                                                                                  v270 = v159 >> 51;
                                                                                                  v272 = v159 >> 52;
                                                                                                  v274 = v159 >> 53;
                                                                                                  v276 = v159 >> 54;
                                                                                                  v278 = v159 >> 55;
                                                                                                  v280 = HIBYTE(v159);
                                                                                                  v282 = (v159 >> 57) | ((_BYTE)v76 << 7);
                                                                                                  v284 = (v159 >> 58) | ((_BYTE)v76 << 6);
                                                                                                  v286 = (v159 >> 59) | (32 * v76);
                                                                                                  v288 = (v159 >> 60) | (16 * v76);
                                                                                                  v290 = (v159 >> 61) | (8 * v76);
                                                                                                  v291 = (v159 >> 62) | (4 * v76);
                                                                                                  v292 = ((v159 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                  v262 = BYTE6(v160);
                                                                                                  v264 = v160 >> 49;
                                                                                                  v267 = v160 >> 50;
                                                                                                  v269 = v160 >> 51;
                                                                                                  v271 = v160 >> 52;
                                                                                                  v273 = v160 >> 53;
                                                                                                  v275 = v160 >> 54;
                                                                                                  v277 = v160 >> 55;
                                                                                                  v279 = HIBYTE(v160);
                                                                                                  v281 = (v160 >> 57) | ((_BYTE)v96 << 7);
                                                                                                  v283 = (v160 >> 58) | ((_BYTE)v96 << 6);
                                                                                                  v285 = (v160 >> 59) | (32 * v96);
                                                                                                  v287 = (v160 >> 60) | (16 * v96);
                                                                                                  v289 = (v160 >> 61) | (8 * v96);
                                                                                                  v97 = (v160 >> 62) | (4 * v96);
                                                                                                  v293 = v76 >> 1;
                                                                                                  v294 = v76 >> 2;
                                                                                                  v100 = ((v160 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                  has = v96 >> 1;
                                                                                                  v7 = v96 >> 2;
                                                                                                }
                                                                                                if ((v262 & 1) == (v263 & 1))
                                                                                                {
                                                                                                  if ((v262 & 1) != 0)
                                                                                                  {
                                                                                                    rawMediaTypeUsageSignalRadio = self->_rawMediaTypeUsageSignalRadio;
                                                                                                    if (rawMediaTypeUsageSignalRadio != objc_msgSend(v4, "rawMediaTypeUsageSignalRadio"))
                                                                                                      goto LABEL_295;
                                                                                                    v162 = v4[43];
                                                                                                    v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                    v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                    v266 = v162 >> 49;
                                                                                                    v163 = (unint64_t)self->_has;
                                                                                                    v268 = v162 >> 50;
                                                                                                    v270 = v162 >> 51;
                                                                                                    v272 = v162 >> 52;
                                                                                                    v274 = v162 >> 53;
                                                                                                    v276 = v162 >> 54;
                                                                                                    v278 = v162 >> 55;
                                                                                                    v280 = HIBYTE(v162);
                                                                                                    v282 = (v162 >> 57) | ((_BYTE)v76 << 7);
                                                                                                    v284 = (v162 >> 58) | ((_BYTE)v76 << 6);
                                                                                                    v286 = (v162 >> 59) | (32 * v76);
                                                                                                    v288 = (v162 >> 60) | (16 * v76);
                                                                                                    v290 = (v162 >> 61) | (8 * v76);
                                                                                                    v291 = (v162 >> 62) | (4 * v76);
                                                                                                    v292 = ((v162 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                    v264 = v163 >> 49;
                                                                                                    v267 = v163 >> 50;
                                                                                                    v269 = v163 >> 51;
                                                                                                    v271 = v163 >> 52;
                                                                                                    v273 = v163 >> 53;
                                                                                                    v275 = v163 >> 54;
                                                                                                    v277 = v163 >> 55;
                                                                                                    v279 = HIBYTE(v163);
                                                                                                    v281 = (v163 >> 57) | ((_BYTE)v96 << 7);
                                                                                                    v283 = (v163 >> 58) | ((_BYTE)v96 << 6);
                                                                                                    v285 = (v163 >> 59) | (32 * v96);
                                                                                                    v287 = (v163 >> 60) | (16 * v96);
                                                                                                    v289 = (v163 >> 61) | (8 * v96);
                                                                                                    v97 = (v163 >> 62) | (4 * v96);
                                                                                                    v293 = v76 >> 1;
                                                                                                    v294 = v76 >> 2;
                                                                                                    v100 = ((v163 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                    has = v96 >> 1;
                                                                                                    v7 = v96 >> 2;
                                                                                                  }
                                                                                                  if ((v264 & 1) == (v266 & 1))
                                                                                                  {
                                                                                                    if ((v264 & 1) != 0)
                                                                                                    {
                                                                                                      rawMediaTypeUsageSignalMusicWithoutRadio = self->_rawMediaTypeUsageSignalMusicWithoutRadio;
                                                                                                      if (rawMediaTypeUsageSignalMusicWithoutRadio != objc_msgSend(v4, "rawMediaTypeUsageSignalMusicWithoutRadio"))
                                                                                                        goto LABEL_295;
                                                                                                      v165 = v4[43];
                                                                                                      v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                      v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                      v268 = v165 >> 50;
                                                                                                      v166 = (unint64_t)self->_has;
                                                                                                      v270 = v165 >> 51;
                                                                                                      v272 = v165 >> 52;
                                                                                                      v274 = v165 >> 53;
                                                                                                      v276 = v165 >> 54;
                                                                                                      v278 = v165 >> 55;
                                                                                                      v280 = HIBYTE(v165);
                                                                                                      v282 = (v165 >> 57) | ((_BYTE)v76 << 7);
                                                                                                      v284 = (v165 >> 58) | ((_BYTE)v76 << 6);
                                                                                                      v286 = (v165 >> 59) | (32 * v76);
                                                                                                      v288 = (v165 >> 60) | (16 * v76);
                                                                                                      v290 = (v165 >> 61) | (8 * v76);
                                                                                                      v291 = (v165 >> 62) | (4 * v76);
                                                                                                      v292 = ((v165 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                      v267 = v166 >> 50;
                                                                                                      v269 = v166 >> 51;
                                                                                                      v271 = v166 >> 52;
                                                                                                      v273 = v166 >> 53;
                                                                                                      v275 = v166 >> 54;
                                                                                                      v277 = v166 >> 55;
                                                                                                      v279 = HIBYTE(v166);
                                                                                                      v281 = (v166 >> 57) | ((_BYTE)v96 << 7);
                                                                                                      v283 = (v166 >> 58) | ((_BYTE)v96 << 6);
                                                                                                      v285 = (v166 >> 59) | (32 * v96);
                                                                                                      v287 = (v166 >> 60) | (16 * v96);
                                                                                                      v289 = (v166 >> 61) | (8 * v96);
                                                                                                      v97 = (v166 >> 62) | (4 * v96);
                                                                                                      v293 = v76 >> 1;
                                                                                                      v294 = v76 >> 2;
                                                                                                      v100 = ((v166 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                      has = v96 >> 1;
                                                                                                      v7 = v96 >> 2;
                                                                                                    }
                                                                                                    if ((v267 & 1) == (v268 & 1))
                                                                                                    {
                                                                                                      if ((v267 & 1) != 0)
                                                                                                      {
                                                                                                        subscriptionStatus = self->_subscriptionStatus;
                                                                                                        if (subscriptionStatus != objc_msgSend(v4, "subscriptionStatus"))
                                                                                                          goto LABEL_295;
                                                                                                        v168 = v4[43];
                                                                                                        v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                        v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                        v270 = v168 >> 51;
                                                                                                        v169 = (unint64_t)self->_has;
                                                                                                        v272 = v168 >> 52;
                                                                                                        v274 = v168 >> 53;
                                                                                                        v276 = v168 >> 54;
                                                                                                        v278 = v168 >> 55;
                                                                                                        v280 = HIBYTE(v168);
                                                                                                        v282 = (v168 >> 57) | ((_BYTE)v76 << 7);
                                                                                                        v284 = (v168 >> 58) | ((_BYTE)v76 << 6);
                                                                                                        v286 = (v168 >> 59) | (32 * v76);
                                                                                                        v288 = (v168 >> 60) | (16 * v76);
                                                                                                        v290 = (v168 >> 61) | (8 * v76);
                                                                                                        v291 = (v168 >> 62) | (4 * v76);
                                                                                                        v292 = ((v168 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                        v269 = v169 >> 51;
                                                                                                        v271 = v169 >> 52;
                                                                                                        v273 = v169 >> 53;
                                                                                                        v275 = v169 >> 54;
                                                                                                        v277 = v169 >> 55;
                                                                                                        v279 = HIBYTE(v169);
                                                                                                        v281 = (v169 >> 57) | ((_BYTE)v96 << 7);
                                                                                                        v283 = (v169 >> 58) | ((_BYTE)v96 << 6);
                                                                                                        v285 = (v169 >> 59) | (32 * v96);
                                                                                                        v287 = (v169 >> 60) | (16 * v96);
                                                                                                        v289 = (v169 >> 61) | (8 * v96);
                                                                                                        v293 = v76 >> 1;
                                                                                                        v294 = v76 >> 2;
                                                                                                        v97 = (v169 >> 62) | (4 * v96);
                                                                                                        v100 = ((v169 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                        v7 = v96 >> 2;
                                                                                                        has = v96 >> 1;
                                                                                                      }
                                                                                                      if ((v269 & 1) == (v270 & 1))
                                                                                                      {
                                                                                                        if ((v269 & 1) != 0)
                                                                                                        {
                                                                                                          isRawNowPlayingBundle = self->_isRawNowPlayingBundle;
                                                                                                          if (isRawNowPlayingBundle != objc_msgSend(v4, "isRawNowPlayingBundle"))
                                                                                                            goto LABEL_295;
                                                                                                          v171 = v4[43];
                                                                                                          v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                          v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                          v272 = v171 >> 52;
                                                                                                          v172 = (unint64_t)self->_has;
                                                                                                          v274 = v171 >> 53;
                                                                                                          v276 = v171 >> 54;
                                                                                                          v278 = v171 >> 55;
                                                                                                          v280 = HIBYTE(v171);
                                                                                                          v282 = (v171 >> 57) | ((_BYTE)v76 << 7);
                                                                                                          v284 = (v171 >> 58) | ((_BYTE)v76 << 6);
                                                                                                          v286 = (v171 >> 59) | (32 * v76);
                                                                                                          v288 = (v171 >> 60) | (16 * v76);
                                                                                                          v290 = (v171 >> 61) | (8 * v76);
                                                                                                          v291 = (v171 >> 62) | (4 * v76);
                                                                                                          v292 = ((v171 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                          v271 = v172 >> 52;
                                                                                                          v273 = v172 >> 53;
                                                                                                          v275 = v172 >> 54;
                                                                                                          v277 = v172 >> 55;
                                                                                                          v279 = HIBYTE(v172);
                                                                                                          v281 = (v172 >> 57) | ((_BYTE)v96 << 7);
                                                                                                          v283 = (v172 >> 58) | ((_BYTE)v96 << 6);
                                                                                                          v285 = (v172 >> 59) | (32 * v96);
                                                                                                          v287 = (v172 >> 60) | (16 * v96);
                                                                                                          v289 = (v172 >> 61) | (8 * v96);
                                                                                                          v293 = v76 >> 1;
                                                                                                          v294 = v76 >> 2;
                                                                                                          v97 = (v172 >> 62) | (4 * v96);
                                                                                                          v100 = ((v172 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                          has = v96 >> 1;
                                                                                                          v7 = v96 >> 2;
                                                                                                        }
                                                                                                        if ((v271 & 1) == (v272 & 1))
                                                                                                        {
                                                                                                          if ((v271 & 1) != 0)
                                                                                                          {
                                                                                                            rawNowPlayingTotal = self->_rawNowPlayingTotal;
                                                                                                            if (rawNowPlayingTotal != objc_msgSend(v4, "rawNowPlayingTotal"))
                                                                                                              goto LABEL_295;
                                                                                                            v174 = v4[43];
                                                                                                            v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                            v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                            v274 = v174 >> 53;
                                                                                                            v175 = (unint64_t)self->_has;
                                                                                                            v276 = v174 >> 54;
                                                                                                            v278 = v174 >> 55;
                                                                                                            v280 = HIBYTE(v174);
                                                                                                            v282 = (v174 >> 57) | ((_BYTE)v76 << 7);
                                                                                                            v284 = (v174 >> 58) | ((_BYTE)v76 << 6);
                                                                                                            v286 = (v174 >> 59) | (32 * v76);
                                                                                                            v288 = (v174 >> 60) | (16 * v76);
                                                                                                            v290 = (v174 >> 61) | (8 * v76);
                                                                                                            v291 = (v174 >> 62) | (4 * v76);
                                                                                                            v292 = ((v174 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                            v273 = v175 >> 53;
                                                                                                            v275 = v175 >> 54;
                                                                                                            v277 = v175 >> 55;
                                                                                                            v279 = HIBYTE(v175);
                                                                                                            v281 = (v175 >> 57) | ((_BYTE)v96 << 7);
                                                                                                            v283 = (v175 >> 58) | ((_BYTE)v96 << 6);
                                                                                                            v285 = (v175 >> 59) | (32 * v96);
                                                                                                            v287 = (v175 >> 60) | (16 * v96);
                                                                                                            v289 = (v175 >> 61) | (8 * v96);
                                                                                                            v293 = v76 >> 1;
                                                                                                            v294 = v76 >> 2;
                                                                                                            v97 = (v175 >> 62) | (4 * v96);
                                                                                                            v100 = ((v175 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                            has = v96 >> 1;
                                                                                                            v7 = v96 >> 2;
                                                                                                          }
                                                                                                          if ((v273 & 1) == (v274 & 1))
                                                                                                          {
                                                                                                            if ((v273 & 1) != 0)
                                                                                                            {
                                                                                                              rawNowPlayingBundleScore = self->_rawNowPlayingBundleScore;
                                                                                                              objc_msgSend(v4, "rawNowPlayingBundleScore");
                                                                                                              if (rawNowPlayingBundleScore != v177)
                                                                                                                goto LABEL_295;
                                                                                                              v178 = v4[43];
                                                                                                              v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                              v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                              v276 = v178 >> 54;
                                                                                                              v179 = (unint64_t)self->_has;
                                                                                                              v278 = v178 >> 55;
                                                                                                              v280 = HIBYTE(v178);
                                                                                                              v282 = (v178 >> 57) | ((_BYTE)v76 << 7);
                                                                                                              v284 = (v178 >> 58) | ((_BYTE)v76 << 6);
                                                                                                              v286 = (v178 >> 59) | (32 * v76);
                                                                                                              v288 = (v178 >> 60) | (16 * v76);
                                                                                                              v290 = (v178 >> 61) | (8 * v76);
                                                                                                              v291 = (v178 >> 62) | (4 * v76);
                                                                                                              v292 = ((v178 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                              v275 = v179 >> 54;
                                                                                                              v277 = v179 >> 55;
                                                                                                              v279 = HIBYTE(v179);
                                                                                                              v281 = (v179 >> 57) | ((_BYTE)v96 << 7);
                                                                                                              v283 = (v179 >> 58) | ((_BYTE)v96 << 6);
                                                                                                              v285 = (v179 >> 59) | (32 * v96);
                                                                                                              v287 = (v179 >> 60) | (16 * v96);
                                                                                                              v289 = (v179 >> 61) | (8 * v96);
                                                                                                              v293 = v76 >> 1;
                                                                                                              v294 = v76 >> 2;
                                                                                                              v97 = (v179 >> 62) | (4 * v96);
                                                                                                              v100 = ((v179 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                              has = v96 >> 1;
                                                                                                              v7 = v96 >> 2;
                                                                                                            }
                                                                                                            if ((v275 & 1) == (v276 & 1))
                                                                                                            {
                                                                                                              if ((v275 & 1) != 0)
                                                                                                              {
                                                                                                                isRawLastNowPlaying = self->_isRawLastNowPlaying;
                                                                                                                objc_msgSend(v4, "isRawLastNowPlaying");
                                                                                                                if (isRawLastNowPlaying != v181)
                                                                                                                  goto LABEL_295;
                                                                                                                v182 = v4[43];
                                                                                                                v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                v278 = v182 >> 55;
                                                                                                                v183 = (unint64_t)self->_has;
                                                                                                                v280 = HIBYTE(v182);
                                                                                                                v282 = (v182 >> 57) | ((_BYTE)v76 << 7);
                                                                                                                v284 = (v182 >> 58) | ((_BYTE)v76 << 6);
                                                                                                                v286 = (v182 >> 59) | (32 * v76);
                                                                                                                v288 = (v182 >> 60) | (16 * v76);
                                                                                                                v290 = (v182 >> 61) | (8 * v76);
                                                                                                                v291 = (v182 >> 62) | (4 * v76);
                                                                                                                v292 = ((v182 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                v277 = v183 >> 55;
                                                                                                                v279 = HIBYTE(v183);
                                                                                                                v281 = (v183 >> 57) | ((_BYTE)v96 << 7);
                                                                                                                v283 = (v183 >> 58) | ((_BYTE)v96 << 6);
                                                                                                                v285 = (v183 >> 59) | (32 * v96);
                                                                                                                v287 = (v183 >> 60) | (16 * v96);
                                                                                                                v289 = (v183 >> 61) | (8 * v96);
                                                                                                                v293 = v76 >> 1;
                                                                                                                v294 = v76 >> 2;
                                                                                                                v97 = (v183 >> 62) | (4 * v96);
                                                                                                                v100 = ((v183 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                has = v96 >> 1;
                                                                                                                v7 = v96 >> 2;
                                                                                                              }
                                                                                                              if ((v277 & 1) == (v278 & 1))
                                                                                                              {
                                                                                                                if ((v277 & 1) != 0)
                                                                                                                {
                                                                                                                  rawNowPlaying2Minutes = self->_rawNowPlaying2Minutes;
                                                                                                                  if (rawNowPlaying2Minutes != objc_msgSend(v4, "rawNowPlaying2Minutes"))
                                                                                                                    goto LABEL_295;
                                                                                                                  v185 = v4[43];
                                                                                                                  v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                  v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                  v280 = HIBYTE(v185);
                                                                                                                  v186 = (unint64_t)self->_has;
                                                                                                                  v282 = (v185 >> 57) | ((_BYTE)v76 << 7);
                                                                                                                  v284 = (v185 >> 58) | ((_BYTE)v76 << 6);
                                                                                                                  v286 = (v185 >> 59) | (32 * v76);
                                                                                                                  v288 = (v185 >> 60) | (16 * v76);
                                                                                                                  v290 = (v185 >> 61) | (8 * v76);
                                                                                                                  v291 = (v185 >> 62) | (4 * v76);
                                                                                                                  v292 = ((v185 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                  v279 = HIBYTE(v186);
                                                                                                                  v281 = (v186 >> 57) | ((_BYTE)v96 << 7);
                                                                                                                  v283 = (v186 >> 58) | ((_BYTE)v96 << 6);
                                                                                                                  v285 = (v186 >> 59) | (32 * v96);
                                                                                                                  v287 = (v186 >> 60) | (16 * v96);
                                                                                                                  v289 = (v186 >> 61) | (8 * v96);
                                                                                                                  v293 = v76 >> 1;
                                                                                                                  v294 = v76 >> 2;
                                                                                                                  v97 = (v186 >> 62) | (4 * v96);
                                                                                                                  v100 = ((v186 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                  has = v96 >> 1;
                                                                                                                  v7 = v96 >> 2;
                                                                                                                }
                                                                                                                if ((v279 & 1) == (v280 & 1))
                                                                                                                {
                                                                                                                  if ((v279 & 1) != 0)
                                                                                                                  {
                                                                                                                    rawNowPlaying10Minutes = self->_rawNowPlaying10Minutes;
                                                                                                                    if (rawNowPlaying10Minutes != objc_msgSend(v4, "rawNowPlaying10Minutes"))
                                                                                                                      goto LABEL_295;
                                                                                                                    v188 = v4[43];
                                                                                                                    v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                    v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                    v282 = (v188 >> 57) | ((_BYTE)v76 << 7);
                                                                                                                    v189 = (unint64_t)self->_has;
                                                                                                                    v284 = (v188 >> 58) | ((_BYTE)v76 << 6);
                                                                                                                    v286 = (v188 >> 59) | (32 * v76);
                                                                                                                    v288 = (v188 >> 60) | (16 * v76);
                                                                                                                    v290 = (v188 >> 61) | (8 * v76);
                                                                                                                    v291 = (v188 >> 62) | (4 * v76);
                                                                                                                    v292 = ((v188 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                    v281 = (v189 >> 57) | ((_BYTE)v96 << 7);
                                                                                                                    v283 = (v189 >> 58) | ((_BYTE)v96 << 6);
                                                                                                                    v285 = (v189 >> 59) | (32 * v96);
                                                                                                                    v287 = (v189 >> 60) | (16 * v96);
                                                                                                                    v289 = (v189 >> 61) | (8 * v96);
                                                                                                                    v293 = v76 >> 1;
                                                                                                                    v294 = v76 >> 2;
                                                                                                                    v97 = (v189 >> 62) | (4 * v96);
                                                                                                                    v100 = ((v189 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                    has = v96 >> 1;
                                                                                                                    v7 = v96 >> 2;
                                                                                                                  }
                                                                                                                  if ((v281 & 1) == (v282 & 1))
                                                                                                                  {
                                                                                                                    if ((v281 & 1) != 0)
                                                                                                                    {
                                                                                                                      rawNowPlaying1Hour = self->_rawNowPlaying1Hour;
                                                                                                                      if (rawNowPlaying1Hour != objc_msgSend(v4, "rawNowPlaying1Hour"))
                                                                                                                        goto LABEL_295;
                                                                                                                      v191 = v4[43];
                                                                                                                      v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                      v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                      v284 = (v191 >> 58) | ((_BYTE)v76 << 6);
                                                                                                                      v192 = (unint64_t)self->_has;
                                                                                                                      v286 = (v191 >> 59) | (32 * v76);
                                                                                                                      v288 = (v191 >> 60) | (16 * v76);
                                                                                                                      v290 = (v191 >> 61) | (8 * v76);
                                                                                                                      v291 = (v191 >> 62) | (4 * v76);
                                                                                                                      v292 = ((v191 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                      v283 = (v192 >> 58) | ((_BYTE)v96 << 6);
                                                                                                                      v285 = (v192 >> 59) | (32 * v96);
                                                                                                                      v287 = (v192 >> 60) | (16 * v96);
                                                                                                                      v289 = (v192 >> 61) | (8 * v96);
                                                                                                                      v293 = v76 >> 1;
                                                                                                                      v294 = v76 >> 2;
                                                                                                                      v97 = (v192 >> 62) | (4 * v96);
                                                                                                                      v100 = ((v192 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                      has = v96 >> 1;
                                                                                                                      v7 = v96 >> 2;
                                                                                                                    }
                                                                                                                    if ((v283 & 1) == (v284 & 1))
                                                                                                                    {
                                                                                                                      if ((v283 & 1) != 0)
                                                                                                                      {
                                                                                                                        rawNowPlaying6Hours = self->_rawNowPlaying6Hours;
                                                                                                                        if (rawNowPlaying6Hours != objc_msgSend(v4, "rawNowPlaying6Hours"))
                                                                                                                          goto LABEL_295;
                                                                                                                        v194 = v4[43];
                                                                                                                        v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                        v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                        v286 = (v194 >> 59) | (32 * v76);
                                                                                                                        v195 = (unint64_t)self->_has;
                                                                                                                        v288 = (v194 >> 60) | (16 * v76);
                                                                                                                        v290 = (v194 >> 61) | (8 * v76);
                                                                                                                        v291 = (v194 >> 62) | (4 * v76);
                                                                                                                        v292 = ((v194 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                        v285 = (v195 >> 59) | (32 * v96);
                                                                                                                        v287 = (v195 >> 60) | (16 * v96);
                                                                                                                        v289 = (v195 >> 61) | (8 * v96);
                                                                                                                        v293 = v76 >> 1;
                                                                                                                        v294 = v76 >> 2;
                                                                                                                        v97 = (v195 >> 62) | (4 * v96);
                                                                                                                        v100 = ((v195 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                        has = v96 >> 1;
                                                                                                                        v7 = v96 >> 2;
                                                                                                                      }
                                                                                                                      if ((v285 & 1) == (v286 & 1))
                                                                                                                      {
                                                                                                                        if ((v285 & 1) != 0)
                                                                                                                        {
                                                                                                                          rawNowPlaying1Day = self->_rawNowPlaying1Day;
                                                                                                                          if (rawNowPlaying1Day != objc_msgSend(v4, "rawNowPlaying1Day"))
                                                                                                                            goto LABEL_295;
                                                                                                                          v197 = v4[43];
                                                                                                                          v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                          v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                          v288 = (v197 >> 60) | (16 * v76);
                                                                                                                          v198 = (unint64_t)self->_has;
                                                                                                                          v290 = (v197 >> 61) | (8 * v76);
                                                                                                                          v291 = (v197 >> 62) | (4 * v76);
                                                                                                                          v292 = ((v197 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                          v287 = (v198 >> 60) | (16 * v96);
                                                                                                                          v289 = (v198 >> 61) | (8 * v96);
                                                                                                                          v293 = v76 >> 1;
                                                                                                                          v294 = v76 >> 2;
                                                                                                                          v97 = (v198 >> 62) | (4 * v96);
                                                                                                                          v100 = ((v198 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                          has = v96 >> 1;
                                                                                                                          v7 = v96 >> 2;
                                                                                                                        }
                                                                                                                        if ((v287 & 1) == (v288 & 1))
                                                                                                                        {
                                                                                                                          if ((v287 & 1) != 0)
                                                                                                                          {
                                                                                                                            rawNowPlaying7Days = self->_rawNowPlaying7Days;
                                                                                                                            if (rawNowPlaying7Days != objc_msgSend(v4, "rawNowPlaying7Days"))
                                                                                                                              goto LABEL_295;
                                                                                                                            v200 = v4[43];
                                                                                                                            v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                            v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                            v290 = ((unint64_t)v200 >> 61) | (8 * v76);
                                                                                                                            v201 = (uint64_t)self->_has;
                                                                                                                            v291 = ((unint64_t)v200 >> 62) | (4 * v76);
                                                                                                                            v292 = (v200 < 0) | (2 * v76);
                                                                                                                            v289 = ((unint64_t)v201 >> 61) | (8 * v96);
                                                                                                                            v293 = v76 >> 1;
                                                                                                                            v294 = v76 >> 2;
                                                                                                                            v97 = ((unint64_t)v201 >> 62) | (4 * v96);
                                                                                                                            v100 = (v201 < 0) | (2 * v96);
                                                                                                                            has = v96 >> 1;
                                                                                                                            v7 = v96 >> 2;
                                                                                                                          }
                                                                                                                          if ((v289 & 1) == (v290 & 1))
                                                                                                                          {
                                                                                                                            if ((v289 & 1) != 0)
                                                                                                                            {
                                                                                                                              rawNowPlaying28Days = self->_rawNowPlaying28Days;
                                                                                                                              if (rawNowPlaying28Days != objc_msgSend(v4, "rawNowPlaying28Days"))
                                                                                                                                goto LABEL_295;
                                                                                                                              v203 = v4[43];
                                                                                                                              v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                              v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                              v291 = ((unint64_t)v203 >> 62) | (4 * v76);
                                                                                                                              v204 = (uint64_t)self->_has;
                                                                                                                              v292 = (v203 < 0) | (2 * v76);
                                                                                                                              v97 = ((unint64_t)v204 >> 62) | (4 * v96);
                                                                                                                              v293 = v76 >> 1;
                                                                                                                              v294 = v76 >> 2;
                                                                                                                              v100 = (v204 < 0) | (2 * v96);
                                                                                                                              has = v96 >> 1;
                                                                                                                              v7 = v96 >> 2;
                                                                                                                            }
                                                                                                                            if ((v97 & 1) == (v291 & 1))
                                                                                                                            {
                                                                                                                              if ((v97 & 1) != 0)
                                                                                                                              {
                                                                                                                                rawLastNowPlayingRecency = self->_rawLastNowPlayingRecency;
                                                                                                                                if (rawLastNowPlayingRecency != objc_msgSend(v4, "rawLastNowPlayingRecency"))
                                                                                                                                  goto LABEL_295;
                                                                                                                                v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                v292 = ((v4[43] & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                                v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                v100 = (*(_QWORD *)&self->_has < 0) | (2 * v96);
                                                                                                                                v293 = v76 >> 1;
                                                                                                                                v294 = v76 >> 2;
                                                                                                                                has = v96 >> 1;
                                                                                                                                v7 = v96 >> 2;
                                                                                                                              }
                                                                                                                              if ((v100 & 1) == (v292 & 1))
                                                                                                                              {
                                                                                                                                if ((v100 & 1) != 0)
                                                                                                                                {
                                                                                                                                  commonForegroundBundleApp = self->_commonForegroundBundleApp;
                                                                                                                                  if (commonForegroundBundleApp != objc_msgSend(v4, "commonForegroundBundleApp"))
                                                                                                                                    goto LABEL_295;
                                                                                                                                  v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                  v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                  v293 = v76 >> 1;
                                                                                                                                  v294 = v76 >> 2;
                                                                                                                                  has = v96 >> 1;
                                                                                                                                  v7 = v96 >> 2;
                                                                                                                                }
                                                                                                                                if ((v96 & 1) == (v76 & 1))
                                                                                                                                {
                                                                                                                                  if ((v96 & 1) != 0)
                                                                                                                                  {
                                                                                                                                    isRawLastNowPlayingBoolean = self->_isRawLastNowPlayingBoolean;
                                                                                                                                    if (isRawLastNowPlayingBoolean != objc_msgSend(v4, "isRawLastNowPlayingBoolean"))
                                                                                                                                      goto LABEL_295;
                                                                                                                                    v208 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                    v209 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                    v293 = v209 >> 1;
                                                                                                                                    v294 = v209 >> 2;
                                                                                                                                    has = v208 >> 1;
                                                                                                                                    v7 = v208 >> 2;
                                                                                                                                  }
                                                                                                                                  if ((has & 1) == (v293 & 1))
                                                                                                                                  {
                                                                                                                                    if ((has & 1) != 0)
                                                                                                                                    {
                                                                                                                                      isCommonForegroundApp = self->_isCommonForegroundApp;
                                                                                                                                      if (isCommonForegroundApp != objc_msgSend(v4, "isCommonForegroundApp"))
                                                                                                                                        goto LABEL_295;
                                                                                                                                      v7 = (unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2;
                                                                                                                                      v294 = (unint64_t)*((unsigned __int16 *)v4 + 176) >> 2;
                                                                                                                                    }
                                                                                                                                    if ((v7 & 1) != (v294 & 1))
                                                                                                                                      goto LABEL_295;
                                                                                                                                    if ((v7 & 1) != 0)
                                                                                                                                    {
                                                                                                                                      isBoltEnabled = self->_isBoltEnabled;
                                                                                                                                      if (isBoltEnabled != objc_msgSend(v4, "isBoltEnabled"))
                                                                                                                                        goto LABEL_295;
                                                                                                                                    }
                                                                                                                                    v212 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                    v213 = (v212 >> 3) & 1;
                                                                                                                                    v214 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                    if (v213 != ((v214 >> 3) & 1))
                                                                                                                                      goto LABEL_295;
                                                                                                                                    if (v213)
                                                                                                                                    {
                                                                                                                                      usageScoreMusicWithoutRadioRemote = self->_usageScoreMusicWithoutRadioRemote;
                                                                                                                                      objc_msgSend(v4, "usageScoreMusicWithoutRadioRemote");
                                                                                                                                      if (usageScoreMusicWithoutRadioRemote != v226)
                                                                                                                                        goto LABEL_295;
                                                                                                                                      v227 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                      v215 = v227 >> 4;
                                                                                                                                      v216 = v227 >> 5;
                                                                                                                                      v217 = v227 >> 6;
                                                                                                                                      v223 = v227 >> 8;
                                                                                                                                      v219 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                      v220 = v219 >> 4;
                                                                                                                                      v221 = v219 >> 5;
                                                                                                                                      v222 = v219 >> 6;
                                                                                                                                      v228 = v219 >> 7;
                                                                                                                                      v229 = v219 >> 8;
                                                                                                                                      v218 = v227 >> 7;
                                                                                                                                      LOBYTE(v219) = v223;
                                                                                                                                      LOBYTE(v223) = v228;
                                                                                                                                      LOBYTE(v224) = v229;
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      v215 = v214 >> 4;
                                                                                                                                      v216 = v214 >> 5;
                                                                                                                                      v217 = v214 >> 6;
                                                                                                                                      v218 = v214 >> 7;
                                                                                                                                      v219 = v214 >> 8;
                                                                                                                                      v220 = v212 >> 4;
                                                                                                                                      v221 = v212 >> 5;
                                                                                                                                      v222 = v212 >> 6;
                                                                                                                                      v223 = v212 >> 7;
                                                                                                                                      v224 = v212 >> 8;
                                                                                                                                    }
                                                                                                                                    v230 = v220 & 1;
                                                                                                                                    if (v230 == (v215 & 1))
                                                                                                                                    {
                                                                                                                                      if (v230)
                                                                                                                                      {
                                                                                                                                        usageScoreBooksRemote = self->_usageScoreBooksRemote;
                                                                                                                                        objc_msgSend(v4, "usageScoreBooksRemote");
                                                                                                                                        if (usageScoreBooksRemote != v232)
                                                                                                                                          goto LABEL_295;
                                                                                                                                        v233 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                        v216 = v233 >> 5;
                                                                                                                                        v217 = v233 >> 6;
                                                                                                                                        v223 = v233 >> 8;
                                                                                                                                        v219 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                        v221 = v219 >> 5;
                                                                                                                                        v222 = v219 >> 6;
                                                                                                                                        v234 = v219 >> 7;
                                                                                                                                        v235 = v219 >> 8;
                                                                                                                                        v218 = v233 >> 7;
                                                                                                                                        LOBYTE(v219) = v223;
                                                                                                                                        LOBYTE(v223) = v234;
                                                                                                                                        LOBYTE(v224) = v235;
                                                                                                                                      }
                                                                                                                                      v236 = v221 & 1;
                                                                                                                                      if (v236 == (v216 & 1))
                                                                                                                                      {
                                                                                                                                        if (v236)
                                                                                                                                        {
                                                                                                                                          usageScoreRadioRemote = self->_usageScoreRadioRemote;
                                                                                                                                          objc_msgSend(v4, "usageScoreRadioRemote");
                                                                                                                                          if (usageScoreRadioRemote != v238)
                                                                                                                                            goto LABEL_295;
                                                                                                                                          v239 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                          v217 = v239 >> 6;
                                                                                                                                          v223 = v239 >> 8;
                                                                                                                                          v219 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                          v222 = v219 >> 6;
                                                                                                                                          v240 = v219 >> 7;
                                                                                                                                          v241 = v219 >> 8;
                                                                                                                                          v218 = v239 >> 7;
                                                                                                                                          LOBYTE(v219) = v223;
                                                                                                                                          LOBYTE(v223) = v240;
                                                                                                                                          LOBYTE(v224) = v241;
                                                                                                                                        }
                                                                                                                                        if ((v222 & 1) == (v217 & 1))
                                                                                                                                        {
                                                                                                                                          if ((v222 & 1) != 0)
                                                                                                                                          {
                                                                                                                                            usageScorePodcastsRemote = self->_usageScorePodcastsRemote;
                                                                                                                                            objc_msgSend(v4, "usageScorePodcastsRemote");
                                                                                                                                            if (usageScorePodcastsRemote != v243)
                                                                                                                                              goto LABEL_295;
                                                                                                                                            v219 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                            v244 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                            v245 = v244 >> 8;
                                                                                                                                            v223 = v219 >> 7;
                                                                                                                                            v246 = v219 >> 8;
                                                                                                                                            v218 = v244 >> 7;
                                                                                                                                            LOBYTE(v219) = v245;
                                                                                                                                            LOBYTE(v224) = v246;
                                                                                                                                          }
                                                                                                                                          if ((v223 & 1) == (v218 & 1))
                                                                                                                                          {
                                                                                                                                            if ((v223 & 1) != 0)
                                                                                                                                            {
                                                                                                                                              entitySearchBundleScoreRemote = self->_entitySearchBundleScoreRemote;
                                                                                                                                              objc_msgSend(v4, "entitySearchBundleScoreRemote");
                                                                                                                                              if (entitySearchBundleScoreRemote != v248)
                                                                                                                                                goto LABEL_295;
                                                                                                                                              LOBYTE(v224) = *((_BYTE *)&self->_has + 9);
                                                                                                                                              LOBYTE(v219) = *((_BYTE *)v4 + 353);
                                                                                                                                            }
                                                                                                                                            if ((v224 & 1) == (v219 & 1))
                                                                                                                                            {
                                                                                                                                              if ((v224 & 1) == 0 || (usageScoreMusicRemote = self->_usageScoreMusicRemote, objc_msgSend(v4, "usageScoreMusicRemote"), usageScoreMusicRemote == v250))
                                                                                                                                              {
                                                                                                                                                v251 = 1;
                                                                                                                                                goto LABEL_296;
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
LABEL_295:
  v251 = 0;
LABEL_296:

  return v251;
}

- (unint64_t)hash
{
  __int16 v3;
  uint64_t has;
  double compoundActiveBundleScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double compoundMediaTypeBundleScore;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double entitySearchBundleRecencyS;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double entitySearchBundleScore;
  double v22;
  long double v23;
  double v24;
  double nowPlayingBundleRecencyS;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  double nowPlayingBundleScore;
  double v32;
  long double v33;
  double v34;
  double usageScoreBooks;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  unint64_t v40;
  double usageScoreMusic;
  double v42;
  long double v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  double usageScorePodcasts;
  double v49;
  long double v50;
  double v51;
  double vq21Score;
  double v53;
  long double v54;
  double v55;
  unint64_t v56;
  double usageScoreRadio;
  double v58;
  long double v59;
  double v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  double usageScoreMusicWithoutRadio;
  double v65;
  long double v66;
  double v67;
  double rawNowPlayingBundleScore;
  double v69;
  long double v70;
  double v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  double isRawLastNowPlaying;
  double v76;
  long double v77;
  double v78;
  double usageScoreMusicWithoutRadioRemote;
  double v80;
  long double v81;
  double v82;
  unint64_t v83;
  unint64_t v84;
  double usageScoreBooksRemote;
  double v86;
  long double v87;
  double v88;
  unint64_t v89;
  double usageScoreRadioRemote;
  double v91;
  long double v92;
  double v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  double usageScorePodcastsRemote;
  double v99;
  long double v100;
  double v101;
  unint64_t v102;
  unint64_t v103;
  double entitySearchBundleScoreRemote;
  double v105;
  long double v106;
  double v107;
  unint64_t v108;
  double usageScoreMusicRemote;
  double v110;
  long double v111;
  double v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v178;
  unint64_t v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;

  v3 = *((_WORD *)&self->_has + 4);
  has = (uint64_t)self->_has;
  if ((has & 1) != 0)
  {
    v178 = 2654435761 * self->_isClientForegroundActiveBundle;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v178 = 0;
  if ((has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  compoundActiveBundleScore = self->_compoundActiveBundleScore;
  v6 = -compoundActiveBundleScore;
  if (compoundActiveBundleScore >= 0.0)
    v6 = self->_compoundActiveBundleScore;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    compoundMediaTypeBundleScore = self->_compoundMediaTypeBundleScore;
    v12 = -compoundMediaTypeBundleScore;
    if (compoundMediaTypeBundleScore >= 0.0)
      v12 = self->_compoundMediaTypeBundleScore;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 8) != 0)
  {
    entitySearchBundleRecencyS = self->_entitySearchBundleRecencyS;
    v17 = -entitySearchBundleRecencyS;
    if (entitySearchBundleRecencyS >= 0.0)
      v17 = self->_entitySearchBundleRecencyS;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((has & 0x10) != 0)
  {
    entitySearchBundleScore = self->_entitySearchBundleScore;
    v22 = -entitySearchBundleScore;
    if (entitySearchBundleScore >= 0.0)
      v22 = self->_entitySearchBundleScore;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((has & 0x20) != 0)
  {
    v176 = 2654435761 * self->_isForegroundBundle;
    if ((has & 0x40) != 0)
    {
LABEL_37:
      v175 = 2654435761 * self->_isNowPlayingBundle;
      if ((has & 0x80) != 0)
        goto LABEL_38;
LABEL_45:
      v174 = 0;
      if ((has & 0x100) != 0)
        goto LABEL_39;
LABEL_46:
      v29 = 0;
      goto LABEL_49;
    }
  }
  else
  {
    v176 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_37;
  }
  v175 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_45;
LABEL_38:
  v174 = 2654435761 * self->_nowPlayingBundleCount;
  if ((has & 0x100) == 0)
    goto LABEL_46;
LABEL_39:
  nowPlayingBundleRecencyS = self->_nowPlayingBundleRecencyS;
  v26 = -nowPlayingBundleRecencyS;
  if (nowPlayingBundleRecencyS >= 0.0)
    v26 = self->_nowPlayingBundleRecencyS;
  v27 = floor(v26 + 0.5);
  v28 = (v26 - v27) * 1.84467441e19;
  v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0)
      v29 += (unint64_t)v28;
  }
  else
  {
    v29 -= (unint64_t)fabs(v28);
  }
LABEL_49:
  if ((has & 0x200) != 0)
  {
    nowPlayingBundleScore = self->_nowPlayingBundleScore;
    v32 = -nowPlayingBundleScore;
    if (nowPlayingBundleScore >= 0.0)
      v32 = self->_nowPlayingBundleScore;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  if ((has & 0x400) != 0)
  {
    v172 = 2654435761 * self->_isNowPlayingLastBundle;
    if ((has & 0x800) != 0)
    {
LABEL_59:
      v171 = 2654435761 * self->_nowPlayingUsage1Day;
      if ((has & 0x1000) != 0)
        goto LABEL_60;
      goto LABEL_87;
    }
  }
  else
  {
    v172 = 0;
    if ((has & 0x800) != 0)
      goto LABEL_59;
  }
  v171 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_60:
    v170 = 2654435761 * self->_nowPlayingUsage7Days;
    if ((has & 0x2000) != 0)
      goto LABEL_61;
    goto LABEL_88;
  }
LABEL_87:
  v170 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_61:
    v169 = 2654435761 * self->_nowPlayingUsage14Days;
    if ((has & 0x4000) != 0)
      goto LABEL_62;
    goto LABEL_89;
  }
LABEL_88:
  v169 = 0;
  if ((has & 0x4000) != 0)
  {
LABEL_62:
    v168 = 2654435761 * self->_isRawLastNowPlayingCoreDuet;
    if ((has & 0x8000) != 0)
      goto LABEL_63;
    goto LABEL_90;
  }
LABEL_89:
  v168 = 0;
  if ((has & 0x8000) != 0)
  {
LABEL_63:
    v167 = 2654435761 * self->_isRawMediaCategoryAudiobookSignal;
    if ((has & 0x10000) != 0)
      goto LABEL_64;
    goto LABEL_91;
  }
LABEL_90:
  v167 = 0;
  if ((has & 0x10000) != 0)
  {
LABEL_64:
    v166 = 2654435761 * self->_isRawMediaCategoryMusicSignal;
    if ((has & 0x20000) != 0)
      goto LABEL_65;
    goto LABEL_92;
  }
LABEL_91:
  v166 = 0;
  if ((has & 0x20000) != 0)
  {
LABEL_65:
    v165 = 2654435761 * self->_isRawMediaCategoryPodcastSignal;
    if ((has & 0x40000) != 0)
      goto LABEL_66;
    goto LABEL_93;
  }
LABEL_92:
  v165 = 0;
  if ((has & 0x40000) != 0)
  {
LABEL_66:
    v164 = 2654435761 * self->_isRawMediaCategoryRadioSignal;
    if ((has & 0x80000) != 0)
      goto LABEL_67;
    goto LABEL_94;
  }
LABEL_93:
  v164 = 0;
  if ((has & 0x80000) != 0)
  {
LABEL_67:
    v163 = 2654435761 * self->_isRawMediaCategoryVideoSignal;
    if ((has & 0x100000) != 0)
      goto LABEL_68;
    goto LABEL_95;
  }
LABEL_94:
  v163 = 0;
  if ((has & 0x100000) != 0)
  {
LABEL_68:
    v162 = 2654435761 * self->_rawMediaTypeUsageSignalBook;
    if ((has & 0x200000) != 0)
      goto LABEL_69;
    goto LABEL_96;
  }
LABEL_95:
  v162 = 0;
  if ((has & 0x200000) != 0)
  {
LABEL_69:
    v161 = 2654435761 * self->_rawMediaTypeUsageSignalMusic;
    if ((has & 0x400000) != 0)
      goto LABEL_70;
    goto LABEL_97;
  }
LABEL_96:
  v161 = 0;
  if ((has & 0x400000) != 0)
  {
LABEL_70:
    v160 = 2654435761 * self->_rawMediaTypeUsageSignalPodcast;
    if ((has & 0x800000) != 0)
      goto LABEL_71;
    goto LABEL_98;
  }
LABEL_97:
  v160 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_71:
    v159 = 2654435761 * self->_rawMediaTypeUsageSignalVideo;
    if ((has & 0x1000000) != 0)
      goto LABEL_72;
    goto LABEL_99;
  }
LABEL_98:
  v159 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_72:
    v158 = 2654435761 * self->_rawNowPlayingCountCoreDuet10Min;
    if ((has & 0x2000000) != 0)
      goto LABEL_73;
    goto LABEL_100;
  }
LABEL_99:
  v158 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_73:
    v157 = 2654435761 * self->_rawNowPlayingCountCoreDuet1Day;
    if ((has & 0x4000000) != 0)
      goto LABEL_74;
    goto LABEL_101;
  }
LABEL_100:
  v157 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_74:
    v156 = 2654435761 * self->_rawNowPlayingCountCoreDuet1Hr;
    if ((has & 0x8000000) != 0)
      goto LABEL_75;
    goto LABEL_102;
  }
LABEL_101:
  v156 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_75:
    v155 = 2654435761 * self->_rawNowPlayingCountCoreDuet28Day;
    if ((has & 0x10000000) != 0)
      goto LABEL_76;
    goto LABEL_103;
  }
LABEL_102:
  v155 = 0;
  if ((has & 0x10000000) != 0)
  {
LABEL_76:
    v154 = 2654435761 * self->_rawNowPlayingCountCoreDuet2Min;
    if ((has & 0x20000000) != 0)
      goto LABEL_77;
    goto LABEL_104;
  }
LABEL_103:
  v154 = 0;
  if ((has & 0x20000000) != 0)
  {
LABEL_77:
    v153 = 2654435761 * self->_rawNowPlayingCountCoreDuet6Hr;
    if ((has & 0x40000000) != 0)
      goto LABEL_78;
    goto LABEL_105;
  }
LABEL_104:
  v153 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_78:
    v152 = 2654435761 * self->_rawNowPlayingCountCoreDuet7Day;
    if ((has & 0x80000000) != 0)
      goto LABEL_79;
    goto LABEL_106;
  }
LABEL_105:
  v152 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_79:
    v151 = 2654435761 * self->_rawNowPlayingRecencyCD;
    if ((has & 0x100000000) != 0)
      goto LABEL_80;
    goto LABEL_107;
  }
LABEL_106:
  v151 = 0;
  if ((has & 0x100000000) != 0)
  {
LABEL_80:
    v150 = 2654435761 * self->_rawEntitySearchRecency;
    if ((has & 0x200000000) != 0)
      goto LABEL_81;
LABEL_108:
    v182 = 0;
    goto LABEL_112;
  }
LABEL_107:
  v150 = 0;
  if ((has & 0x200000000) == 0)
    goto LABEL_108;
LABEL_81:
  usageScoreBooks = self->_usageScoreBooks;
  v36 = -usageScoreBooks;
  if (usageScoreBooks >= 0.0)
    v36 = self->_usageScoreBooks;
  v37 = floor(v36 + 0.5);
  v38 = (v36 - v37) * 1.84467441e19;
  v39 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
  if (v38 >= 0.0)
  {
    v182 = v39;
    if (v38 <= 0.0)
      goto LABEL_112;
    v40 = v39 + (unint64_t)v38;
  }
  else
  {
    v40 = v39 - (unint64_t)fabs(v38);
  }
  v182 = v40;
LABEL_112:
  if ((has & 0x400000000) == 0)
  {
    v181 = 0;
    goto LABEL_121;
  }
  usageScoreMusic = self->_usageScoreMusic;
  v42 = -usageScoreMusic;
  if (usageScoreMusic >= 0.0)
    v42 = self->_usageScoreMusic;
  v43 = floor(v42 + 0.5);
  v44 = (v42 - v43) * 1.84467441e19;
  v45 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
  if (v44 >= 0.0)
  {
    v181 = v45;
    if (v44 <= 0.0)
      goto LABEL_121;
    v46 = v45 + (unint64_t)v44;
  }
  else
  {
    v46 = v45 - (unint64_t)fabs(v44);
  }
  v181 = v46;
LABEL_121:
  if ((has & 0x800000000) != 0)
  {
    usageScorePodcasts = self->_usageScorePodcasts;
    v49 = -usageScorePodcasts;
    if (usageScorePodcasts >= 0.0)
      v49 = self->_usageScorePodcasts;
    v50 = floor(v49 + 0.5);
    v51 = (v49 - v50) * 1.84467441e19;
    v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0)
        v47 += (unint64_t)v51;
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    v47 = 0;
  }
  v149 = v47;
  if ((has & 0x1000000000) != 0)
  {
    v148 = 2654435761 * self->_isAppFirstParty;
    if ((has & 0x2000000000) != 0)
    {
LABEL_131:
      v147 = 2654435761 * self->_isRequestedApp;
      if ((has & 0x4000000000) != 0)
        goto LABEL_132;
      goto LABEL_140;
    }
  }
  else
  {
    v148 = 0;
    if ((has & 0x2000000000) != 0)
      goto LABEL_131;
  }
  v147 = 0;
  if ((has & 0x4000000000) != 0)
  {
LABEL_132:
    v146 = 2654435761 * self->_isNowPlayingBundlePSE1;
    if ((has & 0x8000000000) != 0)
      goto LABEL_133;
LABEL_141:
    v145 = 0;
    if ((has & 0x10000000000) != 0)
      goto LABEL_134;
LABEL_142:
    v56 = 0;
    goto LABEL_145;
  }
LABEL_140:
  v146 = 0;
  if ((has & 0x8000000000) == 0)
    goto LABEL_141;
LABEL_133:
  v145 = 2654435761 * self->_isNowPlayingBundlePSE2;
  if ((has & 0x10000000000) == 0)
    goto LABEL_142;
LABEL_134:
  vq21Score = self->_vq21Score;
  v53 = -vq21Score;
  if (vq21Score >= 0.0)
    v53 = self->_vq21Score;
  v54 = floor(v53 + 0.5);
  v55 = (v53 - v54) * 1.84467441e19;
  v56 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
  if (v55 >= 0.0)
  {
    if (v55 > 0.0)
      v56 += (unint64_t)v55;
  }
  else
  {
    v56 -= (unint64_t)fabs(v55);
  }
LABEL_145:
  v144 = v56;
  if ((has & 0x20000000000) != 0)
  {
    v143 = 2654435761 * self->_isSupportedFlag;
    if ((has & 0x40000000000) != 0)
    {
LABEL_147:
      v142 = 2654435761 * self->_isUnicornFlag;
      if ((has & 0x80000000000) != 0)
        goto LABEL_148;
      goto LABEL_157;
    }
  }
  else
  {
    v143 = 0;
    if ((has & 0x40000000000) != 0)
      goto LABEL_147;
  }
  v142 = 0;
  if ((has & 0x80000000000) != 0)
  {
LABEL_148:
    v141 = 2654435761 * self->_isSupportedUnicornMatchFlag;
    if ((has & 0x100000000000) != 0)
      goto LABEL_149;
    goto LABEL_158;
  }
LABEL_157:
  v141 = 0;
  if ((has & 0x100000000000) != 0)
  {
LABEL_149:
    v140 = 2654435761 * self->_isDisambiguationSelectedApp;
    if ((has & 0x200000000000) != 0)
      goto LABEL_150;
    goto LABEL_159;
  }
LABEL_158:
  v140 = 0;
  if ((has & 0x200000000000) != 0)
  {
LABEL_150:
    v139 = 2654435761 * self->_isModelPredictedApp;
    if ((has & 0x400000000000) != 0)
      goto LABEL_151;
LABEL_160:
    v180 = 0;
    goto LABEL_164;
  }
LABEL_159:
  v139 = 0;
  if ((has & 0x400000000000) == 0)
    goto LABEL_160;
LABEL_151:
  usageScoreRadio = self->_usageScoreRadio;
  v58 = -usageScoreRadio;
  if (usageScoreRadio >= 0.0)
    v58 = self->_usageScoreRadio;
  v59 = floor(v58 + 0.5);
  v60 = (v58 - v59) * 1.84467441e19;
  v61 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
  if (v60 >= 0.0)
  {
    v180 = v61;
    if (v60 <= 0.0)
      goto LABEL_164;
    v62 = v61 + (unint64_t)v60;
  }
  else
  {
    v62 = v61 - (unint64_t)fabs(v60);
  }
  v180 = v62;
LABEL_164:
  if ((has & 0x800000000000) != 0)
  {
    usageScoreMusicWithoutRadio = self->_usageScoreMusicWithoutRadio;
    v65 = -usageScoreMusicWithoutRadio;
    if (usageScoreMusicWithoutRadio >= 0.0)
      v65 = self->_usageScoreMusicWithoutRadio;
    v66 = floor(v65 + 0.5);
    v67 = (v65 - v66) * 1.84467441e19;
    v63 = 2654435761u * (unint64_t)fmod(v66, 1.84467441e19);
    if (v67 >= 0.0)
    {
      if (v67 > 0.0)
        v63 += (unint64_t)v67;
    }
    else
    {
      v63 -= (unint64_t)fabs(v67);
    }
  }
  else
  {
    v63 = 0;
  }
  v138 = v63;
  if ((has & 0x1000000000000) != 0)
  {
    v137 = 2654435761 * self->_rawMediaTypeUsageSignalRadio;
    if ((has & 0x2000000000000) != 0)
    {
LABEL_174:
      v136 = 2654435761 * self->_rawMediaTypeUsageSignalMusicWithoutRadio;
      if ((has & 0x4000000000000) != 0)
        goto LABEL_175;
      goto LABEL_184;
    }
  }
  else
  {
    v137 = 0;
    if ((has & 0x2000000000000) != 0)
      goto LABEL_174;
  }
  v136 = 0;
  if ((has & 0x4000000000000) != 0)
  {
LABEL_175:
    v135 = 2654435761 * self->_subscriptionStatus;
    if ((has & 0x8000000000000) != 0)
      goto LABEL_176;
    goto LABEL_185;
  }
LABEL_184:
  v135 = 0;
  if ((has & 0x8000000000000) != 0)
  {
LABEL_176:
    v134 = 2654435761 * self->_isRawNowPlayingBundle;
    if ((has & 0x10000000000000) != 0)
      goto LABEL_177;
    goto LABEL_186;
  }
LABEL_185:
  v134 = 0;
  if ((has & 0x10000000000000) != 0)
  {
LABEL_177:
    v133 = 2654435761 * self->_rawNowPlayingTotal;
    if ((has & 0x20000000000000) != 0)
      goto LABEL_178;
LABEL_187:
    v179 = 0;
    goto LABEL_191;
  }
LABEL_186:
  v133 = 0;
  if ((has & 0x20000000000000) == 0)
    goto LABEL_187;
LABEL_178:
  rawNowPlayingBundleScore = self->_rawNowPlayingBundleScore;
  v69 = -rawNowPlayingBundleScore;
  if (rawNowPlayingBundleScore >= 0.0)
    v69 = self->_rawNowPlayingBundleScore;
  v70 = floor(v69 + 0.5);
  v71 = (v69 - v70) * 1.84467441e19;
  v72 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
  if (v71 >= 0.0)
  {
    v179 = v72;
    if (v71 <= 0.0)
      goto LABEL_191;
    v73 = v72 + (unint64_t)v71;
  }
  else
  {
    v73 = v72 - (unint64_t)fabs(v71);
  }
  v179 = v73;
LABEL_191:
  if ((has & 0x40000000000000) != 0)
  {
    isRawLastNowPlaying = self->_isRawLastNowPlaying;
    v76 = -isRawLastNowPlaying;
    if (isRawLastNowPlaying >= 0.0)
      v76 = self->_isRawLastNowPlaying;
    v77 = floor(v76 + 0.5);
    v78 = (v76 - v77) * 1.84467441e19;
    v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0)
        v74 += (unint64_t)v78;
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    v74 = 0;
  }
  v132 = v74;
  if ((has & 0x80000000000000) != 0)
  {
    v131 = 2654435761 * self->_rawNowPlaying2Minutes;
    if ((has & 0x100000000000000) != 0)
    {
LABEL_201:
      v130 = 2654435761 * self->_rawNowPlaying10Minutes;
      if ((has & 0x200000000000000) != 0)
        goto LABEL_202;
      goto LABEL_212;
    }
  }
  else
  {
    v131 = 0;
    if ((has & 0x100000000000000) != 0)
      goto LABEL_201;
  }
  v130 = 0;
  if ((has & 0x200000000000000) != 0)
  {
LABEL_202:
    v129 = 2654435761 * self->_rawNowPlaying1Hour;
    if ((has & 0x400000000000000) != 0)
      goto LABEL_203;
    goto LABEL_213;
  }
LABEL_212:
  v129 = 0;
  if ((has & 0x400000000000000) != 0)
  {
LABEL_203:
    v128 = 2654435761 * self->_rawNowPlaying6Hours;
    if ((has & 0x800000000000000) != 0)
      goto LABEL_204;
    goto LABEL_214;
  }
LABEL_213:
  v128 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_204:
    v127 = 2654435761 * self->_rawNowPlaying1Day;
    if ((has & 0x1000000000000000) != 0)
      goto LABEL_205;
    goto LABEL_215;
  }
LABEL_214:
  v127 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_205:
    v126 = 2654435761 * self->_rawNowPlaying7Days;
    if ((has & 0x2000000000000000) != 0)
      goto LABEL_206;
    goto LABEL_216;
  }
LABEL_215:
  v126 = 0;
  if ((has & 0x2000000000000000) != 0)
  {
LABEL_206:
    v125 = 2654435761 * self->_rawNowPlaying28Days;
    if ((has & 0x4000000000000000) != 0)
      goto LABEL_207;
    goto LABEL_217;
  }
LABEL_216:
  v125 = 0;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_207:
    v124 = 2654435761 * self->_rawLastNowPlayingRecency;
    if (has < 0)
      goto LABEL_208;
LABEL_218:
    v123 = 0;
    if ((v3 & 1) != 0)
      goto LABEL_209;
    goto LABEL_219;
  }
LABEL_217:
  v124 = 0;
  if ((has & 0x8000000000000000) == 0)
    goto LABEL_218;
LABEL_208:
  v123 = 2654435761 * self->_commonForegroundBundleApp;
  if ((v3 & 1) != 0)
  {
LABEL_209:
    v122 = 2654435761 * self->_isRawLastNowPlayingBoolean;
    goto LABEL_220;
  }
LABEL_219:
  v122 = 0;
LABEL_220:
  v177 = v9;
  if ((v3 & 2) == 0)
  {
    v121 = 0;
    if ((v3 & 4) != 0)
      goto LABEL_222;
LABEL_228:
    v120 = 0;
    if ((v3 & 8) != 0)
      goto LABEL_223;
LABEL_229:
    v83 = 0;
    goto LABEL_232;
  }
  v121 = 2654435761 * self->_isCommonForegroundApp;
  if ((v3 & 4) == 0)
    goto LABEL_228;
LABEL_222:
  v120 = 2654435761 * self->_isBoltEnabled;
  if ((v3 & 8) == 0)
    goto LABEL_229;
LABEL_223:
  usageScoreMusicWithoutRadioRemote = self->_usageScoreMusicWithoutRadioRemote;
  v80 = -usageScoreMusicWithoutRadioRemote;
  if (usageScoreMusicWithoutRadioRemote >= 0.0)
    v80 = self->_usageScoreMusicWithoutRadioRemote;
  v81 = floor(v80 + 0.5);
  v82 = (v80 - v81) * 1.84467441e19;
  v83 = 2654435761u * (unint64_t)fmod(v81, 1.84467441e19);
  if (v82 >= 0.0)
  {
    if (v82 > 0.0)
      v83 += (unint64_t)v82;
  }
  else
  {
    v83 -= (unint64_t)fabs(v82);
  }
LABEL_232:
  v173 = v29;
  if ((v3 & 0x10) != 0)
  {
    usageScoreBooksRemote = self->_usageScoreBooksRemote;
    v86 = -usageScoreBooksRemote;
    if (usageScoreBooksRemote >= 0.0)
      v86 = self->_usageScoreBooksRemote;
    v87 = floor(v86 + 0.5);
    v88 = (v86 - v87) * 1.84467441e19;
    v84 = 2654435761u * (unint64_t)fmod(v87, 1.84467441e19);
    if (v88 >= 0.0)
    {
      if (v88 > 0.0)
        v84 += (unint64_t)v88;
    }
    else
    {
      v84 -= (unint64_t)fabs(v88);
    }
  }
  else
  {
    v84 = 0;
  }
  v119 = v83;
  if ((v3 & 0x20) != 0)
  {
    usageScoreRadioRemote = self->_usageScoreRadioRemote;
    v91 = -usageScoreRadioRemote;
    if (usageScoreRadioRemote >= 0.0)
      v91 = self->_usageScoreRadioRemote;
    v92 = floor(v91 + 0.5);
    v93 = (v91 - v92) * 1.84467441e19;
    v89 = 2654435761u * (unint64_t)fmod(v92, 1.84467441e19);
    if (v93 >= 0.0)
    {
      if (v93 > 0.0)
        v89 += (unint64_t)v93;
    }
    else
    {
      v89 -= (unint64_t)fabs(v93);
    }
  }
  else
  {
    v89 = 0;
  }
  v118 = v84;
  v94 = v30;
  v95 = v20;
  if ((v3 & 0x40) != 0)
  {
    usageScorePodcastsRemote = self->_usageScorePodcastsRemote;
    v99 = -usageScorePodcastsRemote;
    if (usageScorePodcastsRemote >= 0.0)
      v99 = self->_usageScorePodcastsRemote;
    v100 = floor(v99 + 0.5);
    v101 = (v99 - v100) * 1.84467441e19;
    v97 = 2654435761u * (unint64_t)fmod(v100, 1.84467441e19);
    v96 = v15;
    if (v101 >= 0.0)
    {
      if (v101 > 0.0)
        v97 += (unint64_t)v101;
    }
    else
    {
      v97 -= (unint64_t)fabs(v101);
    }
  }
  else
  {
    v96 = v15;
    v97 = 0;
  }
  v102 = v10;
  if ((v3 & 0x80) != 0)
  {
    entitySearchBundleScoreRemote = self->_entitySearchBundleScoreRemote;
    v105 = -entitySearchBundleScoreRemote;
    if (entitySearchBundleScoreRemote >= 0.0)
      v105 = self->_entitySearchBundleScoreRemote;
    v106 = floor(v105 + 0.5);
    v107 = (v105 - v106) * 1.84467441e19;
    v103 = 2654435761u * (unint64_t)fmod(v106, 1.84467441e19);
    if (v107 >= 0.0)
    {
      if (v107 > 0.0)
        v103 += (unint64_t)v107;
    }
    else
    {
      v103 -= (unint64_t)fabs(v107);
    }
  }
  else
  {
    v103 = 0;
  }
  if ((v3 & 0x100) == 0)
  {
    v108 = 0;
LABEL_270:
    v114 = v181;
    v113 = v182;
    v116 = v179;
    v115 = v180;
    return v177 ^ v178 ^ v102 ^ v96 ^ v95 ^ v176 ^ v175 ^ v174 ^ v173 ^ v94 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v113 ^ v114 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v115 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v116 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v89 ^ v97 ^ v103 ^ v108;
  }
  usageScoreMusicRemote = self->_usageScoreMusicRemote;
  v110 = -usageScoreMusicRemote;
  if (usageScoreMusicRemote >= 0.0)
    v110 = self->_usageScoreMusicRemote;
  v111 = floor(v110 + 0.5);
  v112 = (v110 - v111) * 1.84467441e19;
  v108 = 2654435761u * (unint64_t)fmod(v111, 1.84467441e19);
  if (v112 < 0.0)
  {
    v108 -= (unint64_t)fabs(v112);
    goto LABEL_270;
  }
  v114 = v181;
  v113 = v182;
  v116 = v179;
  v115 = v180;
  if (v112 > 0.0)
    v108 += (unint64_t)v112;
  return v177 ^ v178 ^ v102 ^ v96 ^ v95 ^ v176 ^ v175 ^ v174 ^ v173 ^ v94 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v113 ^ v114 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v115 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v116 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v89 ^ v97 ^ v103 ^ v108;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t has;
  void *v5;
  __int16 v6;
  void *v7;
  void *v8;
  id v9;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  const __CFString *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (uint64_t)self->_has;
  if (has < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals commonForegroundBundleApp](self, "commonForegroundBundleApp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commonForegroundBundleApp"));

    has = (uint64_t)self->_has;
  }
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 2) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals compoundActiveBundleScore](self, "compoundActiveBundleScore");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("compoundActiveBundleScore"));

    has = (uint64_t)self->_has;
    v6 = *((_WORD *)&self->_has + 4);
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_79;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals compoundMediaTypeBundleScore](self, "compoundMediaTypeBundleScore");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("compoundMediaTypeBundleScore"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_80;
  }
LABEL_79:
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals entitySearchBundleRecencyS](self, "entitySearchBundleRecencyS");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("entitySearchBundleRecencyS"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_81;
  }
LABEL_80:
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals entitySearchBundleScore](self, "entitySearchBundleScore");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("entitySearchBundleScore"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x1000000000) == 0)
      goto LABEL_9;
    goto LABEL_82;
  }
LABEL_81:
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals entitySearchBundleScoreRemote](self, "entitySearchBundleScoreRemote");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("entitySearchBundleScoreRemote"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000) == 0)
  {
LABEL_9:
    if ((v6 & 4) == 0)
      goto LABEL_10;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isAppFirstParty](self, "isAppFirstParty"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isAppFirstParty"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isBoltEnabled](self, "isBoltEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("isBoltEnabled"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isClientForegroundActiveBundle](self, "isClientForegroundActiveBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isClientForegroundActiveBundle"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x100000000000) == 0)
      goto LABEL_13;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isCommonForegroundApp](self, "isCommonForegroundApp"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isCommonForegroundApp"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isDisambiguationSelectedApp](self, "isDisambiguationSelectedApp"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("isDisambiguationSelectedApp"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x200000000000) == 0)
      goto LABEL_15;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isForegroundBundle](self, "isForegroundBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("isForegroundBundle"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000000) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isModelPredictedApp](self, "isModelPredictedApp"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("isModelPredictedApp"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40) == 0)
  {
LABEL_16:
    if ((has & 0x4000000000) == 0)
      goto LABEL_17;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isNowPlayingBundle](self, "isNowPlayingBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("isNowPlayingBundle"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000) == 0)
  {
LABEL_17:
    if ((has & 0x8000000000) == 0)
      goto LABEL_18;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isNowPlayingBundlePSE1](self, "isNowPlayingBundlePSE1"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("isNowPlayingBundlePSE1"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000000) == 0)
  {
LABEL_18:
    if ((has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isNowPlayingBundlePSE2](self, "isNowPlayingBundlePSE2"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isNowPlayingBundlePSE2"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400) == 0)
  {
LABEL_19:
    if ((has & 0x40000000000000) == 0)
      goto LABEL_20;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isNowPlayingLastBundle](self, "isNowPlayingLastBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("isNowPlayingLastBundle"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_20:
    if ((v6 & 1) == 0)
      goto LABEL_21;
    goto LABEL_94;
  }
LABEL_93:
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawLastNowPlaying](self, "isRawLastNowPlaying");
  objc_msgSend(v32, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isRawLastNowPlaying"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 1) == 0)
  {
LABEL_21:
    if ((has & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawLastNowPlayingBoolean](self, "isRawLastNowPlayingBoolean"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isRawLastNowPlayingBoolean"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000) == 0)
  {
LABEL_22:
    if ((has & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawLastNowPlayingCoreDuet](self, "isRawLastNowPlayingCoreDuet"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("isRawLastNowPlayingCoreDuet"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000) == 0)
  {
LABEL_23:
    if ((has & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryAudiobookSignal](self, "isRawMediaCategoryAudiobookSignal"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("isRawMediaCategoryAudiobookSignal"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000) == 0)
  {
LABEL_24:
    if ((has & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryMusicSignal](self, "isRawMediaCategoryMusicSignal"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("isRawMediaCategoryMusicSignal"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000) == 0)
  {
LABEL_25:
    if ((has & 0x40000) == 0)
      goto LABEL_26;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryPodcastSignal](self, "isRawMediaCategoryPodcastSignal"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("isRawMediaCategoryPodcastSignal"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000) == 0)
  {
LABEL_26:
    if ((has & 0x80000) == 0)
      goto LABEL_27;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryRadioSignal](self, "isRawMediaCategoryRadioSignal"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("isRawMediaCategoryRadioSignal"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000) == 0)
  {
LABEL_27:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_28;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryVideoSignal](self, "isRawMediaCategoryVideoSignal"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("isRawMediaCategoryVideoSignal"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_28:
    if ((has & 0x2000000000) == 0)
      goto LABEL_29;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawNowPlayingBundle](self, "isRawNowPlayingBundle"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("isRawNowPlayingBundle"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000) == 0)
  {
LABEL_29:
    if ((has & 0x20000000000) == 0)
      goto LABEL_30;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRequestedApp](self, "isRequestedApp"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("isRequestedApp"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000000) == 0)
  {
LABEL_30:
    if ((has & 0x80000000000) == 0)
      goto LABEL_31;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isSupportedFlag](self, "isSupportedFlag"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("isSupportedFlag"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000000) == 0)
  {
LABEL_31:
    if ((has & 0x40000000000) == 0)
      goto LABEL_32;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isSupportedUnicornMatchFlag](self, "isSupportedUnicornMatchFlag"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("isSupportedUnicornMatchFlag"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000000) == 0)
  {
LABEL_32:
    if ((has & 0x80) == 0)
      goto LABEL_33;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isUnicornFlag](self, "isUnicornFlag"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("isUnicornFlag"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80) == 0)
  {
LABEL_33:
    if ((has & 0x100) == 0)
      goto LABEL_34;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingBundleCount](self, "nowPlayingBundleCount"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("nowPlayingBundleCount"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100) == 0)
  {
LABEL_34:
    if ((has & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_108;
  }
LABEL_107:
  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingBundleRecencyS](self, "nowPlayingBundleRecencyS");
  objc_msgSend(v47, "numberWithDouble:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("nowPlayingBundleRecencyS"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200) == 0)
  {
LABEL_35:
    if ((has & 0x2000) == 0)
      goto LABEL_36;
    goto LABEL_109;
  }
LABEL_108:
  v49 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingBundleScore](self, "nowPlayingBundleScore");
  objc_msgSend(v49, "numberWithDouble:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("nowPlayingBundleScore"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000) == 0)
  {
LABEL_36:
    if ((has & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingUsage14Days](self, "nowPlayingUsage14Days"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("nowPlayingUsage14Days"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800) == 0)
  {
LABEL_37:
    if ((has & 0x1000) == 0)
      goto LABEL_38;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingUsage1Day](self, "nowPlayingUsage1Day"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("nowPlayingUsage1Day"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000) == 0)
  {
LABEL_38:
    if ((has & 0x100000000) == 0)
      goto LABEL_39;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingUsage7Days](self, "nowPlayingUsage7Days"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("nowPlayingUsage7Days"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000) == 0)
  {
LABEL_39:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_40;
    goto LABEL_113;
  }
LABEL_112:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawEntitySearchRecency](self, "rawEntitySearchRecency"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("rawEntitySearchRecency"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_40:
    if ((has & 0x100000) == 0)
      goto LABEL_41;
    goto LABEL_114;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawLastNowPlayingRecency](self, "rawLastNowPlayingRecency"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("rawLastNowPlayingRecency"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000) == 0)
  {
LABEL_41:
    if ((has & 0x200000) == 0)
      goto LABEL_42;
    goto LABEL_115;
  }
LABEL_114:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalBook](self, "rawMediaTypeUsageSignalBook"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("rawMediaTypeUsageSignalBook"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000) == 0)
  {
LABEL_42:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_43;
    goto LABEL_116;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalMusic](self, "rawMediaTypeUsageSignalMusic"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("rawMediaTypeUsageSignalMusic"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_43:
    if ((has & 0x400000) == 0)
      goto LABEL_44;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalMusicWithoutRadio](self, "rawMediaTypeUsageSignalMusicWithoutRadio"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("rawMediaTypeUsageSignalMusicWithoutRadio"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000) == 0)
  {
LABEL_44:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_45;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalPodcast](self, "rawMediaTypeUsageSignalPodcast"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("rawMediaTypeUsageSignalPodcast"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_45:
    if ((has & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalRadio](self, "rawMediaTypeUsageSignalRadio"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("rawMediaTypeUsageSignalRadio"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000) == 0)
  {
LABEL_46:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_47;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalVideo](self, "rawMediaTypeUsageSignalVideo"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("rawMediaTypeUsageSignalVideo"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_47:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_48;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying10Minutes](self, "rawNowPlaying10Minutes"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("rawNowPlaying10Minutes"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_48:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_49;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying1Day](self, "rawNowPlaying1Day"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("rawNowPlaying1Day"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_49:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_50;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying1Hour](self, "rawNowPlaying1Hour"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("rawNowPlaying1Hour"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x80000000000000) == 0)
      goto LABEL_51;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying28Days](self, "rawNowPlaying28Days"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("rawNowPlaying28Days"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x400000000000000) == 0)
      goto LABEL_52;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying2Minutes](self, "rawNowPlaying2Minutes"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("rawNowPlaying2Minutes"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_53;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying6Hours](self, "rawNowPlaying6Hours"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("rawNowPlaying6Hours"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_53:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_54;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying7Days](self, "rawNowPlaying7Days"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("rawNowPlaying7Days"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x1000000) == 0)
      goto LABEL_55;
    goto LABEL_128;
  }
LABEL_127:
  v69 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingBundleScore](self, "rawNowPlayingBundleScore");
  objc_msgSend(v69, "numberWithDouble:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("rawNowPlayingBundleScore"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000) == 0)
  {
LABEL_55:
    if ((has & 0x2000000) == 0)
      goto LABEL_56;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet10Min](self, "rawNowPlayingCountCoreDuet10Min"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("rawNowPlayingCountCoreDuet10Min"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000) == 0)
      goto LABEL_57;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet1Day](self, "rawNowPlayingCountCoreDuet1Day"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("rawNowPlayingCountCoreDuet1Day"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000) == 0)
  {
LABEL_57:
    if ((has & 0x8000000) == 0)
      goto LABEL_58;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet1Hr](self, "rawNowPlayingCountCoreDuet1Hr"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("rawNowPlayingCountCoreDuet1Hr"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000) == 0)
      goto LABEL_59;
    goto LABEL_132;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet28Day](self, "rawNowPlayingCountCoreDuet28Day"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("rawNowPlayingCountCoreDuet28Day"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000) == 0)
  {
LABEL_59:
    if ((has & 0x20000000) == 0)
      goto LABEL_60;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet2Min](self, "rawNowPlayingCountCoreDuet2Min"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("rawNowPlayingCountCoreDuet2Min"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000) == 0)
  {
LABEL_60:
    if ((has & 0x40000000) == 0)
      goto LABEL_61;
    goto LABEL_134;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet6Hr](self, "rawNowPlayingCountCoreDuet6Hr"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("rawNowPlayingCountCoreDuet6Hr"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000) == 0)
  {
LABEL_61:
    if ((has & 0x80000000) == 0)
      goto LABEL_62;
    goto LABEL_135;
  }
LABEL_134:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet7Day](self, "rawNowPlayingCountCoreDuet7Day"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("rawNowPlayingCountCoreDuet7Day"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000) == 0)
  {
LABEL_62:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_63;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingRecencyCD](self, "rawNowPlayingRecencyCD"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("rawNowPlayingRecencyCD"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_63:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_64;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingTotal](self, "rawNowPlayingTotal"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("rawNowPlayingTotal"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_64:
    if ((has & 0x200000000) == 0)
      goto LABEL_65;
    goto LABEL_143;
  }
LABEL_137:
  v80 = -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals subscriptionStatus](self, "subscriptionStatus");
  v81 = CFSTR("INFERENCEMEDIASUBSCRIPTIONSTATUS_UNKNOWN");
  if (v80 == 1)
    v81 = CFSTR("INFERENCEMEDIASUBSCRIPTIONSTATUS_NOT_SUBSCRIBED");
  if (v80 == 2)
    v82 = CFSTR("INFERENCEMEDIASUBSCRIPTIONSTATUS_SUBSCRIBED");
  else
    v82 = v81;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("subscriptionStatus"));
  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000) == 0)
  {
LABEL_65:
    if ((v6 & 0x10) == 0)
      goto LABEL_66;
    goto LABEL_144;
  }
LABEL_143:
  v83 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScoreBooks](self, "usageScoreBooks");
  objc_msgSend(v83, "numberWithDouble:");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("usageScoreBooks"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x10) == 0)
  {
LABEL_66:
    if ((has & 0x400000000) == 0)
      goto LABEL_67;
    goto LABEL_145;
  }
LABEL_144:
  v85 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScoreBooksRemote](self, "usageScoreBooksRemote");
  objc_msgSend(v85, "numberWithDouble:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("usageScoreBooksRemote"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000) == 0)
  {
LABEL_67:
    if ((v6 & 0x100) == 0)
      goto LABEL_68;
    goto LABEL_146;
  }
LABEL_145:
  v87 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScoreMusic](self, "usageScoreMusic");
  objc_msgSend(v87, "numberWithDouble:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("usageScoreMusic"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x100) == 0)
  {
LABEL_68:
    if ((has & 0x800000000000) == 0)
      goto LABEL_69;
    goto LABEL_147;
  }
LABEL_146:
  v89 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScoreMusicRemote](self, "usageScoreMusicRemote");
  objc_msgSend(v89, "numberWithDouble:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("usageScoreMusicRemote"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000000) == 0)
  {
LABEL_69:
    if ((v6 & 8) == 0)
      goto LABEL_70;
    goto LABEL_148;
  }
LABEL_147:
  v91 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScoreMusicWithoutRadio](self, "usageScoreMusicWithoutRadio");
  objc_msgSend(v91, "numberWithDouble:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("usageScoreMusicWithoutRadio"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 8) == 0)
  {
LABEL_70:
    if ((has & 0x800000000) == 0)
      goto LABEL_71;
    goto LABEL_149;
  }
LABEL_148:
  v93 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScoreMusicWithoutRadioRemote](self, "usageScoreMusicWithoutRadioRemote");
  objc_msgSend(v93, "numberWithDouble:");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("usageScoreMusicWithoutRadioRemote"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000) == 0)
  {
LABEL_71:
    if ((v6 & 0x40) == 0)
      goto LABEL_72;
    goto LABEL_150;
  }
LABEL_149:
  v95 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScorePodcasts](self, "usageScorePodcasts");
  objc_msgSend(v95, "numberWithDouble:");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("usageScorePodcasts"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x40) == 0)
  {
LABEL_72:
    if ((has & 0x400000000000) == 0)
      goto LABEL_73;
    goto LABEL_151;
  }
LABEL_150:
  v97 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScorePodcastsRemote](self, "usageScorePodcastsRemote");
  objc_msgSend(v97, "numberWithDouble:");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("usageScorePodcastsRemote"));

  has = (uint64_t)self->_has;
  v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000000) == 0)
  {
LABEL_73:
    if ((v6 & 0x20) == 0)
      goto LABEL_74;
LABEL_152:
    v101 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScoreRadioRemote](self, "usageScoreRadioRemote");
    objc_msgSend(v101, "numberWithDouble:");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("usageScoreRadioRemote"));

    if ((*(_QWORD *)&self->_has & 0x10000000000) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_151:
  v99 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals usageScoreRadio](self, "usageScoreRadio");
  objc_msgSend(v99, "numberWithDouble:");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("usageScoreRadio"));

  has = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
    goto LABEL_152;
LABEL_74:
  if ((has & 0x10000000000) != 0)
  {
LABEL_75:
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals vq21Score](self, "vq21Score");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("vq21Score"));

  }
LABEL_76:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v9 = v3;

  return v9;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEMusicTrainingDependentSignals)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEMusicTrainingDependentSignals *v5;
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
    self = -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEMusicTrainingDependentSignals)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEMusicTrainingDependentSignals *v5;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  INFERENCESchemaINFERENCEMusicTrainingDependentSignals *v89;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  objc_super v157;

  v4 = a3;
  v157.receiver = self;
  v157.super_class = (Class)INFERENCESchemaINFERENCEMusicTrainingDependentSignals;
  v5 = -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals init](&v157, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isClientForegroundActiveBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsClientForegroundActiveBundle:](v5, "setIsClientForegroundActiveBundle:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compoundActiveBundleScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCompoundActiveBundleScore:](v5, "setCompoundActiveBundleScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compoundMediaTypeBundleScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCompoundMediaTypeBundleScore:](v5, "setCompoundMediaTypeBundleScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySearchBundleRecencyS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleRecencyS:](v5, "setEntitySearchBundleRecencyS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySearchBundleScore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleScore:](v5, "setEntitySearchBundleScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isForegroundBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsForegroundBundle:](v5, "setIsForegroundBundle:", objc_msgSend(v11, "BOOLValue"));
    v123 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNowPlayingBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundle:](v5, "setIsNowPlayingBundle:", objc_msgSend(v12, "BOOLValue"));
    v117 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingBundleCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v156 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleCount:](v5, "setNowPlayingBundleCount:", objc_msgSend(v13, "intValue"));
    v122 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingBundleRecencyS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleRecencyS:](v5, "setNowPlayingBundleRecencyS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingBundleScore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v155 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleScore:](v5, "setNowPlayingBundleScore:");
    }
    v121 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNowPlayingLastBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingLastBundle:](v5, "setIsNowPlayingLastBundle:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingUsage1Day"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v154 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage1Day:](v5, "setNowPlayingUsage1Day:", objc_msgSend(v17, "intValue"));
    v120 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingUsage7Days"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage7Days:](v5, "setNowPlayingUsage7Days:", objc_msgSend(v18, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nowPlayingUsage14Days"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v153 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage14Days:](v5, "setNowPlayingUsage14Days:", objc_msgSend(v19, "intValue"));
    v20 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawLastNowPlayingCoreDuet"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlayingCoreDuet:](v5, "setIsRawLastNowPlayingCoreDuet:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryAudiobookSignal"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v152 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryAudiobookSignal:](v5, "setIsRawMediaCategoryAudiobookSignal:", objc_msgSend(v22, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryMusicSignal"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryMusicSignal:](v5, "setIsRawMediaCategoryMusicSignal:", objc_msgSend(v23, "BOOLValue"));
    v112 = v23;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryPodcastSignal"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v151 = v24;
    v119 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryPodcastSignal:](v5, "setIsRawMediaCategoryPodcastSignal:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryRadioSignal"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v150 = v25;
    v118 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryRadioSignal:](v5, "setIsRawMediaCategoryRadioSignal:", objc_msgSend(v25, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawMediaCategoryVideoSignal"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryVideoSignal:](v5, "setIsRawMediaCategoryVideoSignal:", objc_msgSend(v26, "BOOLValue"));
    v111 = v26;
    v27 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalBook"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v149 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalBook:](v5, "setRawMediaTypeUsageSignalBook:", objc_msgSend(v28, "intValue"));
    v29 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalMusic"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalMusic:](v5, "setRawMediaTypeUsageSignalMusic:", objc_msgSend(v30, "intValue"));
    v110 = v30;
    v31 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalPodcast"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v148 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalPodcast:](v5, "setRawMediaTypeUsageSignalPodcast:", objc_msgSend(v32, "intValue"));
    v33 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalVideo"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalVideo:](v5, "setRawMediaTypeUsageSignalVideo:", objc_msgSend(v34, "intValue"));
    v109 = v34;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet10Min"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v147 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet10Min:](v5, "setRawNowPlayingCountCoreDuet10Min:", objc_msgSend(v35, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet1Day"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet1Day:](v5, "setRawNowPlayingCountCoreDuet1Day:", objc_msgSend(v36, "intValue"));
    v108 = v36;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet1Hr"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v146 = v37;
    v116 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet1Hr:](v5, "setRawNowPlayingCountCoreDuet1Hr:", objc_msgSend(v37, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet28Day"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v145 = v38;
    v115 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet28Day:](v5, "setRawNowPlayingCountCoreDuet28Day:", objc_msgSend(v38, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet2Min"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v144 = v39;
    v114 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet2Min:](v5, "setRawNowPlayingCountCoreDuet2Min:", objc_msgSend(v39, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet6Hr"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v143 = v40;
    v113 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet6Hr:](v5, "setRawNowPlayingCountCoreDuet6Hr:", objc_msgSend(v40, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingCountCoreDuet7Day"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet7Day:](v5, "setRawNowPlayingCountCoreDuet7Day:", objc_msgSend(v41, "intValue"));
    v107 = v41;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingRecencyCD"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v142 = v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingRecencyCD:](v5, "setRawNowPlayingRecencyCD:", objc_msgSend(v42, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawEntitySearchRecency"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawEntitySearchRecency:](v5, "setRawEntitySearchRecency:", objc_msgSend(v43, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScoreBooks"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v141 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v44, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreBooks:](v5, "setUsageScoreBooks:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScoreMusic"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v45, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusic:](v5, "setUsageScoreMusic:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScorePodcasts"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v140 = v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v46, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScorePodcasts:](v5, "setUsageScorePodcasts:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAppFirstParty"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsAppFirstParty:](v5, "setIsAppFirstParty:", objc_msgSend(v47, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRequestedApp"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v139 = v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRequestedApp:](v5, "setIsRequestedApp:", objc_msgSend(v48, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNowPlayingBundlePSE1"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundlePSE1:](v5, "setIsNowPlayingBundlePSE1:", objc_msgSend(v49, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNowPlayingBundlePSE2"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v138 = v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundlePSE2:](v5, "setIsNowPlayingBundlePSE2:", objc_msgSend(v50, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vq21Score"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v51, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setVq21Score:](v5, "setVq21Score:");
    }
    v102 = v51;
    v52 = v49;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSupportedFlag"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v137 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsSupportedFlag:](v5, "setIsSupportedFlag:", objc_msgSend(v53, "BOOLValue"));
    v54 = v47;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isUnicornFlag"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsUnicornFlag:](v5, "setIsUnicornFlag:", objc_msgSend(v55, "BOOLValue"));
    v101 = v55;
    v56 = v45;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSupportedUnicornMatchFlag"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v136 = v57;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsSupportedUnicornMatchFlag:](v5, "setIsSupportedUnicornMatchFlag:", objc_msgSend(v57, "BOOLValue"));
    v58 = v43;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDisambiguationSelectedApp"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsDisambiguationSelectedApp:](v5, "setIsDisambiguationSelectedApp:", objc_msgSend(v59, "BOOLValue"));
    v100 = v59;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isModelPredictedApp"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v135 = v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsModelPredictedApp:](v5, "setIsModelPredictedApp:", objc_msgSend(v60, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScoreRadio"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v61, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreRadio:](v5, "setUsageScoreRadio:");
    }
    v99 = v61;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScoreMusicWithoutRadio"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v134 = v62;
    v106 = v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v62, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusicWithoutRadio:](v5, "setUsageScoreMusicWithoutRadio:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalRadio"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v133 = v63;
    v105 = v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalRadio:](v5, "setRawMediaTypeUsageSignalRadio:", objc_msgSend(v63, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawMediaTypeUsageSignalMusicWithoutRadio"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v132 = v64;
    v104 = v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalMusicWithoutRadio:](v5, "setRawMediaTypeUsageSignalMusicWithoutRadio:", objc_msgSend(v64, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscriptionStatus"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v131 = v65;
    v103 = v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setSubscriptionStatus:](v5, "setSubscriptionStatus:", objc_msgSend(v65, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawNowPlayingBundle"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawNowPlayingBundle:](v5, "setIsRawNowPlayingBundle:", objc_msgSend(v66, "BOOLValue"));
    v98 = v66;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingTotal"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v130 = v67;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingTotal:](v5, "setRawNowPlayingTotal:", objc_msgSend(v67, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlayingBundleScore"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v68, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingBundleScore:](v5, "setRawNowPlayingBundleScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawLastNowPlaying"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v129 = v69;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v69, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlaying:](v5, "setIsRawLastNowPlaying:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlaying2Minutes"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying2Minutes:](v5, "setRawNowPlaying2Minutes:", objc_msgSend(v70, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlaying10Minutes"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v128 = v71;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying10Minutes:](v5, "setRawNowPlaying10Minutes:", objc_msgSend(v71, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlaying1Hour"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying1Hour:](v5, "setRawNowPlaying1Hour:", objc_msgSend(v72, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlaying6Hours"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v127 = v73;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying6Hours:](v5, "setRawNowPlaying6Hours:", objc_msgSend(v73, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlaying1Day"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying1Day:](v5, "setRawNowPlaying1Day:", objc_msgSend(v74, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlaying7Days"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v126 = v75;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying7Days:](v5, "setRawNowPlaying7Days:", objc_msgSend(v75, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawNowPlaying28Days"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying28Days:](v5, "setRawNowPlaying28Days:", objc_msgSend(v76, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawLastNowPlayingRecency"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v125 = v77;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawLastNowPlayingRecency:](v5, "setRawLastNowPlayingRecency:", objc_msgSend(v77, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonForegroundBundleApp"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCommonForegroundBundleApp:](v5, "setCommonForegroundBundleApp:", objc_msgSend(v78, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRawLastNowPlayingBoolean"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v124 = v79;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlayingBoolean:](v5, "setIsRawLastNowPlayingBoolean:", objc_msgSend(v79, "BOOLValue"));
    v96 = v70;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommonForegroundApp"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsCommonForegroundApp:](v5, "setIsCommonForegroundApp:", objc_msgSend(v80, "BOOLValue"));
    v91 = v80;
    v95 = v72;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBoltEnabled"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsBoltEnabled:](v5, "setIsBoltEnabled:", objc_msgSend(v82, "BOOLValue"));
    v94 = v74;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScoreMusicWithoutRadioRemote"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v83, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusicWithoutRadioRemote:](v5, "setUsageScoreMusicWithoutRadioRemote:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScoreBooksRemote"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v84, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreBooksRemote:](v5, "setUsageScoreBooksRemote:");
    }
    v93 = v76;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScoreRadioRemote"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v85, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreRadioRemote:](v5, "setUsageScoreRadioRemote:");
    }
    v92 = v78;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScorePodcastsRemote"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v86, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScorePodcastsRemote:](v5, "setUsageScorePodcastsRemote:");
    }
    v97 = v81;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySearchBundleScoreRemote"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v87, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleScoreRemote:](v5, "setEntitySearchBundleScoreRemote:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageScoreMusicRemote"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v88, "doubleValue");
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusicRemote:](v5, "setUsageScoreMusicRemote:");
    }
    v89 = v5;

  }
  return v5;
}

- (BOOL)isClientForegroundActiveBundle
{
  return self->_isClientForegroundActiveBundle;
}

- (double)compoundActiveBundleScore
{
  return self->_compoundActiveBundleScore;
}

- (double)compoundMediaTypeBundleScore
{
  return self->_compoundMediaTypeBundleScore;
}

- (double)entitySearchBundleRecencyS
{
  return self->_entitySearchBundleRecencyS;
}

- (double)entitySearchBundleScore
{
  return self->_entitySearchBundleScore;
}

- (BOOL)isForegroundBundle
{
  return self->_isForegroundBundle;
}

- (BOOL)isNowPlayingBundle
{
  return self->_isNowPlayingBundle;
}

- (int)nowPlayingBundleCount
{
  return self->_nowPlayingBundleCount;
}

- (double)nowPlayingBundleRecencyS
{
  return self->_nowPlayingBundleRecencyS;
}

- (double)nowPlayingBundleScore
{
  return self->_nowPlayingBundleScore;
}

- (BOOL)isNowPlayingLastBundle
{
  return self->_isNowPlayingLastBundle;
}

- (int)nowPlayingUsage1Day
{
  return self->_nowPlayingUsage1Day;
}

- (int)nowPlayingUsage7Days
{
  return self->_nowPlayingUsage7Days;
}

- (int)nowPlayingUsage14Days
{
  return self->_nowPlayingUsage14Days;
}

- (BOOL)isRawLastNowPlayingCoreDuet
{
  return self->_isRawLastNowPlayingCoreDuet;
}

- (BOOL)isRawMediaCategoryAudiobookSignal
{
  return self->_isRawMediaCategoryAudiobookSignal;
}

- (BOOL)isRawMediaCategoryMusicSignal
{
  return self->_isRawMediaCategoryMusicSignal;
}

- (BOOL)isRawMediaCategoryPodcastSignal
{
  return self->_isRawMediaCategoryPodcastSignal;
}

- (BOOL)isRawMediaCategoryRadioSignal
{
  return self->_isRawMediaCategoryRadioSignal;
}

- (BOOL)isRawMediaCategoryVideoSignal
{
  return self->_isRawMediaCategoryVideoSignal;
}

- (int)rawMediaTypeUsageSignalBook
{
  return self->_rawMediaTypeUsageSignalBook;
}

- (int)rawMediaTypeUsageSignalMusic
{
  return self->_rawMediaTypeUsageSignalMusic;
}

- (int)rawMediaTypeUsageSignalPodcast
{
  return self->_rawMediaTypeUsageSignalPodcast;
}

- (int)rawMediaTypeUsageSignalVideo
{
  return self->_rawMediaTypeUsageSignalVideo;
}

- (int)rawNowPlayingCountCoreDuet10Min
{
  return self->_rawNowPlayingCountCoreDuet10Min;
}

- (int)rawNowPlayingCountCoreDuet1Day
{
  return self->_rawNowPlayingCountCoreDuet1Day;
}

- (int)rawNowPlayingCountCoreDuet1Hr
{
  return self->_rawNowPlayingCountCoreDuet1Hr;
}

- (int)rawNowPlayingCountCoreDuet28Day
{
  return self->_rawNowPlayingCountCoreDuet28Day;
}

- (int)rawNowPlayingCountCoreDuet2Min
{
  return self->_rawNowPlayingCountCoreDuet2Min;
}

- (int)rawNowPlayingCountCoreDuet6Hr
{
  return self->_rawNowPlayingCountCoreDuet6Hr;
}

- (int)rawNowPlayingCountCoreDuet7Day
{
  return self->_rawNowPlayingCountCoreDuet7Day;
}

- (int)rawNowPlayingRecencyCD
{
  return self->_rawNowPlayingRecencyCD;
}

- (int)rawEntitySearchRecency
{
  return self->_rawEntitySearchRecency;
}

- (double)usageScoreBooks
{
  return self->_usageScoreBooks;
}

- (double)usageScoreMusic
{
  return self->_usageScoreMusic;
}

- (double)usageScorePodcasts
{
  return self->_usageScorePodcasts;
}

- (BOOL)isAppFirstParty
{
  return self->_isAppFirstParty;
}

- (BOOL)isRequestedApp
{
  return self->_isRequestedApp;
}

- (BOOL)isNowPlayingBundlePSE1
{
  return self->_isNowPlayingBundlePSE1;
}

- (BOOL)isNowPlayingBundlePSE2
{
  return self->_isNowPlayingBundlePSE2;
}

- (double)vq21Score
{
  return self->_vq21Score;
}

- (BOOL)isSupportedFlag
{
  return self->_isSupportedFlag;
}

- (BOOL)isUnicornFlag
{
  return self->_isUnicornFlag;
}

- (BOOL)isSupportedUnicornMatchFlag
{
  return self->_isSupportedUnicornMatchFlag;
}

- (BOOL)isDisambiguationSelectedApp
{
  return self->_isDisambiguationSelectedApp;
}

- (BOOL)isModelPredictedApp
{
  return self->_isModelPredictedApp;
}

- (double)usageScoreRadio
{
  return self->_usageScoreRadio;
}

- (double)usageScoreMusicWithoutRadio
{
  return self->_usageScoreMusicWithoutRadio;
}

- (int)rawMediaTypeUsageSignalRadio
{
  return self->_rawMediaTypeUsageSignalRadio;
}

- (int)rawMediaTypeUsageSignalMusicWithoutRadio
{
  return self->_rawMediaTypeUsageSignalMusicWithoutRadio;
}

- (int)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (BOOL)isRawNowPlayingBundle
{
  return self->_isRawNowPlayingBundle;
}

- (int)rawNowPlayingTotal
{
  return self->_rawNowPlayingTotal;
}

- (double)rawNowPlayingBundleScore
{
  return self->_rawNowPlayingBundleScore;
}

- (double)isRawLastNowPlaying
{
  return self->_isRawLastNowPlaying;
}

- (int)rawNowPlaying2Minutes
{
  return self->_rawNowPlaying2Minutes;
}

- (int)rawNowPlaying10Minutes
{
  return self->_rawNowPlaying10Minutes;
}

- (int)rawNowPlaying1Hour
{
  return self->_rawNowPlaying1Hour;
}

- (int)rawNowPlaying6Hours
{
  return self->_rawNowPlaying6Hours;
}

- (int)rawNowPlaying1Day
{
  return self->_rawNowPlaying1Day;
}

- (int)rawNowPlaying7Days
{
  return self->_rawNowPlaying7Days;
}

- (int)rawNowPlaying28Days
{
  return self->_rawNowPlaying28Days;
}

- (int)rawLastNowPlayingRecency
{
  return self->_rawLastNowPlayingRecency;
}

- (int)commonForegroundBundleApp
{
  return self->_commonForegroundBundleApp;
}

- (BOOL)isRawLastNowPlayingBoolean
{
  return self->_isRawLastNowPlayingBoolean;
}

- (BOOL)isCommonForegroundApp
{
  return self->_isCommonForegroundApp;
}

- (BOOL)isBoltEnabled
{
  return self->_isBoltEnabled;
}

- (double)usageScoreMusicWithoutRadioRemote
{
  return self->_usageScoreMusicWithoutRadioRemote;
}

- (double)usageScoreBooksRemote
{
  return self->_usageScoreBooksRemote;
}

- (double)usageScoreRadioRemote
{
  return self->_usageScoreRadioRemote;
}

- (double)usageScorePodcastsRemote
{
  return self->_usageScorePodcastsRemote;
}

- (double)entitySearchBundleScoreRemote
{
  return self->_entitySearchBundleScoreRemote;
}

- (double)usageScoreMusicRemote
{
  return self->_usageScoreMusicRemote;
}

@end
