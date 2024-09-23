@implementation PUToolbarViewModelChange

- (BOOL)hasChanges
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUToolbarViewModelChange;
  return -[PUViewModelChange hasChanges](&v4, sel_hasChanges)
      || -[PUToolbarViewModelChange toolbarItemsChanged](self, "toolbarItemsChanged")
      || -[PUToolbarViewModelChange accessoryViewChanged](self, "accessoryViewChanged")
      || -[PUToolbarViewModelChange accessoryViewTopOutsetChanged](self, "accessoryViewTopOutsetChanged")
      || -[PUToolbarViewModelChange maximumHeightChanged](self, "maximumHeightChanged");
}

- (BOOL)toolbarItemsChanged
{
  return *(&self->super._hasChanges + 1);
}

- (void)_setToolbarItemsChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)accessoryViewChanged
{
  return *(&self->super._hasChanges + 2);
}

- (void)_setAccessoryViewChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)accessoryViewTopOutsetChanged
{
  return *(&self->super._hasChanges + 3);
}

- (void)_setAccessoryViewTopOutsetChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)accessoryViewMaximumHeightChanged
{
  return *(&self->super._hasChanges + 4);
}

- (void)_setAccessoryViewMaximumHeightChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)maximumHeightChanged
{
  return *(&self->super._hasChanges + 5);
}

- (void)_setMaximumHeightChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

@end
