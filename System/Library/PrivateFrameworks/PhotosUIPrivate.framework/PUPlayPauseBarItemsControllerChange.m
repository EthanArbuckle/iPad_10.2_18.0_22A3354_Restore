@implementation PUPlayPauseBarItemsControllerChange

- (BOOL)hasChanges
{
  return -[PUPlayPauseBarItemsControllerChange playPauseStateDidChange](self, "playPauseStateDidChange")
      || -[PUPlayPauseBarItemsControllerChange currentPlaybackTimeDidChange](self, "currentPlaybackTimeDidChange")
      || -[PUPlayPauseBarItemsControllerChange playbackDurationDidChange](self, "playbackDurationDidChange");
}

- (BOOL)playPauseStateDidChange
{
  return self->_playPauseStateDidChange;
}

- (void)_setPlayPauseStateDidChange:(BOOL)a3
{
  self->_playPauseStateDidChange = a3;
}

- (BOOL)currentPlaybackTimeDidChange
{
  return self->_currentPlaybackTimeDidChange;
}

- (void)_setCurrentPlaybackTimeDidChange:(BOOL)a3
{
  self->_currentPlaybackTimeDidChange = a3;
}

- (BOOL)playbackDurationDidChange
{
  return self->_playbackDurationDidChange;
}

- (void)_setPlaybackDurationDidChange:(BOOL)a3
{
  self->_playbackDurationDidChange = a3;
}

@end
