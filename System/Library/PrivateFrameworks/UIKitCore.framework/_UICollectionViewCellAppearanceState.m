@implementation _UICollectionViewCellAppearanceState

- (_UICollectionViewCellAppearanceState)init
{
  _UICollectionViewCellAppearanceState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewCellAppearanceState;
  result = -[_UICollectionViewCellAppearanceState init](&v3, sel_init);
  if (result)
  {
    result->_dragState = 0;
    result->_prefersGhostedDraggedAppearance = 1;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  int dragState;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UICollectionViewCellAppearanceState dragState](self, "dragState");
  if (v6 > 8)
    v7 = CFSTR("<unknown>");
  else
    v7 = off_1E16BE418[v6];
  if (!self)
    goto LABEL_13;
  dragState = self->_dragState;
  if (dragState == 1)
  {
    v9 = CFSTR("lifting");
    goto LABEL_14;
  }
  if (dragState == 6)
  {
    if (self->_prefersGhostedDraggedAppearance)
      goto LABEL_12;
LABEL_13:
    v9 = CFSTR("normal");
    goto LABEL_14;
  }
  if (dragState != 3)
    goto LABEL_13;
  if (self->_prefersGhostedDraggedAppearance)
  {
LABEL_12:
    v9 = CFSTR("ghosted");
    goto LABEL_14;
  }
  v9 = CFSTR("hidden");
LABEL_14:
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p - dragState = %@; appearance = %@>"), v5, self, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setHasLifted:(BOOL)a3
{
  self->_hasLifted = a3;
}

- (void)setHasBeganCancelling:(BOOL)a3
{
  self->_hasBeganCancelling = a3;
}

- (int)dragState
{
  return self->_dragState;
}

- (void)setDragState:(int)a3
{
  self->_dragState = a3;
}

@end
