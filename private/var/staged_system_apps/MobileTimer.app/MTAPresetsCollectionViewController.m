@implementation MTAPresetsCollectionViewController

- (MTAPresetsCollectionViewController)initWithItems:(id)a3 presetsDelegate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  MTAPresetsCollectionViewController *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "presetFlowLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v13.receiver = self;
  v13.super_class = (Class)MTAPresetsCollectionViewController;
  v11 = -[MTAPresetsCollectionViewController initWithCollectionViewLayout:](&v13, "initWithCollectionViewLayout:", v10);

  if (v11)
  {
    -[MTAPresetsCollectionViewController setItems:](v11, "setItems:", v6);
    -[MTAPresetsCollectionViewController setDelegate:](v11, "setDelegate:", v7);
  }

  return v11;
}

+ (id)presetFlowLayout
{
  id v2;

  v2 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  objc_msgSend(v2, "setScrollDirection:", 1);
  objc_msgSend(v2, "setMinimumInteritemSpacing:", 16.0);
  objc_msgSend(v2, "setMinimumLineSpacing:", 16.0);
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAPresetsCollectionViewController;
  -[MTAPresetsCollectionViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MTAPresetCollectionViewCell, v4), CFSTR("PresetCell"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController items](self, "items", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PresetCell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController items](self, "items"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  objc_msgSend(v7, "setPresetItem:", v10);

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = 80.0;
  v6 = 80.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  objc_msgSend(v4, "setHighlighted:", 1);

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  objc_msgSend(v4, "setHighlighted:", 0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAPresetsCollectionViewController items](self, "items"));
  v7 = objc_msgSend(v5, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  objc_msgSend(v8, "duration");
  objc_msgSend(v9, "didSelectPresetWithDuration:");

}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (TimerPresetsDelegate)delegate
{
  return (TimerPresetsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
