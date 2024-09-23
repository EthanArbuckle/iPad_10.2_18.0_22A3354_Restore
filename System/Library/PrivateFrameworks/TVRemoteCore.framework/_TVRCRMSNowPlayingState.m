@implementation _TVRCRMSNowPlayingState

+ (id)nowPlayingStateFromInfo:(id)a3
{
  id v3;
  _TVRCRMSNowPlayingState *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;

  v3 = a3;
  v4 = objc_alloc_init(_TVRCRMSNowPlayingState);
  objc_msgSend(v3, "totalDuration");
  v6 = v5 / 1000.0;
  objc_msgSend(v3, "timeRemaining");
  v8 = v6 - v7 / 1000.0;
  v9 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v3, "timestamp");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "playbackState");

  if (v11 == 4)
    v12 = 1.0;
  else
    v12 = 0.0;
  -[_TVRCRMSNowPlayingState setDuration:](v4, "setDuration:", v6);
  -[_TVRCRMSNowPlayingState setPlaybackRate:](v4, "setPlaybackRate:", v12);
  -[_TVRCRMSNowPlayingState setLastReportedTimestamp:](v4, "setLastReportedTimestamp:", v10);
  -[_TVRCRMSNowPlayingState setLastReportedPlaybackPosition:](v4, "setLastReportedPlaybackPosition:", v8);

  return v4;
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(double)a3
{
  self->_playbackRate = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDate)lastReportedTimestamp
{
  return self->_lastReportedTimestamp;
}

- (void)setLastReportedTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedTimestamp, a3);
}

- (double)lastReportedPlaybackPosition
{
  return self->_lastReportedPlaybackPosition;
}

- (void)setLastReportedPlaybackPosition:(double)a3
{
  self->_lastReportedPlaybackPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReportedTimestamp, 0);
}

@end
