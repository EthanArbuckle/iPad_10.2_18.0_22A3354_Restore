@implementation RCUndoManager

- (BOOL)canUndo
{
  objc_super v4;

  if (-[RCUndoManager undoDisabled](self, "undoDisabled"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)RCUndoManager;
  return -[RCUndoManager canUndo](&v4, "canUndo");
}

- (BOOL)undoDisabled
{
  return self->_undoDisabled;
}

- (void)setUndoDisabled:(BOOL)a3
{
  self->_undoDisabled = a3;
}

@end
