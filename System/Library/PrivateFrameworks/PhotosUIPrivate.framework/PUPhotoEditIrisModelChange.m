@implementation PUPhotoEditIrisModelChange

- (BOOL)videoEnabledDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (void)_setVideoEnabledDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

@end
