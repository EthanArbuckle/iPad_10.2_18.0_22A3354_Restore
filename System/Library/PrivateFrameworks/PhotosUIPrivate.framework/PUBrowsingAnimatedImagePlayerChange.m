@implementation PUBrowsingAnimatedImagePlayerChange

- (BOOL)hasChanges
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingAnimatedImagePlayerChange;
  return -[PUViewModelChange hasChanges](&v4, sel_hasChanges)
      || -[PUBrowsingAnimatedImagePlayerChange animatedImageDidChange](self, "animatedImageDidChange")
      || -[PUBrowsingAnimatedImagePlayerChange animatedImageLoadingAllowedDidChange](self, "animatedImageLoadingAllowedDidChange");
}

- (BOOL)animatedImageDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (void)_setAnimatedImageDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)animatedImageLoadingAllowedDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setAnimatedImageLoadingAllowedDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

@end
