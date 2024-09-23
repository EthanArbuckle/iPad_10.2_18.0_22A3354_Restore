@implementation PXPeopleRecoCollectionView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleRecoCollectionView;
  -[PXPeopleRecoCollectionView setFrame:](&v9, sel_setFrame_);
  -[PXPeopleRecoCollectionView recoCollectionViewDelegate](self, "recoCollectionViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView:frameDidChange:", self, x, y, width, height);

}

- (void)enableSwipeSelectionWithDelegate:(id)a3
{
  PXPeopleSwipeSelectionManager *swipeSelectionManager;
  PXPeopleSwipeSelectionManager *v5;
  PXPeopleSwipeSelectionManager *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PXPeopleRecoCollectionView setAllowsMultipleSelection:](self, "setAllowsMultipleSelection:", 1);
  swipeSelectionManager = self->_swipeSelectionManager;
  if (!swipeSelectionManager)
  {
    v5 = -[PXPeopleSwipeSelectionManager initWithScrollView:]([PXPeopleSwipeSelectionManager alloc], "initWithScrollView:", self);
    v6 = self->_swipeSelectionManager;
    self->_swipeSelectionManager = v5;

    -[PXPeopleRecoCollectionView superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSwipeSelectionManager swipeGestureRecognizer](self->_swipeSelectionManager, "swipeGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:", v8);

    swipeSelectionManager = self->_swipeSelectionManager;
  }
  -[PXPeopleSwipeSelectionManager setDelegate:](swipeSelectionManager, "setDelegate:", v10);
  -[PXPeopleSwipeSelectionManager swipeGestureRecognizer](self->_swipeSelectionManager, "swipeGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

}

- (void)disableSwipeSelection
{
  PXPeopleSwipeSelectionManager *swipeSelectionManager;
  id v4;

  -[PXPeopleRecoCollectionView setAllowsMultipleSelection:](self, "setAllowsMultipleSelection:", 0);
  swipeSelectionManager = self->_swipeSelectionManager;
  if (swipeSelectionManager)
  {
    -[PXPeopleSwipeSelectionManager swipeGestureRecognizer](swipeSelectionManager, "swipeGestureRecognizer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 0);

  }
}

- (PXPeopleRecoCollectionViewDelegate)recoCollectionViewDelegate
{
  return (PXPeopleRecoCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_recoCollectionViewDelegate);
}

- (void)setRecoCollectionViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recoCollectionViewDelegate, a3);
}

- (PXPeopleSwipeSelectionManager)swipeSelectionManager
{
  return self->_swipeSelectionManager;
}

- (void)setSwipeSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_swipeSelectionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_destroyWeak((id *)&self->_recoCollectionViewDelegate);
}

@end
