@implementation UIKeyboardUISnapshotView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIKeyboardUISnapshot size](self->_snapshot, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSnapshot:(id)a3
{
  UIKeyboardUISnapshot *v4;
  void *v5;
  void *v6;
  UIKeyboardUISnapshot *v7;

  v4 = (UIKeyboardUISnapshot *)a3;
  if (self->_snapshot != v4)
  {
    self->_snapshot = v4;
    v7 = v4;
    if (-[UIKeyboardUISnapshot slotID](v4, "slotID"))
    {
      objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", -[UIKeyboardUISnapshot slotID](self->_snapshot, "slotID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContents:", v5);

    }
    else
    {
      -[UIView layer](self, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContents:", 0);
    }

    v4 = v7;
  }

}

- (UIKeyboardUISnapshot)snapshot
{
  return self->_snapshot;
}

@end
