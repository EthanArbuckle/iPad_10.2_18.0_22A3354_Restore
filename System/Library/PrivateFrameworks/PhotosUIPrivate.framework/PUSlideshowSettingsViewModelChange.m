@implementation PUSlideshowSettingsViewModelChange

- (BOOL)hasChanges
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowSettingsViewModelChange;
  return -[PUViewModelChange hasChanges](&v4, sel_hasChanges)
      || -[PUSlideshowSettingsViewModelChange presetDidChange](self, "presetDidChange")
      || -[PUSlideshowSettingsViewModelChange mediaItemDidChange](self, "mediaItemDidChange")
      || -[PUSlideshowSettingsViewModelChange shouldRepeatDidChange](self, "shouldRepeatDidChange")
      || -[PUSlideshowSettingsViewModelChange stepDurationDidChange](self, "stepDurationDidChange")
      || -[PUSlideshowSettingsViewModelChange musicOnDidChange](self, "musicOnDidChange");
}

- (BOOL)presetDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (void)_setPresetDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)mediaItemDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setMediaItemDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)shouldRepeatDidChange
{
  return *(&self->super._hasChanges + 3);
}

- (void)_setRepeatDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)stepDurationDidChange
{
  return *(&self->super._hasChanges + 4);
}

- (void)_setStepDurationDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)musicOnDidChange
{
  return *(&self->super._hasChanges + 5);
}

- (void)_setMusicOnDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

@end
