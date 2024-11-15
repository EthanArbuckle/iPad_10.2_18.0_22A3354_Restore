@implementation SXMediaEngageEvent

- (unint64_t)userAction
{
  return self->_userAction;
}

- (void)setUserAction:(unint64_t)a3
{
  self->_userAction = a3;
}

- (double)mediaTimePlayed
{
  return self->_mediaTimePlayed;
}

- (void)setMediaTimePlayed:(double)a3
{
  self->_mediaTimePlayed = a3;
}

- (unint64_t)mediaPlayMethod
{
  return self->_mediaPlayMethod;
}

- (void)setMediaPlayMethod:(unint64_t)a3
{
  self->_mediaPlayMethod = a3;
}

- (NSString)mediaPauseMethod
{
  return self->_mediaPauseMethod;
}

- (void)setMediaPauseMethod:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPauseMethod, a3);
}

- (NSString)mediaResumeMethod
{
  return self->_mediaResumeMethod;
}

- (void)setMediaResumeMethod:(id)a3
{
  objc_storeStrong((id *)&self->_mediaResumeMethod, a3);
}

- (unint64_t)mediaPausePosition
{
  return self->_mediaPausePosition;
}

- (void)setMediaPausePosition:(unint64_t)a3
{
  self->_mediaPausePosition = a3;
}

- (unint64_t)mediaResumePosition
{
  return self->_mediaResumePosition;
}

- (void)setMediaResumePosition:(unint64_t)a3
{
  self->_mediaResumePosition = a3;
}

- (double)mediaFrameRate
{
  return self->_mediaFrameRate;
}

- (void)setMediaFrameRate:(double)a3
{
  self->_mediaFrameRate = a3;
}

- (double)mediaDuration
{
  return self->_mediaDuration;
}

- (void)setMediaDuration:(double)a3
{
  self->_mediaDuration = a3;
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_mediaResumeMethod, 0);
  objc_storeStrong((id *)&self->_mediaPauseMethod, 0);
}

@end
