@implementation _TVStackCollectionView

- (_TVStackCollectionView)initWithFrame:(CGRect)a3
{
  _TVStackCollectionView *v3;
  _TVStackCollectionView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVStackCollectionView;
  v3 = -[_TVStackCollectionView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_TVStackCollectionView panGestureRecognizer](v3, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v4);

  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  BOOL v8;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setBottomPaddingForVisibleBounds:(double)a3
{
  self->_bottomPadding = a3;
}

- (void)_setGradientBoundsInsets:(UIEdgeInsets)a3
{
  self->_gradientBoundsInsets = a3;
}

- (UIEdgeInsets)_gradientBoundsInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gradientBoundsInsets.top;
  left = self->_gradientBoundsInsets.left;
  bottom = self->_gradientBoundsInsets.bottom;
  right = self->_gradientBoundsInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_TVStackCollectionView;
  -[_TVStackCollectionView _getGradientMaskBounds:startInsets:endInsets:intensities:](&v14, sel__getGradientMaskBounds_startInsets_endInsets_intensities_, a3, a4, a5, a6);
  -[_TVStackCollectionView _gradientBoundsInsets](self, "_gradientBoundsInsets");
  if (a3)
  {
    v12 = v8 + a3->origin.y;
    a3->origin.x = v9 + a3->origin.x;
    a3->origin.y = v12;
    v13 = a3->size.height - (v8 + v10);
    a3->size.width = a3->size.width - (v9 + v11);
    a3->size.height = v13;
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *indexPathForLastFocusedItem;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSIndexPath *v16;
  NSIndexPath *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TVStackCollectionView;
  -[_TVStackCollectionView didUpdateFocusInContext:withAnimationCoordinator:](&v22, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  if (-[UICollectionView tv_isFocusOnNonOwnedCell](self, "tv_isFocusOnNonOwnedCell"))
  {
    indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
    self->_indexPathForLastFocusedItem = 0;
  }
  else
  {
    objc_msgSend(v6, "nextFocusedView");
    indexPathForLastFocusedItem = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(indexPathForLastFocusedItem, "isDescendantOfView:", self))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[_TVStackCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
LABEL_6:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          -[_TVStackCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(indexPathForLastFocusedItem, "isDescendantOfView:", v14) & 1) != 0)
            break;

          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
            if (v10)
              goto LABEL_6;
            goto LABEL_15;
          }
        }
        v15 = v13;

        if (!v15)
          goto LABEL_16;
        v16 = (NSIndexPath *)objc_msgSend(v15, "copy");
        v17 = self->_indexPathForLastFocusedItem;
        self->_indexPathForLastFocusedItem = v16;

        v8 = v15;
      }
LABEL_15:

    }
  }
LABEL_16:

}

- (void)reloadData
{
  NSIndexPath *indexPathForLastFocusedItem;
  objc_super v4;

  indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
  self->_indexPathForLastFocusedItem = 0;

  v4.receiver = self;
  v4.super_class = (Class)_TVStackCollectionView;
  -[_TVStackCollectionView reloadData](&v4, sel_reloadData);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  _QWORD v3[5];
  UIEdgeInsets v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42___TVStackCollectionView_setContentInset___block_invoke;
  v3[3] = &unk_24EB857E0;
  v4 = a3;
  v3[4] = self;
  -[_TVStackCollectionView _performWithoutLayoutBelow:](self, "_performWithoutLayoutBelow:", v3);
}

- (void)layoutBelowIfNeeded
{
  objc_super v2;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_TVStackCollectionView;
    -[_TVStackCollectionView layoutBelowIfNeeded](&v2, sel_layoutBelowIfNeeded);
  }
}

- (void)_performWithoutLayoutBelow:(id)a3
{
  char flags;

  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags | 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | flags & 1;
}

- (CGRect)_visibleBounds
{
  void *v3;
  double bottomPadding;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  -[_TVStackCollectionView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (bottomPadding = self->_bottomPadding, v3, bottomPadding != 0.0))
  {
    -[_TVStackCollectionView bounds](self, "bounds");
    v8 = self->_bottomPadding + v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVStackCollectionView;
    -[_TVStackCollectionView _visibleBounds](&v10, sel__visibleBounds);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (NSIndexPath)indexPathForLastFocusedItem
{
  return self->_indexPathForLastFocusedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathForLastFocusedItem, 0);
}

@end
