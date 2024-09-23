@implementation SiriUISnippetCollectionViewController

- (SiriUISnippetCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v5;
  SiriUISnippetCollectionViewController *v6;
  SiriUISnippetCollectionViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUISnippetCollectionViewController;
  v6 = -[SiriUISnippetViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collectionViewLayout, a3);

  return v7;
}

- (void)loadView
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  UICollectionView *v8;
  UICollectionView *collectionView;
  UICollectionView *v10;
  void *v11;
  void *v12;

  self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 1;
  v3 = objc_alloc(MEMORY[0x24BDF68D8]);
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriViewControllerExpectedWidth:", self);
  v6 = v5;
  -[SiriUISnippetCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v7, 0.0, 0.0, v6, 0.0);
  collectionView = self->_collectionView;
  self->_collectionView = v8;

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", 0);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  v10 = self->_collectionView;
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v12, "enableDragAndDrop");

  if ((_DWORD)v11)
    -[UICollectionView setDragDelegate:](self->_collectionView, "setDragDelegate:", self);
  -[SiriUISnippetCollectionViewController setView:](self, "setView:", self->_collectionView);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SiriUISnippetCollectionViewController;
  -[SiriUISnippetCollectionViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[SiriUISnippetCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (self->_previousBounds.size.width != v9 || self->_previousBounds.size.height != v11)
  {
    if (self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews)
    {
      -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invalidateLayout");

    }
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 1;
    self->_previousBounds.origin.x = v5;
    self->_previousBounds.origin.y = v7;
    self->_previousBounds.size.width = v9;
    self->_previousBounds.size.height = v11;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;
  _QWORD v15[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SiriUISnippetCollectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __92__SiriUISnippetCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_24D7D9568;
    v15[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v15, 0);
  }
  v14.receiver = self;
  v14.super_class = (Class)SiriUISnippetCollectionViewController;
  -[SiriUISnippetCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __92__SiriUISnippetCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateLayout");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__SiriUISnippetCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  block[3] = &unk_24D7D91F8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __92__SiriUISnippetCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "siriViewControllerHeightDidChange:", *(_QWORD *)(a1 + 32));

}

- (UICollectionViewLayout)collectionViewLayout
{
  UICollectionViewLayout *collectionViewLayout;
  SiriUICollectionViewFlowLayout *v4;
  UICollectionViewLayout *v5;

  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    v4 = objc_alloc_init(SiriUICollectionViewFlowLayout);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v4, "setMinimumLineSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v4, "setMinimumInteritemSpacing:", 0.0);
    v5 = self->_collectionViewLayout;
    self->_collectionViewLayout = &v4->super.super;

    collectionViewLayout = self->_collectionViewLayout;
  }
  return collectionViewLayout;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriUISnippetCollectionViewController.m"), 105, CFSTR("SiriUISnippetCollectionViewController unexpectedly asked to provide a cell, subclass %@ should override"), v8);

  return 0;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array", a3, a4, a5);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end
