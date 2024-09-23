@implementation CACCorrectionsCollectionViewController

- (CACCorrectionsCollectionViewController)init
{
  void *v3;
  void *v4;
  double v5;
  CACCorrectionsCollectionViewController *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setEstimatedItemSize:", 40.0, 40.0);
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValueForValue:", 8.0);
  objc_msgSend(v3, "setSectionInset:", v5, v5, v5, v5);
  v6 = -[CACCorrectionsCollectionViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v3);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CACCorrectionsCollectionViewController;
  -[CACCorrectionsCollectionViewController viewDidLoad](&v9, sel_viewDidLoad);
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("Corrections.Title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCollectionViewController setTitle:](self, "setTitle:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__didTapCancel_);
  -[CACCorrectionsCollectionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[CACCorrectionsCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACCorrectionsCollectionViewController;
  -[CACCorrectionsCollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CACCorrectionsCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)_didTapCancel:(id)a3
{
  id v4;

  -[CACCorrectionsCollectionViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissCorrectionsCollectionViewController:", self);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (id)_itemsInSection:(int64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[CACCorrectionsCollectionViewController emojis](self, "emojis");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[CACCorrectionsCollectionViewController alternatives](self, "alternatives");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CACCorrectionsCollectionViewController _itemsInSection:](self, "_itemsInSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Cell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCollectionViewController _itemsInSection:](self, "_itemsInSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  -[CACCorrectionsCollectionViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCollectionViewController _itemsInSection:](self, "_itemsInSection:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "correctionsCollectionViewController:didSelectItemWithText:", self, v8);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCorrectionsCollectionViewControllerDelegate)delegate
{
  return (CACCorrectionsCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSArray)emojis
{
  return self->_emojis;
}

- (void)setEmojis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojis, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
