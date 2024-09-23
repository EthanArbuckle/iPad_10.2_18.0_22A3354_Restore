@implementation VideosExtrasGridElementViewController

- (VideosExtrasGridElementViewController)initWithViewElement:(id)a3
{
  id v4;
  VideosExtrasGridElementViewController *v5;
  VideosExtrasGridElementViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasGridElementViewController;
  v5 = -[VideosExtrasViewElementViewController initWithViewElement:](&v9, sel_initWithViewElement_, 0);
  v6 = v5;
  if (v5)
  {
    -[VideosExtrasGridElementViewController setViewElement:](v5, "setViewElement:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__dynamicTypeDidChange, *MEMORY[0x1E0DC48E8], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasGridElementViewController;
  -[VideosExtrasElementViewController dealloc](&v4, sel_dealloc);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_VideosExtrasShelfCollectionViewLayout calculatedContentSize](self->_flowLayout, "calculatedContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setShelfStyle:(BOOL)a3
{
  self->_shelfStyle = a3;
  -[UICollectionViewFlowLayout setScrollDirection:](self->_flowLayout, "setScrollDirection:", a3);
  -[_VideosExtrasShelfCollectionViewLayout invalidateLayout](self->_flowLayout, "invalidateLayout");
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
}

- (UICollectionView)collectionView
{
  UICollectionView *collectionView;
  _VideosExtrasShelfCollectionViewLayout *v4;
  _VideosExtrasShelfCollectionViewLayout *flowLayout;
  id v6;
  UICollectionView *v7;
  UICollectionView *v8;
  void *v9;

  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v4 = objc_alloc_init(_VideosExtrasShelfCollectionViewLayout);
    flowLayout = self->_flowLayout;
    self->_flowLayout = v4;

    -[UICollectionViewFlowLayout setScrollDirection:](self->_flowLayout, "setScrollDirection:", -[VideosExtrasGridElementViewController isShelfStyle](self, "isShelfStyle"));
    v6 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v7 = (UICollectionView *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", self->_flowLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_collectionView;
    self->_collectionView = v7;

    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v9);

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("GridCellID"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("TextCellID"));
    -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("ReusableHeaderID"));
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    collectionView = self->_collectionView;
  }
  return collectionView;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  _VideosExtrasGridHeaderView *v6;
  _VideosExtrasGridHeaderView *headerView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasGridElementViewController;
  -[VideosExtrasGridElementViewController loadView](&v8, sel_loadView);
  -[VideosExtrasGridElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[VideosExtrasGridElementViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v5);

  v6 = (_VideosExtrasGridHeaderView *)-[_VideosExtrasGridHeaderView initForAutolayout]([_VideosExtrasGridHeaderView alloc], "initForAutolayout");
  headerView = self->_headerView;
  self->_headerView = v6;

  objc_msgSend(v3, "addSubview:", self->_headerView);
}

+ (id)keyPathsForValuesAffectingContentScrollView
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet;
  if (!keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("collectionView"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet;
    keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet = v3;

    v2 = (void *)keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasGridElementViewController;
  -[VideosExtrasElementViewController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "header");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[_VideosExtrasGridHeaderView configureForImage:title:subtitle:style:](self->_headerView, "configureForImage:title:subtitle:style:", v6, v7, v8, v10);
  -[VideosExtrasGridElementViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  -[VideosExtrasGridElementViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bringSubviewToFront:", self->_headerView);

  -[VideosExtrasGridElementViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bringSubviewToFront:", self->_titleRule);

  -[VideosExtrasGridElementViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bringSubviewToFront:", v15);

}

- (void)setViewElement:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)VideosExtrasGridElementViewController;
    -[VideosExtrasViewElementViewController setViewElement:](&v13, sel_setViewElement_, v4);
    -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "headerStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[_VideosExtrasGridHeaderView configureForImage:title:subtitle:style:](self->_headerView, "configureForImage:title:subtitle:style:", v8, v9, v10, v12);
    objc_opt_class();
    -[VideosExtrasGridElementViewController setShelfStyle:](self, "setShelfStyle:", (objc_opt_isKindOfClass() & 1) == 0);

  }
}

- (BOOL)_hasDescriptionText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "header");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;

  return v6;
}

- (BOOL)_sectionIndexIsDescriptionSection:(int64_t)a3
{
  BOOL result;

  result = -[VideosExtrasGridElementViewController _hasDescriptionText](self, "_hasDescriptionText");
  if (a3)
    return 0;
  return result;
}

- (id)_lockupForIndexPath:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[VideosExtrasGridElementViewController _hasDescriptionText](self, "_hasDescriptionText");
  v6 = objc_msgSend(v4, "section") - v5;
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v4, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_sectionElementForIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:"))
  {
    v5 = 0;
  }
  else
  {
    v6 = a3 - -[VideosExtrasGridElementViewController _hasDescriptionText](self, "_hasDescriptionText");
    -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", objc_msgSend(v10, "section")))
  {
    if (collectionView_layout_sizeForItemAtIndexPath__onceToken != -1)
      dispatch_once(&collectionView_layout_sizeForItemAtIndexPath__onceToken, &__block_literal_global_47);
    v12 = (void *)collectionView_layout_sizeForItemAtIndexPath____textCell;
    -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "header");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "descriptionText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detailTextStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureForTextElement:style:", v15, v16);

    -[VideosExtrasGridElementViewController collectionView:layout:insetForSectionAtIndex:](self, "collectionView:layout:insetForSectionAtIndex:", v8, v9, objc_msgSend(v10, "section"));
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v8, "frame");
    objc_msgSend((id)collectionView_layout_sizeForItemAtIndexPath____textCell, "sizeThatFits:", v25 - v20 - v24, v26 - v18 - v22);
    v28 = v27;
    v30 = v29;
  }
  else
  {
    -[VideosExtrasGridElementViewController _sectionElementForIndex:](self, "_sectionElementForIndex:", objc_msgSend(v10, "section"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController _cellStyleForSection:](self, "_cellStyleForSection:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController _lockupForIndexPath:](self, "_lockupForIndexPath:", v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (collectionView_layout_sizeForItemAtIndexPath__onceToken_74 != -1)
      dispatch_once(&collectionView_layout_sizeForItemAtIndexPath__onceToken_74, &__block_literal_global_75_0);
    objc_msgSend((id)collectionView_layout_sizeForItemAtIndexPath____sizeCell, "configureForLockup:cellStyle:withSizing:", v33, v32, 1);
    objc_msgSend((id)collectionView_layout_sizeForItemAtIndexPath____sizeCell, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC5000], *(double *)(MEMORY[0x1E0DC5000] + 8));
    v28 = v34;
    v30 = v35;

  }
  v36 = v28;
  v37 = v30;
  result.height = v37;
  result.width = v36;
  return result;
}

void __86__VideosExtrasGridElementViewController_collectionView_layout_sizeForItemAtIndexPath___block_invoke()
{
  VideosExtrasDetailTextCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [VideosExtrasDetailTextCell alloc];
  v1 = -[VideosExtrasDetailTextCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_sizeForItemAtIndexPath____textCell;
  collectionView_layout_sizeForItemAtIndexPath____textCell = v1;

}

void __86__VideosExtrasGridElementViewController_collectionView_layout_sizeForItemAtIndexPath___block_invoke_2()
{
  VideosExtrasGridCollectionViewCell *v0;
  void *v1;

  v0 = objc_alloc_init(VideosExtrasGridCollectionViewCell);
  v1 = (void *)collectionView_layout_sizeForItemAtIndexPath____sizeCell;
  collectionView_layout_sizeForItemAtIndexPath____sizeCell = (uint64_t)v0;

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", a5))
  {
    objc_msgSend(v7, "detailInsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    -[VideosExtrasGridElementViewController _sectionElementForIndex:](self, "_sectionElementForIndex:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController _sectionInsetsForSection:](self, "_sectionInsetsForSection:", v16);
    v9 = v17;
    v11 = v18;
    v13 = v19;
    v15 = v20;

  }
  v21 = v9;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[VideosExtrasGridElementViewController _sectionElementForIndex:](self, "_sectionElementForIndex:", a5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0.0;
  -[VideosExtrasGridElementViewController _sectionElementForIndex:](self, "_sectionElementForIndex:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController _cellSpacingForSection:](self, "_cellSpacingForSection:", v8);
  v10 = v9;

  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[VideosExtrasViewElementViewController viewElement](self, "viewElement", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6 + -[VideosExtrasGridElementViewController _hasDescriptionText](self, "_hasDescriptionText");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  int64_t v13;

  if (-[VideosExtrasGridElementViewController _hasDescriptionText](self, "_hasDescriptionText", a3))
  {
    if (-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", a4))
    {
      return 1;
    }
    -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = a4 - 1;
  }
  else
  {
    -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = a4;
  }
  objc_msgSend(v8, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", objc_msgSend(v6, "section")))
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TextCellID"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "header");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptionText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "detailTextStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configureForTextElement:style:", v12, v13);
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("GridCellID"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasGridElementViewController _lockupForIndexPath:](self, "_lockupForIndexPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController _sectionElementForIndex:](self, "_sectionElementForIndex:", objc_msgSend(v6, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController _cellStyleForSection:](self, "_cellStyleForSection:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configureForLockup:cellStyle:", v12, v14);

  }
  return v9;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (!-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", objc_msgSend(v6, "section")))
  {
    -[VideosExtrasGridElementViewController _lockupForIndexPath:](self, "_lockupForIndexPath:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 4, 1, 0, 0, 0);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", objc_msgSend(v6, "section")))
  {
    -[VideosExtrasGridElementViewController _lockupForIndexPath:](self, "_lockupForIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectItemAtIndexPath:animated:", v6, 1);
    objc_msgSend(v7, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, 0);

  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a5;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", a4, CFSTR("ReusableHeaderID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = -[VideosExtrasGridElementViewController _hasDescriptionText](self, "_hasDescriptionText");
  v10 = objc_msgSend(v8, "section");

  v11 = v10 - a3;
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "header");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionHeaderStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "configureForHeaderElement:headerStyle:", v15, v17);
  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (collectionView_layout_referenceSizeForHeaderInSection__onceToken != -1)
    dispatch_once(&collectionView_layout_referenceSizeForHeaderInSection__onceToken, &__block_literal_global_76);
  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (!-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", a5))
  {
    v12 = a5 - -[VideosExtrasGridElementViewController _hasDescriptionText](self, "_hasDescriptionText");
    -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "header");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sectionHeaderStyle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)collectionView_layout_referenceSizeForHeaderInSection____sizingView, "configureForHeaderElement:headerStyle:", v16, v18);
      objc_msgSend((id)collectionView_layout_referenceSizeForHeaderInSection____sizingView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC5000], *(double *)(MEMORY[0x1E0DC5000] + 8));
      v10 = v19;
      v11 = v20;

    }
  }

  v21 = v10;
  v22 = v11;
  result.height = v22;
  result.width = v21;
  return result;
}

void __95__VideosExtrasGridElementViewController_collectionView_layout_referenceSizeForHeaderInSection___block_invoke()
{
  VideosExtrasCollectionReusableView *v0;
  void *v1;

  v0 = objc_alloc_init(VideosExtrasCollectionReusableView);
  v1 = (void *)collectionView_layout_referenceSizeForHeaderInSection____sizingView;
  collectionView_layout_referenceSizeForHeaderInSection____sizingView = (uint64_t)v0;

}

- (id)preferredLayoutGuide
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_VideosExtrasGridHeaderView titleLabel](self->_headerView, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[VideosExtrasGridElementViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (int64_t)preferredLayoutAttribute
{
  return 3;
}

- (id)_cellStyleForSection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForStyle:", CFSTR("extras-itml-section-content-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("extras-image")))
  {
    objc_msgSend(v6, "imageCellStyle");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("extras-video")))
  {
    objc_msgSend(v6, "videoCellStyle");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("extras-product")))
    {
LABEL_9:
      objc_msgSend(v6, "defaultCellStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(v6, "productCellStyle");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (!v7)
    goto LABEL_9;
LABEL_10:

  return v8;
}

- (UIEdgeInsets)_sectionInsetsForSection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  objc_msgSend(a3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForStyle:", CFSTR("extras-itml-section-content-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultCellSectionInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("extras-image")))
    {
      objc_msgSend(v6, "imageCellSectionInsets");
LABEL_8:
      v8 = v15;
      v10 = v16;
      v12 = v17;
      v14 = v18;
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("extras-video")))
    {
      objc_msgSend(v6, "videoCellSectionInsets");
      goto LABEL_8;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("extras-product")))
    {
      objc_msgSend(v6, "productCellSectionInsets");
      goto LABEL_8;
    }
  }
LABEL_9:

  v19 = v8;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (double)_cellSpacingForSection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  v4 = a3;
  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSpacing");
  v7 = v6;
  objc_msgSend(v4, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForStyle:", CFSTR("extras-itml-section-content-type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("extras-image")))
    {
      objc_msgSend(v5, "imageSpacing");
LABEL_8:
      v7 = v10;
      goto LABEL_9;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("extras-video")))
    {
      objc_msgSend(v5, "videoSpacing");
      goto LABEL_8;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("extras-product")))
    {
      objc_msgSend(v5, "productSpacing");
      goto LABEL_8;
    }
  }
LABEL_9:

  return v7;
}

- (VideosExtrasGridViewControllerStyle)currentStyle
{
  VideosExtrasGridViewControllerStyle *v3;

  if (-[VideosExtrasElementViewController isWide](self, "isWide"))
  {
    v3 = self->_wideStyle;
  }
  else
  {
    -[VideosExtrasGridElementViewController _narrowStyle](self, "_narrowStyle");
    v3 = (VideosExtrasGridViewControllerStyle *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_narrowStyle
{
  void *v3;
  double v4;
  double v5;
  void *v6;

  -[VideosExtrasGridElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (fabs(v5 + -480.0) >= 0.00000011920929)
  {
    if (fabs(v5 + -568.0) >= 0.00000011920929)
    {
      if (fabs(v5 + -667.0) < 0.00000011920929)
      {
        -[VideosExtrasGridElementViewController largeStyle](self, "largeStyle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      if (fabs(v5 + -736.0) < 0.00000011920929 || fabs(v5 + -812.0) < 0.00000011920929)
      {
        -[VideosExtrasGridElementViewController extraLargeStyle](self, "extraLargeStyle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
    }
    -[VideosExtrasGridElementViewController mediumStyle](self, "mediumStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VideosExtrasGridElementViewController smallStyle](self, "smallStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_dynamicTypeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_VideosExtrasGridHeaderView invalidateIntrinsicContentSize](self->_headerView, "invalidateIntrinsicContentSize");
  -[VideosExtrasGridElementViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "invalidateLayout");
  -[VideosExtrasGridElementViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "updateConstraintsIfNeeded", (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_prepareLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  UIView *titleRule;
  int *v9;
  UIView *v10;
  UIView *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSArray *v19;
  NSArray *titleRuleConstraints;
  void *v21;
  void *v22;
  NSArray **p_headerViewConstraints;
  NSArray *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  _VideosExtrasGridHeaderView *headerView;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  char isKindOfClass;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  id *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  objc_super v86;

  v86.receiver = self;
  v86.super_class = (Class)VideosExtrasGridElementViewController;
  -[VideosExtrasElementViewController _prepareLayout](&v86, sel__prepareLayout);
  -[VideosExtrasGridElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VideosExtrasViewElementViewController embedded](self, "embedded"))
  {
    -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVignetteType:", 3);

  }
  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  v7 = objc_msgSend(v5, "showsScrollFade");
  titleRule = self->_titleRule;
  v9 = &OBJC_IVAR___VUIStoreFPSKeyLoader__didSkipRentalCheckout;
  if (v7)
  {
    if (!titleRule)
    {
      objc_msgSend((id)objc_opt_class(), "_borderView");
      v10 = (UIView *)objc_claimAutoreleasedReturnValue();
      v11 = self->_titleRule;
      self->_titleRule = v10;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleRule, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v3, "addSubview:", self->_titleRule);
    }
    if (!self->_titleRuleConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleRule, 4, 0, self->_headerView, 4, 1.0, 0.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "headerStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "insets");
      v15 = v14;
      v17 = v16;

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_titleRule, self->_collectionView, 10, 0.0, v15, 0.0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayByAddingObject:", v12);
      v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
      titleRuleConstraints = self->_titleRuleConstraints;
      self->_titleRuleConstraints = v19;

    }
    -[VideosExtrasGridElementViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addConstraints:", self->_titleRuleConstraints);

    -[VideosExtrasGridElementViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bringSubviewToFront:", self->_titleRule);

  }
  else
  {
    if (titleRule)
      -[UIView removeFromSuperview](titleRule, "removeFromSuperview");
    if (self->_titleRuleConstraints)
      objc_msgSend(v3, "removeConstraints:");
  }
  p_headerViewConstraints = &self->_headerViewConstraints;
  if (self->_headerViewConstraints)
  {
    objc_msgSend(v3, "removeConstraints:");
    v24 = *p_headerViewConstraints;
    *p_headerViewConstraints = 0;

  }
  -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "headerStyle");
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)v26;
  if (v26)
  {
    -[VideosExtrasGridElementViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", self->_headerView);

    -[VideosExtrasGridElementViewController currentStyle](self, "currentStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "headerStyle");
    v85 = v3;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "insets");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v39 = (void *)MEMORY[0x1E0CB3718];
    headerView = self->_headerView;
    -[VideosExtrasGridElementViewController view](self, "view");
    v83 = v5;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "safeAreaLayoutGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", headerView, 3, 0, v42, 3, 1.0, v32);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_headerView, v85, 10, v32, v34, v36, v38);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_headerView, 8, 1, 0, 0, 1.0, 50.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasGridElementViewController collectionView](self, "collectionView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintsByAttachingView:toView:alongEdges:insets:", v47, v85, 14, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasGridElementViewController collectionView](self, "collectionView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 3, 0, self->_headerView, 4, 1.0, v36);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addObject:", v43);
    objc_msgSend(v27, "addObjectsFromArray:", v44);
    objc_msgSend(v27, "addObject:", v45);
    objc_msgSend(v27, "addObjectsFromArray:", v48);
    objc_msgSend(v27, "addObject:", v51);

    v9 = &OBJC_IVAR___VUIStoreFPSKeyLoader__didSkipRentalCheckout;
    v5 = v83;

    v3 = v85;
  }
  else
  {
    -[_VideosExtrasGridHeaderView removeFromSuperview](self->_headerView, "removeFromSuperview");
    v52 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasGridElementViewController collectionView](self, "collectionView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintsByAttachingView:toView:alongEdges:insets:", v53, v3, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "addObjectsFromArray:", v43);
  }

  objc_storeStrong((id *)&self->_headerViewConstraints, v27);
  objc_msgSend(v3, "addConstraints:", v27);
  objc_msgSend(v5, "collectionViewInsets");
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;
  -[VideosExtrasGridElementViewController parentViewController](self, "parentViewController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (-[VideosExtrasElementViewController isWide](self, "isWide"))
      v59 = 60.0;
    else
      v59 = 70.0;
  }
  if (objc_msgSend(v5, "adjustsContentInsetByBottomNavBar"))
  {
    -[VideosExtrasGridElementViewController navigationController](self, "navigationController");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_opt_respondsToSelector();

    if ((v65 & 1) != 0)
    {
      -[VideosExtrasGridElementViewController navigationController](self, "navigationController");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "mainTemplateViewController");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "view");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "bounds");
      v70 = v69;

      if (v70 > v59)
      {
        objc_msgSend(v67, "menuBarView");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "bounds");
        v73 = v72;

        if (v59 < v73)
          v59 = v73;
      }

    }
  }
  v74 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "keyWindow");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "safeAreaInsets");
  v77 = v57 + v76;

  objc_msgSend(*v74, "keyWindow");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "safeAreaInsets");
  v80 = v61 + v79;

  v81 = v9[946];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v81), "setContentInset:", v55, v77, v59, v80);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v81), "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v81), "collectionViewLayout");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "invalidateLayout");

  objc_msgSend(v5, "defaultSpacing");
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_flowLayout, "setMinimumInteritemSpacing:");
  objc_msgSend(v5, "cellLineSpacing");
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_flowLayout, "setMinimumLineSpacing:");

}

+ (id)_fontAttributesForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0DC1378];
  objc_msgSend(v3, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E0DC1388];
  objc_msgSend(v3, "fontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultCellStyle
{
  VideosExtrasGridCellStyle *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v3, "setImageSize:", 90.0, 90.0);
  -[VideosExtrasGridCellStyle setTitleFirstBaselineHeight:](v3, "setTitleFirstBaselineHeight:", 20.0);
  v4 = *MEMORY[0x1E0DC4A98];
  -[VideosExtrasGridCellStyle setTitleTextStyle:](v3, "setTitleTextStyle:", *MEMORY[0x1E0DC4A98]);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleDefaultFontAttributes:](v3, "setTitleDefaultFontAttributes:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleTextColor:](v3, "setTitleTextColor:", v6);

  -[VideosExtrasGridCellStyle setTextFirstBaselineToBottom:](v3, "setTextFirstBaselineToBottom:", 30.0);
  -[VideosExtrasGridCellStyle setTextLastBaselineToBottom:](v3, "setTextLastBaselineToBottom:", 10.0);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setSubtitleDefaultFontAttributes:](v3, "setSubtitleDefaultFontAttributes:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setSubtitleTextColor:](v3, "setSubtitleTextColor:", v8);

  -[VideosExtrasGridCellStyle setSubtitleTextStyle:](v3, "setSubtitleTextStyle:", v4);
  -[VideosExtrasGridCellStyle setSubtitleFirstBaselineHeight:](v3, "setSubtitleFirstBaselineHeight:", 18.0);
  -[VideosExtrasGridCellStyle setDefaultTextAlignment:](v3, "setDefaultTextAlignment:", 1);
  return v3;
}

+ (id)wideGalleryStyle
{
  VideosExtrasGridViewControllerStyle *v3;
  void *v4;
  void *v5;
  void *v6;
  VideosExtrasGridSectionHeaderStyle *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  objc_msgSend(a1, "_defaultCellStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageSize:", 170.0, 170.0);
  -[VideosExtrasGridViewControllerStyle setDefaultCellStyle:](v3, "setDefaultCellStyle:", v4);
  -[VideosExtrasGridViewControllerStyle setImageCellStyle:](v3, "setImageCellStyle:", v4);
  objc_msgSend(a1, "_defaultCellStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSize:", 224.0, 126.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellStyle:](v3, "setVideoCellStyle:", v5);
  objc_msgSend(a1, "_defaultCellStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageSize:", 114.0, 170.0);
  -[VideosExtrasGridViewControllerStyle setProductCellStyle:](v3, "setProductCellStyle:", v6);
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", 280.0, 15.0, 0.0, 15.0);
  v7 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  v8 = *MEMORY[0x1E0DC4A88];
  -[VideosExtrasGridSectionHeaderStyle setTextStyle:](v7, "setTextStyle:", *MEMORY[0x1E0DC4A88]);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridSectionHeaderStyle setDefaultFontAttributes:](v7, "setDefaultFontAttributes:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridSectionHeaderStyle setTextColor:](v7, "setTextColor:", v10);

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v7, "setInsets:", 0.0, 5.0, 0.0, 5.0);
  -[VideosExtrasGridSectionHeaderStyle setTextBaselineDescender:](v7, "setTextBaselineDescender:", 15.0);
  -[VideosExtrasGridViewControllerStyle setSectionHeaderStyle:](v3, "setSectionHeaderStyle:", v7);
  -[VideosExtrasGridViewControllerStyle setDefaultSpacing:](v3, "setDefaultSpacing:", 32.0);
  -[VideosExtrasGridViewControllerStyle setImageSpacing:](v3, "setImageSpacing:", 32.0);
  -[VideosExtrasGridViewControllerStyle setVideoSpacing:](v3, "setVideoSpacing:", 29.0);
  -[VideosExtrasGridViewControllerStyle setProductSpacing:](v3, "setProductSpacing:", 40.0);
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", 0.0, 5.0, 0.0, 5.0);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", 0.0, 5.0, 0.0, 5.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", 0.0, 5.0, 0.0, 5.0);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", 0.0, 5.0, 0.0, 5.0);
  -[VideosExtrasGridViewControllerStyle setCellLineSpacing:](v3, "setCellLineSpacing:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setBackgroundColor:](v3, "setBackgroundColor:", v11);

  -[VideosExtrasGridViewControllerStyle setShowsScrollFade:](v3, "setShowsScrollFade:", 0);
  -[VideosExtrasGridViewControllerStyle setAdjustsContentInsetByBottomNavBar:](v3, "setAdjustsContentInsetByBottomNavBar:", 1);

  return v3;
}

+ (id)smallGalleryStyle
{
  VideosExtrasGridViewControllerStyle *v3;
  VideosExtrasGridCellStyle *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VideosExtrasGridSectionHeaderStyle *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 120.0, 120.0);
  -[VideosExtrasGridCellStyle setTitleFirstBaselineHeight:](v4, "setTitleFirstBaselineHeight:", 20.0);
  v5 = *MEMORY[0x1E0DC4AA0];
  -[VideosExtrasGridCellStyle setTitleTextStyle:](v4, "setTitleTextStyle:", *MEMORY[0x1E0DC4AA0]);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleDefaultFontAttributes:](v4, "setTitleDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleTextColor:](v4, "setTitleTextColor:", v7);

  -[VideosExtrasGridCellStyle setTextFirstBaselineToBottom:](v4, "setTextFirstBaselineToBottom:", 30.0);
  -[VideosExtrasGridCellStyle setTextLastBaselineToBottom:](v4, "setTextLastBaselineToBottom:", 10.0);
  -[VideosExtrasGridCellStyle setSubtitleDefaultFontAttributes:](v4, "setSubtitleDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setSubtitleTextColor:](v4, "setSubtitleTextColor:", v8);

  -[VideosExtrasGridCellStyle setSubtitleTextStyle:](v4, "setSubtitleTextStyle:", *MEMORY[0x1E0DC4A98]);
  -[VideosExtrasGridCellStyle setSubtitleFirstBaselineHeight:](v4, "setSubtitleFirstBaselineHeight:", 18.0);
  -[VideosExtrasGridCellStyle setDefaultTextAlignment:](v4, "setDefaultTextAlignment:", 1);
  -[VideosExtrasGridViewControllerStyle setDefaultCellStyle:](v3, "setDefaultCellStyle:", v4);
  -[VideosExtrasGridViewControllerStyle setImageCellStyle:](v3, "setImageCellStyle:", v4);
  -[VideosExtrasGridViewControllerStyle setProductCellStyle:](v3, "setProductCellStyle:", v4);
  v9 = (void *)-[VideosExtrasGridCellStyle copy](v4, "copy");
  objc_msgSend(v9, "setImageSize:", 125.0, 70.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellStyle:](v3, "setVideoCellStyle:", v9);
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", 112.0, 0.0, 0.0, 0.0);
  v10 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  -[VideosExtrasGridSectionHeaderStyle setTextStyle:](v10, "setTextStyle:", *MEMORY[0x1E0DC4B10]);
  -[VideosExtrasGridSectionHeaderStyle setDefaultFontAttributes:](v10, "setDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridSectionHeaderStyle setTextColor:](v10, "setTextColor:", v11);

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v10, "setInsets:", 15.0, 15.0, 5.0, 15.0);
  -[VideosExtrasGridViewControllerStyle setSectionHeaderStyle:](v3, "setSectionHeaderStyle:", v10);
  -[VideosExtrasGridViewControllerStyle setDefaultSpacing:](v3, "setDefaultSpacing:", 45.0);
  -[VideosExtrasGridViewControllerStyle setImageSpacing:](v3, "setImageSpacing:", 45.0);
  -[VideosExtrasGridViewControllerStyle setVideoSpacing:](v3, "setVideoSpacing:", 37.0);
  -[VideosExtrasGridViewControllerStyle setProductSpacing:](v3, "setProductSpacing:", 45.0);
  -[VideosExtrasGridViewControllerStyle setCellLineSpacing:](v3, "setCellLineSpacing:", 0.0);
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", 0.0, 15.0, 0.0, 15.0);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", 0.0, 15.0, 0.0, 15.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", 0.0, 15.0, 0.0, 15.0);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", 0.0, 15.0, 0.0, 15.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setBackgroundColor:](v3, "setBackgroundColor:", v12);

  -[VideosExtrasGridViewControllerStyle setShowsScrollFade:](v3, "setShowsScrollFade:", 0);
  -[VideosExtrasGridViewControllerStyle setAdjustsContentInsetByBottomNavBar:](v3, "setAdjustsContentInsetByBottomNavBar:", 1);

  return v3;
}

+ (id)mediumGalleryStyle
{
  void *v2;

  objc_msgSend(a1, "smallGalleryStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultSpacing:", 19.0);
  objc_msgSend(v2, "setImageSpacing:", 19.0);
  objc_msgSend(v2, "setVideoSpacing:", 12.0);
  objc_msgSend(v2, "setProductSpacing:", 19.0);
  return v2;
}

+ (id)largeGalleryStyle
{
  void *v2;

  objc_msgSend(a1, "smallGalleryStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewInsets");
  objc_msgSend(v2, "setCollectionViewInsets:", 155.0);
  objc_msgSend(v2, "setDefaultSpacing:", 8.0);
  objc_msgSend(v2, "setImageSpacing:", 8.0);
  objc_msgSend(v2, "setVideoSpacing:", 12.0);
  objc_msgSend(v2, "setProductSpacing:", 8.0);
  return v2;
}

+ (id)extraLargeGalleryStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "smallGalleryStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewInsets");
  objc_msgSend(v2, "setCollectionViewInsets:", 160.0);
  objc_msgSend(v2, "defaultCellStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageSize:", 160.0, 160.0);

  objc_msgSend(v2, "imageCellStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageSize:", 160.0, 160.0);

  objc_msgSend(v2, "videoCellStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSize:", 160.0, 90.0);

  objc_msgSend(v2, "productCellStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageSize:", 160.0, 160.0);

  objc_msgSend(v2, "setDefaultSpacing:", 22.0);
  objc_msgSend(v2, "setImageSpacing:", 22.0);
  objc_msgSend(v2, "setVideoSpacing:", 22.0);
  objc_msgSend(v2, "setProductSpacing:", 22.0);
  return v2;
}

+ (id)wideDetailStyle
{
  VideosExtrasGridViewControllerStyle *v3;
  VideosExtrasGridCellStyle *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VideosExtrasGridHeaderStyle *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  VideosExtrasGridSectionHeaderStyle *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 160.0, 160.0);
  v5 = *MEMORY[0x1E0DC4A98];
  objc_msgSend(a1, "_fontAttributesForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleDefaultFontAttributes:](v4, "setTitleDefaultFontAttributes:", v6);

  -[VideosExtrasGridCellStyle setTitleFirstBaselineHeight:](v4, "setTitleFirstBaselineHeight:", 20.0);
  -[VideosExtrasGridCellStyle setTitleTextStyle:](v4, "setTitleTextStyle:", v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleTextColor:](v4, "setTitleTextColor:", v7);

  -[VideosExtrasGridCellStyle setTextFirstBaselineToBottom:](v4, "setTextFirstBaselineToBottom:", 35.0);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setSubtitleDefaultFontAttributes:](v4, "setSubtitleDefaultFontAttributes:", v8);

  -[VideosExtrasGridCellStyle setSubtitleTextStyle:](v4, "setSubtitleTextStyle:", v5);
  -[VideosExtrasGridCellStyle setSubtitleFirstBaselineHeight:](v4, "setSubtitleFirstBaselineHeight:", 18.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setSubtitleTextColor:](v4, "setSubtitleTextColor:", v9);

  -[VideosExtrasGridCellStyle setDefaultTextAlignment:](v4, "setDefaultTextAlignment:", 1);
  -[VideosExtrasGridViewControllerStyle setDefaultCellStyle:](v3, "setDefaultCellStyle:", v4);
  -[VideosExtrasGridViewControllerStyle setImageCellStyle:](v3, "setImageCellStyle:", v4);
  v10 = (void *)-[VideosExtrasGridCellStyle copy](v4, "copy");
  objc_msgSend(v10, "setImageSize:", 160.0, 90.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellStyle:](v3, "setVideoCellStyle:", v10);
  v11 = (void *)-[VideosExtrasGridCellStyle copy](v4, "copy");
  objc_msgSend(v11, "setImageSize:", 160.0, 170.0);
  -[VideosExtrasGridViewControllerStyle setProductCellStyle:](v3, "setProductCellStyle:", v11);
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v12 = objc_alloc_init(VideosExtrasGridHeaderStyle);
  -[VideosExtrasGridHeaderStyle setInsets:](v12, "setInsets:", 15.0, 0.0, 0.0, 0.0);
  v13 = *MEMORY[0x1E0DC4A90];
  -[VideosExtrasGridHeaderStyle setTitleTextStyle:](v12, "setTitleTextStyle:", *MEMORY[0x1E0DC4A90]);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridHeaderStyle setTitleDefaultFontAttributes:](v12, "setTitleDefaultFontAttributes:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridHeaderStyle setTitleColor:](v12, "setTitleColor:", v15);

  v16 = *MEMORY[0x1E0DC4B10];
  -[VideosExtrasGridHeaderStyle setSubtitleTextStyle:](v12, "setSubtitleTextStyle:", *MEMORY[0x1E0DC4B10]);
  -[VideosExtrasGridHeaderStyle setSubtitleLineHeight:](v12, "setSubtitleLineHeight:", 25.0);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridHeaderStyle setSubtitleDefaultFontAttributes:](v12, "setSubtitleDefaultFontAttributes:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridHeaderStyle setSubtitleColor:](v12, "setSubtitleColor:", v18);

  -[VideosExtrasGridHeaderStyle setBottomLabelDescender:](v12, "setBottomLabelDescender:", 15.0);
  -[VideosExtrasGridViewControllerStyle setHeaderStyle:](v3, "setHeaderStyle:", v12);
  v19 = *MEMORY[0x1E0DC4AB8];
  -[VideosExtrasGridViewControllerStyle setDetailTextStyle:](v3, "setDetailTextStyle:", *MEMORY[0x1E0DC4AB8]);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setDetailDefaultFontAttributes:](v3, "setDetailDefaultFontAttributes:", v20);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setDetailTextColor:](v3, "setDetailTextColor:", v21);

  -[VideosExtrasGridViewControllerStyle setDetailInsets:](v3, "setDetailInsets:", 23.0, 10.0, 10.0, 10.0);
  v22 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  -[VideosExtrasGridSectionHeaderStyle setTextStyle:](v22, "setTextStyle:", v16);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridSectionHeaderStyle setDefaultFontAttributes:](v22, "setDefaultFontAttributes:", v23);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridSectionHeaderStyle setTextColor:](v22, "setTextColor:", v24);

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v22, "setInsets:", 10.0, 10.0, 5.0, 10.0);
  -[VideosExtrasGridViewControllerStyle setSectionHeaderStyle:](v3, "setSectionHeaderStyle:", v22);
  -[VideosExtrasGridViewControllerStyle setDefaultSpacing:](v3, "setDefaultSpacing:", 20.0);
  -[VideosExtrasGridViewControllerStyle setImageSpacing:](v3, "setImageSpacing:", 20.0);
  -[VideosExtrasGridViewControllerStyle setVideoSpacing:](v3, "setVideoSpacing:", 20.0);
  -[VideosExtrasGridViewControllerStyle setProductSpacing:](v3, "setProductSpacing:", 20.0);
  -[VideosExtrasGridViewControllerStyle setCellLineSpacing:](v3, "setCellLineSpacing:", 0.0);
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", 20.0, 0.0, 0.0, 0.0);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", 20.0, 0.0, 0.0, 0.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", 20.0, 0.0, 0.0, 0.0);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", 20.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setBackgroundColor:](v3, "setBackgroundColor:", v25);

  -[VideosExtrasGridViewControllerStyle setShowsScrollFade:](v3, "setShowsScrollFade:", 1);
  -[VideosExtrasGridViewControllerStyle setAdjustsContentInsetByBottomNavBar:](v3, "setAdjustsContentInsetByBottomNavBar:", 1);

  return v3;
}

+ (id)smallDetailStyle
{
  VideosExtrasGridViewControllerStyle *v3;
  VideosExtrasGridCellStyle *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  VideosExtrasGridHeaderStyle *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  VideosExtrasGridSectionHeaderStyle *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 90.0, 90.0);
  -[VideosExtrasGridCellStyle setTitleFirstBaselineHeight:](v4, "setTitleFirstBaselineHeight:", 18.0);
  v5 = *MEMORY[0x1E0DC4AA0];
  -[VideosExtrasGridCellStyle setTitleTextStyle:](v4, "setTitleTextStyle:", *MEMORY[0x1E0DC4AA0]);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleDefaultFontAttributes:](v4, "setTitleDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleTextColor:](v4, "setTitleTextColor:", v7);

  -[VideosExtrasGridCellStyle setTextFirstBaselineToBottom:](v4, "setTextFirstBaselineToBottom:", 30.0);
  -[VideosExtrasGridCellStyle setSubtitleDefaultFontAttributes:](v4, "setSubtitleDefaultFontAttributes:", v6);
  v8 = *MEMORY[0x1E0DC4A98];
  -[VideosExtrasGridCellStyle setSubtitleTextStyle:](v4, "setSubtitleTextStyle:", *MEMORY[0x1E0DC4A98]);
  -[VideosExtrasGridCellStyle setSubtitleFirstBaselineHeight:](v4, "setSubtitleFirstBaselineHeight:", 18.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setSubtitleTextColor:](v4, "setSubtitleTextColor:", v9);

  -[VideosExtrasGridCellStyle setDefaultTextAlignment:](v4, "setDefaultTextAlignment:", 1);
  -[VideosExtrasGridViewControllerStyle setDefaultCellStyle:](v3, "setDefaultCellStyle:", v4);
  -[VideosExtrasGridViewControllerStyle setImageCellStyle:](v3, "setImageCellStyle:", v4);
  -[VideosExtrasGridViewControllerStyle setProductCellStyle:](v3, "setProductCellStyle:", v4);
  v10 = (void *)-[VideosExtrasGridCellStyle copy](v4, "copy");
  objc_msgSend(v10, "setImageSize:", 125.0, 70.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellStyle:](v3, "setVideoCellStyle:", v10);
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v11 = objc_alloc_init(VideosExtrasGridHeaderStyle);
  -[VideosExtrasGridHeaderStyle setShowsImage:](v11, "setShowsImage:", 1);
  -[VideosExtrasGridHeaderStyle setInsets:](v11, "setInsets:", 15.0, 34.0, 0.0, 34.0);
  -[VideosExtrasGridHeaderStyle setTitleTextStyle:](v11, "setTitleTextStyle:", *MEMORY[0x1E0DC4A90]);
  -[VideosExtrasGridHeaderStyle setTitleLineHeight:](v11, "setTitleLineHeight:", 21.0);
  -[VideosExtrasGridHeaderStyle setTitleDefaultFontAttributes:](v11, "setTitleDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridHeaderStyle setTitleColor:](v11, "setTitleColor:", v12);

  v13 = *MEMORY[0x1E0DC4B10];
  -[VideosExtrasGridHeaderStyle setSubtitleTextStyle:](v11, "setSubtitleTextStyle:", *MEMORY[0x1E0DC4B10]);
  -[VideosExtrasGridHeaderStyle setSubtitleLineHeight:](v11, "setSubtitleLineHeight:", 20.0);
  -[VideosExtrasGridHeaderStyle setSubtitleDefaultFontAttributes:](v11, "setSubtitleDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridHeaderStyle setSubtitleColor:](v11, "setSubtitleColor:", v14);

  -[VideosExtrasGridHeaderStyle setBottomLabelDescender:](v11, "setBottomLabelDescender:", 9.0);
  -[VideosExtrasGridViewControllerStyle setHeaderStyle:](v3, "setHeaderStyle:", v11);
  -[VideosExtrasGridViewControllerStyle setDetailTextStyle:](v3, "setDetailTextStyle:", v8);
  -[VideosExtrasGridViewControllerStyle setDetailDefaultFontAttributes:](v3, "setDetailDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setDetailTextColor:](v3, "setDetailTextColor:", v15);

  -[VideosExtrasGridViewControllerStyle setDetailInsets:](v3, "setDetailInsets:", 15.0, 34.0, 20.0, 34.0);
  v16 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  -[VideosExtrasGridSectionHeaderStyle setTextStyle:](v16, "setTextStyle:", v13);
  -[VideosExtrasGridSectionHeaderStyle setDefaultFontAttributes:](v16, "setDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridSectionHeaderStyle setTextColor:](v16, "setTextColor:", v17);

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v16, "setInsets:", 20.0, 34.0, 5.0, 34.0);
  -[VideosExtrasGridViewControllerStyle setSectionHeaderStyle:](v3, "setSectionHeaderStyle:", v16);
  -[VideosExtrasGridViewControllerStyle setDefaultSpacing:](v3, "setDefaultSpacing:", 10.0);
  -[VideosExtrasGridViewControllerStyle setImageSpacing:](v3, "setImageSpacing:", 7.0);
  -[VideosExtrasGridViewControllerStyle setVideoSpacing:](v3, "setVideoSpacing:", 18.0);
  -[VideosExtrasGridViewControllerStyle setProductSpacing:](v3, "setProductSpacing:", 10.0);
  -[VideosExtrasGridViewControllerStyle setCellLineSpacing:](v3, "setCellLineSpacing:", 0.0);
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", 15.0, 35.0, 0.0, 35.0);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", 15.0, 46.0, 0.0, 46.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", 15.0, 34.0, 0.0, 34.0);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", 15.0, 35.0, 0.0, 35.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setBackgroundColor:](v3, "setBackgroundColor:", v18);

  -[VideosExtrasGridViewControllerStyle setShowsScrollFade:](v3, "setShowsScrollFade:", 1);
  -[VideosExtrasGridViewControllerStyle setAdjustsContentInsetByBottomNavBar:](v3, "setAdjustsContentInsetByBottomNavBar:", 1);

  return v3;
}

+ (id)mediumDetailStyle
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "smallDetailStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDetailInsets:", 15.0, 78.0, 20.0, 78.0);
  objc_msgSend(v2, "headerStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInsets:", 15.0, 78.0, 0.0, 78.0);

  objc_msgSend(v2, "setDefaultCellSectionInsets:", 15.0, 79.0, 0.0, 79.0);
  objc_msgSend(v2, "setImageCellSectionInsets:", 15.0, 89.0, 0.0, 89.0);
  objc_msgSend(v2, "setVideoCellSectionInsets:", 15.0, 78.0, 0.0, 78.0);
  objc_msgSend(v2, "setProductCellSectionInsets:", 15.0, 79.0, 0.0, 79.0);
  return v2;
}

+ (id)largeDetailStyle
{
  void *v2;

  objc_msgSend(a1, "mediumDetailStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultSpacing:", 14.0);
  objc_msgSend(v2, "setImageSpacing:", 7.0);
  objc_msgSend(v2, "setVideoSpacing:", 28.0);
  objc_msgSend(v2, "setProductSpacing:", 14.0);
  return v2;
}

+ (id)extraLargeDetailStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "smallDetailStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultCellStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageSize:", 90.0, 90.0);

  objc_msgSend(v2, "imageCellStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageSize:", 90.0, 90.0);

  objc_msgSend(v2, "videoCellStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSize:", 150.0, 84.0);

  objc_msgSend(v2, "productCellStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageSize:", 100.0, 100.0);

  objc_msgSend(v2, "setDetailInsets:", 15.0, 100.0, 20.0, 100.0);
  objc_msgSend(v2, "headerStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInsets:", 15.0, 100.0, 0.0, 100.0);

  objc_msgSend(v2, "setDefaultCellSectionInsets:", 15.0, 107.0, 0.0, 107.0);
  objc_msgSend(v2, "setImageCellSectionInsets:", 15.0, 100.0, 0.0, 100.0);
  objc_msgSend(v2, "setVideoCellSectionInsets:", 15.0, 107.0, 0.0, 107.0);
  objc_msgSend(v2, "setProductCellSectionInsets:", 15.0, 107.0, 0.0, 107.0);
  objc_msgSend(v2, "setDefaultSpacing:", 7.0);
  objc_msgSend(v2, "setImageSpacing:", 7.0);
  objc_msgSend(v2, "setVideoSpacing:", 7.0);
  objc_msgSend(v2, "setProductSpacing:", 7.0);
  return v2;
}

+ (id)wideStackGridStyle
{
  VideosExtrasGridViewControllerStyle *v3;
  VideosExtrasGridCellStyle *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VideosExtrasGridSectionHeaderStyle *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 114.0, 170.0);
  -[VideosExtrasGridCellStyle setTitleFirstBaselineHeight:](v4, "setTitleFirstBaselineHeight:", 20.0);
  v5 = *MEMORY[0x1E0DC4A98];
  -[VideosExtrasGridCellStyle setTitleTextStyle:](v4, "setTitleTextStyle:", *MEMORY[0x1E0DC4A98]);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleDefaultFontAttributes:](v4, "setTitleDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleTextColor:](v4, "setTitleTextColor:", v7);

  -[VideosExtrasGridCellStyle setTextFirstBaselineToBottom:](v4, "setTextFirstBaselineToBottom:", 27.0);
  -[VideosExtrasGridCellStyle setTextLastBaselineToBottom:](v4, "setTextLastBaselineToBottom:", 10.0);
  -[VideosExtrasGridCellStyle setSubtitleDefaultFontAttributes:](v4, "setSubtitleDefaultFontAttributes:", v6);
  -[VideosExtrasGridCellStyle setSubtitleFirstBaselineHeight:](v4, "setSubtitleFirstBaselineHeight:", 18.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setSubtitleTextColor:](v4, "setSubtitleTextColor:", v8);

  -[VideosExtrasGridCellStyle setSubtitleTextStyle:](v4, "setSubtitleTextStyle:", v5);
  -[VideosExtrasGridCellStyle setDefaultTextAlignment:](v4, "setDefaultTextAlignment:", 1);
  -[VideosExtrasGridViewControllerStyle setDefaultCellStyle:](v3, "setDefaultCellStyle:", v4);
  -[VideosExtrasGridViewControllerStyle setProductCellStyle:](v3, "setProductCellStyle:", v4);
  v9 = (void *)-[VideosExtrasGridCellStyle copy](v4, "copy");
  objc_msgSend(v9, "setImageSize:", 170.0, 170.0);
  -[VideosExtrasGridViewControllerStyle setImageCellStyle:](v3, "setImageCellStyle:", v9);
  v10 = (void *)-[VideosExtrasGridCellStyle copy](v4, "copy");
  objc_msgSend(v10, "setImageSize:", 252.0, 126.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellStyle:](v3, "setVideoCellStyle:", v10);
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", 0.0, 20.0, 0.0, 20.0);
  v11 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  -[VideosExtrasGridSectionHeaderStyle setTextStyle:](v11, "setTextStyle:", *MEMORY[0x1E0DC4B10]);
  -[VideosExtrasGridSectionHeaderStyle setDefaultFontAttributes:](v11, "setDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridSectionHeaderStyle setTextColor:](v11, "setTextColor:", v12);

  UIEdgeInsetsMakeWithEdges();
  -[VideosExtrasGridSectionHeaderStyle setInsets:](v11, "setInsets:");
  -[VideosExtrasGridSectionHeaderStyle setTextBaselineDescender:](v11, "setTextBaselineDescender:", 15.0);
  -[VideosExtrasGridSectionHeaderStyle setTextBaselineHeight:](v11, "setTextBaselineHeight:", 25.0);
  -[VideosExtrasGridViewControllerStyle setSectionHeaderStyle:](v3, "setSectionHeaderStyle:", v11);
  -[VideosExtrasGridViewControllerStyle setDefaultSpacing:](v3, "setDefaultSpacing:", 40.0);
  -[VideosExtrasGridViewControllerStyle setProductSpacing:](v3, "setProductSpacing:", 40.0);
  -[VideosExtrasGridViewControllerStyle setImageSpacing:](v3, "setImageSpacing:", 50.0);
  -[VideosExtrasGridViewControllerStyle setVideoSpacing:](v3, "setVideoSpacing:", 50.0);
  v13 = *MEMORY[0x1E0DC49E8];
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", *MEMORY[0x1E0DC49E8], v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setCellLineSpacing:](v3, "setCellLineSpacing:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setBackgroundColor:](v3, "setBackgroundColor:", v17);

  -[VideosExtrasGridViewControllerStyle setShowsScrollFade:](v3, "setShowsScrollFade:", 0);
  -[VideosExtrasGridViewControllerStyle setAdjustsContentInsetByBottomNavBar:](v3, "setAdjustsContentInsetByBottomNavBar:", 0);

  return v3;
}

+ (id)smallStackGridStyle
{
  VideosExtrasGridViewControllerStyle *v3;
  VideosExtrasGridCellStyle *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VideosExtrasGridSectionHeaderStyle *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 80.0, 120.0);
  -[VideosExtrasGridCellStyle setTitleFirstBaselineHeight:](v4, "setTitleFirstBaselineHeight:", 20.0);
  v5 = *MEMORY[0x1E0DC4AA0];
  -[VideosExtrasGridCellStyle setTitleTextStyle:](v4, "setTitleTextStyle:", *MEMORY[0x1E0DC4AA0]);
  objc_msgSend(a1, "_fontAttributesForTextStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleDefaultFontAttributes:](v4, "setTitleDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setTitleTextColor:](v4, "setTitleTextColor:", v7);

  -[VideosExtrasGridCellStyle setTextFirstBaselineToBottom:](v4, "setTextFirstBaselineToBottom:", 30.0);
  -[VideosExtrasGridCellStyle setSubtitleDefaultFontAttributes:](v4, "setSubtitleDefaultFontAttributes:", v6);
  -[VideosExtrasGridCellStyle setSubtitleFirstBaselineHeight:](v4, "setSubtitleFirstBaselineHeight:", 18.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridCellStyle setSubtitleTextColor:](v4, "setSubtitleTextColor:", v8);

  -[VideosExtrasGridCellStyle setSubtitleTextStyle:](v4, "setSubtitleTextStyle:", *MEMORY[0x1E0DC4A98]);
  -[VideosExtrasGridCellStyle setDefaultTextAlignment:](v4, "setDefaultTextAlignment:", 1);
  -[VideosExtrasGridViewControllerStyle setDefaultCellStyle:](v3, "setDefaultCellStyle:", v4);
  -[VideosExtrasGridViewControllerStyle setProductCellStyle:](v3, "setProductCellStyle:", v4);
  v9 = (void *)-[VideosExtrasGridCellStyle copy](v4, "copy");
  objc_msgSend(v9, "setImageSize:", 120.0, 120.0);
  -[VideosExtrasGridViewControllerStyle setImageCellStyle:](v3, "setImageCellStyle:", v9);
  v10 = (void *)-[VideosExtrasGridCellStyle copy](v4, "copy");
  objc_msgSend(v10, "setImageSize:", 125.0, 70.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellStyle:](v3, "setVideoCellStyle:", v10);
  v11 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  -[VideosExtrasGridSectionHeaderStyle setTextStyle:](v11, "setTextStyle:", *MEMORY[0x1E0DC4B10]);
  -[VideosExtrasGridSectionHeaderStyle setDefaultFontAttributes:](v11, "setDefaultFontAttributes:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridSectionHeaderStyle setTextColor:](v11, "setTextColor:", v12);

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v11, "setInsets:", 20.0, 15.0, 5.0, 15.0);
  -[VideosExtrasGridViewControllerStyle setSectionHeaderStyle:](v3, "setSectionHeaderStyle:", v11);
  -[VideosExtrasGridViewControllerStyle setDefaultSpacing:](v3, "setDefaultSpacing:", 25.0);
  -[VideosExtrasGridViewControllerStyle setImageSpacing:](v3, "setImageSpacing:", 25.0);
  -[VideosExtrasGridViewControllerStyle setVideoSpacing:](v3, "setVideoSpacing:", 20.0);
  -[VideosExtrasGridViewControllerStyle setProductSpacing:](v3, "setProductSpacing:", 25.0);
  -[VideosExtrasGridViewControllerStyle setCellLineSpacing:](v3, "setCellLineSpacing:", 0.0);
  v13 = *MEMORY[0x1E0DC49E8];
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", *MEMORY[0x1E0DC49E8], v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", v13, v14, v15, v16);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasGridViewControllerStyle setBackgroundColor:](v3, "setBackgroundColor:", v17);

  -[VideosExtrasGridViewControllerStyle setShowsScrollFade:](v3, "setShowsScrollFade:", 0);
  -[VideosExtrasGridViewControllerStyle setAdjustsContentInsetByBottomNavBar:](v3, "setAdjustsContentInsetByBottomNavBar:", 0);
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", 0.0, 15.0, 0.0, 15.0);

  return v3;
}

+ (id)mediumStackGridStyle
{
  void *v2;

  objc_msgSend(a1, "smallStackGridStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultSpacing:", 25.0);
  objc_msgSend(v2, "setImageSpacing:", 30.0);
  objc_msgSend(v2, "setVideoSpacing:", 30.0);
  objc_msgSend(v2, "setProductSpacing:", 25.0);
  return v2;
}

+ (id)largeStackGridStyle
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "mediumStackGridStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoCellStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageSize:", 150.0, 85.0);

  objc_msgSend(v2, "setImageSpacing:", 25.0);
  objc_msgSend(v2, "setVideoSpacing:", 25.0);
  return v2;
}

+ (id)extraLargeStackGridStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "largeStackGridStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultCellStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageSize:", 160.0, 160.0);

  objc_msgSend(v2, "imageCellStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageSize:", 160.0, 160.0);

  objc_msgSend(v2, "videoCellStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSize:", 160.0, 90.0);

  objc_msgSend(v2, "productCellStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageSize:", 106.0, 160.0);

  objc_msgSend(v2, "setDefaultSpacing:", 50.0);
  objc_msgSend(v2, "setImageSpacing:", 50.0);
  objc_msgSend(v2, "setVideoSpacing:", 50.0);
  objc_msgSend(v2, "setProductSpacing:", 30.0);
  return v2;
}

- (VideosExtrasGridViewControllerStyle)smallStyle
{
  return self->_smallStyle;
}

- (void)setSmallStyle:(id)a3
{
  objc_storeStrong((id *)&self->_smallStyle, a3);
}

- (VideosExtrasGridViewControllerStyle)mediumStyle
{
  return self->_mediumStyle;
}

- (void)setMediumStyle:(id)a3
{
  objc_storeStrong((id *)&self->_mediumStyle, a3);
}

- (VideosExtrasGridViewControllerStyle)largeStyle
{
  return self->_largeStyle;
}

- (void)setLargeStyle:(id)a3
{
  objc_storeStrong((id *)&self->_largeStyle, a3);
}

- (VideosExtrasGridViewControllerStyle)extraLargeStyle
{
  return self->_extraLargeStyle;
}

- (void)setExtraLargeStyle:(id)a3
{
  objc_storeStrong((id *)&self->_extraLargeStyle, a3);
}

- (VideosExtrasGridViewControllerStyle)wideStyle
{
  return self->_wideStyle;
}

- (void)setWideStyle:(id)a3
{
  objc_storeStrong((id *)&self->_wideStyle, a3);
}

- (BOOL)isShelfStyle
{
  return self->_shelfStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wideStyle, 0);
  objc_storeStrong((id *)&self->_extraLargeStyle, 0);
  objc_storeStrong((id *)&self->_largeStyle, 0);
  objc_storeStrong((id *)&self->_mediumStyle, 0);
  objc_storeStrong((id *)&self->_smallStyle, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_headerViewConstraints, 0);
  objc_storeStrong((id *)&self->_titleRuleConstraints, 0);
  objc_storeStrong((id *)&self->_titleRule, 0);
}

@end
