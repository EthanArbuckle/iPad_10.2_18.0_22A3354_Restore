@implementation MWTSchemaMWTMusicMetadataReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMusicDomain:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 1u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_musicDomain = a3;
}

- (BOOL)hasMusicDomain
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasMusicDomain:(BOOL)a3
{
  __int16 v3;
  char v4;

  v3 = *((_WORD *)&self->_has + 2);
  v4 = *((_BYTE *)&self->_has + 6);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFE | a3;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = v4;
}

- (void)deleteMusicDomain
{
  __int16 v3;
  char v4;

  -[MWTSchemaMWTMusicMetadataReported setMusicDomain:](self, "setMusicDomain:", 0);
  v3 = *((_WORD *)&self->_has + 2);
  v4 = *((_BYTE *)&self->_has + 6);
  *(_DWORD *)&self->_has &= ~1u;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = v4;
}

- (void)setQueueType:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 2u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_queueType = a3;
}

- (BOOL)hasQueueType
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 1) & 1;
}

- (void)setHasQueueType:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 2;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFD | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteQueueType
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setQueueType:](self, "setQueueType:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~2u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setQueueSize:(unsigned int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 4u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_queueSize = a3;
}

- (BOOL)hasQueueSize
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 2) & 1;
}

- (void)setHasQueueSize:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 4;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFB | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteQueueSize
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setQueueSize:](self, "setQueueSize:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~4u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsShuffled:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 8u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isShuffled = a3;
}

- (BOOL)hasIsShuffled
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 3) & 1;
}

- (void)setHasIsShuffled:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 8;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFF7 | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsShuffled
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsShuffled:](self, "setIsShuffled:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~8u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setPrefetchedMetadataSource:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x10u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_prefetchedMetadataSource = a3;
}

- (BOOL)hasPrefetchedMetadataSource
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 4) & 1;
}

- (void)setHasPrefetchedMetadataSource:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 16;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFEF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deletePrefetchedMetadataSource
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setPrefetchedMetadataSource:](self, "setPrefetchedMetadataSource:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x10u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setAssetEndPoint:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x20u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_assetEndPoint = a3;
}

- (BOOL)hasAssetEndPoint
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 5) & 1;
}

- (void)setHasAssetEndPoint:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 32;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFDF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteAssetEndPoint
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setAssetEndPoint:](self, "setAssetEndPoint:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x20u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setStreamingContentType:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x40u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_streamingContentType = a3;
}

- (BOOL)hasStreamingContentType
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 6) & 1;
}

- (void)setHasStreamingContentType:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 64;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFBF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteStreamingContentType
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setStreamingContentType:](self, "setStreamingContentType:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x40u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setFormatCodec:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x80u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_formatCodec = a3;
}

- (BOOL)hasFormatCodec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 7) & 1;
}

- (void)setHasFormatCodec:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 128;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFF7F | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteFormatCodec
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setFormatCodec:](self, "setFormatCodec:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x80u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setFormatBitrate:(unsigned int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x100u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_formatBitrate = a3;
}

- (BOOL)hasFormatBitrate
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 8) & 1;
}

- (void)setHasFormatBitrate:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 256;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFEFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteFormatBitrate
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setFormatBitrate:](self, "setFormatBitrate:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x100u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setFormatBitDepth:(unsigned int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x200u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_formatBitDepth = a3;
}

- (BOOL)hasFormatBitDepth
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 9) & 1;
}

- (void)setHasFormatBitDepth:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 512;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFDFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteFormatBitDepth
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setFormatBitDepth:](self, "setFormatBitDepth:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x200u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setFormatChannels:(unsigned int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x400u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_formatChannels = a3;
}

- (BOOL)hasFormatChannels
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 10) & 1;
}

- (void)setHasFormatChannels:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 1024;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFBFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteFormatChannels
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setFormatChannels:](self, "setFormatChannels:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x400u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setFormatLayout:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x800u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_formatLayout = a3;
}

- (BOOL)hasFormatLayout
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 11) & 1;
}

- (void)setHasFormatLayout:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 2048;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFF7FF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteFormatLayout
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setFormatLayout:](self, "setFormatLayout:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x800u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setFormatSampleRate:(unsigned int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x1000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_formatSampleRate = a3;
}

- (BOOL)hasFormatSampleRate
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 12) & 1;
}

- (void)setHasFormatSampleRate:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 4096;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFEFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteFormatSampleRate
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setFormatSampleRate:](self, "setFormatSampleRate:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x1000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setFormatTier:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x2000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_formatTier = a3;
}

- (BOOL)hasFormatTier
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 13) & 1;
}

- (void)setHasFormatTier:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x2000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFDFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteFormatTier
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setFormatTier:](self, "setFormatTier:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x2000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setNumberOfSpeakers:(unsigned int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x4000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_numberOfSpeakers = a3;
}

- (BOOL)hasNumberOfSpeakers
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 14) & 1;
}

- (void)setHasNumberOfSpeakers:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x4000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFBFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteNumberOfSpeakers
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setNumberOfSpeakers:](self, "setNumberOfSpeakers:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x4000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setRouteConfiguration:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x8000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_routeConfiguration = a3;
}

- (BOOL)hasRouteConfiguration
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 15) & 1;
}

- (void)setHasRouteConfiguration:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x8000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFF7FFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteRouteConfiguration
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setRouteConfiguration:](self, "setRouteConfiguration:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x8000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsAccountDataReady:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x10000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isAccountDataReady = a3;
}

- (BOOL)hasIsAccountDataReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 16) & 1;
}

- (void)setHasIsAccountDataReady:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x10000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFEFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsAccountDataReady
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsAccountDataReady:](self, "setIsAccountDataReady:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x10000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsStoreBagReady:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x20000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isStoreBagReady = a3;
}

- (BOOL)hasIsStoreBagReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 17) & 1;
}

- (void)setHasIsStoreBagReady:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x20000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFDFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsStoreBagReady
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsStoreBagReady:](self, "setIsStoreBagReady:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x20000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsLeaseReady:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x40000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isLeaseReady = a3;
}

- (BOOL)hasIsLeaseReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 18) & 1;
}

- (void)setHasIsLeaseReady:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x40000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFBFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsLeaseReady
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsLeaseReady:](self, "setIsLeaseReady:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x40000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsOnlineKeyReady:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x80000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isOnlineKeyReady = a3;
}

- (BOOL)hasIsOnlineKeyReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 19) & 1;
}

- (void)setHasIsOnlineKeyReady:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x80000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFF7FFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsOnlineKeyReady
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsOnlineKeyReady:](self, "setIsOnlineKeyReady:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x80000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsOfflineKeyReady:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x100000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isOfflineKeyReady = a3;
}

- (BOOL)hasIsOfflineKeyReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 20) & 1;
}

- (void)setHasIsOfflineKeyReady:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x100000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFEFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsOfflineKeyReady
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsOfflineKeyReady:](self, "setIsOfflineKeyReady:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x100000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsHlsKeysReady:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x200000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isHlsKeysReady = a3;
}

- (BOOL)hasIsHlsKeysReady
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 21) & 1;
}

- (void)setHasIsHlsKeysReady:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x200000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFDFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsHlsKeysReady
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsHlsKeysReady:](self, "setIsHlsKeysReady:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x200000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsInterruptingPlayback:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x400000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isInterruptingPlayback = a3;
}

- (BOOL)hasIsInterruptingPlayback
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 22) & 1;
}

- (void)setHasIsInterruptingPlayback:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x400000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFBFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsInterruptingPlayback
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsInterruptingPlayback:](self, "setIsInterruptingPlayback:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x400000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsRemoteSetQueue:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x800000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isRemoteSetQueue = a3;
}

- (BOOL)hasIsRemoteSetQueue
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 23) & 1;
}

- (void)setHasIsRemoteSetQueue:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x800000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFF7FFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsRemoteSetQueue
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsRemoteSetQueue:](self, "setIsRemoteSetQueue:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x800000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsDelegatedPlayback:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x1000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isDelegatedPlayback = a3;
}

- (BOOL)hasIsDelegatedPlayback
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 24) & 1;
}

- (void)setHasIsDelegatedPlayback:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x1000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFEFFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsDelegatedPlayback
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsDelegatedPlayback:](self, "setIsDelegatedPlayback:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x1000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsNonDefaultUser:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x2000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isNonDefaultUser = a3;
}

- (BOOL)hasIsNonDefaultUser
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 25) & 1;
}

- (void)setHasIsNonDefaultUser:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x2000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFDFFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsNonDefaultUser
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsNonDefaultUser:](self, "setIsNonDefaultUser:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x2000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsAutoPlay:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x4000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isAutoPlay = a3;
}

- (BOOL)hasIsAutoPlay
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 26) & 1;
}

- (void)setHasIsAutoPlay:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x4000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFBFFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsAutoPlay
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsAutoPlay:](self, "setIsAutoPlay:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x4000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsFirstPlayAfterAppLaunch:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x8000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isFirstPlayAfterAppLaunch = a3;
}

- (BOOL)hasIsFirstPlayAfterAppLaunch
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 27) & 1;
}

- (void)setHasIsFirstPlayAfterAppLaunch:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x8000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xF7FFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsFirstPlayAfterAppLaunch
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsFirstPlayAfterAppLaunch:](self, "setIsFirstPlayAfterAppLaunch:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x8000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsMiniSinfAvailable:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x10000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isMiniSinfAvailable = a3;
}

- (BOOL)hasIsMiniSinfAvailable
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 28) & 1;
}

- (void)setHasIsMiniSinfAvailable:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x10000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xEFFFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsMiniSinfAvailable
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsMiniSinfAvailable:](self, "setIsMiniSinfAvailable:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x10000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsSharePlayPlayback:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x20000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isSharePlayPlayback = a3;
}

- (BOOL)hasIsSharePlayPlayback
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 29) & 1;
}

- (void)setHasIsSharePlayPlayback:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x20000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xDFFFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsSharePlayPlayback
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsSharePlayPlayback:](self, "setIsSharePlayPlayback:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x20000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setIsSuzeLease:(BOOL)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x40000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_isSuzeLease = a3;
}

- (BOOL)hasIsSuzeLease
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 30) & 1;
}

- (void)setHasIsSuzeLease:(BOOL)a3
{
  char v3;
  __int16 v4;
  int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x40000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xBFFFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteIsSuzeLease
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setIsSuzeLease:](self, "setIsSuzeLease:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x40000000u;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setNetworkConnectionType:(int)a3
{
  char v3;
  __int16 v4;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has |= 0x80000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
  self->_networkConnectionType = a3;
}

- (BOOL)hasNetworkConnectionType
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setHasNetworkConnectionType:(BOOL)a3
{
  char v3;
  __int16 v4;
  unsigned int v5;

  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  v5 = 0x80000000;
  if (!a3)
    v5 = 0;
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0x7FFFFFFF | v5;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)deleteNetworkConnectionType
{
  char v3;
  __int16 v4;

  -[MWTSchemaMWTMusicMetadataReported setNetworkConnectionType:](self, "setNetworkConnectionType:", 0);
  v3 = *((_BYTE *)&self->_has + 6);
  v4 = *((_WORD *)&self->_has + 2);
  *(_DWORD *)&self->_has &= ~0x80000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = v4;
}

- (void)setWasMediaLibraryDatabaseUpgraded:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x100000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_wasMediaLibraryDatabaseUpgraded = a3;
}

- (BOOL)hasWasMediaLibraryDatabaseUpgraded
{
  return *((_WORD *)&self->_has + 2) & 1;
}

- (void)setHasWasMediaLibraryDatabaseUpgraded:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x100000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteWasMediaLibraryDatabaseUpgraded
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setWasMediaLibraryDatabaseUpgraded:](self, "setWasMediaLibraryDatabaseUpgraded:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x200000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_isPrimaryUser = a3;
}

- (BOOL)hasIsPrimaryUser
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasIsPrimaryUser:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x200000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteIsPrimaryUser
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setIsPrimaryUser:](self, "setIsPrimaryUser:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFDFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (BOOL)hasErrorResolutionType
{
  return self->_errorResolutionType != 0;
}

- (void)deleteErrorResolutionType
{
  -[MWTSchemaMWTMusicMetadataReported setErrorResolutionType:](self, "setErrorResolutionType:", 0);
}

- (void)setEndPointType:(int)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x400000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_endPointType = a3;
}

- (BOOL)hasEndPointType
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasEndPointType:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x400000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFBFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteEndPointType
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setEndPointType:](self, "setEndPointType:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFBFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setRouteType:(int)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x800000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_routeType = a3;
}

- (BOOL)hasRouteType
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasRouteType:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x800000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFF7FFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteRouteType
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setRouteType:](self, "setRouteType:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFF7FFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setFormatLayoutValue:(unsigned int)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x1000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_formatLayoutValue = a3;
}

- (BOOL)hasFormatLayoutValue
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasFormatLayoutValue:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x1000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteFormatLayoutValue
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setFormatLayoutValue:](self, "setFormatLayoutValue:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFEFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setAssetSource:(int)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x2000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_assetSource = a3;
}

- (BOOL)hasAssetSource
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasAssetSource:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x2000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteAssetSource
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setAssetSource:](self, "setAssetSource:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFDFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setAssetLocation:(int)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x4000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_assetLocation = a3;
}

- (BOOL)hasAssetLocation
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasAssetLocation:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x4000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteAssetLocation
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setAssetLocation:](self, "setAssetLocation:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFFBFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setSubscriptionType:(int)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x8000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_subscriptionType = a3;
}

- (BOOL)hasSubscriptionType
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 7) & 1;
}

- (void)setHasSubscriptionType:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x8000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFF7FFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteSubscriptionType
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setSubscriptionType:](self, "setSubscriptionType:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFF7FFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasLookupWaitTime:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x10000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_hasLookupWaitTime = a3;
}

- (BOOL)hasHasLookupWaitTime
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setHasHasLookupWaitTime:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x10000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFEFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteHasLookupWaitTime
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setHasLookupWaitTime:](self, "setHasLookupWaitTime:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFEFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasBagWaitTime:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x20000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_hasBagWaitTime = a3;
}

- (BOOL)hasHasBagWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 9) & 1;
}

- (void)setHasHasBagWaitTime:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x20000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFDFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteHasBagWaitTime
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setHasBagWaitTime:](self, "setHasBagWaitTime:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFDFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasLeaseWaitTime:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x40000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_hasLeaseWaitTime = a3;
}

- (BOOL)hasHasLeaseWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 10) & 1;
}

- (void)setHasHasLeaseWaitTime:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x40000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFBFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteHasLeaseWaitTime
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setHasLeaseWaitTime:](self, "setHasLeaseWaitTime:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFFBFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasSuzeLeaseWaitTime:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x80000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_hasSuzeLeaseWaitTime = a3;
}

- (BOOL)hasHasSuzeLeaseWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 11) & 1;
}

- (void)setHasHasSuzeLeaseWaitTime:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x80000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFF7FFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteHasSuzeLeaseWaitTime
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setHasSuzeLeaseWaitTime:](self, "setHasSuzeLeaseWaitTime:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFF7FFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasSubscriptionAssetLoadWaitTime:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x100000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_hasSubscriptionAssetLoadWaitTime = a3;
}

- (BOOL)hasHasSubscriptionAssetLoadWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 12) & 1;
}

- (void)setHasHasSubscriptionAssetLoadWaitTime:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x100000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFEFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteHasSubscriptionAssetLoadWaitTime
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setHasSubscriptionAssetLoadWaitTime:](self, "setHasSubscriptionAssetLoadWaitTime:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFEFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setHasMediaRedownloadWaitTime:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x200000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_hasMediaRedownloadWaitTime = a3;
}

- (BOOL)hasHasMediaRedownloadWaitTime
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 13) & 1;
}

- (void)setHasHasMediaRedownloadWaitTime:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x200000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFDFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteHasMediaRedownloadWaitTime
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setHasMediaRedownloadWaitTime:](self, "setHasMediaRedownloadWaitTime:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFDFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setCmInitialStartupItemCreationToReadyToPlayDurationInMs:(unsigned int)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x400000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_cmInitialStartupItemCreationToReadyToPlayDurationInMs = a3;
}

- (BOOL)hasCmInitialStartupItemCreationToReadyToPlayDurationInMs
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 14) & 1;
}

- (void)setHasCmInitialStartupItemCreationToReadyToPlayDurationInMs:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x400000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFBFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteCmInitialStartupItemCreationToReadyToPlayDurationInMs
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setCmInitialStartupItemCreationToReadyToPlayDurationInMs:](self, "setCmInitialStartupItemCreationToReadyToPlayDurationInMs:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFFBFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setCmInitialStartupItemCreationToLtluDurationInMs:(unsigned int)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32) | 0x800000000000;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
  self->_cmInitialStartupItemCreationToLtluDurationInMs = a3;
}

- (BOOL)hasCmInitialStartupItemCreationToLtluDurationInMs
{
  return *((unsigned __int16 *)&self->_has + 2) >> 15;
}

- (void)setHasCmInitialStartupItemCreationToLtluDurationInMs:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = 0x800000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFF7FFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)deleteCmInitialStartupItemCreationToLtluDurationInMs
{
  int v3;
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;

  -[MWTSchemaMWTMusicMetadataReported setCmInitialStartupItemCreationToLtluDurationInMs:](self, "setCmInitialStartupItemCreationToLtluDurationInMs:", 0);
  v3 = *((unsigned __int8 *)&self->_has + 6);
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = (*(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (v3 << 16)) << 32)) & 0xFFFF7FFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v4;
  *((_BYTE *)&self->_has + 6) = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v5);
}

- (void)setMasterPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unint64_t v3;

  v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x1000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((_BYTE *)&self->_has + 6) = BYTE6(v3);
  self->_masterPlaylistConnectionTlsHandshakeDurationInMs = a3;
}

- (BOOL)hasMasterPlaylistConnectionTlsHandshakeDurationInMs
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (void)setHasMasterPlaylistConnectionTlsHandshakeDurationInMs:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = 0x1000000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFEFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v5);
}

- (void)deleteMasterPlaylistConnectionTlsHandshakeDurationInMs
{
  uint64_t v3;
  unint64_t v4;

  -[MWTSchemaMWTMusicMetadataReported setMasterPlaylistConnectionTlsHandshakeDurationInMs:](self, "setMasterPlaylistConnectionTlsHandshakeDurationInMs:", 0);
  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFEFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v4);
}

- (void)setMasterPlaylistRequestDurationInMs:(unsigned int)a3
{
  unint64_t v3;

  v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x2000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((_BYTE *)&self->_has + 6) = BYTE6(v3);
  self->_masterPlaylistRequestDurationInMs = a3;
}

- (BOOL)hasMasterPlaylistRequestDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setHasMasterPlaylistRequestDurationInMs:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = 0x2000000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFDFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v5);
}

- (void)deleteMasterPlaylistRequestDurationInMs
{
  uint64_t v3;
  unint64_t v4;

  -[MWTSchemaMWTMusicMetadataReported setMasterPlaylistRequestDurationInMs:](self, "setMasterPlaylistRequestDurationInMs:", 0);
  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFDFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v4);
}

- (void)setSubPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unint64_t v3;

  v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x4000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((_BYTE *)&self->_has + 6) = BYTE6(v3);
  self->_subPlaylistConnectionTlsHandshakeDurationInMs = a3;
}

- (BOOL)hasSubPlaylistConnectionTlsHandshakeDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setHasSubPlaylistConnectionTlsHandshakeDurationInMs:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = 0x4000000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFBFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v5);
}

- (void)deleteSubPlaylistConnectionTlsHandshakeDurationInMs
{
  uint64_t v3;
  unint64_t v4;

  -[MWTSchemaMWTMusicMetadataReported setSubPlaylistConnectionTlsHandshakeDurationInMs:](self, "setSubPlaylistConnectionTlsHandshakeDurationInMs:", 0);
  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFFBFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v4);
}

- (void)setSubPlaylistRequestDurationInMs:(unsigned int)a3
{
  unint64_t v3;

  v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x8000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((_BYTE *)&self->_has + 6) = BYTE6(v3);
  self->_subPlaylistRequestDurationInMs = a3;
}

- (BOOL)hasSubPlaylistRequestDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setHasSubPlaylistRequestDurationInMs:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = 0x8000000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFF7FFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v5);
}

- (void)deleteSubPlaylistRequestDurationInMs
{
  uint64_t v3;
  unint64_t v4;

  -[MWTSchemaMWTMusicMetadataReported setSubPlaylistRequestDurationInMs:](self, "setSubPlaylistRequestDurationInMs:", 0);
  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFF7FFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v4);
}

- (void)setContentConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unint64_t v3;

  v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x10000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((_BYTE *)&self->_has + 6) = BYTE6(v3);
  self->_contentConnectionTlsHandshakeDurationInMs = a3;
}

- (BOOL)hasContentConnectionTlsHandshakeDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setHasContentConnectionTlsHandshakeDurationInMs:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = 0x10000000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFEFFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v5);
}

- (void)deleteContentConnectionTlsHandshakeDurationInMs
{
  uint64_t v3;
  unint64_t v4;

  -[MWTSchemaMWTMusicMetadataReported setContentConnectionTlsHandshakeDurationInMs:](self, "setContentConnectionTlsHandshakeDurationInMs:", 0);
  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFEFFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v4);
}

- (void)setContentFirstSegmentDurationInMs:(unsigned int)a3
{
  unint64_t v3;

  v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32) | 0x20000000000000;
  *((_WORD *)&self->_has + 2) = *((_WORD *)&self->_has + 2);
  *((_BYTE *)&self->_has + 6) = BYTE6(v3);
  self->_contentFirstSegmentDurationInMs = a3;
}

- (BOOL)hasContentFirstSegmentDurationInMs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setHasContentFirstSegmentDurationInMs:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = 0x20000000000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFDFFFFFFFFFFFFFLL | v4;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v5);
}

- (void)deleteContentFirstSegmentDurationInMs
{
  uint64_t v3;
  unint64_t v4;

  -[MWTSchemaMWTMusicMetadataReported setContentFirstSegmentDurationInMs:](self, "setContentFirstSegmentDurationInMs:", 0);
  v3 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
  v4 = (*(_DWORD *)&self->_has | (unint64_t)(v3 << 32)) & 0xFFDFFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = v3;
  *((_BYTE *)&self->_has + 6) = BYTE6(v4);
}

- (BOOL)hasAudioQueueType
{
  return self->_audioQueueType != 0;
}

- (void)deleteAudioQueueType
{
  -[MWTSchemaMWTMusicMetadataReported setAudioQueueType:](self, "setAudioQueueType:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MWTSchemaMWTMusicMetadataReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $3A707FEDEB8D4B451EE4458D3B539123 v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  $3A707FEDEB8D4B451EE4458D3B539123 v10;
  id v11;

  v11 = a3;
  v4 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v5 = *(_QWORD *)&v4 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                      + 6) << 16)) << 32);
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v10 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v5 = *(_QWORD *)&v10 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                         + 6) << 16)) << 32);
    if ((*(_BYTE *)&v10 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_64;
    }
  }
  else if ((*(_BYTE *)&v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_20:
    if ((v5 & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_22:
    if ((v5 & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_23:
    if ((v5 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_24:
    if ((v5 & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_31;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_33;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteBOOLField();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteInt32Field();
  v5 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_94:
  PBDataWriterWriteBOOLField();
  if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32)) & 0x200000000) != 0)
LABEL_35:
    PBDataWriterWriteBOOLField();
LABEL_36:
  -[MWTSchemaMWTMusicMetadataReported errorResolutionType](self, "errorResolutionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x400000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32);
    if ((v7 & 0x800000000) == 0)
    {
LABEL_40:
      if ((v7 & 0x1000000000) == 0)
        goto LABEL_41;
      goto LABEL_98;
    }
  }
  else if ((v7 & 0x800000000) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteInt32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_42;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x2000000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_43;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x4000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_44;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x8000000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x20000000000) == 0)
      goto LABEL_46;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_46:
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_47;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_47:
    if ((v7 & 0x80000000000) == 0)
      goto LABEL_48;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x80000000000) == 0)
  {
LABEL_48:
    if ((v7 & 0x100000000000) == 0)
      goto LABEL_49;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x100000000000) == 0)
  {
LABEL_49:
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_50;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x200000000000) == 0)
  {
LABEL_50:
    if ((v7 & 0x400000000000) == 0)
      goto LABEL_51;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x400000000000) == 0)
  {
LABEL_51:
    if ((v7 & 0x800000000000) == 0)
      goto LABEL_52;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x800000000000) == 0)
  {
LABEL_52:
    if ((v7 & 0x1000000000000) == 0)
      goto LABEL_53;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x1000000000000) == 0)
  {
LABEL_53:
    if ((v7 & 0x2000000000000) == 0)
      goto LABEL_54;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x2000000000000) == 0)
  {
LABEL_54:
    if ((v7 & 0x4000000000000) == 0)
      goto LABEL_55;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x4000000000000) == 0)
  {
LABEL_55:
    if ((v7 & 0x8000000000000) == 0)
      goto LABEL_56;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((v7 & 0x10000000000000) == 0)
      goto LABEL_57;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((v7 & 0x10000000000000) == 0)
  {
LABEL_57:
    if ((v7 & 0x20000000000000) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
LABEL_114:
  PBDataWriterWriteUint32Field();
  if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32)) & 0x20000000000000) != 0)
LABEL_58:
    PBDataWriterWriteUint32Field();
LABEL_59:
  -[MWTSchemaMWTMusicMetadataReported audioQueueType](self, "audioQueueType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned int *v4;
  $3A707FEDEB8D4B451EE4458D3B539123 v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int musicDomain;
  unsigned int v10;
  int queueType;
  unsigned int v12;
  unsigned int queueSize;
  unsigned int v14;
  int isShuffled;
  unsigned int v16;
  int prefetchedMetadataSource;
  unsigned int v18;
  int assetEndPoint;
  unsigned int v20;
  int streamingContentType;
  unsigned int v22;
  int formatCodec;
  unsigned int v24;
  unsigned int formatBitrate;
  unsigned int v26;
  unsigned int formatBitDepth;
  unsigned int v28;
  unsigned int formatChannels;
  unsigned int v30;
  int formatLayout;
  unsigned int v32;
  unsigned int formatSampleRate;
  unsigned int v34;
  int formatTier;
  unsigned int v36;
  unsigned int numberOfSpeakers;
  unsigned int v38;
  int routeConfiguration;
  unsigned int v40;
  int isAccountDataReady;
  unsigned int v42;
  int isStoreBagReady;
  unsigned int v44;
  int isLeaseReady;
  unsigned int v46;
  int isOnlineKeyReady;
  unsigned int v48;
  int isOfflineKeyReady;
  unsigned int v50;
  int isHlsKeysReady;
  unsigned int v52;
  int isInterruptingPlayback;
  unsigned int v54;
  int isRemoteSetQueue;
  unsigned int v56;
  int isDelegatedPlayback;
  unsigned int v58;
  int isNonDefaultUser;
  unsigned int v60;
  int isAutoPlay;
  unsigned int v62;
  int isFirstPlayAfterAppLaunch;
  unsigned int v64;
  int isMiniSinfAvailable;
  unsigned int v66;
  int isSharePlayPlayback;
  unsigned int v68;
  int isSuzeLease;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int networkConnectionType;
  int v75;
  int wasMediaLibraryDatabaseUpgraded;
  int v77;
  int isPrimaryUser;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  int endPointType;
  unsigned int v117;
  unsigned int v118;
  int v119;
  int routeType;
  unsigned int v121;
  unsigned int v122;
  int v123;
  unsigned int formatLayoutValue;
  unsigned int v125;
  unsigned int v126;
  int v127;
  int assetSource;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  int assetLocation;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int v136;
  int subscriptionType;
  unsigned int v138;
  unsigned int v139;
  unsigned int v140;
  unsigned int v141;
  int hasLookupWaitTime;
  unsigned int v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  int v147;
  int hasBagWaitTime;
  unsigned int v149;
  unsigned int v150;
  int hasLeaseWaitTime;
  unsigned int v152;
  unsigned int v153;
  int hasSuzeLeaseWaitTime;
  unsigned int v155;
  unsigned int v156;
  int hasSubscriptionAssetLoadWaitTime;
  unsigned int v158;
  unsigned int v159;
  int hasMediaRedownloadWaitTime;
  unsigned int v161;
  unsigned int v162;
  unsigned int cmInitialStartupItemCreationToReadyToPlayDurationInMs;
  unsigned int v164;
  unsigned int v165;
  unsigned int cmInitialStartupItemCreationToLtluDurationInMs;
  unsigned int v167;
  unsigned int v168;
  unsigned int masterPlaylistConnectionTlsHandshakeDurationInMs;
  unsigned int v170;
  unsigned int v171;
  unsigned int masterPlaylistRequestDurationInMs;
  unsigned int v173;
  unsigned int v174;
  unsigned int subPlaylistConnectionTlsHandshakeDurationInMs;
  unsigned int v176;
  unsigned int v177;
  unsigned int subPlaylistRequestDurationInMs;
  unsigned int v179;
  unsigned int v180;
  unsigned int contentConnectionTlsHandshakeDurationInMs;
  unsigned int contentFirstSegmentDurationInMs;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  char v187;
  BOOL v188;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  unint64_t v194;
  unint64_t v195;
  unint64_t v196;
  unint64_t v197;
  unint64_t v198;
  unint64_t v199;
  unint64_t v200;
  unint64_t v201;
  unint64_t v202;

  v4 = (unsigned int *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_229;
  v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v6 = v4[44];
  if ((*(_DWORD *)&self->_has & 1) != (v4[44] & 1))
    goto LABEL_229;
  if ((*(_BYTE *)&v5 & 1) != 0)
  {
    musicDomain = self->_musicDomain;
    if (musicDomain != objc_msgSend(v4, "musicDomain"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  else
  {
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v6 | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
  }
  v10 = (*(_DWORD *)&v5 >> 1) & 1;
  if (v10 != ((v6 >> 1) & 1))
    goto LABEL_229;
  if (v10)
  {
    queueType = self->_queueType;
    if (queueType != objc_msgSend(v4, "queueType"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v12 = (*(_DWORD *)&v5 >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1))
    goto LABEL_229;
  if (v12)
  {
    queueSize = self->_queueSize;
    if (queueSize != objc_msgSend(v4, "queueSize"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v14 = (*(_DWORD *)&v5 >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1))
    goto LABEL_229;
  if (v14)
  {
    isShuffled = self->_isShuffled;
    if (isShuffled != objc_msgSend(v4, "isShuffled"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v16 = (*(_DWORD *)&v5 >> 4) & 1;
  if (v16 != ((v6 >> 4) & 1))
    goto LABEL_229;
  if (v16)
  {
    prefetchedMetadataSource = self->_prefetchedMetadataSource;
    if (prefetchedMetadataSource != objc_msgSend(v4, "prefetchedMetadataSource"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v18 = (*(_DWORD *)&v5 >> 5) & 1;
  if (v18 != ((v6 >> 5) & 1))
    goto LABEL_229;
  if (v18)
  {
    assetEndPoint = self->_assetEndPoint;
    if (assetEndPoint != objc_msgSend(v4, "assetEndPoint"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v20 = (*(_DWORD *)&v5 >> 6) & 1;
  if (v20 != ((v6 >> 6) & 1))
    goto LABEL_229;
  if (v20)
  {
    streamingContentType = self->_streamingContentType;
    if (streamingContentType != objc_msgSend(v4, "streamingContentType"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v22 = (*(_DWORD *)&v5 >> 7) & 1;
  if (v22 != ((v6 >> 7) & 1))
    goto LABEL_229;
  if (v22)
  {
    formatCodec = self->_formatCodec;
    if (formatCodec != objc_msgSend(v4, "formatCodec"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v24 = (*(_DWORD *)&v5 >> 8) & 1;
  if (v24 != ((v6 >> 8) & 1))
    goto LABEL_229;
  if (v24)
  {
    formatBitrate = self->_formatBitrate;
    if (formatBitrate != objc_msgSend(v4, "formatBitrate"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v26 = (*(_DWORD *)&v5 >> 9) & 1;
  if (v26 != ((v6 >> 9) & 1))
    goto LABEL_229;
  if (v26)
  {
    formatBitDepth = self->_formatBitDepth;
    if (formatBitDepth != objc_msgSend(v4, "formatBitDepth"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v28 = (*(_DWORD *)&v5 >> 10) & 1;
  if (v28 != ((v6 >> 10) & 1))
    goto LABEL_229;
  if (v28)
  {
    formatChannels = self->_formatChannels;
    if (formatChannels != objc_msgSend(v4, "formatChannels"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v30 = (*(_DWORD *)&v5 >> 11) & 1;
  if (v30 != ((v6 >> 11) & 1))
    goto LABEL_229;
  if (v30)
  {
    formatLayout = self->_formatLayout;
    if (formatLayout != objc_msgSend(v4, "formatLayout"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v32 = (*(_DWORD *)&v5 >> 12) & 1;
  if (v32 != ((v6 >> 12) & 1))
    goto LABEL_229;
  if (v32)
  {
    formatSampleRate = self->_formatSampleRate;
    if (formatSampleRate != objc_msgSend(v4, "formatSampleRate"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v34 = (*(_DWORD *)&v5 >> 13) & 1;
  if (v34 != ((v6 >> 13) & 1))
    goto LABEL_229;
  if (v34)
  {
    formatTier = self->_formatTier;
    if (formatTier != objc_msgSend(v4, "formatTier"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v36 = (*(_DWORD *)&v5 >> 14) & 1;
  if (v36 != ((v6 >> 14) & 1))
    goto LABEL_229;
  if (v36)
  {
    numberOfSpeakers = self->_numberOfSpeakers;
    if (numberOfSpeakers != objc_msgSend(v4, "numberOfSpeakers"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v38 = (*(_DWORD *)&v5 >> 15) & 1;
  if (v38 != ((v6 >> 15) & 1))
    goto LABEL_229;
  if (v38)
  {
    routeConfiguration = self->_routeConfiguration;
    if (routeConfiguration != objc_msgSend(v4, "routeConfiguration"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v40 = HIWORD(*(_DWORD *)&v5) & 1;
  if (v40 != (WORD1(v6) & 1))
    goto LABEL_229;
  if (v40)
  {
    isAccountDataReady = self->_isAccountDataReady;
    if (isAccountDataReady != objc_msgSend(v4, "isAccountDataReady"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v42 = (*(_DWORD *)&v5 >> 17) & 1;
  if (v42 != ((v6 >> 17) & 1))
    goto LABEL_229;
  if (v42)
  {
    isStoreBagReady = self->_isStoreBagReady;
    if (isStoreBagReady != objc_msgSend(v4, "isStoreBagReady"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v44 = (*(_DWORD *)&v5 >> 18) & 1;
  if (v44 != ((v6 >> 18) & 1))
    goto LABEL_229;
  if (v44)
  {
    isLeaseReady = self->_isLeaseReady;
    if (isLeaseReady != objc_msgSend(v4, "isLeaseReady"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v46 = (*(_DWORD *)&v5 >> 19) & 1;
  if (v46 != ((v6 >> 19) & 1))
    goto LABEL_229;
  if (v46)
  {
    isOnlineKeyReady = self->_isOnlineKeyReady;
    if (isOnlineKeyReady != objc_msgSend(v4, "isOnlineKeyReady"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v48 = (*(_DWORD *)&v5 >> 20) & 1;
  if (v48 != ((v6 >> 20) & 1))
    goto LABEL_229;
  if (v48)
  {
    isOfflineKeyReady = self->_isOfflineKeyReady;
    if (isOfflineKeyReady != objc_msgSend(v4, "isOfflineKeyReady"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v50 = (*(_DWORD *)&v5 >> 21) & 1;
  if (v50 != ((v6 >> 21) & 1))
    goto LABEL_229;
  if (v50)
  {
    isHlsKeysReady = self->_isHlsKeysReady;
    if (isHlsKeysReady != objc_msgSend(v4, "isHlsKeysReady"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v52 = (*(_DWORD *)&v5 >> 22) & 1;
  if (v52 != ((v6 >> 22) & 1))
    goto LABEL_229;
  if (v52)
  {
    isInterruptingPlayback = self->_isInterruptingPlayback;
    if (isInterruptingPlayback != objc_msgSend(v4, "isInterruptingPlayback"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v54 = (*(_DWORD *)&v5 >> 23) & 1;
  if (v54 != ((v6 >> 23) & 1))
    goto LABEL_229;
  if (v54)
  {
    isRemoteSetQueue = self->_isRemoteSetQueue;
    if (isRemoteSetQueue != objc_msgSend(v4, "isRemoteSetQueue"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v56 = HIBYTE(*(_DWORD *)&v5) & 1;
  if (v56 != (BYTE3(v6) & 1))
    goto LABEL_229;
  if (v56)
  {
    isDelegatedPlayback = self->_isDelegatedPlayback;
    if (isDelegatedPlayback != objc_msgSend(v4, "isDelegatedPlayback"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v58 = (*(_DWORD *)&v5 >> 25) & 1;
  if (v58 != ((v6 >> 25) & 1))
    goto LABEL_229;
  if (v58)
  {
    isNonDefaultUser = self->_isNonDefaultUser;
    if (isNonDefaultUser != objc_msgSend(v4, "isNonDefaultUser"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v60 = (*(_DWORD *)&v5 >> 26) & 1;
  if (v60 != ((v6 >> 26) & 1))
    goto LABEL_229;
  if (v60)
  {
    isAutoPlay = self->_isAutoPlay;
    if (isAutoPlay != objc_msgSend(v4, "isAutoPlay"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v62 = (*(_DWORD *)&v5 >> 27) & 1;
  if (v62 != ((v6 >> 27) & 1))
    goto LABEL_229;
  if (v62)
  {
    isFirstPlayAfterAppLaunch = self->_isFirstPlayAfterAppLaunch;
    if (isFirstPlayAfterAppLaunch != objc_msgSend(v4, "isFirstPlayAfterAppLaunch"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v64 = (*(_DWORD *)&v5 >> 28) & 1;
  if (v64 != ((v6 >> 28) & 1))
    goto LABEL_229;
  if (v64)
  {
    isMiniSinfAvailable = self->_isMiniSinfAvailable;
    if (isMiniSinfAvailable != objc_msgSend(v4, "isMiniSinfAvailable"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v66 = (*(_DWORD *)&v5 >> 29) & 1;
  if (v66 != ((v6 >> 29) & 1))
    goto LABEL_229;
  if (v66)
  {
    isSharePlayPlayback = self->_isSharePlayPlayback;
    if (isSharePlayPlayback != objc_msgSend(v4, "isSharePlayPlayback"))
      goto LABEL_229;
    v5 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v7 = *(_QWORD *)&v5 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    LODWORD(v6) = v4[44];
  }
  v68 = (*(_DWORD *)&v5 >> 30) & 1;
  if (v68 != ((v6 >> 30) & 1))
    goto LABEL_229;
  if (v68)
  {
    isSuzeLease = self->_isSuzeLease;
    if (isSuzeLease != objc_msgSend(v4, "isSuzeLease"))
      goto LABEL_229;
    v7 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32);
    v8 = v4[44] | ((unint64_t)(*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
  }
  if (((v8 ^ v7) & 0x80000000) != 0)
    goto LABEL_229;
  if ((v7 & 0x80000000) != 0)
  {
    networkConnectionType = self->_networkConnectionType;
    if (networkConnectionType != objc_msgSend(v4, "networkConnectionType"))
      goto LABEL_229;
    LODWORD(v72) = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    LODWORD(v70) = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v71) = v70 >> 1;
    LODWORD(v73) = v72 >> 1;
  }
  else
  {
    v70 = HIDWORD(v8) & 0xFFFFFF;
    v71 = (v8 >> 33) & 0x7FFFFF;
    v72 = HIDWORD(v7) & 0xFFFFFF;
    v73 = (v7 >> 33) & 0x7FFFFF;
  }
  v75 = v72 & 1;
  if (v75 != (v70 & 1))
    goto LABEL_229;
  if (v75)
  {
    wasMediaLibraryDatabaseUpgraded = self->_wasMediaLibraryDatabaseUpgraded;
    if (wasMediaLibraryDatabaseUpgraded != objc_msgSend(v4, "wasMediaLibraryDatabaseUpgraded"))
      goto LABEL_229;
    LODWORD(v71) = (*((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16)) >> 1;
    LODWORD(v73) = (*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16)) >> 1;
  }
  v77 = v73 & 1;
  if (v77 != (v71 & 1))
    goto LABEL_229;
  if (v77)
  {
    isPrimaryUser = self->_isPrimaryUser;
    if (isPrimaryUser != objc_msgSend(v4, "isPrimaryUser"))
      goto LABEL_229;
  }
  -[MWTSchemaMWTMusicMetadataReported errorResolutionType](self, "errorResolutionType");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorResolutionType");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v79 == 0) == (v80 != 0))
    goto LABEL_228;
  -[MWTSchemaMWTMusicMetadataReported errorResolutionType](self, "errorResolutionType");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    -[MWTSchemaMWTMusicMetadataReported errorResolutionType](self, "errorResolutionType");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorResolutionType");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqual:", v84);

    if (!v85)
      goto LABEL_229;
  }
  else
  {

  }
  v86 = *((unsigned __int16 *)&self->_has + 2);
  v87 = (v86 >> 2) & 1;
  v88 = *((unsigned __int16 *)v4 + 90);
  if (v87 != ((v88 >> 2) & 1))
    goto LABEL_229;
  if (v87)
  {
    endPointType = self->_endPointType;
    if (endPointType != objc_msgSend(v4, "endPointType"))
      goto LABEL_229;
    v117 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v118 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v91) = v118 >> 3;
    LODWORD(v92) = v118 >> 5;
    LODWORD(v93) = v118 >> 6;
    LODWORD(v94) = v118 >> 7;
    LODWORD(v95) = v118 >> 8;
    LODWORD(v96) = v118 >> 9;
    LODWORD(v97) = v118 >> 10;
    v98 = v118 >> 11;
    LODWORD(v202) = v118 >> 4;
    LODWORD(v190) = v118 >> 12;
    LODWORD(v191) = v118 >> 13;
    LODWORD(v192) = v118 >> 14;
    LODWORD(v193) = v118 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v118 >> 17;
    LODWORD(v196) = v118 >> 18;
    LODWORD(v198) = v118 >> 19;
    LODWORD(v200) = v118 >> 20;
    LODWORD(v201) = v118 >> 21;
    LODWORD(v99) = v117 >> 3;
    LODWORD(v100) = v117 >> 4;
    LODWORD(v101) = v117 >> 5;
    LODWORD(v102) = v117 >> 6;
    LODWORD(v103) = v117 >> 7;
    LODWORD(v104) = v117 >> 8;
    LODWORD(v105) = v117 >> 9;
    LODWORD(v106) = v117 >> 10;
    LODWORD(v107) = v117 >> 11;
    LODWORD(v108) = v117 >> 12;
    LODWORD(v109) = v117 >> 13;
    LODWORD(v110) = v117 >> 14;
    v111 = v117 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v117 >> 17;
    v114 = v117 >> 18;
    LODWORD(v197) = v117 >> 19;
    LODWORD(v199) = v117 >> 20;
    v115 = v117 >> 21;
  }
  else
  {
    v89 = *(_DWORD *)&self->_has | ((unint64_t)(v86 | (*((unsigned __int8 *)&self->_has + 6) << 16)) << 32);
    v90 = v4[44] | ((unint64_t)(v88 | (*((unsigned __int8 *)v4 + 182) << 16)) << 32);
    v91 = v90 >> 35;
    v202 = v90 >> 36;
    v92 = v90 >> 37;
    v93 = v90 >> 38;
    v94 = v90 >> 39;
    v95 = v90 >> 40;
    v96 = v90 >> 41;
    v97 = v90 >> 42;
    v98 = v90 >> 43;
    v190 = v90 >> 44;
    v191 = v90 >> 45;
    v192 = v90 >> 46;
    v193 = v90 >> 47;
    v194 = HIWORD(v90);
    v195 = v90 >> 49;
    v196 = v90 >> 50;
    v198 = v90 >> 51;
    v200 = v90 >> 52;
    v201 = v90 >> 53;
    v99 = v89 >> 35;
    v100 = v89 >> 36;
    v101 = v89 >> 37;
    v102 = v89 >> 38;
    v103 = v89 >> 39;
    v104 = v89 >> 40;
    v105 = v89 >> 41;
    v106 = v89 >> 42;
    v107 = v89 >> 43;
    v108 = v89 >> 44;
    v109 = v89 >> 45;
    v110 = v89 >> 46;
    v111 = v89 >> 47;
    v112 = HIWORD(v89);
    v113 = v89 >> 49;
    v114 = v89 >> 50;
    v197 = v89 >> 51;
    v199 = v89 >> 52;
    v115 = v89 >> 53;
  }
  v119 = v99 & 1;
  if (v119 != (v91 & 1))
    goto LABEL_229;
  if (v119)
  {
    routeType = self->_routeType;
    if (routeType != objc_msgSend(v4, "routeType", v114, v115, v113, v112, v98, v111))
      goto LABEL_229;
    v121 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v122 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v92) = v122 >> 5;
    LODWORD(v93) = v122 >> 6;
    LODWORD(v94) = v122 >> 7;
    LODWORD(v95) = v122 >> 8;
    LODWORD(v96) = v122 >> 9;
    LODWORD(v97) = v122 >> 10;
    v98 = v122 >> 11;
    LODWORD(v202) = v122 >> 4;
    LODWORD(v190) = v122 >> 12;
    LODWORD(v191) = v122 >> 13;
    LODWORD(v192) = v122 >> 14;
    LODWORD(v193) = v122 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v122 >> 17;
    LODWORD(v196) = v122 >> 18;
    LODWORD(v198) = v122 >> 19;
    LODWORD(v200) = v122 >> 20;
    LODWORD(v201) = v122 >> 21;
    LODWORD(v100) = v121 >> 4;
    LODWORD(v101) = v121 >> 5;
    LODWORD(v102) = v121 >> 6;
    LODWORD(v103) = v121 >> 7;
    LODWORD(v104) = v121 >> 8;
    LODWORD(v105) = v121 >> 9;
    LODWORD(v106) = v121 >> 10;
    LODWORD(v107) = v121 >> 11;
    LODWORD(v108) = v121 >> 12;
    LODWORD(v109) = v121 >> 13;
    LODWORD(v110) = v121 >> 14;
    v111 = v121 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v121 >> 17;
    v114 = v121 >> 18;
    LODWORD(v197) = v121 >> 19;
    LODWORD(v199) = v121 >> 20;
    v115 = v121 >> 21;
  }
  v123 = v100 & 1;
  if (v123 != (v202 & 1))
    goto LABEL_229;
  if (v123)
  {
    formatLayoutValue = self->_formatLayoutValue;
    if (formatLayoutValue != objc_msgSend(v4, "formatLayoutValue", v114, v115, v113, v112, v98, v111))
      goto LABEL_229;
    v125 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v126 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v92) = v126 >> 5;
    LODWORD(v93) = v126 >> 6;
    LODWORD(v94) = v126 >> 7;
    LODWORD(v95) = v126 >> 8;
    LODWORD(v96) = v126 >> 9;
    LODWORD(v97) = v126 >> 10;
    v98 = v126 >> 11;
    LODWORD(v190) = v126 >> 12;
    LODWORD(v191) = v126 >> 13;
    LODWORD(v192) = v126 >> 14;
    LODWORD(v193) = v126 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v126 >> 17;
    LODWORD(v196) = v126 >> 18;
    LODWORD(v198) = v126 >> 19;
    LODWORD(v200) = v126 >> 20;
    LODWORD(v201) = v126 >> 21;
    LODWORD(v101) = v125 >> 5;
    LODWORD(v102) = v125 >> 6;
    LODWORD(v103) = v125 >> 7;
    LODWORD(v104) = v125 >> 8;
    LODWORD(v105) = v125 >> 9;
    LODWORD(v106) = v125 >> 10;
    LODWORD(v107) = v125 >> 11;
    LODWORD(v108) = v125 >> 12;
    LODWORD(v109) = v125 >> 13;
    LODWORD(v110) = v125 >> 14;
    v111 = v125 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v125 >> 17;
    v114 = v125 >> 18;
    LODWORD(v197) = v125 >> 19;
    LODWORD(v199) = v125 >> 20;
    v115 = v125 >> 21;
  }
  v127 = v101 & 1;
  if (v127 != (v92 & 1))
    goto LABEL_229;
  if (v127)
  {
    assetSource = self->_assetSource;
    if (assetSource != objc_msgSend(v4, "assetSource", v114, v115, v113, v112, v98, v111))
      goto LABEL_229;
    v129 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v130 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v93) = v130 >> 6;
    LODWORD(v94) = v130 >> 7;
    LODWORD(v95) = v130 >> 8;
    LODWORD(v96) = v130 >> 9;
    LODWORD(v97) = v130 >> 10;
    v98 = v130 >> 11;
    v131 = v130 >> 18;
    LODWORD(v190) = v130 >> 12;
    LODWORD(v191) = v130 >> 13;
    LODWORD(v192) = v130 >> 14;
    LODWORD(v193) = v130 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v130 >> 17;
    LODWORD(v198) = v130 >> 19;
    LODWORD(v200) = v130 >> 20;
    LODWORD(v201) = v130 >> 21;
    LODWORD(v102) = v129 >> 6;
    LODWORD(v103) = v129 >> 7;
    LODWORD(v104) = v129 >> 8;
    LODWORD(v105) = v129 >> 9;
    LODWORD(v106) = v129 >> 10;
    LODWORD(v107) = v129 >> 11;
    LODWORD(v108) = v129 >> 12;
    LODWORD(v109) = v129 >> 13;
    LODWORD(v110) = v129 >> 14;
    v111 = v129 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v129 >> 17;
    v114 = v129 >> 18;
    LOBYTE(v196) = v131;
    LODWORD(v197) = v129 >> 19;
    LODWORD(v199) = v129 >> 20;
    v115 = v129 >> 21;
  }
  if ((v102 & 1) != (v93 & 1))
    goto LABEL_229;
  if ((v102 & 1) != 0)
  {
    assetLocation = self->_assetLocation;
    if (assetLocation != objc_msgSend(v4, "assetLocation", v114, v115, v113, v112, v98, v111))
      goto LABEL_229;
    v133 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v134 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v94) = v134 >> 7;
    LODWORD(v95) = v134 >> 8;
    LODWORD(v96) = v134 >> 9;
    LODWORD(v97) = v134 >> 10;
    v98 = v134 >> 11;
    v135 = v134 >> 18;
    v136 = v134 >> 19;
    LODWORD(v190) = v134 >> 12;
    LODWORD(v191) = v134 >> 13;
    LODWORD(v192) = v134 >> 14;
    LODWORD(v193) = v134 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v134 >> 17;
    LODWORD(v200) = v134 >> 20;
    LODWORD(v201) = v134 >> 21;
    LODWORD(v103) = v133 >> 7;
    LODWORD(v104) = v133 >> 8;
    LODWORD(v105) = v133 >> 9;
    LODWORD(v106) = v133 >> 10;
    LODWORD(v107) = v133 >> 11;
    LODWORD(v108) = v133 >> 12;
    LODWORD(v109) = v133 >> 13;
    LODWORD(v110) = v133 >> 14;
    v111 = v133 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v133 >> 17;
    v114 = v133 >> 18;
    LOBYTE(v196) = v135;
    LODWORD(v197) = v133 >> 19;
    LOBYTE(v198) = v136;
    LODWORD(v199) = v133 >> 20;
    v115 = v133 >> 21;
  }
  if ((v103 & 1) != (v94 & 1))
    goto LABEL_229;
  if ((v103 & 1) != 0)
  {
    subscriptionType = self->_subscriptionType;
    if (subscriptionType != objc_msgSend(v4, "subscriptionType", v114, v115, v113, v112, v98, v111))
      goto LABEL_229;
    v138 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v139 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v95) = v139 >> 8;
    LODWORD(v96) = v139 >> 9;
    LODWORD(v97) = v139 >> 10;
    v98 = v139 >> 11;
    v140 = v139 >> 18;
    v141 = v139 >> 19;
    LODWORD(v190) = v139 >> 12;
    LODWORD(v191) = v139 >> 13;
    LODWORD(v192) = v139 >> 14;
    LODWORD(v193) = v139 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v139 >> 17;
    LODWORD(v200) = v139 >> 20;
    LODWORD(v201) = v139 >> 21;
    LODWORD(v104) = v138 >> 8;
    LODWORD(v105) = v138 >> 9;
    LODWORD(v106) = v138 >> 10;
    LODWORD(v107) = v138 >> 11;
    LODWORD(v108) = v138 >> 12;
    LODWORD(v109) = v138 >> 13;
    LODWORD(v110) = v138 >> 14;
    v111 = v138 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v138 >> 17;
    v114 = v138 >> 18;
    LOBYTE(v196) = v140;
    LODWORD(v197) = v138 >> 19;
    LOBYTE(v198) = v141;
    LODWORD(v199) = v138 >> 20;
    v115 = v138 >> 21;
  }
  if ((v104 & 1) != (v95 & 1))
    goto LABEL_229;
  if ((v104 & 1) != 0)
  {
    hasLookupWaitTime = self->_hasLookupWaitTime;
    if (hasLookupWaitTime != objc_msgSend(v4, "hasLookupWaitTime", v114, v115, v113, v112, v98, v111))
      goto LABEL_229;
    v143 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v144 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v96) = v144 >> 9;
    LODWORD(v97) = v144 >> 10;
    v98 = v144 >> 11;
    v145 = v144 >> 18;
    v146 = v144 >> 19;
    LODWORD(v190) = v144 >> 12;
    LODWORD(v191) = v144 >> 13;
    LODWORD(v192) = v144 >> 14;
    LODWORD(v193) = v144 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v144 >> 17;
    LODWORD(v200) = v144 >> 20;
    LODWORD(v201) = v144 >> 21;
    LODWORD(v105) = v143 >> 9;
    LODWORD(v106) = v143 >> 10;
    LODWORD(v107) = v143 >> 11;
    LODWORD(v108) = v143 >> 12;
    LODWORD(v109) = v143 >> 13;
    LODWORD(v110) = v143 >> 14;
    v111 = v143 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v143 >> 17;
    v114 = v143 >> 18;
    LOBYTE(v196) = v145;
    LODWORD(v197) = v143 >> 19;
    LOBYTE(v198) = v146;
    LODWORD(v199) = v143 >> 20;
    v115 = v143 >> 21;
  }
  v147 = v105 & 1;
  if (v147 != (v96 & 1))
    goto LABEL_229;
  if (v147)
  {
    hasBagWaitTime = self->_hasBagWaitTime;
    if (hasBagWaitTime != objc_msgSend(v4, "hasBagWaitTime", v114, v115, v113, v112, v98, v111))
      goto LABEL_229;
    v149 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v150 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v97) = v150 >> 10;
    v98 = v150 >> 11;
    LODWORD(v106) = v149 >> 10;
    LODWORD(v107) = v149 >> 11;
    LODWORD(v190) = v150 >> 12;
    LODWORD(v191) = v150 >> 13;
    LODWORD(v192) = v150 >> 14;
    LODWORD(v193) = v150 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v150 >> 17;
    LODWORD(v200) = v150 >> 20;
    LODWORD(v201) = v150 >> 21;
    LODWORD(v108) = v149 >> 12;
    LODWORD(v109) = v149 >> 13;
    LODWORD(v110) = v149 >> 14;
    v111 = v149 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v149 >> 17;
    v114 = v149 >> 18;
    LODWORD(v196) = v150 >> 18;
    LODWORD(v197) = v149 >> 19;
    LODWORD(v198) = v150 >> 19;
    LODWORD(v199) = v149 >> 20;
    v115 = v149 >> 21;
  }
  if ((v106 & 1) != (v97 & 1))
    goto LABEL_229;
  if ((v106 & 1) != 0)
  {
    hasLeaseWaitTime = self->_hasLeaseWaitTime;
    if (hasLeaseWaitTime != objc_msgSend(v4, "hasLeaseWaitTime", v114, v115, v113, v112, v98, v111))
      goto LABEL_229;
    v152 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v153 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v98) = v153 >> 11;
    LODWORD(v107) = v152 >> 11;
    LODWORD(v108) = v152 >> 12;
    LODWORD(v109) = v152 >> 13;
    LODWORD(v190) = v153 >> 12;
    LODWORD(v191) = v153 >> 13;
    LODWORD(v192) = v153 >> 14;
    LODWORD(v193) = v153 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v153 >> 17;
    LODWORD(v200) = v153 >> 20;
    LODWORD(v201) = v153 >> 21;
    LODWORD(v110) = v152 >> 14;
    LODWORD(v111) = v152 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v152 >> 17;
    v114 = v152 >> 18;
    LODWORD(v196) = v153 >> 18;
    LODWORD(v197) = v152 >> 19;
    LODWORD(v198) = v153 >> 19;
    LODWORD(v199) = v152 >> 20;
    v115 = v152 >> 21;
  }
  if ((v107 & 1) != (v98 & 1))
    goto LABEL_229;
  if ((v107 & 1) != 0)
  {
    hasSuzeLeaseWaitTime = self->_hasSuzeLeaseWaitTime;
    if (hasSuzeLeaseWaitTime != objc_msgSend(v4, "hasSuzeLeaseWaitTime", v114, v115, v113, v112))
      goto LABEL_229;
    v155 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v156 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v108) = v155 >> 12;
    LODWORD(v109) = v155 >> 13;
    LODWORD(v110) = v155 >> 14;
    LODWORD(v111) = v155 >> 15;
    LODWORD(v190) = v156 >> 12;
    LODWORD(v191) = v156 >> 13;
    LODWORD(v192) = v156 >> 14;
    LODWORD(v193) = v156 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v156 >> 17;
    LODWORD(v200) = v156 >> 20;
    LODWORD(v201) = v156 >> 21;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v155 >> 17;
    v114 = v155 >> 18;
    LODWORD(v196) = v156 >> 18;
    LODWORD(v197) = v155 >> 19;
    LODWORD(v198) = v156 >> 19;
    LODWORD(v199) = v155 >> 20;
    v115 = v155 >> 21;
  }
  if ((v108 & 1) != (v190 & 1))
    goto LABEL_229;
  if ((v108 & 1) != 0)
  {
    hasSubscriptionAssetLoadWaitTime = self->_hasSubscriptionAssetLoadWaitTime;
    if (hasSubscriptionAssetLoadWaitTime != objc_msgSend(v4, "hasSubscriptionAssetLoadWaitTime", v114, v115, v113, v112))goto LABEL_229;
    v158 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v159 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v109) = v158 >> 13;
    LODWORD(v110) = v158 >> 14;
    LODWORD(v111) = v158 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v158 >> 17;
    LODWORD(v191) = v159 >> 13;
    LODWORD(v192) = v159 >> 14;
    LODWORD(v193) = v159 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v159 >> 17;
    LODWORD(v196) = v159 >> 18;
    LODWORD(v200) = v159 >> 20;
    LODWORD(v201) = v159 >> 21;
    v114 = v158 >> 18;
    LODWORD(v197) = v158 >> 19;
    LODWORD(v198) = v159 >> 19;
    LODWORD(v199) = v158 >> 20;
    v115 = v158 >> 21;
  }
  if ((v109 & 1) != (v191 & 1))
    goto LABEL_229;
  if ((v109 & 1) != 0)
  {
    hasMediaRedownloadWaitTime = self->_hasMediaRedownloadWaitTime;
    if (hasMediaRedownloadWaitTime != objc_msgSend(v4, "hasMediaRedownloadWaitTime", v114, v115, v113, v112))goto LABEL_229;
    v161 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v162 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v110) = v161 >> 14;
    LODWORD(v111) = v161 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v161 >> 17;
    v114 = v161 >> 18;
    LODWORD(v192) = v162 >> 14;
    LODWORD(v193) = v162 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v162 >> 17;
    LODWORD(v200) = v162 >> 20;
    LODWORD(v201) = v162 >> 21;
    LODWORD(v196) = v162 >> 18;
    LODWORD(v197) = v161 >> 19;
    LODWORD(v198) = v162 >> 19;
    LODWORD(v199) = v161 >> 20;
    v115 = v161 >> 21;
  }
  if ((v110 & 1) != (v192 & 1))
    goto LABEL_229;
  if ((v110 & 1) != 0)
  {
    cmInitialStartupItemCreationToReadyToPlayDurationInMs = self->_cmInitialStartupItemCreationToReadyToPlayDurationInMs;
    if (cmInitialStartupItemCreationToReadyToPlayDurationInMs != objc_msgSend(v4, "cmInitialStartupItemCreationToReadyToPlayDurationInMs", v114, v115, v113, v112))goto LABEL_229;
    v164 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v165 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v111) = v164 >> 15;
    v112 = *((unsigned __int8 *)&self->_has + 6);
    v113 = v164 >> 17;
    v114 = v164 >> 18;
    v115 = v164 >> 21;
    LODWORD(v193) = v165 >> 15;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v165 >> 17;
    LODWORD(v196) = v165 >> 18;
    LODWORD(v200) = v165 >> 20;
    LODWORD(v201) = v165 >> 21;
    LODWORD(v197) = v164 >> 19;
    LODWORD(v198) = v165 >> 19;
    LODWORD(v199) = v164 >> 20;
  }
  if ((v111 & 1) != (v193 & 1))
    goto LABEL_229;
  if ((v111 & 1) != 0)
  {
    cmInitialStartupItemCreationToLtluDurationInMs = self->_cmInitialStartupItemCreationToLtluDurationInMs;
    if (cmInitialStartupItemCreationToLtluDurationInMs != objc_msgSend(v4, "cmInitialStartupItemCreationToLtluDurationInMs", v114, v115, v113, v112))goto LABEL_229;
    v167 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v168 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LOBYTE(v112) = *((_BYTE *)&self->_has + 6);
    v113 = v167 >> 17;
    v114 = v167 >> 18;
    v115 = v167 >> 21;
    LOBYTE(v194) = *((_BYTE *)v4 + 182);
    LODWORD(v195) = v168 >> 17;
    LODWORD(v200) = v168 >> 20;
    LODWORD(v201) = v168 >> 21;
    LODWORD(v196) = v168 >> 18;
    LODWORD(v197) = v167 >> 19;
    LODWORD(v198) = v168 >> 19;
    LODWORD(v199) = v167 >> 20;
  }
  if ((v112 & 1) != (v194 & 1))
    goto LABEL_229;
  if ((v112 & 1) != 0)
  {
    masterPlaylistConnectionTlsHandshakeDurationInMs = self->_masterPlaylistConnectionTlsHandshakeDurationInMs;
    if (masterPlaylistConnectionTlsHandshakeDurationInMs != objc_msgSend(v4, "masterPlaylistConnectionTlsHandshakeDurationInMs", v114, v115, v113))goto LABEL_229;
    v170 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v171 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v113) = v170 >> 17;
    v114 = v170 >> 18;
    v115 = v170 >> 21;
    LODWORD(v195) = v171 >> 17;
    LODWORD(v196) = v171 >> 18;
    LODWORD(v200) = v171 >> 20;
    LODWORD(v201) = v171 >> 21;
    LODWORD(v197) = v170 >> 19;
    LODWORD(v198) = v171 >> 19;
    LODWORD(v199) = v170 >> 20;
  }
  if ((v113 & 1) != (v195 & 1))
    goto LABEL_229;
  if ((v113 & 1) != 0)
  {
    masterPlaylistRequestDurationInMs = self->_masterPlaylistRequestDurationInMs;
    if (masterPlaylistRequestDurationInMs != objc_msgSend(v4, "masterPlaylistRequestDurationInMs", v114, v115))goto LABEL_229;
    v173 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v174 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v114) = v173 >> 18;
    LODWORD(v115) = v173 >> 21;
    LODWORD(v200) = v174 >> 20;
    LODWORD(v201) = v174 >> 21;
    LODWORD(v196) = v174 >> 18;
    LODWORD(v197) = v173 >> 19;
    LODWORD(v198) = v174 >> 19;
    LODWORD(v199) = v173 >> 20;
  }
  if ((v114 & 1) != (v196 & 1))
    goto LABEL_229;
  if ((v114 & 1) != 0)
  {
    subPlaylistConnectionTlsHandshakeDurationInMs = self->_subPlaylistConnectionTlsHandshakeDurationInMs;
    if (subPlaylistConnectionTlsHandshakeDurationInMs != objc_msgSend(v4, "subPlaylistConnectionTlsHandshakeDurationInMs"))goto LABEL_229;
    v176 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v177 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v115) = v176 >> 21;
    LODWORD(v200) = v177 >> 20;
    LODWORD(v201) = v177 >> 21;
    LODWORD(v197) = v176 >> 19;
    LODWORD(v198) = v177 >> 19;
    LODWORD(v199) = v176 >> 20;
  }
  if ((v197 & 1) != (v198 & 1))
    goto LABEL_229;
  if ((v197 & 1) != 0)
  {
    subPlaylistRequestDurationInMs = self->_subPlaylistRequestDurationInMs;
    if (subPlaylistRequestDurationInMs != objc_msgSend(v4, "subPlaylistRequestDurationInMs"))
      goto LABEL_229;
    v179 = *((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has + 6) << 16);
    v180 = *((unsigned __int16 *)v4 + 90) | (*((unsigned __int8 *)v4 + 182) << 16);
    LODWORD(v115) = v179 >> 21;
    LODWORD(v200) = v180 >> 20;
    LODWORD(v201) = v180 >> 21;
    LODWORD(v199) = v179 >> 20;
  }
  if ((v199 & 1) != (v200 & 1))
    goto LABEL_229;
  if ((v199 & 1) != 0)
  {
    contentConnectionTlsHandshakeDurationInMs = self->_contentConnectionTlsHandshakeDurationInMs;
    if (contentConnectionTlsHandshakeDurationInMs != objc_msgSend(v4, "contentConnectionTlsHandshakeDurationInMs"))goto LABEL_229;
    LODWORD(v115) = *((unsigned __int8 *)&self->_has + 6) >> 5;
    LODWORD(v201) = *((unsigned __int8 *)v4 + 182) >> 5;
  }
  if ((v115 & 1) != (v201 & 1))
    goto LABEL_229;
  if ((v115 & 1) != 0)
  {
    contentFirstSegmentDurationInMs = self->_contentFirstSegmentDurationInMs;
    if (contentFirstSegmentDurationInMs != objc_msgSend(v4, "contentFirstSegmentDurationInMs"))
      goto LABEL_229;
  }
  -[MWTSchemaMWTMusicMetadataReported audioQueueType](self, "audioQueueType");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioQueueType");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v79 == 0) == (v80 != 0))
  {
LABEL_228:

    goto LABEL_229;
  }
  -[MWTSchemaMWTMusicMetadataReported audioQueueType](self, "audioQueueType");
  v183 = objc_claimAutoreleasedReturnValue();
  if (!v183)
  {

LABEL_232:
    v188 = 1;
    goto LABEL_230;
  }
  v184 = (void *)v183;
  -[MWTSchemaMWTMusicMetadataReported audioQueueType](self, "audioQueueType");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioQueueType");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = objc_msgSend(v185, "isEqual:", v186);

  if ((v187 & 1) != 0)
    goto LABEL_232;
LABEL_229:
  v188 = 0;
LABEL_230:

  return v188;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
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
  uint64_t v30;
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
  uint64_t v42;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v3 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_musicDomain;
    if ((*(_DWORD *)&self->_has & 2) != 0)
    {
LABEL_3:
      v61 = 2654435761 * self->_queueType;
      if ((*(_DWORD *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_DWORD *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v61 = 0;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v60 = 2654435761 * self->_queueSize;
    if ((*(_DWORD *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  v60 = 0;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_5:
    v59 = 2654435761 * self->_isShuffled;
    if ((*(_DWORD *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  v59 = 0;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v58 = 2654435761 * self->_prefetchedMetadataSource;
    if ((*(_DWORD *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  v58 = 0;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v57 = 2654435761 * self->_assetEndPoint;
    if ((*(_DWORD *)&self->_has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  v57 = 0;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    v56 = 2654435761 * self->_streamingContentType;
    if ((*(_DWORD *)&self->_has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  v56 = 0;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    v55 = 2654435761 * self->_formatCodec;
    if ((*(_DWORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  v55 = 0;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v54 = 2654435761 * self->_formatBitrate;
    if ((*(_DWORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  v54 = 0;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v53 = 2654435761 * self->_formatBitDepth;
    if ((*(_DWORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  v53 = 0;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    v52 = 2654435761 * self->_formatChannels;
    if ((*(_DWORD *)&self->_has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_46:
  v52 = 0;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    v51 = 2654435761 * self->_formatLayout;
    if ((*(_DWORD *)&self->_has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_47:
  v51 = 0;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    v50 = 2654435761 * self->_formatSampleRate;
    if ((*(_DWORD *)&self->_has & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_48:
  v50 = 0;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_15:
    v49 = 2654435761 * self->_formatTier;
    if ((*(_DWORD *)&self->_has & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_50;
  }
LABEL_49:
  v49 = 0;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_16:
    v48 = 2654435761 * self->_numberOfSpeakers;
    if ((*(_DWORD *)&self->_has & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_51;
  }
LABEL_50:
  v48 = 0;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    v47 = 2654435761 * self->_routeConfiguration;
    if ((*(_DWORD *)&self->_has & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_52;
  }
LABEL_51:
  v47 = 0;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_18:
    v46 = 2654435761 * self->_isAccountDataReady;
    if ((*(_DWORD *)&self->_has & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_52:
  v46 = 0;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_19:
    v45 = 2654435761 * self->_isStoreBagReady;
    if ((*(_DWORD *)&self->_has & 0x40000) != 0)
      goto LABEL_20;
    goto LABEL_54;
  }
LABEL_53:
  v45 = 0;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_20:
    v44 = 2654435761 * self->_isLeaseReady;
    if ((*(_DWORD *)&self->_has & 0x80000) != 0)
      goto LABEL_21;
    goto LABEL_55;
  }
LABEL_54:
  v44 = 0;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_21:
    v43 = 2654435761 * self->_isOnlineKeyReady;
    if ((*(_DWORD *)&self->_has & 0x100000) != 0)
      goto LABEL_22;
    goto LABEL_56;
  }
LABEL_55:
  v43 = 0;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_22:
    v42 = 2654435761 * self->_isOfflineKeyReady;
    if ((*(_DWORD *)&self->_has & 0x200000) != 0)
      goto LABEL_23;
    goto LABEL_57;
  }
LABEL_56:
  v42 = 0;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_23:
    v41 = 2654435761 * self->_isHlsKeysReady;
    if ((*(_DWORD *)&self->_has & 0x400000) != 0)
      goto LABEL_24;
    goto LABEL_58;
  }
LABEL_57:
  v41 = 0;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_24:
    v40 = 2654435761 * self->_isInterruptingPlayback;
    if ((*(_DWORD *)&self->_has & 0x800000) != 0)
      goto LABEL_25;
    goto LABEL_59;
  }
LABEL_58:
  v40 = 0;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_25:
    v39 = 2654435761 * self->_isRemoteSetQueue;
    if ((*(_DWORD *)&self->_has & 0x1000000) != 0)
      goto LABEL_26;
    goto LABEL_60;
  }
LABEL_59:
  v39 = 0;
  if ((*(_DWORD *)&self->_has & 0x1000000) != 0)
  {
LABEL_26:
    v38 = 2654435761 * self->_isDelegatedPlayback;
    if ((*(_DWORD *)&self->_has & 0x2000000) != 0)
      goto LABEL_27;
    goto LABEL_61;
  }
LABEL_60:
  v38 = 0;
  if ((*(_DWORD *)&self->_has & 0x2000000) != 0)
  {
LABEL_27:
    v37 = 2654435761 * self->_isNonDefaultUser;
    if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
      goto LABEL_28;
    goto LABEL_62;
  }
LABEL_61:
  v37 = 0;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_28:
    v36 = 2654435761 * self->_isAutoPlay;
    if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
      goto LABEL_29;
    goto LABEL_63;
  }
LABEL_62:
  v36 = 0;
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
  {
LABEL_29:
    v35 = 2654435761 * self->_isFirstPlayAfterAppLaunch;
    if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
      goto LABEL_30;
    goto LABEL_64;
  }
LABEL_63:
  v35 = 0;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_30:
    v34 = 2654435761 * self->_isMiniSinfAvailable;
    if ((*(_DWORD *)&self->_has & 0x20000000) != 0)
      goto LABEL_31;
    goto LABEL_65;
  }
LABEL_64:
  v34 = 0;
  if ((*(_DWORD *)&self->_has & 0x20000000) != 0)
  {
LABEL_31:
    v32 = 2654435761 * self->_isSharePlayPlayback;
    if ((*(_DWORD *)&self->_has & 0x40000000) != 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_65:
  v32 = 0;
  if ((*(_DWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_32:
    v5 = 2654435761 * self->_isSuzeLease;
    if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_66:
  v5 = 0;
  if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_33:
    v6 = 2654435761 * self->_networkConnectionType;
    if ((v3 & 0x100000000) != 0)
      goto LABEL_34;
LABEL_68:
    v7 = 0;
    if ((v3 & 0x200000000) != 0)
      goto LABEL_35;
    goto LABEL_69;
  }
LABEL_67:
  v6 = 0;
  if ((v3 & 0x100000000) == 0)
    goto LABEL_68;
LABEL_34:
  v7 = 2654435761 * self->_wasMediaLibraryDatabaseUpgraded;
  if ((v3 & 0x200000000) != 0)
  {
LABEL_35:
    v8 = 2654435761 * self->_isPrimaryUser;
    goto LABEL_70;
  }
LABEL_69:
  v8 = 0;
LABEL_70:
  v9 = -[NSString hash](self->_errorResolutionType, "hash", v32);
  v10 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v10 & 0x400000000) != 0)
  {
    v11 = 2654435761 * self->_endPointType;
    if ((v10 & 0x800000000) != 0)
    {
LABEL_72:
      v12 = 2654435761 * self->_routeType;
      if ((v10 & 0x1000000000) != 0)
        goto LABEL_73;
      goto LABEL_93;
    }
  }
  else
  {
    v11 = 0;
    if ((v10 & 0x800000000) != 0)
      goto LABEL_72;
  }
  v12 = 0;
  if ((v10 & 0x1000000000) != 0)
  {
LABEL_73:
    v13 = 2654435761 * self->_formatLayoutValue;
    if ((v10 & 0x2000000000) != 0)
      goto LABEL_74;
    goto LABEL_94;
  }
LABEL_93:
  v13 = 0;
  if ((v10 & 0x2000000000) != 0)
  {
LABEL_74:
    v14 = 2654435761 * self->_assetSource;
    if ((v10 & 0x4000000000) != 0)
      goto LABEL_75;
    goto LABEL_95;
  }
LABEL_94:
  v14 = 0;
  if ((v10 & 0x4000000000) != 0)
  {
LABEL_75:
    v15 = 2654435761 * self->_assetLocation;
    if ((v10 & 0x8000000000) != 0)
      goto LABEL_76;
    goto LABEL_96;
  }
LABEL_95:
  v15 = 0;
  if ((v10 & 0x8000000000) != 0)
  {
LABEL_76:
    v16 = 2654435761 * self->_subscriptionType;
    if ((v10 & 0x10000000000) != 0)
      goto LABEL_77;
    goto LABEL_97;
  }
LABEL_96:
  v16 = 0;
  if ((v10 & 0x10000000000) != 0)
  {
LABEL_77:
    v17 = 2654435761 * self->_hasLookupWaitTime;
    if ((v10 & 0x20000000000) != 0)
      goto LABEL_78;
    goto LABEL_98;
  }
LABEL_97:
  v17 = 0;
  if ((v10 & 0x20000000000) != 0)
  {
LABEL_78:
    v18 = 2654435761 * self->_hasBagWaitTime;
    if ((v10 & 0x40000000000) != 0)
      goto LABEL_79;
    goto LABEL_99;
  }
LABEL_98:
  v18 = 0;
  if ((v10 & 0x40000000000) != 0)
  {
LABEL_79:
    v19 = 2654435761 * self->_hasLeaseWaitTime;
    if ((v10 & 0x80000000000) != 0)
      goto LABEL_80;
    goto LABEL_100;
  }
LABEL_99:
  v19 = 0;
  if ((v10 & 0x80000000000) != 0)
  {
LABEL_80:
    v20 = 2654435761 * self->_hasSuzeLeaseWaitTime;
    if ((v10 & 0x100000000000) != 0)
      goto LABEL_81;
    goto LABEL_101;
  }
LABEL_100:
  v20 = 0;
  if ((v10 & 0x100000000000) != 0)
  {
LABEL_81:
    v21 = 2654435761 * self->_hasSubscriptionAssetLoadWaitTime;
    if ((v10 & 0x200000000000) != 0)
      goto LABEL_82;
    goto LABEL_102;
  }
LABEL_101:
  v21 = 0;
  if ((v10 & 0x200000000000) != 0)
  {
LABEL_82:
    v22 = 2654435761 * self->_hasMediaRedownloadWaitTime;
    if ((v10 & 0x400000000000) != 0)
      goto LABEL_83;
    goto LABEL_103;
  }
LABEL_102:
  v22 = 0;
  if ((v10 & 0x400000000000) != 0)
  {
LABEL_83:
    v23 = 2654435761 * self->_cmInitialStartupItemCreationToReadyToPlayDurationInMs;
    if ((v10 & 0x800000000000) != 0)
      goto LABEL_84;
    goto LABEL_104;
  }
LABEL_103:
  v23 = 0;
  if ((v10 & 0x800000000000) != 0)
  {
LABEL_84:
    v24 = 2654435761 * self->_cmInitialStartupItemCreationToLtluDurationInMs;
    if ((v10 & 0x1000000000000) != 0)
      goto LABEL_85;
    goto LABEL_105;
  }
LABEL_104:
  v24 = 0;
  if ((v10 & 0x1000000000000) != 0)
  {
LABEL_85:
    v25 = 2654435761 * self->_masterPlaylistConnectionTlsHandshakeDurationInMs;
    if ((v10 & 0x2000000000000) != 0)
      goto LABEL_86;
    goto LABEL_106;
  }
LABEL_105:
  v25 = 0;
  if ((v10 & 0x2000000000000) != 0)
  {
LABEL_86:
    v26 = 2654435761 * self->_masterPlaylistRequestDurationInMs;
    if ((v10 & 0x4000000000000) != 0)
      goto LABEL_87;
    goto LABEL_107;
  }
LABEL_106:
  v26 = 0;
  if ((v10 & 0x4000000000000) != 0)
  {
LABEL_87:
    v27 = 2654435761 * self->_subPlaylistConnectionTlsHandshakeDurationInMs;
    if ((v10 & 0x8000000000000) != 0)
      goto LABEL_88;
    goto LABEL_108;
  }
LABEL_107:
  v27 = 0;
  if ((v10 & 0x8000000000000) != 0)
  {
LABEL_88:
    v28 = 2654435761 * self->_subPlaylistRequestDurationInMs;
    if ((v10 & 0x10000000000000) != 0)
      goto LABEL_89;
LABEL_109:
    v29 = 0;
    if ((v10 & 0x20000000000000) != 0)
      goto LABEL_90;
LABEL_110:
    v30 = 0;
    return v61 ^ v4 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v5 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ -[NSString hash](self->_audioQueueType, "hash");
  }
LABEL_108:
  v28 = 0;
  if ((v10 & 0x10000000000000) == 0)
    goto LABEL_109;
LABEL_89:
  v29 = 2654435761 * self->_contentConnectionTlsHandshakeDurationInMs;
  if ((v10 & 0x20000000000000) == 0)
    goto LABEL_110;
LABEL_90:
  v30 = 2654435761 * self->_contentFirstSegmentDurationInMs;
  return v61 ^ v4 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v5 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ -[NSString hash](self->_audioQueueType, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  unsigned int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  $3A707FEDEB8D4B451EE4458D3B539123 v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v28;
  $3A707FEDEB8D4B451EE4458D3B539123 v29;
  void *v30;
  void *v31;
  unsigned int v32;
  const __CFString *v33;
  unsigned int v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  const __CFString *v39;
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
  unsigned int v65;
  const __CFString *v66;
  unsigned int v67;
  const __CFString *v68;
  void *v69;
  unsigned int v70;
  const __CFString *v71;
  void *v72;
  unsigned int v73;
  const __CFString *v74;
  unsigned int v75;
  const __CFString *v76;
  unsigned int v77;
  const __CFString *v78;
  unsigned int v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  unsigned int v83;
  const __CFString *v84;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                              + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
    v5 = -[MWTSchemaMWTMusicMetadataReported assetEndPoint](self, "assetEndPoint") - 1;
    if (v5 > 4)
      v6 = CFSTR("MWTASSETENDPOINT_UNKNOWN");
    else
      v6 = off_1E5630CC0[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assetEndPoint"));
    v4 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32);
    if ((v4 & 0x4000000000) == 0)
    {
LABEL_3:
      if ((v4 & 0x2000000000) == 0)
        goto LABEL_19;
      goto LABEL_15;
    }
  }
  else if ((v4 & 0x4000000000) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[MWTSchemaMWTMusicMetadataReported assetLocation](self, "assetLocation");
  v8 = CFSTR("MWTASSETLOCATION_UNKNOWN");
  if (v7 == 1)
    v8 = CFSTR("MWTASSETLOCATION_LOCAL_FILE");
  if (v7 == 2)
    v9 = CFSTR("MWTASSETLOCATION_CDN");
  else
    v9 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetLocation"));
  if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32)) & 0x2000000000) != 0)
  {
LABEL_15:
    v10 = -[MWTSchemaMWTMusicMetadataReported assetSource](self, "assetSource") - 1;
    if (v10 > 5)
      v11 = CFSTR("MWTASSETSOURCE_UNKNOWN");
    else
      v11 = off_1E5630CE8[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("assetSource"));
  }
LABEL_19:
  if (self->_audioQueueType)
  {
    -[MWTSchemaMWTMusicMetadataReported audioQueueType](self, "audioQueueType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("audioQueueType"));

  }
  v14 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v14 & 0x800000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported cmInitialStartupItemCreationToLtluDurationInMs](self, "cmInitialStartupItemCreationToLtluDurationInMs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cmInitialStartupItemCreationToLtluDurationInMs"));

    v14 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                 + 6) << 16)) << 32);
    if ((v14 & 0x400000000000) == 0)
    {
LABEL_23:
      if ((v14 & 0x10000000000000) == 0)
        goto LABEL_24;
      goto LABEL_29;
    }
  }
  else if ((v14 & 0x400000000000) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported cmInitialStartupItemCreationToReadyToPlayDurationInMs](self, "cmInitialStartupItemCreationToReadyToPlayDurationInMs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("cmInitialStartupItemCreationToReadyToPlayDurationInMs"));

  v14 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v14 & 0x10000000000000) == 0)
  {
LABEL_24:
    if ((v14 & 0x20000000000000) == 0)
      goto LABEL_25;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported contentConnectionTlsHandshakeDurationInMs](self, "contentConnectionTlsHandshakeDurationInMs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("contentConnectionTlsHandshakeDurationInMs"));

  v14 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v14 & 0x20000000000000) == 0)
  {
LABEL_25:
    if ((v14 & 0x400000000) == 0)
      goto LABEL_35;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported contentFirstSegmentDurationInMs](self, "contentFirstSegmentDurationInMs"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("contentFirstSegmentDurationInMs"));

  if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                + 6) << 16)) << 32)) & 0x400000000) == 0)
    goto LABEL_35;
LABEL_31:
  v19 = -[MWTSchemaMWTMusicMetadataReported endPointType](self, "endPointType") - 1;
  if (v19 > 2)
    v20 = CFSTR("MWTENDPOINTTYPE_UNKNOWN");
  else
    v20 = off_1E5630D18[v19];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("endPointType"));
LABEL_35:
  if (self->_errorResolutionType)
  {
    -[MWTSchemaMWTMusicMetadataReported errorResolutionType](self, "errorResolutionType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("errorResolutionType"));

  }
  v23 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
  v24 = *(_QWORD *)&v23 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                        + 6) << 16)) << 32);
  if ((*(_WORD *)&v23 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatBitDepth](self, "formatBitDepth"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("formatBitDepth"));

    v29 = ($3A707FEDEB8D4B451EE4458D3B539123)*(_DWORD *)&self->_has;
    v24 = *(_QWORD *)&v29 | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                          + 6) << 16)) << 32);
    if ((*(_WORD *)&v29 & 0x100) == 0)
    {
LABEL_39:
      if ((v24 & 0x400) == 0)
        goto LABEL_40;
      goto LABEL_87;
    }
  }
  else if ((*(_WORD *)&v23 & 0x100) == 0)
  {
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatBitrate](self, "formatBitrate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("formatBitrate"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_40:
    if ((v24 & 0x80) == 0)
      goto LABEL_41;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatChannels](self, "formatChannels"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("formatChannels"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_41:
    if ((v24 & 0x800) == 0)
      goto LABEL_42;
    goto LABEL_92;
  }
LABEL_88:
  v32 = -[MWTSchemaMWTMusicMetadataReported formatCodec](self, "formatCodec") - 1;
  if (v32 > 0x27)
    v33 = CFSTR("MWTFORMATCODEC_UNKNOWN");
  else
    v33 = off_1E5630D30[v32];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("formatCodec"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_42:
    if ((v24 & 0x1000000000) == 0)
      goto LABEL_43;
    goto LABEL_96;
  }
LABEL_92:
  v34 = -[MWTSchemaMWTMusicMetadataReported formatLayout](self, "formatLayout") - 1;
  if (v34 > 0xAD)
    v35 = CFSTR("MWTFORMATLAYOUT_UNKNOWN");
  else
    v35 = off_1E5630E70[v34];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("formatLayout"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x1000000000) == 0)
  {
LABEL_43:
    if ((v24 & 0x1000) == 0)
      goto LABEL_44;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatLayoutValue](self, "formatLayoutValue"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("formatLayoutValue"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_44:
    if ((v24 & 0x2000) == 0)
      goto LABEL_45;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported formatSampleRate](self, "formatSampleRate"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("formatSampleRate"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000) == 0)
  {
LABEL_45:
    if ((v24 & 0x20000000000) == 0)
      goto LABEL_46;
    goto LABEL_102;
  }
LABEL_98:
  v38 = -[MWTSchemaMWTMusicMetadataReported formatTier](self, "formatTier") - 1;
  if (v38 > 4)
    v39 = CFSTR("MWTFORMATTIER_UNKNOWN");
  else
    v39 = off_1E56313E0[v38];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("formatTier"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x20000000000) == 0)
  {
LABEL_46:
    if ((v24 & 0x40000000000) == 0)
      goto LABEL_47;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasBagWaitTime](self, "hasBagWaitTime"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("hasBagWaitTime"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x40000000000) == 0)
  {
LABEL_47:
    if ((v24 & 0x10000000000) == 0)
      goto LABEL_48;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasLeaseWaitTime](self, "hasLeaseWaitTime"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("hasLeaseWaitTime"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x10000000000) == 0)
  {
LABEL_48:
    if ((v24 & 0x200000000000) == 0)
      goto LABEL_49;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasLookupWaitTime](self, "hasLookupWaitTime"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("hasLookupWaitTime"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x200000000000) == 0)
  {
LABEL_49:
    if ((v24 & 0x100000000000) == 0)
      goto LABEL_50;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasMediaRedownloadWaitTime](self, "hasMediaRedownloadWaitTime"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("hasMediaRedownloadWaitTime"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x100000000000) == 0)
  {
LABEL_50:
    if ((v24 & 0x80000000000) == 0)
      goto LABEL_51;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasSubscriptionAssetLoadWaitTime](self, "hasSubscriptionAssetLoadWaitTime"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("hasSubscriptionAssetLoadWaitTime"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x80000000000) == 0)
  {
LABEL_51:
    if ((v24 & 0x10000) == 0)
      goto LABEL_52;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported hasSuzeLeaseWaitTime](self, "hasSuzeLeaseWaitTime"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("hasSuzeLeaseWaitTime"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_52:
    if ((v24 & 0x4000000) == 0)
      goto LABEL_53;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isAccountDataReady](self, "isAccountDataReady"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("isAccountDataReady"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_53:
    if ((v24 & 0x1000000) == 0)
      goto LABEL_54;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isAutoPlay](self, "isAutoPlay"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("isAutoPlay"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_54:
    if ((v24 & 0x8000000) == 0)
      goto LABEL_55;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isDelegatedPlayback](self, "isDelegatedPlayback"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("isDelegatedPlayback"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_55:
    if ((v24 & 0x200000) == 0)
      goto LABEL_56;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isFirstPlayAfterAppLaunch](self, "isFirstPlayAfterAppLaunch"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("isFirstPlayAfterAppLaunch"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_56:
    if ((v24 & 0x400000) == 0)
      goto LABEL_57;
    goto LABEL_113;
  }
LABEL_112:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isHlsKeysReady](self, "isHlsKeysReady"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("isHlsKeysReady"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_57:
    if ((v24 & 0x40000) == 0)
      goto LABEL_58;
    goto LABEL_114;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isInterruptingPlayback](self, "isInterruptingPlayback"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("isInterruptingPlayback"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_58:
    if ((v24 & 0x10000000) == 0)
      goto LABEL_59;
    goto LABEL_115;
  }
LABEL_114:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isLeaseReady](self, "isLeaseReady"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("isLeaseReady"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_59:
    if ((v24 & 0x2000000) == 0)
      goto LABEL_60;
    goto LABEL_116;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isMiniSinfAvailable](self, "isMiniSinfAvailable"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("isMiniSinfAvailable"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_60:
    if ((v24 & 0x100000) == 0)
      goto LABEL_61;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isNonDefaultUser](self, "isNonDefaultUser"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("isNonDefaultUser"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_61:
    if ((v24 & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isOfflineKeyReady](self, "isOfflineKeyReady"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("isOfflineKeyReady"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_62:
    if ((v24 & 0x200000000) == 0)
      goto LABEL_63;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isOnlineKeyReady](self, "isOnlineKeyReady"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("isOnlineKeyReady"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x200000000) == 0)
  {
LABEL_63:
    if ((v24 & 0x800000) == 0)
      goto LABEL_64;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isPrimaryUser](self, "isPrimaryUser"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("isPrimaryUser"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_64:
    if ((v24 & 0x20000000) == 0)
      goto LABEL_65;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isRemoteSetQueue](self, "isRemoteSetQueue"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("isRemoteSetQueue"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_65:
    if ((v24 & 8) == 0)
      goto LABEL_66;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isSharePlayPlayback](self, "isSharePlayPlayback"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("isSharePlayPlayback"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_66:
    if ((v24 & 0x20000) == 0)
      goto LABEL_67;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isShuffled](self, "isShuffled"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("isShuffled"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_67:
    if ((v24 & 0x40000000) == 0)
      goto LABEL_68;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isStoreBagReady](self, "isStoreBagReady"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("isStoreBagReady"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_68:
    if ((v24 & 0x1000000000000) == 0)
      goto LABEL_69;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported isSuzeLease](self, "isSuzeLease"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("isSuzeLease"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x1000000000000) == 0)
  {
LABEL_69:
    if ((v24 & 0x2000000000000) == 0)
      goto LABEL_70;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported masterPlaylistConnectionTlsHandshakeDurationInMs](self, "masterPlaylistConnectionTlsHandshakeDurationInMs"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("masterPlaylistConnectionTlsHandshakeDurationInMs"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x2000000000000) == 0)
  {
LABEL_70:
    if ((v24 & 1) == 0)
      goto LABEL_71;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported masterPlaylistRequestDurationInMs](self, "masterPlaylistRequestDurationInMs"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("masterPlaylistRequestDurationInMs"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 1) == 0)
  {
LABEL_71:
    if ((v24 & 0x80000000) == 0)
      goto LABEL_72;
    goto LABEL_131;
  }
LABEL_127:
  v65 = -[MWTSchemaMWTMusicMetadataReported musicDomain](self, "musicDomain") - 1;
  if (v65 > 3)
    v66 = CFSTR("MWTMUSICDOMAIN_UNKNOWN");
  else
    v66 = off_1E5631408[v65];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("musicDomain"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_72:
    if ((v24 & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_135;
  }
LABEL_131:
  v67 = -[MWTSchemaMWTMusicMetadataReported networkConnectionType](self, "networkConnectionType") - 1;
  if (v67 > 0xD)
    v68 = CFSTR("MWTNETWORKCONNECTIONTYPE_UNKNOWN");
  else
    v68 = off_1E5631428[v67];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("networkConnectionType"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_73:
    if ((v24 & 0x10) == 0)
      goto LABEL_74;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported numberOfSpeakers](self, "numberOfSpeakers"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("numberOfSpeakers"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x10) == 0)
  {
LABEL_74:
    if ((v24 & 4) == 0)
      goto LABEL_75;
    goto LABEL_140;
  }
LABEL_136:
  v70 = -[MWTSchemaMWTMusicMetadataReported prefetchedMetadataSource](self, "prefetchedMetadataSource") - 1;
  if (v70 > 3)
    v71 = CFSTR("MWTPREFETCHEDMETADATASOURCE_UNKNOWN");
  else
    v71 = off_1E5631498[v70];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("prefetchedMetadataSource"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_75:
    if ((v24 & 2) == 0)
      goto LABEL_76;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported queueSize](self, "queueSize"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("queueSize"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 2) == 0)
  {
LABEL_76:
    if ((v24 & 0x8000) == 0)
      goto LABEL_77;
    goto LABEL_145;
  }
LABEL_141:
  v73 = -[MWTSchemaMWTMusicMetadataReported queueType](self, "queueType") - 1;
  if (v73 > 6)
    v74 = CFSTR("MWTQUEUETYPE_UNKNOWN");
  else
    v74 = off_1E56314B8[v73];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("queueType"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_77:
    if ((v24 & 0x800000000) == 0)
      goto LABEL_78;
    goto LABEL_149;
  }
LABEL_145:
  v75 = -[MWTSchemaMWTMusicMetadataReported routeConfiguration](self, "routeConfiguration") - 1;
  if (v75 > 5)
    v76 = CFSTR("MWTROUTECONFIGURATION_UNKNOWN");
  else
    v76 = off_1E56314F0[v75];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("routeConfiguration"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x800000000) == 0)
  {
LABEL_78:
    if ((v24 & 0x40) == 0)
      goto LABEL_79;
    goto LABEL_153;
  }
LABEL_149:
  v77 = -[MWTSchemaMWTMusicMetadataReported routeType](self, "routeType") - 1;
  if (v77 > 8)
    v78 = CFSTR("MWTAUDIOROUTETYPE_UNKNOWN");
  else
    v78 = off_1E5631520[v77];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("routeType"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_79:
    if ((v24 & 0x4000000000000) == 0)
      goto LABEL_80;
    goto LABEL_157;
  }
LABEL_153:
  v79 = -[MWTSchemaMWTMusicMetadataReported streamingContentType](self, "streamingContentType") - 1;
  if (v79 > 3)
    v80 = CFSTR("MWTSTREAMINGCONTENTTYPE_UNKNOWN");
  else
    v80 = off_1E5631568[v79];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("streamingContentType"));
  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x4000000000000) == 0)
  {
LABEL_80:
    if ((v24 & 0x8000000000000) == 0)
      goto LABEL_81;
    goto LABEL_158;
  }
LABEL_157:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported subPlaylistConnectionTlsHandshakeDurationInMs](self, "subPlaylistConnectionTlsHandshakeDurationInMs"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("subPlaylistConnectionTlsHandshakeDurationInMs"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x8000000000000) == 0)
  {
LABEL_81:
    if ((v24 & 0x8000000000) == 0)
      goto LABEL_82;
LABEL_159:
    v83 = -[MWTSchemaMWTMusicMetadataReported subscriptionType](self, "subscriptionType") - 1;
    if (v83 > 2)
      v84 = CFSTR("MWTSUBSCRIPTIONTYPE_UNKNOWN");
    else
      v84 = off_1E5631588[v83];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("subscriptionType"));
    if (((*(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                                  + 6) << 16)) << 32)) & 0x100000000) != 0)
      goto LABEL_83;
    goto LABEL_84;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MWTSchemaMWTMusicMetadataReported subPlaylistRequestDurationInMs](self, "subPlaylistRequestDurationInMs"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("subPlaylistRequestDurationInMs"));

  v24 = *(_DWORD *)&self->_has | ((unint64_t)(*((unsigned __int16 *)&self->_has + 2) | (*((unsigned __int8 *)&self->_has
                                                                                               + 6) << 16)) << 32);
  if ((v24 & 0x8000000000) != 0)
    goto LABEL_159;
LABEL_82:
  if ((v24 & 0x100000000) != 0)
  {
LABEL_83:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MWTSchemaMWTMusicMetadataReported wasMediaLibraryDatabaseUpgraded](self, "wasMediaLibraryDatabaseUpgraded"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("wasMediaLibraryDatabaseUpgraded"));

  }
LABEL_84:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v26 = v3;

  return v26;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MWTSchemaMWTMusicMetadataReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MWTSchemaMWTMusicMetadataReported)initWithJSON:(id)a3
{
  void *v4;
  MWTSchemaMWTMusicMetadataReported *v5;
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
    self = -[MWTSchemaMWTMusicMetadataReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MWTSchemaMWTMusicMetadataReported)initWithDictionary:(id)a3
{
  id v4;
  MWTSchemaMWTMusicMetadataReported *v5;
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
  MWTSchemaMWTMusicMetadataReported *v66;
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
  objc_super v117;

  v4 = a3;
  v117.receiver = self;
  v117.super_class = (Class)MWTSchemaMWTMusicMetadataReported;
  v5 = -[MWTSchemaMWTMusicMetadataReported init](&v117, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("musicDomain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setMusicDomain:](v5, "setMusicDomain:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queueType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setQueueType:](v5, "setQueueType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queueSize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setQueueSize:](v5, "setQueueSize:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShuffled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v116 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsShuffled:](v5, "setIsShuffled:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prefetchedMetadataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setPrefetchedMetadataSource:](v5, "setPrefetchedMetadataSource:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetEndPoint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setAssetEndPoint:](v5, "setAssetEndPoint:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamingContentType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v115 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setStreamingContentType:](v5, "setStreamingContentType:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatCodec"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v114 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setFormatCodec:](v5, "setFormatCodec:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatBitrate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v113 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setFormatBitrate:](v5, "setFormatBitrate:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatBitDepth"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v112 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setFormatBitDepth:](v5, "setFormatBitDepth:", objc_msgSend(v15, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatChannels"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v111 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setFormatChannels:](v5, "setFormatChannels:", objc_msgSend(v16, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatLayout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v110 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setFormatLayout:](v5, "setFormatLayout:", objc_msgSend(v17, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatSampleRate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v109 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setFormatSampleRate:](v5, "setFormatSampleRate:", objc_msgSend(v18, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatTier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setFormatTier:](v5, "setFormatTier:", objc_msgSend(v19, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfSpeakers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v107 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setNumberOfSpeakers:](v5, "setNumberOfSpeakers:", objc_msgSend(v20, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routeConfiguration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v106 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setRouteConfiguration:](v5, "setRouteConfiguration:", objc_msgSend(v21, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAccountDataReady"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v105 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsAccountDataReady:](v5, "setIsAccountDataReady:", objc_msgSend(v22, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isStoreBagReady"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v104 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsStoreBagReady:](v5, "setIsStoreBagReady:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLeaseReady"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v103 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsLeaseReady:](v5, "setIsLeaseReady:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOnlineKeyReady"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v102 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsOnlineKeyReady:](v5, "setIsOnlineKeyReady:", objc_msgSend(v25, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOfflineKeyReady"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v101 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsOfflineKeyReady:](v5, "setIsOfflineKeyReady:", objc_msgSend(v26, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHlsKeysReady"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v100 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsHlsKeysReady:](v5, "setIsHlsKeysReady:", objc_msgSend(v27, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInterruptingPlayback"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v99 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsInterruptingPlayback:](v5, "setIsInterruptingPlayback:", objc_msgSend(v28, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRemoteSetQueue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsRemoteSetQueue:](v5, "setIsRemoteSetQueue:", objc_msgSend(v29, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDelegatedPlayback"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v97 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsDelegatedPlayback:](v5, "setIsDelegatedPlayback:", objc_msgSend(v30, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNonDefaultUser"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v96 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsNonDefaultUser:](v5, "setIsNonDefaultUser:", objc_msgSend(v31, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutoPlay"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsAutoPlay:](v5, "setIsAutoPlay:", objc_msgSend(v32, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFirstPlayAfterAppLaunch"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v94 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsFirstPlayAfterAppLaunch:](v5, "setIsFirstPlayAfterAppLaunch:", objc_msgSend(v33, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMiniSinfAvailable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsMiniSinfAvailable:](v5, "setIsMiniSinfAvailable:", objc_msgSend(v34, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSharePlayPlayback"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsSharePlayPlayback:](v5, "setIsSharePlayPlayback:", objc_msgSend(v35, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuzeLease"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsSuzeLease:](v5, "setIsSuzeLease:", objc_msgSend(v36, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkConnectionType"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setNetworkConnectionType:](v5, "setNetworkConnectionType:", objc_msgSend(v37, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasMediaLibraryDatabaseUpgraded"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setWasMediaLibraryDatabaseUpgraded:](v5, "setWasMediaLibraryDatabaseUpgraded:", objc_msgSend(v38, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPrimaryUser"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setIsPrimaryUser:](v5, "setIsPrimaryUser:", objc_msgSend(v39, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorResolutionType"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = (void *)objc_msgSend(v40, "copy");
      -[MWTSchemaMWTMusicMetadataReported setErrorResolutionType:](v5, "setErrorResolutionType:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endPointType"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setEndPointType:](v5, "setEndPointType:", objc_msgSend(v42, "intValue"));
    v70 = v42;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routeType"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v43;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setRouteType:](v5, "setRouteType:", objc_msgSend(v43, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatLayoutValue"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setFormatLayoutValue:](v5, "setFormatLayoutValue:", objc_msgSend(v44, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSource"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setAssetSource:](v5, "setAssetSource:", objc_msgSend(v45, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetLocation"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setAssetLocation:](v5, "setAssetLocation:", objc_msgSend(v46, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscriptionType"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setSubscriptionType:](v5, "setSubscriptionType:", objc_msgSend(v47, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasLookupWaitTime"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v48;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setHasLookupWaitTime:](v5, "setHasLookupWaitTime:", objc_msgSend(v48, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasBagWaitTime"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setHasBagWaitTime:](v5, "setHasBagWaitTime:", objc_msgSend(v49, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasLeaseWaitTime"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setHasLeaseWaitTime:](v5, "setHasLeaseWaitTime:", objc_msgSend(v50, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSuzeLeaseWaitTime"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = v51;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setHasSuzeLeaseWaitTime:](v5, "setHasSuzeLeaseWaitTime:", objc_msgSend(v51, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSubscriptionAssetLoadWaitTime"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setHasSubscriptionAssetLoadWaitTime:](v5, "setHasSubscriptionAssetLoadWaitTime:", objc_msgSend(v52, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasMediaRedownloadWaitTime"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setHasMediaRedownloadWaitTime:](v5, "setHasMediaRedownloadWaitTime:", objc_msgSend(v53, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cmInitialStartupItemCreationToReadyToPlayDurationInMs"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setCmInitialStartupItemCreationToReadyToPlayDurationInMs:](v5, "setCmInitialStartupItemCreationToReadyToPlayDurationInMs:", objc_msgSend(v54, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cmInitialStartupItemCreationToLtluDurationInMs"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = v55;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setCmInitialStartupItemCreationToLtluDurationInMs:](v5, "setCmInitialStartupItemCreationToLtluDurationInMs:", objc_msgSend(v55, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("masterPlaylistConnectionTlsHandshakeDurationInMs"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setMasterPlaylistConnectionTlsHandshakeDurationInMs:](v5, "setMasterPlaylistConnectionTlsHandshakeDurationInMs:", objc_msgSend(v56, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("masterPlaylistRequestDurationInMs"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = v57;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setMasterPlaylistRequestDurationInMs:](v5, "setMasterPlaylistRequestDurationInMs:", objc_msgSend(v57, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subPlaylistConnectionTlsHandshakeDurationInMs"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setSubPlaylistConnectionTlsHandshakeDurationInMs:](v5, "setSubPlaylistConnectionTlsHandshakeDurationInMs:", objc_msgSend(v58, "unsignedIntValue"));
    v69 = v52;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subPlaylistRequestDurationInMs"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setSubPlaylistRequestDurationInMs:](v5, "setSubPlaylistRequestDurationInMs:", objc_msgSend(v59, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentConnectionTlsHandshakeDurationInMs"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setContentConnectionTlsHandshakeDurationInMs:](v5, "setContentConnectionTlsHandshakeDurationInMs:", objc_msgSend(v61, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentFirstSegmentDurationInMs"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MWTSchemaMWTMusicMetadataReported setContentFirstSegmentDurationInMs:](v5, "setContentFirstSegmentDurationInMs:", objc_msgSend(v62, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioQueueType"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v68 = v50;
      v64 = v61;
      v65 = (void *)objc_msgSend(v63, "copy");
      -[MWTSchemaMWTMusicMetadataReported setAudioQueueType:](v5, "setAudioQueueType:", v65);

      v61 = v64;
      v50 = v68;
    }
    v66 = v5;

  }
  return v5;
}

- (int)musicDomain
{
  return self->_musicDomain;
}

- (int)queueType
{
  return self->_queueType;
}

- (unsigned)queueSize
{
  return self->_queueSize;
}

- (BOOL)isShuffled
{
  return self->_isShuffled;
}

- (int)prefetchedMetadataSource
{
  return self->_prefetchedMetadataSource;
}

- (int)assetEndPoint
{
  return self->_assetEndPoint;
}

- (int)streamingContentType
{
  return self->_streamingContentType;
}

- (int)formatCodec
{
  return self->_formatCodec;
}

- (unsigned)formatBitrate
{
  return self->_formatBitrate;
}

- (unsigned)formatBitDepth
{
  return self->_formatBitDepth;
}

- (unsigned)formatChannels
{
  return self->_formatChannels;
}

- (int)formatLayout
{
  return self->_formatLayout;
}

- (unsigned)formatSampleRate
{
  return self->_formatSampleRate;
}

- (int)formatTier
{
  return self->_formatTier;
}

- (unsigned)numberOfSpeakers
{
  return self->_numberOfSpeakers;
}

- (int)routeConfiguration
{
  return self->_routeConfiguration;
}

- (BOOL)isAccountDataReady
{
  return self->_isAccountDataReady;
}

- (BOOL)isStoreBagReady
{
  return self->_isStoreBagReady;
}

- (BOOL)isLeaseReady
{
  return self->_isLeaseReady;
}

- (BOOL)isOnlineKeyReady
{
  return self->_isOnlineKeyReady;
}

- (BOOL)isOfflineKeyReady
{
  return self->_isOfflineKeyReady;
}

- (BOOL)isHlsKeysReady
{
  return self->_isHlsKeysReady;
}

- (BOOL)isInterruptingPlayback
{
  return self->_isInterruptingPlayback;
}

- (BOOL)isRemoteSetQueue
{
  return self->_isRemoteSetQueue;
}

- (BOOL)isDelegatedPlayback
{
  return self->_isDelegatedPlayback;
}

- (BOOL)isNonDefaultUser
{
  return self->_isNonDefaultUser;
}

- (BOOL)isAutoPlay
{
  return self->_isAutoPlay;
}

- (BOOL)isFirstPlayAfterAppLaunch
{
  return self->_isFirstPlayAfterAppLaunch;
}

- (BOOL)isMiniSinfAvailable
{
  return self->_isMiniSinfAvailable;
}

- (BOOL)isSharePlayPlayback
{
  return self->_isSharePlayPlayback;
}

- (BOOL)isSuzeLease
{
  return self->_isSuzeLease;
}

- (int)networkConnectionType
{
  return self->_networkConnectionType;
}

- (BOOL)wasMediaLibraryDatabaseUpgraded
{
  return self->_wasMediaLibraryDatabaseUpgraded;
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (NSString)errorResolutionType
{
  return self->_errorResolutionType;
}

- (void)setErrorResolutionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int)endPointType
{
  return self->_endPointType;
}

- (int)routeType
{
  return self->_routeType;
}

- (unsigned)formatLayoutValue
{
  return self->_formatLayoutValue;
}

- (int)assetSource
{
  return self->_assetSource;
}

- (int)assetLocation
{
  return self->_assetLocation;
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (BOOL)hasLookupWaitTime
{
  return self->_hasLookupWaitTime;
}

- (BOOL)hasBagWaitTime
{
  return self->_hasBagWaitTime;
}

- (BOOL)hasLeaseWaitTime
{
  return self->_hasLeaseWaitTime;
}

- (BOOL)hasSuzeLeaseWaitTime
{
  return self->_hasSuzeLeaseWaitTime;
}

- (BOOL)hasSubscriptionAssetLoadWaitTime
{
  return self->_hasSubscriptionAssetLoadWaitTime;
}

- (BOOL)hasMediaRedownloadWaitTime
{
  return self->_hasMediaRedownloadWaitTime;
}

- (unsigned)cmInitialStartupItemCreationToReadyToPlayDurationInMs
{
  return self->_cmInitialStartupItemCreationToReadyToPlayDurationInMs;
}

- (unsigned)cmInitialStartupItemCreationToLtluDurationInMs
{
  return self->_cmInitialStartupItemCreationToLtluDurationInMs;
}

- (unsigned)masterPlaylistConnectionTlsHandshakeDurationInMs
{
  return self->_masterPlaylistConnectionTlsHandshakeDurationInMs;
}

- (unsigned)masterPlaylistRequestDurationInMs
{
  return self->_masterPlaylistRequestDurationInMs;
}

- (unsigned)subPlaylistConnectionTlsHandshakeDurationInMs
{
  return self->_subPlaylistConnectionTlsHandshakeDurationInMs;
}

- (unsigned)subPlaylistRequestDurationInMs
{
  return self->_subPlaylistRequestDurationInMs;
}

- (unsigned)contentConnectionTlsHandshakeDurationInMs
{
  return self->_contentConnectionTlsHandshakeDurationInMs;
}

- (unsigned)contentFirstSegmentDurationInMs
{
  return self->_contentFirstSegmentDurationInMs;
}

- (NSString)audioQueueType
{
  return self->_audioQueueType;
}

- (void)setAudioQueueType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setHasErrorResolutionType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 7) = a3;
}

- (void)setHasAudioQueueType:(BOOL)a3
{
  self->_hasErrorResolutionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueueType, 0);
  objc_storeStrong((id *)&self->_errorResolutionType, 0);
}

@end
