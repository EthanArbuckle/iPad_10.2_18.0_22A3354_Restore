@implementation _UICollectionViewPlaceholderContext

- (BOOL)deletePlaceholder
{
  _UICollectionViewPlaceholderContext *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[_UICollectionViewPlaceholderContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderContextDidDismiss:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)commitInsertionWithDataSourceUpdates:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UICollectionViewPlaceholderContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "placeholderContext:didCommitInsertionWithDataSourceUpdates:", self, v4);

  return (char)self;
}

- (void)setNeedsCellUpdate
{
  id v3;

  -[_UICollectionViewPlaceholderContext delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderContextNeedsCellUpdate:", self);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSIndexPath *v6;
  NSString *reuseIdentifier;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = self->_originalInsertionIndexPath;
    reuseIdentifier = self->_reuseIdentifier;
  }
  else
  {
    v6 = 0;
    reuseIdentifier = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p insertionIndexPath=%@ reuseIdentifier=%@>"), v5, self, v6, reuseIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)addAnimations:(id)a3
{
  if (self)
    self = (_UICollectionViewPlaceholderContext *)self->_animationHandlers;
  -[_UICollectionViewPlaceholderContext addAnimations:](self, "addAnimations:", a3);
}

- (void)addCompletion:(id)a3
{
  if (self)
    self = (_UICollectionViewPlaceholderContext *)self->_animationHandlers;
  -[_UICollectionViewPlaceholderContext addCompletion:](self, "addCompletion:", a3);
}

- (void)setAnimationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_animationHandlers, a3);
}

- (_UICollectionViewPlaceholderContextDelegate)delegate
{
  return (_UICollectionViewPlaceholderContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
  objc_storeStrong((id *)&self->_dragItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationHandlers, 0);
  objc_storeStrong(&self->_cellUpdateHandler, 0);
  objc_storeStrong((id *)&self->_originalInsertionIndexPath, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_shadowUpdateIdentifier, 0);
}

@end
