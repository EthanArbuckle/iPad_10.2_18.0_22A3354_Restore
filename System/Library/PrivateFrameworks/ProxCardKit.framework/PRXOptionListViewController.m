@implementation PRXOptionListViewController

- (PRXOptionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PRXScrollableContentView *v5;
  id v6;
  id v7;
  void *v8;
  PRXScrollableContentView *v9;
  PRXOptionListViewController *v10;

  v5 = [PRXScrollableContentView alloc];
  v6 = objc_alloc(MEMORY[0x24BDF68D8]);
  v7 = objc_alloc_init(MEMORY[0x24BDF6908]);
  v8 = (void *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = -[PRXScrollableContentView initWithCardStyle:scrollView:](v5, "initWithCardStyle:scrollView:", 0, v8);
  v10 = -[PRXOptionListViewController initWithContentView:](self, "initWithContentView:", v9);

  return v10;
}

- (PRXOptionListViewController)initWithContentView:(id)a3
{
  PRXOptionListViewController *v3;
  PRXOptionListViewController *v4;
  NSArray *options;
  PRXOptionListViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRXOptionListViewController;
  v3 = -[PRXCardContentViewController initWithContentView:](&v8, sel_initWithContentView_, a3);
  v4 = v3;
  if (v3)
  {
    options = v3->_options;
    v3->_options = (NSArray *)MEMORY[0x24BDBD1A8];

    v6 = v4;
  }

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  char isKindOfClass;
  UICollectionView *v6;
  UICollectionView *collectionView;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PRXOptionListViewController;
  -[PRXCardContentViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[PRXCardContentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v3, "scrollView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCAB8];
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ requires a PRXScrollableContentView with a UICollectionView"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  objc_msgSend(v3, "scrollView");
  v6 = (UICollectionView *)objc_claimAutoreleasedReturnValue();
  collectionView = self->_collectionView;
  self->_collectionView = v6;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v8);

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PRXOptionCell"));
  -[PRXOptionListViewController _createCollectionViewLayout](self, "_createCollectionViewLayout");

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PRXOptionListViewController;
  -[PRXCardContentViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXOptionListViewController;
  -[PRXOptionListViewController viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  -[PRXOptionListViewController _createCollectionViewLayout](self, "_createCollectionViewLayout");
}

- (void)_createCollectionViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDF6710];
  objc_msgSend(MEMORY[0x24BDF66F0], "fractionalWidthDimension:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF66F0], "estimatedDimension:", 50.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6700], "itemWithLayoutSize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDF66F8];
  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "verticalGroupWithLayoutSize:subitems:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6708], "sectionWithGroup:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterGroupSpacing:", 8.0);
  -[PRXCardContentViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "directionalLayoutMargins");
  v14 = v13;
  -[PRXCardContentViewController contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "directionalLayoutMargins");
  objc_msgSend(v11, "setContentInsets:", 0.0, v14, 0.0);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF68E8]), "initWithSection:", v11);
  -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v16);

}

- (void)setOptions:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *options;
  id v7;

  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_options, "isEqualToArray:"))
  {
    -[PRXOptionListViewController selectedOptions](self, "selectedOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSArray *)objc_msgSend(v7, "copy");
    options = self->_options;
    self->_options = v5;

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    -[PRXOptionListViewController setSelectedOptions:](self, "setSelectedOptions:", v4);

  }
}

- (NSArray)selectedOptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "item"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSArray objectsAtIndexes:](self->_options, "objectsAtIndexes:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (void)setSelectedOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  UICollectionView *collectionView;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v9 = a3;
  if (objc_msgSend(v9, "count")
    || (-[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    collectionView = self->_collectionView;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__PRXOptionListViewController_setSelectedOptions___block_invoke;
    v10[3] = &unk_24CC31E98;
    v10[4] = self;
    v11 = v6;
    v8 = v6;
    -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", v10, 0);

  }
}

void __50__PRXOptionListViewController_setSelectedOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __50__PRXOptionListViewController_setSelectedOptions___block_invoke_2;
  v6[3] = &unk_24CC32020;
  v6[1] = 3221225472;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

}

void __50__PRXOptionListViewController_setSelectedOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD15D8];
  v6 = a2;
  objc_msgSend(v5, "indexPathForItem:inSection:", a3, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 1088);
  if ((_DWORD)a3)
    objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v8, 0, 0);
  else
    objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v8, 0);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_options, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *options;
  uint64_t v9;
  void *v10;
  void (**formatterBlock)(id, void *);
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PRXOptionCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  v9 = objc_msgSend(v6, "item");

  -[NSArray objectAtIndexedSubscript:](options, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  formatterBlock = (void (**)(id, void *))self->_formatterBlock;
  if (formatterBlock)
    formatterBlock[2](formatterBlock, v10);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;

  if (self->_selectionHandler)
  {
    -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_selectionHandler + 2))();

  }
}

- (NSArray)options
{
  return self->_options;
}

- (id)formatterBlock
{
  return self->_formatterBlock;
}

- (void)setFormatterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong(&self->_formatterBlock, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
