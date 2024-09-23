@implementation BSUIScreenshotCollectionViewFlowLayout

- (BSUIScreenshotCollectionViewFlowLayout)init
{
  BSUIScreenshotCollectionViewFlowLayout *v2;
  BSUIScreenshotCollectionViewFlowLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
  v2 = -[BSUIScreenshotCollectionViewFlowLayout init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BSUIScreenshotCollectionViewFlowLayout setScrollDirection:](v2, "setScrollDirection:", 1);
  return v3;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
  -[BSUIScreenshotCollectionViewFlowLayout prepareLayout](&v7, "prepareLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "panGestureRecognizer"));
  objc_msgSend(v4, "removeTarget:action:", self, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "panGestureRecognizer"));
  objc_msgSend(v6, "addTarget:action:", self, "_panGestureRecognized:");

}

- (void)prepareForTransitionToLayout:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
  -[BSUIScreenshotCollectionViewFlowLayout prepareForTransitionToLayout:](&v6, "prepareForTransitionToLayout:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "panGestureRecognizer"));
  objc_msgSend(v5, "removeTarget:action:", self, 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "panGestureRecognizer"));
  objc_msgSend(v4, "removeTarget:action:", self, 0);

  v5.receiver = self;
  v5.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
  -[BSUIScreenshotCollectionViewFlowLayout dealloc](&v5, "dealloc");
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  char *v17;
  double v18;
  void *v19;
  void *v20;
  double Width;
  double v22;
  double v23;
  double v24;
  NSIndexPath *indexPathAtInitialScroll;
  uint64_t v26;
  void *v27;
  char *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  objc_super v52;
  objc_super v53;
  CGPoint result;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
  objc_msgSend(v9, "bounds");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:"));

  if (objc_msgSend(v10, "count"))
  {
    v52.receiver = self;
    v52.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
    -[BSUIScreenshotCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v52, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", v7, v6, x, y);
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
    objc_msgSend(v13, "frame");
    v14 = v7 + CGRectGetWidth(v55);
    -[BSUIScreenshotCollectionViewFlowLayout collectionViewContentSize](self, "collectionViewContentSize");
    v16 = v15;

    if (v14 <= v16)
    {
      v17 = 0;
      if (v7 > 0.0)
      {
        v18 = 0.0;
        while (1)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v17, 0));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v19));

          objc_msgSend(v20, "bounds");
          Width = CGRectGetWidth(v56);
          if (v18 + Width * 0.5 >= v7)
            break;
          -[BSUIScreenshotCollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
          v18 = v18 + Width + v22;
          ++v17;

          if (v18 >= v7)
            goto LABEL_10;
        }

      }
LABEL_10:
      indexPathAtInitialScroll = self->_indexPathAtInitialScroll;
      v51 = v12;
      if (indexPathAtInitialScroll && (char *)-[NSIndexPath item](indexPathAtInitialScroll, "item") == v17)
      {
        if (x >= 0.0)
        {
          if (x > 0.0)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
            v28 = (char *)objc_msgSend(v27, "numberOfItemsInSection:", 0) - 1;

            if ((uint64_t)v28 >= (uint64_t)(v17 + 1))
              ++v17;
            else
              v17 = v28;
          }
        }
        else
        {
          if ((uint64_t)v17 <= 1)
            v26 = 1;
          else
            v26 = (uint64_t)v17;
          v17 = (char *)(v26 - 1);
        }
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v17, 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v29));

      objc_msgSend(v30, "frame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
      objc_msgSend(v39, "bounds");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;

      v57.origin.x = v41;
      v57.origin.y = v43;
      v57.size.width = v45;
      v57.size.height = v47;
      v48 = CGRectGetWidth(v57);
      v58.origin.x = v32;
      v58.origin.y = v34;
      v58.size.width = v36;
      v58.size.height = v38;
      v7 = v32 + (v48 - CGRectGetWidth(v58)) * -0.5;

      v12 = v51;
    }
  }
  else
  {
    v53.receiver = self;
    v53.super_class = (Class)BSUIScreenshotCollectionViewFlowLayout;
    -[BSUIScreenshotCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v53, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", v7, v6, x, y);
    v7 = v23;
    v12 = v24;
  }

  v49 = v7;
  v50 = v12;
  result.y = v50;
  result.x = v49;
  return result;
}

- (void)_panGestureRecognized:(id)a3
{
  void *v4;
  double MidX;
  void *v6;
  id v7;
  NSIndexPath *v8;
  NSIndexPath *indexPathAtInitialScroll;
  id v10;
  CGRect v11;
  CGRect v12;

  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 1)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
    objc_msgSend(v4, "bounds");
    MidX = CGRectGetMidX(v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotCollectionViewFlowLayout collectionView](self, "collectionView"));
    objc_msgSend(v6, "bounds");
    v7 = objc_msgSend(v10, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v12));
    v8 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(v7);
    indexPathAtInitialScroll = self->_indexPathAtInitialScroll;
    self->_indexPathAtInitialScroll = v8;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathAtInitialScroll, 0);
}

@end
