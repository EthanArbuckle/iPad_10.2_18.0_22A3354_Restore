@implementation _PXVideoSessionPresentationState

- (void)setVolume:(float)a3 withFade:(BOOL)a4
{
  if (self->_volume != a3 || self->_shouldFadeVolumeChange != a4)
  {
    self->_volume = a3;
    self->_shouldFadeVolumeChange = a4;
  }
}

- (void)setAudioSessionCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6
{
  NSString *v10;
  NSString *v11;
  NSString *audioSessionCategory;
  NSString *audioSessionMode;

  v10 = (NSString *)a4;
  v11 = (NSString *)objc_msgSend(a3, "copy");
  audioSessionCategory = self->_audioSessionCategory;
  self->_audioSessionCategory = v11;

  self->_audioSessionCategoryOptions = a6;
  audioSessionMode = self->_audioSessionMode;
  self->_audioSessionMode = v10;

  self->_audioSessionRouteSharingPolicy = a5;
}

- (BOOL)isLoopingEnabled
{
  return self->_loopingEnabled;
}

- (void)setLoopingEnabled:(BOOL)a3
{
  self->_loopingEnabled = a3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)playbackTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setPlaybackTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_playbackTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_playbackTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_playbackTimeRange.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setPlaybackStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_playbackStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_playbackStartTime.value = v3;
}

- (BOOL)seekToBeginningAtEnd
{
  return self->_seekToBeginningAtEnd;
}

- (void)setSeekToBeginningAtEnd:(BOOL)a3
{
  self->_seekToBeginningAtEnd = a3;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  self->_desiredPlayState = a3;
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  return self->_preventsSleepDuringVideoPlayback;
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  self->_preventsSleepDuringVideoPlayback = a3;
}

- (BOOL)allowsExternalPlayback
{
  return self->_allowsExternalPlayback;
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  self->_allowsExternalPlayback = a3;
}

- (NSString)audioSessionMode
{
  return self->_audioSessionMode;
}

- (unint64_t)audioSessionRouteSharingPolicy
{
  return self->_audioSessionRouteSharingPolicy;
}

- (BOOL)shouldDisableAutomaticPixelBufferUpdates
{
  return self->_shouldDisableAutomaticPixelBufferUpdates;
}

- (void)setShouldDisableAutomaticPixelBufferUpdates:(BOOL)a3
{
  self->_shouldDisableAutomaticPixelBufferUpdates = a3;
}

- (double)desiredPlaybackRate
{
  return self->_desiredPlaybackRate;
}

- (void)setDesiredPlaybackRate:(double)a3
{
  self->_desiredPlaybackRate = a3;
}

- (void)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(void *)a3
{
  self->_presenter = a3;
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (unint64_t)audioSessionCategoryOptions
{
  return self->_audioSessionCategoryOptions;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)shouldFadeVolumeChange
{
  return self->_shouldFadeVolumeChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_storeStrong((id *)&self->_audioSessionMode, 0);
}

@end
