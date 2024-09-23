@implementation SBCollectionViewCell

- (void)_performSetHighlighted
{
  self->_protectDelayedUnhighlights = 0;
  -[SBCollectionViewCell setHighlighted:afterDelay:](self, "setHighlighted:afterDelay:", self->_performSetHighlighted, 0.0);
}

- (void)setHighlighted:(BOOL)a3 afterDelay:(double)a4
{
  _BOOL8 v7;
  void *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a4 > 0.0 || !self->_protectDelayedUnhighlights || a3)
  {
    v7 = a3;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performSetHighlighted, 0);
    if (-[SBCollectionViewCell isHighlighted](self, "isHighlighted") != v7)
    {
      if (a4 <= 0.0)
      {
        v10.receiver = self;
        v10.super_class = (Class)SBCollectionViewCell;
        -[SBCollectionViewCell setHighlighted:](&v10, sel_setHighlighted_, v7);
        if (-[SBCollectionViewCell isHighlighted](self, "isHighlighted") == v7)
          -[SBCollectionViewCell _didSetHighlighted:](self, "_didSetHighlighted:", v7);
      }
      else
      {
        self->_performSetHighlighted = v7;
        v11[0] = *MEMORY[0x1E0C99860];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBCollectionViewCell performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__performSetHighlighted, 0, v9, a4);

      }
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  -[SBCollectionViewCell setHighlighted:afterDelay:](self, "setHighlighted:afterDelay:", a3, 0.0);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCollectionViewCell;
  -[SBCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  self->_protectDelayedUnhighlights = 0;
  -[SBCollectionViewCell setHighlighted:](self, "setHighlighted:", 0);
}

- (BOOL)protectDelayedUnhighlights
{
  return self->_protectDelayedUnhighlights;
}

- (void)setProtectDelayedUnhighlights:(BOOL)a3
{
  self->_protectDelayedUnhighlights = a3;
}

- (SBCollectionViewCellDelegate)delegate
{
  return (SBCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
