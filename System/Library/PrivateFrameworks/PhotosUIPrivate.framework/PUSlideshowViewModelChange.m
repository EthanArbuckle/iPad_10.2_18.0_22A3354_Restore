@implementation PUSlideshowViewModelChange

- (BOOL)hasChanges
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowViewModelChange;
  return -[PUViewModelChange hasChanges](&v4, sel_hasChanges)
      || -[PUSlideshowViewModelChange currentStateDidChange](self, "currentStateDidChange")
      || -[PUSlideshowViewModelChange wantsChromeVisibleDidChange](self, "wantsChromeVisibleDidChange");
}

- (BOOL)currentStateDidChange
{
  return *(&self->super._hasChanges + 1);
}

- (void)_setCurrentStateDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)wantsChromeVisibleDidChange
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setWantsChromeVisibleDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

@end
