@implementation _UIActivityContentCollectionView

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  if (-[_UIActivityContentCollectionView initialValidLayoutWasCalled](self, "initialValidLayoutWasCalled"))
    -[_UIActivityContentCollectionView setIsInitialLayoutPass:](self, "setIsInitialLayoutPass:", 0);
  if (!-[_UIActivityContentCollectionView initialValidLayoutWasCalled](self, "initialValidLayoutWasCalled"))
  {
    -[_UIActivityContentCollectionView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[_UIActivityContentCollectionView setInitialValidLayoutWasCalled:](self, "setInitialValidLayoutWasCalled:", 1);
      -[_UIActivityContentCollectionView setIsInitialLayoutPass:](self, "setIsInitialLayoutPass:", 1);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIActivityContentCollectionView;
  -[_UIActivityContentCollectionView layoutSubviews](&v4, sel_layoutSubviews);
}

- (void)removeFromSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIActivityContentCollectionView;
  -[_UIActivityContentCollectionView removeFromSuperview](&v3, sel_removeFromSuperview);
  -[_UIActivityContentCollectionView setInitialValidLayoutWasCalled:](self, "setInitialValidLayoutWasCalled:", 0);
  -[_UIActivityContentCollectionView setIsInitialLayoutPass:](self, "setIsInitialLayoutPass:", 0);
}

- (BOOL)isInitialLayoutPass
{
  return self->_isInitialLayoutPass;
}

- (void)setIsInitialLayoutPass:(BOOL)a3
{
  self->_isInitialLayoutPass = a3;
}

- (BOOL)initialValidLayoutWasCalled
{
  return self->_initialValidLayoutWasCalled;
}

- (void)setInitialValidLayoutWasCalled:(BOOL)a3
{
  self->_initialValidLayoutWasCalled = a3;
}

@end
