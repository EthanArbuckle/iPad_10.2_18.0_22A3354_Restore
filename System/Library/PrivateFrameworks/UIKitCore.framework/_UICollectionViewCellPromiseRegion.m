@implementation _UICollectionViewCellPromiseRegion

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewCellPromiseRegion layoutAttributes](self, "layoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewCellPromiseRegion layoutAttributes](self, "layoutAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  NSStringFromCGRect(v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewCellPromiseRegion collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewCellPromiseRegion collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; Represents index path %@ with frame %@ in %@: %p>"),
    v5,
    self,
    v7,
    v9,
    v12,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)_focusRegionFocusSystem
{
  void *v2;
  void *v3;

  -[_UICollectionViewCellPromiseRegion collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)_focusRegionFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
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
  CGRect result;

  -[_UICollectionViewCellPromiseRegion parentScrollView](self, "parentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewCellPromiseRegion layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "convertRect:toView:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return 0;
}

- (BOOL)_isPromiseFocusRegion
{
  return 1;
}

- (id)_fulfillPromisedFocusRegion
{
  void *v3;
  void *v4;

  -[_UICollectionViewCellPromiseRegion collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fulfillPromisedFocusRegionForCell:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isTransparentFocusRegion
{
  return 0;
}

- (id)_focusRegionView
{
  return 0;
}

- (id)_focusRegionGuides
{
  return 0;
}

- (id)_focusDebugOverlayParentView
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGRect)frame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[_UICollectionViewCellPromiseRegion layoutAttributes](self, "layoutAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 1;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (void)updateFocusIfNeeded
{
  id v2;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[_UICollectionViewCellPromiseRegion _fulfillPromisedFocusRegion](self, "_fulfillPromisedFocusRegion", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (UICoordinateSpace)coordinateSpace
{
  void *v2;
  void *v3;

  -[_UICollectionViewCellPromiseRegion parentScrollView](self, "parentScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICoordinateSpace *)v3;
}

- (BOOL)_isLazyFocusItemContainer
{
  return 1;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[_UICollectionViewCellPromiseRegion collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createPromiseRegion
{
  _UIFocusPromiseRegion *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _UIFocusPromiseRegion *v16;
  _QWORD v18[5];

  v3 = [_UIFocusPromiseRegion alloc];
  -[_UICollectionViewCellPromiseRegion layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_UICollectionViewCellPromiseRegion parentScrollView](self, "parentScrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewCellPromiseRegion layoutAttributes](self, "layoutAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_UIFocusPromiseRegion initWithFrame:coordinateSpace:identifier:](v3, "initWithFrame:coordinateSpace:identifier:", v13, v15, v6, v8, v10, v12);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57___UICollectionViewCellPromiseRegion_createPromiseRegion__block_invoke;
  v18[3] = &unk_1E16BDB20;
  v18[4] = self;
  -[_UIFocusPromiseRegion setContentFulfillmentHandler:](v16, "setContentFulfillmentHandler:", v18);
  return v16;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UICollectionViewCellPromiseRegion createPromiseRegion](self, "createPromiseRegion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addRegion:", v5);

}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (UIScrollView)parentScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_parentScrollView);
}

- (void)setParentScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_parentScrollView, a3);
}

- (UICollectionViewLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_layoutAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_destroyWeak((id *)&self->_parentScrollView);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
