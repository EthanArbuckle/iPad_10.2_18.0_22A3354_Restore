@implementation PUBrowsingVideoPlayerChange

- (BOOL)hasChanges
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingVideoPlayerChange;
  return -[PUViewModelChange hasChanges](&v4, sel_hasChanges)
      || -[PUBrowsingVideoPlayerChange playStateDidChange](self, "playStateDidChange")
      || -[PUBrowsingVideoPlayerChange desiredPlayStateDidChange](self, "desiredPlayStateDidChange")
      || -[PUBrowsingVideoPlayerChange isActivatedDidChange](self, "isActivatedDidChange")
      || -[PUBrowsingVideoPlayerChange isPlayerLoadingAllowedDidChange](self, "isPlayerLoadingAllowedDidChange")
      || -[PUBrowsingVideoPlayerChange avPlayerDidChange](self, "avPlayerDidChange")
      || -[PUBrowsingVideoPlayerChange playerItemDidChange](self, "playerItemDidChange")
      || -[PUBrowsingVideoPlayerChange errorDidChange](self, "errorDidChange")
      || -[PUBrowsingVideoPlayerChange isAtBeginningDidChange](self, "isAtBeginningDidChange")
      || -[PUBrowsingVideoPlayerChange isAtEndDidChange](self, "isAtEndDidChange")
      || -[PUBrowsingVideoPlayerChange isStalledDidChange](self, "isStalledDidChange")
      || -[PUBrowsingVideoPlayerChange isPlayableDidChange](self, "isPlayableDidChange")
      || -[PUBrowsingVideoPlayerChange audioStatusDidChange](self, "audioStatusDidChange")
      || -[PUBrowsingVideoPlayerChange audioSessionVolumeIncreaseDidOccur](self, "audioSessionVolumeIncreaseDidOccur");
}

- (BOOL)durationDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (void)setDurationDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)playStateDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setPlayStateDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)desiredPlayStateDidChange
{
  return *(&self->super._hasChanges + 3);
}

- (void)_setDesiredPlayStateDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)isActivatedDidChange
{
  return *(&self->super._hasChanges + 4);
}

- (void)_setActivatedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)isPlayerLoadingAllowedDidChange
{
  return *(&self->super._hasChanges + 5);
}

- (void)_setPlayerLoadingAllowedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

- (BOOL)avPlayerDidChange
{
  return *(&self->super._hasChanges + 6);
}

- (void)_setAVPlayerDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 6) = a3;
}

- (BOOL)playerItemDidChange
{
  return *(&self->super._hasChanges + 7);
}

- (void)_setPlayerItemDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 7) = a3;
}

- (BOOL)errorDidChange
{
  return self->_durationDidChange;
}

- (void)_setErrorDidChange:(BOOL)a3
{
  self->_durationDidChange = a3;
}

- (BOOL)isAtBeginningDidChange
{
  return self->_playStateDidChange;
}

- (void)_setAtBeginningDidChange:(BOOL)a3
{
  self->_playStateDidChange = a3;
}

- (BOOL)isAtEndDidChange
{
  return self->_desiredPlayStateDidChange;
}

- (void)_setAtEndDidChange:(BOOL)a3
{
  self->_desiredPlayStateDidChange = a3;
}

- (BOOL)isStalledDidChange
{
  return self->_isActivatedDidChange;
}

- (void)_setStalledDidChange:(BOOL)a3
{
  self->_isActivatedDidChange = a3;
}

- (BOOL)isPlayableDidChange
{
  return self->_isPlayerLoadingAllowedDidChange;
}

- (void)_setPlayableDidChange:(BOOL)a3
{
  self->_isPlayerLoadingAllowedDidChange = a3;
}

- (BOOL)audioStatusDidChange
{
  return self->_avPlayerDidChange;
}

- (void)_setAudioStatusDidChange:(BOOL)a3
{
  self->_avPlayerDidChange = a3;
}

- (BOOL)audioSessionVolumeIncreaseDidOccur
{
  return self->_playerItemDidChange;
}

- (void)_setAudioSessionVolumeIncreaseDidOccur:(BOOL)a3
{
  self->_playerItemDidChange = a3;
}

@end
