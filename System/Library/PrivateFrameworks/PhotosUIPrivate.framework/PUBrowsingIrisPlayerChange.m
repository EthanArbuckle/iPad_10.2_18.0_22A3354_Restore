@implementation PUBrowsingIrisPlayerChange

- (BOOL)hasChanges
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingIrisPlayerChange;
  return -[PUViewModelChange hasChanges](&v4, sel_hasChanges)
      || -[PUBrowsingIrisPlayerChange isLivePhotoLoadingAllowedDidChange](self, "isLivePhotoLoadingAllowedDidChange")
      || -[PUBrowsingIrisPlayerChange isLivePhotoPlaybackAllowedDidChange](self, "isLivePhotoPlaybackAllowedDidChange")
      || -[PUBrowsingIrisPlayerChange playerDidChange](self, "playerDidChange")
      || -[PUBrowsingIrisPlayerChange playbackStateDidChange](self, "playbackStateDidChange")
      || -[PUBrowsingIrisPlayerChange livePhotoDidChange](self, "livePhotoDidChange")
      || -[PUBrowsingIrisPlayerChange activatedDidChange](self, "activatedDidChange")
      || -[PUBrowsingIrisPlayerChange scrubbingPhotoTimeDidChange](self, "scrubbingPhotoTimeDidChange")
      || -[PUBrowsingIrisPlayerChange currentlyDisplayedTimesDidChange](self, "currentlyDisplayedTimesDidChange")
      || -[PUBrowsingIrisPlayerChange playingDidChange](self, "playingDidChange")
      || -[PUBrowsingIrisPlayerChange vitalityTransformDidChange](self, "vitalityTransformDidChange")
      || -[PUBrowsingIrisPlayerChange imageLoadingEnabledDidChange](self, "imageLoadingEnabledDidChange");
}

- (BOOL)isLivePhotoPlaybackAllowedDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (void)setIsLivePhotoPlaybackAllowedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)isLivePhotoLoadingAllowedDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)setIsLivePhotoLoadingAllowedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)livePhotoDidChange
{
  return *(&self->super._hasChanges + 3);
}

- (void)setLivePhotoDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)playerDidChange
{
  return *(&self->super._hasChanges + 4);
}

- (void)setPlayerDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)playbackStateDidChange
{
  return *(&self->super._hasChanges + 5);
}

- (void)setPlaybackStateDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

- (BOOL)activatedDidChange
{
  return *(&self->super._hasChanges + 6);
}

- (void)setActivatedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 6) = a3;
}

- (BOOL)scrubbingPhotoTimeDidChange
{
  return *(&self->super._hasChanges + 7);
}

- (void)setScrubbingPhotoTimeDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 7) = a3;
}

- (BOOL)currentlyDisplayedTimesDidChange
{
  return self->_isLivePhotoPlaybackAllowedDidChange;
}

- (void)setCurrentlyDisplayedTimesDidChange:(BOOL)a3
{
  self->_isLivePhotoPlaybackAllowedDidChange = a3;
}

- (BOOL)playingDidChange
{
  return self->_isLivePhotoLoadingAllowedDidChange;
}

- (void)setPlayingDidChange:(BOOL)a3
{
  self->_isLivePhotoLoadingAllowedDidChange = a3;
}

- (BOOL)vitalityTransformDidChange
{
  return self->_livePhotoDidChange;
}

- (void)setVitalityTransformDidChange:(BOOL)a3
{
  self->_livePhotoDidChange = a3;
}

- (BOOL)imageLoadingEnabledDidChange
{
  return self->_playerDidChange;
}

- (void)setImageLoadingEnabledDidChange:(BOOL)a3
{
  self->_playerDidChange = a3;
}

@end
