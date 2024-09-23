@implementation _MFConversationViewCollectionView

- (NSDirectionalEdgeInsets)_updateLayoutMarginsForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
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
  double v24;
  double v25;
  double v26;
  double v27;
  NSDirectionalEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MFConversationViewCollectionView delegate](self, "delegate"));
  objc_msgSend(v8, "layoutMarginsForCollectionViewFrame:", x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[_MFConversationViewCollectionView directionalLayoutMargins](self, "directionalLayoutMargins");
  if (v12 != v20 || v10 != v17 || v16 != v19 || v14 != v18)
  {
    -[_MFConversationViewCollectionView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v10, v12, v14, v16);
    objc_msgSend(v8, "collectionViewMarginsDidChange:", v10, v12, v14, v16);
  }

  v24 = v10;
  v25 = v12;
  v26 = v14;
  v27 = v16;
  result.trailing = v27;
  result.bottom = v26;
  result.leading = v25;
  result.top = v24;
  return result;
}

- (NSDirectionalEdgeInsets)updateLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  -[_MFConversationViewCollectionView frame](self, "frame");
  -[_MFConversationViewCollectionView _updateLayoutMarginsForFrame:](self, "_updateLayoutMarginsForFrame:");
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_MFConversationViewCollectionView frame](self, "frame");
  v8 = CGRectGetWidth(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v9 = v8 - CGRectGetWidth(v13);
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 >= 2.22044605e-16)
  {
    -[_MFConversationViewCollectionView _updateLayoutMarginsForFrame:](self, "_updateLayoutMarginsForFrame:", x, y, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MFConversationViewCollectionView collectionViewLayout](self, "collectionViewLayout"));
    objc_msgSend(v10, "invalidateLayout");

  }
  v11.receiver = self;
  v11.super_class = (Class)_MFConversationViewCollectionView;
  -[_MFConversationViewCollectionView setFrame:](&v11, "setFrame:", x, y, width, height);
  -[_MFConversationViewCollectionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailConversationViewCollection);
}

@end
