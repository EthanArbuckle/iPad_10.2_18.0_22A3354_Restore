@implementation _UIFocusCollectionViewSectionContainerGuide

- (_UIFocusCollectionViewSectionContainerGuide)initWithCollectionView:(id)a3
{
  id v4;
  _UIFocusCollectionViewSectionContainerGuide *v5;
  _UIFocusCollectionViewSectionContainerGuide *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusCollectionViewSectionContainerGuide;
  v5 = -[UIFocusContainerGuide init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_collectionView, v4);

  return v6;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4;
  _UIFocusCollectionViewSectionContainerGuideRegion *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _UIFocusCollectionViewSectionContainerGuideRegion *v20;

  v4 = a3;
  v5 = [_UIFocusCollectionViewSectionContainerGuideRegion alloc];
  -[UILayoutGuide layoutFrame](self, "layoutFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UILayoutGuide owningView](self, "owningView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[_UIFocusGuideRegion initWithFrame:coordinateSpace:](v5, "initWithFrame:coordinateSpace:", v15, v7, v9, v11, v13);

  -[_UIFocusGuideRegion setDelegate:](v20, "setDelegate:", self);
  -[UILayoutGuide owningView](self, "owningView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide owningView](self, "owningView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v16, (uint64_t)v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusContainerGuideRegion setContentFocusRegionContainer:](v20, "setContentFocusRegionContainer:", v18);

  -[_UIFocusCollectionViewSectionContainerGuide collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusCollectionViewSectionContainerGuideRegion setCollectionView:](v20, "setCollectionView:", v19);

  -[_UIFocusCollectionViewSectionContainerGuideRegion setSection:](v20, "setSection:", -[_UIFocusCollectionViewSectionContainerGuide section](self, "section"));
  -[UILayoutGuide layoutFrame](self, "layoutFrame");
  -[_UIFocusCollectionViewSectionContainerGuideRegion setSectionFrame:](v20, "setSectionFrame:");
  objc_msgSend(v4, "addRegion:", v20);

}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
