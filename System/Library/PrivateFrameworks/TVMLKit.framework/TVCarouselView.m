@implementation TVCarouselView

- (TVCarouselView)initWithFrame:(CGRect)a3
{
  char *v3;
  _TVCarouselCollectionView *v4;
  double x;
  double y;
  double width;
  double height;
  _TVCarouselCollectionViewLayout *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)TVCarouselView;
  v3 = -[TVCarouselView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_TVCarouselCollectionView alloc];
    objc_msgSend(v3, "bounds");
    v23 = CGRectInset(v22, 0.0, 0.0);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    v9 = objc_alloc_init(_TVCarouselCollectionViewLayout);
    v10 = -[_TVCarouselCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);
    v11 = (void *)*((_QWORD *)v3 + 53);
    *((_QWORD *)v3 + 53) = v10;

    objc_msgSend(*((id *)v3 + 53), "setAutoresizingMask:", 18);
    objc_msgSend(*((id *)v3 + 53), "setDataSource:", v3);
    objc_msgSend(*((id *)v3 + 53), "setDelegate:", v3);
    objc_msgSend(*((id *)v3 + 53), "setOpaque:", 0);
    objc_msgSend(*((id *)v3 + 53), "setBackgroundColor:", 0);
    objc_msgSend(*((id *)v3 + 53), "setClipsToBounds:", 0);
    *(int64x2_t *)(v3 + 568) = vdupq_n_s64(0x4049000000000000uLL);
    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 53));
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v3 + 66);
    *((_QWORD *)v3 + 66) = v12;

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v3, sel__handlePlayGesture_);
    objc_msgSend(v14, "setAllowedPressTypes:", &unk_24EBCD4C0);
    objc_msgSend(v3, "addGestureRecognizer:", v14);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDF7528];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel__applicationDidEnterBackgroundNotification_, v16, v17);

    v18 = *MEMORY[0x24BDF75D0];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForegroundNotification_, v18, v19);

    *((_QWORD *)v3 + 59) = 0;
  }
  return (TVCarouselView *)v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVCarouselView;
  -[TVCarouselView layoutSubviews](&v9, sel_layoutSubviews);
  -[_TVCarouselCollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemSize");
  v5 = v4;
  objc_msgSend(v3, "minimumInteritemSpacing");
  v7 = v5 + v6;
  -[TVCarouselView _collectionView](self, "_collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setVisibleRectEdgeInsets:", 0.0, v7 * -10.0, 0.0, v7 * -10.0);

}

- (void)_startContinuousScroll
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  if (!self->_displayLink)
  {
    v3 = -[TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex");
    -[TVCarouselView _setContentOffsetForCollectionViewIndex:](self, "_setContentOffsetForCollectionViewIndex:", v3);
    -[TVCarouselView _collectionView](self, "_collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    v8 = v7;

    -[TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v3 + 1);
    v10 = v9;
    -[TVCarouselView setOffsetChangePerSecond:](self, "setOffsetChangePerSecond:", (v9 - v6) / self->_continuousScrollVelocity);
    -[TVCarouselView setTargetContentOffset:](self, "setTargetContentOffset:", v10, v8);
    -[TVCarouselView setPreviousDisplayLinkTimestamp:](self, "setPreviousDisplayLinkTimestamp:", 0.0);
    -[TVCarouselView _stopContinuousScroll](self, "_stopContinuousScroll");
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_displayLinkDidFire_);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToRunLoop:forMode:", v11, *MEMORY[0x24BDBCB80]);

    -[TVCarouselView setDisplayLink:](self, "setDisplayLink:", v12);
  }
}

- (void)displayLinkDidFire:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;

  -[TVCarouselView displayLink](self, "displayLink", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5;

  -[TVCarouselView previousDisplayLinkTimestamp](self, "previousDisplayLinkTimestamp");
  if (v7 == 0.0)
  {
    v9 = 0.0;
  }
  else
  {
    -[TVCarouselView previousDisplayLinkTimestamp](self, "previousDisplayLinkTimestamp");
    v9 = v6 - v8;
  }
  -[TVCarouselView setPreviousDisplayLinkTimestamp:](self, "setPreviousDisplayLinkTimestamp:", v6);
  if (-[TVCarouselView _canScrollCarouselView](self, "_canScrollCarouselView"))
  {
    -[TVCarouselView _collectionView](self, "_collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v12 = v11;
    v14 = v13;

    -[TVCarouselView offsetChangePerSecond](self, "offsetChangePerSecond");
    v16 = v12 + v15 * v9;
    -[TVCarouselView _collectionView](self, "_collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentOffset:animated:", 0, v16, v14);

    -[TVCarouselView displayLink](self, "displayLink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "targetTimestamp");
    v20 = v19 - v6;
    -[TVCarouselView offsetChangePerSecond](self, "offsetChangePerSecond");
    v22 = v20 * v21;

    -[TVCarouselView _collectionView](self, "_collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentOffset");
    v25 = v22 + v24;
    -[TVCarouselView targetContentOffset](self, "targetContentOffset");
    v27 = v26;

    if (v25 >= v27)
      -[TVCarouselView _adjustCarouselForDirectionShift:](self, "_adjustCarouselForDirectionShift:", 0);
  }
}

- (void)_stopContinuousScroll
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVCarouselView;
  -[TVCarouselView dealloc](&v4, sel_dealloc);
}

- (NSDictionary)collectionToDatasourceIndexMap
{
  if (!-[NSDictionary count](self->_collectionToDatasourceIndexMap, "count"))
    -[TVCarouselView _prepareIndexMap:](self, "_prepareIndexMap:", 0);
  return self->_collectionToDatasourceIndexMap;
}

- (id)_collectionView
{
  return self->_collectionView;
}

- (void)didMoveToSuperview
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVCarouselView;
  -[TVCarouselView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__TVCarouselView_didMoveToSuperview__block_invoke;
  block[3] = &unk_24EB85440;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __36__TVCarouselView_didMoveToSuperview__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAutoScrollTimer");
}

- (void)didMoveToWindow
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVCarouselView;
  -[TVCarouselView didMoveToWindow](&v4, sel_didMoveToWindow);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__TVCarouselView_didMoveToWindow__block_invoke;
  block[3] = &unk_24EB85440;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __33__TVCarouselView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAutoScrollTimer");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVCarouselView;
  -[TVCarouselView didUpdateFocusInContext:withAnimationCoordinator:](&v5, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  -[TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
  -[TVCarouselView _updateIdleModeLayoutAttributes](self, "_updateIdleModeLayoutAttributes");
}

- (id)preferredFocusedView
{
  return self->_collectionView;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double height;

  height = self->_itemSize.height;
  result.height = height;
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVCarouselView;
  -[TVCarouselView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[_TVCarouselCollectionView setSemanticContentAttribute:](self->_collectionView, "setSemanticContentAttribute:", a3);
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  int64_t v3;

  v3 = -[TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex", a3);
  return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v3, 0);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained;
  int64_t result;
  void *v7;
  int64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfRealItemsForDataSource = objc_msgSend(WeakRetained, "numberOfItemsInCarouselView:", self);

  result = self->_numberOfRealItemsForDataSource;
  if ((unint64_t)result >= 2)
  {
    -[TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    return v8;
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;

  self->_indexToDeque = objc_msgSend(a4, "item", a3);
  -[TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_indexToDeque);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "carouselView:cellForItemAtIndex:", self, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_setFocusableContentMargins:", 140.0, 0.0, 0.0, 0.0);
  self->_indexToDeque = 0x7FFFFFFFFFFFFFFFLL;
  return v10;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  if (!self->_focusedIndexPath)
    -[TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", 0x7FFFFFFFFFFFFFFFLL, 0, a5);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  BOOL v4;
  void *v6;
  double v7;

  if (self->_scrollMode == 1)
    return 0;
  if (!self->_firstFocusChangeInInterval)
    return 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", self->_firstFocusChangeInInterval);
  if (v7 < 0.15)
  {
    v4 = self->_numFocusChangesInInterval < 1;
  }
  else
  {
    self->_numFocusChangesInInterval = 0;
    v4 = 1;
  }

  return v4;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "carouselView:didSelectItemAtIndex:", self, v10);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "carouselViewDidScroll:", self);

  }
  if (self->_focusedIndexPath)
  {
    v7 = -[TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex");
    -[TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v7 + 1);
    v9 = v8;
    -[TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v7 - 1);
    v11 = v10;
    objc_msgSend(v15, "contentOffset");
    if (v12 <= v11)
    {
      v14 = 1;
      goto LABEL_8;
    }
    objc_msgSend(v15, "contentOffset");
    if (v13 >= v9)
    {
      v14 = 0;
LABEL_8:
      -[TVCarouselView _adjustCarouselForDirectionShift:](self, "_adjustCarouselForDirectionShift:", v14);
    }
  }

}

- (void)_handlePlayGesture:(id)a3
{
  id WeakRetained;
  char v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  id v10;
  id v11;

  if (objc_msgSend(a3, "state") == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "focusedView");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[TVCarouselView visibleCells](self, "visibleCells");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "containsObject:", v11);

        if (v8)
        {
          v9 = -[TVCarouselView indexForCell:](self, "indexForCell:", v11);
          v10 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v10, "carouselView:didPlayItemAtIndex:", self, v9);

        }
      }

    }
  }
}

- (id)_cellForItemAtIndex:(unint64_t)a3
{
  _TVCarouselCollectionView *collectionView;
  void *v4;
  void *v5;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCarouselCollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndex:(unint64_t)a4
{
  id v5;
  unint64_t indexToDeque;
  void *v7;
  _TVCarouselCollectionView *collectionView;
  void *v9;

  v5 = a3;
  indexToDeque = self->_indexToDeque;
  if (indexToDeque == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("-dequeueReusableCellWithReuseIdentifier:forIndex: may only be called from -carouselView:cellForItemAtIndex:"));
    v7 = 0;
  }
  else
  {
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", indexToDeque, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVCarouselCollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v5, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)focusedCell
{
  void *focusedIndexPath;

  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath)
  {
    -[TVCarouselView _cellForItemAtIndex:](self, "_cellForItemAtIndex:", objc_msgSend(focusedIndexPath, "item"));
    focusedIndexPath = (void *)objc_claimAutoreleasedReturnValue();
  }
  return focusedIndexPath;
}

- (unint64_t)indexForCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[_TVCarouselCollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4
{
  -[_TVCarouselCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", a3, a4);
}

- (void)reloadData
{
  NSDictionary *collectionToDatasourceIndexMap;

  collectionToDatasourceIndexMap = self->_collectionToDatasourceIndexMap;
  self->_collectionToDatasourceIndexMap = 0;

  -[_TVCarouselCollectionView reloadData](self->_collectionView, "reloadData");
  -[TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
}

- (void)setInteritemSpacing:(double)a3
{
  -[TVCarouselView setInteritemSpacing:animated:](self, "setInteritemSpacing:animated:", 0, a3);
}

- (void)setInteritemSpacing:(double)a3 animated:(BOOL)a4
{
  if (vabdd_f64(self->_interitemSpacing, a3) > 0.00000011920929)
  {
    self->_interitemSpacing = a3;
    -[TVCarouselView _updateCollectionViewLayoutAnimated:](self, "_updateCollectionViewLayoutAnimated:", a4);
  }
}

- (void)setItemSize:(CGSize)a3
{
  if (self->_itemSize.width != a3.width || self->_itemSize.height != a3.height)
  {
    self->_itemSize = a3;
    -[TVCarouselView _updateCollectionViewLayout](self, "_updateCollectionViewLayout");
  }
}

- (void)setAutoScrollInterval:(double)a3
{
  if (vabdd_f64(self->_autoScrollInterval, a3) > 2.22044605e-16)
  {
    if (a3 < 0.5 && a3 > 2.22044605e-16)
      a3 = 0.5;
    self->_autoScrollInterval = a3;
    -[TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
  }
}

- (void)setContinuousScrollVelocity:(double)a3
{
  if (vabdd_f64(self->_continuousScrollVelocity, a3) > 2.22044605e-16)
  {
    if (a3 < 0.5 && a3 > 2.22044605e-16)
      a3 = 0.5;
    self->_continuousScrollVelocity = a3;
    -[TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
  }
}

- (NSArray)visibleCells
{
  return (NSArray *)-[_TVCarouselCollectionView visibleCells](self->_collectionView, "visibleCells");
}

- (int64_t)_centerCollectionViewCellIndex
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[_TVCarouselCollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0);
  if (v2 >= 0)
    v3 = v2;
  else
    v3 = v2 + 1;
  return v3 >> 1;
}

- (int64_t)_numberOfCells
{
  void *v2;
  int64_t v3;

  -[_TVCarouselCollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_expectedNumberOfCells");

  return v3;
}

- (void)_adjustCarouselForDirectionShift:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;

  if (-[TVCarouselView _canScrollCarouselView](self, "_canScrollCarouselView"))
  {
    v5 = -[TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex");
    v6 = v5;
    if (a3 == 1)
      v7 = v5 - 1;
    else
      v7 = v5 + 1;
    -[TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    -[TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = a3 == 1;
    if (a3 == 1)
      v15 = 0;
    else
      v15 = v13 - 1;
    if (v14)
      v16 = v13 - 1;
    else
      v16 = 0;

    -[TVCarouselView _updateCarouselWithCenterIndex:indexToRemove:indexToAdd:](self, "_updateCarouselWithCenterIndex:indexToRemove:indexToAdd:", v11, v16, v15);
    -[TVCarouselView _setContentOffsetForCollectionViewIndex:](self, "_setContentOffsetForCollectionViewIndex:", v6);
  }
}

- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__TVCarouselView__setContentOffsetForCollectionViewIndex___block_invoke;
  v3[3] = &unk_24EB85540;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v3);
}

void __58__TVCarouselView__setContentOffsetForCollectionViewIndex___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "_contentOffsetXForCollectionViewIndex:", *(_QWORD *)(a1 + 40));
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:animated:", 0, v6, v4);

}

- (void)_updateCarouselWithCenterIndex:(int64_t)a3 indexToRemove:(int64_t)a4 indexToAdd:(int64_t)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__TVCarouselView__updateCarouselWithCenterIndex_indexToRemove_indexToAdd___block_invoke;
  v5[3] = &unk_24EB860E0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v5);
}

void __74__TVCarouselView__updateCarouselWithCenterIndex_indexToRemove_indexToAdd___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __74__TVCarouselView__updateCarouselWithCenterIndex_indexToRemove_indexToAdd___block_invoke_2;
  v3[3] = &unk_24EB860E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "performBatchUpdates:completion:", v3, 0);

}

void __74__TVCarouselView__updateCarouselWithCenterIndex_indexToRemove_indexToAdd___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_prepareIndexMap:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 48), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItemsAtIndexPaths:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 56), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertItemsAtIndexPaths:", v7);

}

- (void)_prepareIndexMap:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t numberOfRealItemsForDataSource;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *collectionToDatasourceIndexMap;
  id v22;

  v5 = -[TVCarouselView _numberOfCells](self, "_numberOfCells");
  v6 = v5;
  if (v5 >= 0)
    v7 = v5;
  else
    v7 = v5 + 1;
  v8 = v7 >> 1;
  numberOfRealItemsForDataSource = self->_numberOfRealItemsForDataSource;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v5);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v10, v11);

  if (v6 >= 2)
  {
    v12 = v8 - 1;
    v13 = v8 + 1;
    v14 = a3;
    do
    {
      if (v14 + 1 == numberOfRealItemsForDataSource)
        v14 = 0;
      else
        ++v14;
      if (a3 >= 1)
        v15 = a3;
      else
        v15 = numberOfRealItemsForDataSource;
      a3 = v15 - 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v16, v17);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v18, v19);

      --v12;
      ++v13;
    }
    while (v12 != -1);
  }
  v20 = (NSDictionary *)objc_msgSend(v22, "copy");
  collectionToDatasourceIndexMap = self->_collectionToDatasourceIndexMap;
  self->_collectionToDatasourceIndexMap = v20;

}

- (double)_contentOffsetXForCollectionViewIndex:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double Width;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[_TVCarouselCollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSize");
  v7 = v6;
  objc_msgSend(v5, "minimumInteritemSpacing");
  v9 = v8;
  -[TVCarouselView bounds](self, "bounds");
  if (CGRectGetWidth(v13) > 0.0)
  {
    -[TVCarouselView bounds](self, "bounds");
    Width = CGRectGetWidth(v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    Width = CGRectGetWidth(v14);

  }
  return floor(floor(v7 * 0.5 + (double)a3 * (v7 + v9)) - Width * 0.5);
}

- (void)_updateCollectionViewLayout
{
  -[TVCarouselView _updateCollectionViewLayoutAnimated:](self, "_updateCollectionViewLayoutAnimated:", 0);
}

- (void)_updateCollectionViewLayoutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSIndexPath *focusedIndexPath;
  _TVCarouselCollectionViewLayout *v6;

  v3 = a3;
  v6 = objc_alloc_init(_TVCarouselCollectionViewLayout);
  -[UICollectionViewFlowLayout setItemSize:](v6, "setItemSize:", self->_itemSize.width, self->_itemSize.height);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v6, "setMinimumInteritemSpacing:", self->_interitemSpacing);
  -[UICollectionViewFlowLayout setScrollDirection:](v6, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setSectionInsetReference:](v6, "setSectionInsetReference:", 0);
  -[_TVCarouselCollectionView setCollectionViewLayout:animated:](self->_collectionView, "setCollectionViewLayout:animated:", v6, v3);
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath)
    -[TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", -[NSIndexPath item](focusedIndexPath, "item"), 0);

}

- (void)_updateContentOffsetForFocusedIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSIndexPath *v7;
  NSIndexPath *focusedIndexPath;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  int64_t v13;
  _QWORD v14[6];
  _QWORD v15[6];

  v4 = a4;
  if (-[TVCarouselView _canScrollCarouselView](self, "_canScrollCarouselView"))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
    v7 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    focusedIndexPath = self->_focusedIndexPath;
    self->_focusedIndexPath = v7;

    v9 = -[_TVCarouselCollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0);
    if (!self->_scrollMode)
    {
      if (v9 >= 0)
        v10 = v9;
      else
        v10 = v9 + 1;
      v11 = 0.8;
      v12 = v10 >> 1;
      v15[0] = MEMORY[0x24BDAC760];
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        v13 = v12;
      else
        v13 = a3;
      if (!v4)
        v11 = 0.0;
      v15[1] = 3221225472;
      v15[2] = __63__TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke;
      v15[3] = &unk_24EB85540;
      v15[4] = self;
      v15[5] = v13;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __63__TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke_2;
      v14[3] = &unk_24EB86F38;
      v14[4] = self;
      v14[5] = v12;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 327686, v15, v14, v11, 0.0);
    }
  }
}

void __63__TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollToItemAtIndexPath:atScrollPosition:animated:", v2, 16, 0);

}

void __63__TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 440);
  *(_QWORD *)(v3 + 440) = v2;

}

- (BOOL)_canScrollCarouselView
{
  void *v3;
  BOOL v4;

  -[TVCarouselView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[_TVCarouselCollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0) > 1;
  else
    v4 = 0;

  return v4;
}

- (void)_updateAutoScrollTimer
{
  void *v3;
  void *v4;
  char v5;
  unint64_t scrollMode;

  if (!-[TVCarouselView _canScrollCarouselView](self, "_canScrollCarouselView"))
    goto LABEL_5;
  if (!self->_focusedIndexPath)
    -[TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", 0x7FFFFFFFFFFFFFFFLL, 0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDescendantOfView:", self);

  if ((v5 & 1) == 0)
  {
    scrollMode = self->_scrollMode;
    if (scrollMode == 1)
    {
      -[TVCarouselView _startContinuousScroll](self, "_startContinuousScroll");
    }
    else if (!scrollMode && fabs(self->_autoScrollInterval) > 2.22044605e-16)
    {
      -[TVCarouselView _startAutoScrollTimer](self, "_startAutoScrollTimer");
    }
  }
  else
  {
LABEL_5:
    -[TVCarouselView _stopAutoScrollTimer](self, "_stopAutoScrollTimer");
    -[TVCarouselView _stopContinuousScroll](self, "_stopContinuousScroll");
  }
}

- (void)_startAutoScrollTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *autoScrollTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];
  id v9;
  id location;

  -[TVCarouselView _stopAutoScrollTimer](self, "_stopAutoScrollTimer");
  if (self->_autoScrollInterval > 0.0)
  {
    objc_initWeak(&location, self);
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    autoScrollTimer = self->_autoScrollTimer;
    self->_autoScrollTimer = v3;

    v5 = self->_autoScrollTimer;
    v6 = dispatch_time(0, (uint64_t)(self->_autoScrollInterval * 1000000000.0));
    dispatch_source_set_timer(v5, v6, (unint64_t)(self->_autoScrollInterval * 1000000000.0), 0x1DCD6500uLL);
    v7 = self->_autoScrollTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __39__TVCarouselView__startAutoScrollTimer__block_invoke;
    handler[3] = &unk_24EB85398;
    objc_copyWeak(&v9, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_autoScrollTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __39__TVCarouselView__startAutoScrollTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF7F78]);

    WeakRetained = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v6, "_updateContentOffsetForFocusedIndex:animated:", objc_msgSend(*(id *)(a1 + 32), "_centerCollectionViewCellIndex") + 1, 1);
      WeakRetained = v6;
    }
  }

}

- (void)_stopAutoScrollTimer
{
  NSObject *autoScrollTimer;
  OS_dispatch_source *v4;

  autoScrollTimer = self->_autoScrollTimer;
  if (autoScrollTimer)
  {
    dispatch_source_cancel(autoScrollTimer);
    v4 = self->_autoScrollTimer;
    self->_autoScrollTimer = 0;

  }
}

- (void)_updateIdleModeLayoutAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[_TVCarouselCollectionView visibleCells](self->_collectionView, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "_setIdleModeLayoutAttributes:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "focusedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isDescendantOfView:", self))
  {
    -[_TVCarouselCollectionView visibleCells](self->_collectionView, "visibleCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v9);

    if (v11)
    {
      objc_msgSend(v9, "bounds");
      if (v12 >= v13)
        v14 = v12;
      else
        v14 = v13;
      memset(&v17, 0, sizeof(v17));
      CGAffineTransformMakeScale(&v17, (v14 + 20.0) / v14, (v14 + 20.0) / v14);
      v15 = (void *)objc_opt_new();
      v16 = v17;
      objc_msgSend(v15, "setTransform:", &v16);
      objc_msgSend(v9, "_setIdleModeLayoutAttributes:", v15);

    }
  }

}

- (TVCarouselViewDataSource)dataSource
{
  return (TVCarouselViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (TVCarouselViewDelegate)delegate
{
  return (TVCarouselViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (unint64_t)scrollMode
{
  return self->_scrollMode;
}

- (void)setScrollMode:(unint64_t)a3
{
  self->_scrollMode = a3;
}

- (double)autoScrollInterval
{
  return self->_autoScrollInterval;
}

- (double)continuousScrollVelocity
{
  return self->_continuousScrollVelocity;
}

- (CGPoint)focusDirection
{
  double x;
  double y;
  CGPoint result;

  x = self->_focusDirection.x;
  y = self->_focusDirection.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
  self->_focusDirection = a3;
}

- (void)setCollectionToDatasourceIndexMap:(id)a3
{
  objc_storeStrong((id *)&self->_collectionToDatasourceIndexMap, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (double)previousDisplayLinkTimestamp
{
  return self->_previousDisplayLinkTimestamp;
}

- (void)setPreviousDisplayLinkTimestamp:(double)a3
{
  self->_previousDisplayLinkTimestamp = a3;
}

- (CGPoint)targetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetContentOffset.x;
  y = self->_targetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  self->_targetContentOffset = a3;
}

- (double)offsetChangePerSecond
{
  return self->_offsetChangePerSecond;
}

- (void)setOffsetChangePerSecond:(double)a3
{
  self->_offsetChangePerSecond = a3;
}

- (NSDate)firstFocusChangeInInterval
{
  return self->_firstFocusChangeInInterval;
}

- (void)setFirstFocusChangeInInterval:(id)a3
{
  objc_storeStrong((id *)&self->_firstFocusChangeInInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFocusChangeInInterval, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_collectionToDatasourceIndexMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_autoScrollTimer, 0);
}

@end
