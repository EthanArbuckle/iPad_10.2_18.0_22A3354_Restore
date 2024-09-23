@implementation PXPhotoKitLivePhotoVideoContentProviderSpec

- (PXPhotoKitLivePhotoVideoContentProviderSpec)init
{
  PXPhotoKitLivePhotoVideoContentProviderSpec *result;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitLivePhotoVideoContentProviderSpec;
  result = -[PXPhotoKitLivePhotoVideoContentProviderSpec init](&v8, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E40];
    v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)((char *)&result->_loopStartTime.epoch + 4) = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&result->_loopTimeRange.start.flags = v4;
    *(_OWORD *)((char *)&result->_loopTimeRange.duration.value + 4) = *(_OWORD *)(v3 + 32);
    *(_WORD *)&result->_stabilizeIfPossible = 0;
    v5 = MEMORY[0x1E0CA2E18];
    v6 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(&result->_wantsAudio + 3) = *MEMORY[0x1E0CA2E18];
    v7 = *(_QWORD *)(v5 + 16);
    *(_QWORD *)&result->_crossfadeDuration.flags = v7;
    *(_OWORD *)((char *)&result->_crossfadeDuration.epoch + 4) = v6;
    *(_QWORD *)&result->_loopStartTime.flags = v7;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_alloc_init((Class)objc_opt_class());
  v5 = *(_OWORD *)&self->_loopTimeRange.start.flags;
  v6 = *(_OWORD *)((char *)&self->_loopTimeRange.duration.value + 4);
  *(_OWORD *)((char *)result + 60) = *(_OWORD *)((char *)&self->_loopStartTime.epoch + 4);
  *(_OWORD *)((char *)result + 92) = v6;
  *(_OWORD *)((char *)result + 76) = v5;
  *((_BYTE *)result + 8) = self->_stabilizeIfPossible;
  v7 = *(_QWORD *)&self->_crossfadeDuration.flags;
  *(_OWORD *)((char *)result + 12) = *(_OWORD *)(&self->_wantsAudio + 3);
  *(_QWORD *)((char *)result + 28) = v7;
  v8 = *(_QWORD *)&self->_loopStartTime.flags;
  *(_OWORD *)((char *)result + 36) = *(_OWORD *)((char *)&self->_crossfadeDuration.epoch + 4);
  *(_QWORD *)((char *)result + 52) = v8;
  *((_BYTE *)result + 9) = self->_wantsAudio;
  return result;
}

- (id)identifier
{
  void *v3;
  Float64 Seconds;
  Float64 v5;
  CMTime v7;
  CMTime v8;
  CMTime v9;
  CMTime v10;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXPhotoKitLivePhotoVideoContentProviderSpec crossfadeDuration](self, "crossfadeDuration");
  Seconds = CMTimeGetSeconds(&time);
  -[PXPhotoKitLivePhotoVideoContentProviderSpec loopTimeRange](self, "loopTimeRange");
  v10 = v9;
  v5 = CMTimeGetSeconds(&v10);
  -[PXPhotoKitLivePhotoVideoContentProviderSpec loopTimeRange](self, "loopTimeRange");
  v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("-%f-%f-%f"), *(_QWORD *)&Seconds, *(_QWORD *)&v5, CMTimeGetSeconds(&v8));
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (void)setCrossfadeDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_crossfadeDuration.flags = a3->var3;
  *(_OWORD *)(&self->_wantsAudio + 3) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  retstr->var3 = *(int64_t *)((char *)&self[2].var0 + 4);
  return self;
}

- (void)setLoopStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_loopStartTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_crossfadeDuration.epoch + 4) = v3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)loopTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)&self[1].var1.var0 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var2;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)((char *)&self[1].var1.var3 + 4);
  return self;
}

- (void)setLoopTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)((char *)&self->_loopTimeRange.duration.value + 4) = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_loopTimeRange.start.flags = v4;
  *(_OWORD *)((char *)&self->_loopStartTime.epoch + 4) = v3;
}

- (BOOL)stabilizeIfPossible
{
  return self->_stabilizeIfPossible;
}

- (void)setStabilizeIfPossible:(BOOL)a3
{
  self->_stabilizeIfPossible = a3;
}

- (BOOL)wantsAudio
{
  return self->_wantsAudio;
}

- (void)setWantsAudio:(BOOL)a3
{
  self->_wantsAudio = a3;
}

@end
