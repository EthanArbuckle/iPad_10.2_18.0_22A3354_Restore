@implementation PXStoryMockMovieHighlight

- (PXStoryMockMovieHighlight)init
{
  double v2;
  _OWORD v4[3];

  memset(v4, 0, sizeof(v4));
  LODWORD(v2) = 0.5;
  return -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:audioScore:](self, "initWithTimeRange:score:bestPlaybackRect:normalizationData:audioScore:", v4, 0, 0.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v2);
}

- (PXStoryMockMovieHighlight)initWithTimeRange:(id *)a3 score:(float)a4 bestPlaybackRect:(CGRect)a5 normalizationData:(id)a6 audioScore:(float)a7
{
  __int128 v7;
  _OWORD v9[3];

  v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  return -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](self, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", v9, a6, 0, 0, 0);
}

- (PXStoryMockMovieHighlight)initWithBestPlaybackRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  _OWORD v7[3];

  memset(v7, 0, sizeof(v7));
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0.5;
  return -[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](self, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", v7, 0, 0, 0, 0, 0.0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v3, v4, v5);
}

- (PXStoryMockMovieHighlight)initWithTimeRange:(id *)a3 score:(float)a4 bestPlaybackRect:(CGRect)a5 normalizationData:(id)a6 face:(BOOL)a7 voice:(BOOL)a8 music:(BOOL)a9 loudness:(float)a10 peak:(float)a11 audioScore:(float)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  double height;
  double width;
  double y;
  double x;
  id v24;
  PXStoryMockMovieHighlight *v25;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _OWORD v32[3];
  objc_super v33;

  v12 = a9;
  v13 = a8;
  v14 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)PXStoryMockMovieHighlight;
  v24 = a6;
  v25 = -[PXStoryMockMovieHighlight init](&v33, sel_init);
  v26 = *(_OWORD *)&a3->var0.var3;
  v32[0] = *(_OWORD *)&a3->var0.var0;
  v32[1] = v26;
  v32[2] = *(_OWORD *)&a3->var1.var1;
  -[PXStoryMockMovieHighlight setTimeRange:](v25, "setTimeRange:", v32);
  *(float *)&v27 = a4;
  -[PXStoryMockMovieHighlight setQualityScore:](v25, "setQualityScore:", v27);
  -[PXStoryMockMovieHighlight setNormalizationData:](v25, "setNormalizationData:", v24);

  -[PXStoryMockMovieHighlight setHasMusic:](v25, "setHasMusic:", v12);
  -[PXStoryMockMovieHighlight setHasVoice:](v25, "setHasVoice:", v13);
  -[PXStoryMockMovieHighlight setHasFace:](v25, "setHasFace:", v14);
  *(float *)&v28 = a10;
  -[PXStoryMockMovieHighlight setLoudness:](v25, "setLoudness:", v28);
  *(float *)&v29 = a11;
  -[PXStoryMockMovieHighlight setPeakVolume:](v25, "setPeakVolume:", v29);
  -[PXStoryMockMovieHighlight setBestPlaybackRect:](v25, "setBestPlaybackRect:", x, y, width, height);
  *(float *)&v30 = a12;
  -[PXStoryMockMovieHighlight setAudioQualityScore:](v25, "setAudioQualityScore:", v30);
  return v25;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)bestTimeRangeForTargetDuration:(SEL)a3
{
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE rhs[32];
  __int128 v11;
  CMTime lhs[2];
  CMTime v13;
  CMTime v14;
  CMTime v15;
  __int128 v16;
  _OWORD v17[2];

  memset(v17, 0, sizeof(v17));
  v16 = 0u;
  -[PXStoryMockMovieHighlight timeRange](self, "timeRange");
  memset(&v15, 0, sizeof(v15));
  CMTimeMakeWithSeconds(&v15, a4, 600);
  memset(&v14, 0, sizeof(v14));
  lhs[0] = *(CMTime *)((char *)v17 + 8);
  *(CMTime *)rhs = v15;
  CMTimeSubtract(&v13, lhs, (CMTime *)rhs);
  lhs[0] = v13;
  CMTimeMultiplyByRatio(&v14, lhs, 1, 2);
  memset(lhs, 0, sizeof(lhs));
  *(_OWORD *)rhs = v16;
  *(_QWORD *)&rhs[16] = *(_QWORD *)&v17[0];
  v7 = *(_OWORD *)&v14.value;
  *(_QWORD *)&v8 = v14.epoch;
  CMTimeAdd(lhs, (CMTime *)rhs, (CMTime *)&v7);
  lhs[1] = v15;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)rhs = v16;
  *(_OWORD *)&rhs[16] = v17[0];
  v11 = v17[1];
  v8 = *(_OWORD *)&lhs[0].epoch;
  v9 = *(_OWORD *)&lhs[1].timescale;
  v7 = *(_OWORD *)&lhs[0].value;
  PXStoryTimeRangeIntersection(rhs, &v7, retstr);
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var1;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (float)qualityScore
{
  return self->_qualityScore;
}

- (void)setQualityScore:(float)a3
{
  self->_qualityScore = a3;
}

- (NSData)normalizationData
{
  return self->_normalizationData;
}

- (void)setNormalizationData:(id)a3
{
  objc_storeStrong((id *)&self->_normalizationData, a3);
}

- (BOOL)hasFace
{
  return self->_hasFace;
}

- (void)setHasFace:(BOOL)a3
{
  self->_hasFace = a3;
}

- (BOOL)hasVoice
{
  return self->_hasVoice;
}

- (void)setHasVoice:(BOOL)a3
{
  self->_hasVoice = a3;
}

- (BOOL)hasMusic
{
  return self->_hasMusic;
}

- (void)setHasMusic:(BOOL)a3
{
  self->_hasMusic = a3;
}

- (float)loudness
{
  return self->_loudness;
}

- (void)setLoudness:(float)a3
{
  self->_loudness = a3;
}

- (float)peakVolume
{
  return self->_peakVolume;
}

- (void)setPeakVolume:(float)a3
{
  self->_peakVolume = a3;
}

- (CGRect)bestPlaybackRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bestPlaybackRect.origin.x;
  y = self->_bestPlaybackRect.origin.y;
  width = self->_bestPlaybackRect.size.width;
  height = self->_bestPlaybackRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBestPlaybackRect:(CGRect)a3
{
  self->_bestPlaybackRect = a3;
}

- (float)audioQualityScore
{
  return self->_audioQualityScore;
}

- (void)setAudioQualityScore:(float)a3
{
  self->_audioQualityScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizationData, 0);
}

@end
