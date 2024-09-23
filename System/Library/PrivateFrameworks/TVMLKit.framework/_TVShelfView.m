@implementation _TVShelfView

- (_TVShelfView)initWithFrame:(CGRect)a3 shelfViewLayout:(id)a4
{
  _TVShelfView *v4;
  _TVShelfView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVShelfView;
  v4 = -[_TVCollectionView initWithFrame:collectionViewLayout:](&v7, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    commonInit(v4);
  return v5;
}

- (_TVShelfView)initWithCoder:(id)a3
{
  _TVShelfView *v3;
  _TVShelfView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVShelfView;
  v3 = -[_TVShelfView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit(v3);
  return v4;
}

- (_TVShelfView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  -[_TVShelfView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (_TVShelfView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TVShelfViewLayout *v8;
  _TVShelfView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(_TVShelfViewLayout);
  v9 = -[_TVShelfView initWithFrame:shelfViewLayout:](self, "initWithFrame:shelfViewLayout:", v8, x, y, width, height);

  return v9;
}

- (_TVShelfView)init
{
  return -[_TVShelfView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_TVShelfView contentInset](self, "contentInset");
  -[_TVShelfView tv_sizeThatFits:withContentInset:](self, "tv_sizeThatFits:withContentInset:", width, height, v6, v7, v8, v9);
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4
{
  double bottom;
  double top;
  CGFloat width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  bottom = a4.bottom;
  top = a4.top;
  width = a3.width;
  -[_TVShelfView collectionViewLayout](self, "collectionViewLayout", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "computedContentHeight");
  v9 = bottom + top + v8;

  v10 = width;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_updateLayoutForFocusedView:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  TVShelfViewLayoutInvalidationContext *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _BOOL8 v34;
  double v35;
  TVShelfViewLayoutInvalidationContext *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v38 = v6;
  if (objc_msgSend(v6, "isDescendantOfView:", self))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[_TVShelfView indexPathsForVisibleItems](self, "indexPathsForVisibleItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          -[_TVShelfView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "isDescendantOfView:", v14))
          {
            v15 = v13;

            goto LABEL_13;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v10)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_13:

  }
  else
  {
    v15 = 0;
  }
  v16 = objc_alloc_init(TVShelfViewLayoutInvalidationContext);
  -[TVShelfViewLayoutInvalidationContext setInvalidateVerticalBumps:](v16, "setInvalidateVerticalBumps:", 1);
  v37 = v15;
  -[TVShelfViewLayoutInvalidationContext setFocusedItemIndexPath:](v16, "setFocusedItemIndexPath:", v15);
  -[_TVShelfView collectionViewLayout](self, "collectionViewLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v16;
  objc_msgSend(v17, "invalidateLayoutWithContext:", v16);

  -[_TVShelfView indexPathsForVisibleSupplementaryElementsOfKind:](self, "indexPathsForVisibleSupplementaryElementsOfKind:", CFSTR("TVShelfLayoutElementKindHeader"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
        -[_TVShelfView supplementaryViewForElementKind:atIndexPath:](self, "supplementaryViewForElementKind:atIndexPath:", CFSTR("TVShelfLayoutElementKindHeader"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVShelfView collectionViewLayout](self, "collectionViewLayout");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("TVShelfLayoutElementKindHeader"), v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "frame");
        v28 = v27;
        objc_msgSend(v26, "frame");
        if (v28 != v29)
        {
          objc_msgSend(v24, "frame");
          if (v7)
          {
            v32 = v31;
            objc_msgSend(v26, "frame");
            v39[0] = MEMORY[0x24BDAC760];
            v34 = v32 < v33;
            v39[1] = 3221225472;
            v39[2] = __69___TVShelfView__updateLayoutForFocusedView_withAnimationCoordinator___block_invoke;
            v39[3] = &unk_24EB848C0;
            v40 = v24;
            v41 = v26;
            objc_msgSend(v7, "addCoordinatedAnimationsForAnimation:animations:completion:", v34, v39, 0);

          }
          else
          {
            v35 = v30;
            objc_msgSend(v26, "frame");
            objc_msgSend(v24, "setFrame:", v35);
          }
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v20);
  }

}

- (CGRect)tv_augmentedSelectionFrameForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_TVShelfView indexPathsForVisibleSupplementaryElementsOfKind:](self, "indexPathsForVisibleSupplementaryElementsOfKind:", CFSTR("TVShelfLayoutElementKindHeader"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[_TVShelfView shelfFlowLayout](self, "shelfFlowLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "boundingSelectionFrameForFrame:", x, y, width, height);
    x = v11;
    y = v12;
    width = v13;
    height = v14;

  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)updateLayoutForFocusedView:(id)a3
{
  -[_TVShelfView _updateLayoutForFocusedView:withAnimationCoordinator:](self, "_updateLayoutForFocusedView:withAnimationCoordinator:", a3, 0);
}

- (UIEdgeInsets)selectionMarginsForCellAtIndexPath:(id)a3
{
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
  UIEdgeInsets result;

  -[_TVShelfView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_TVShelfView _selectionMarginsForCell:](self, "_selectionMarginsForCell:", v4);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x24BDF7718];
    v8 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v10 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v12 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)_selectionMarginsForCell:(id)a3
{
  id v3;
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
  double v15;
  UIEdgeInsets result;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_25578CA30))
  {
    objc_msgSend(v3, "selectionMarginsForSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x24BDF7718];
    v7 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v9 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v11 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)setShelfFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_shelfFlowLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfFlowLayout, 0);
}

@end
