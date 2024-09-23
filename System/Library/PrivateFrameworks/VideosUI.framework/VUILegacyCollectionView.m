@implementation VUILegacyCollectionView

id __43__VUILegacyCollectionView_setContentInset___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)VUILegacyCollectionView;
  return objc_msgSendSuper2(&v2, sel_setContentInset_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUILegacyCollectionView;
  v4 = a3;
  -[VUILegacyCollectionView setDelegate:](&v8, sel_setDelegate_, v4);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v5;
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
    v7 = 4;
  else
    v7 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v7;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  _QWORD v3[5];
  UIEdgeInsets v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__VUILegacyCollectionView_setContentInset___block_invoke;
  v3[3] = &unk_1E9F9D420;
  v4 = a3;
  v3[4] = self;
  -[VUILegacyCollectionView _performWithoutLayoutBelow:](self, "_performWithoutLayoutBelow:", v3);
}

- (void)reloadData
{
  NSIndexPath *indexPathForLastFocusedItem;
  objc_super v4;

  indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
  self->_indexPathForLastFocusedItem = 0;

  v4.receiver = self;
  v4.super_class = (Class)VUILegacyCollectionView;
  -[VUILegacyCollectionView reloadData](&v4, sel_reloadData);
}

- (void)layoutBelowIfNeeded
{
  objc_super v2;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)VUILegacyCollectionView;
    -[VUILegacyCollectionView layoutBelowIfNeeded](&v2, sel_layoutBelowIfNeeded);
  }
}

- (VUILegacyCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  VUILegacyCollectionView *v4;
  uint64_t v5;
  UILongPressGestureRecognizer *longPressRecognizer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUILegacyCollectionView;
  v4 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](&v8, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v4, sel__longPressAction_);
    longPressRecognizer = v4->_longPressRecognizer;
    v4->_longPressRecognizer = (UILongPressGestureRecognizer *)v5;

    -[UILongPressGestureRecognizer setCancelsTouchesInView:](v4->_longPressRecognizer, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setDelegate:](v4->_longPressRecognizer, "setDelegate:", v4);
    -[VUILegacyCollectionView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_longPressRecognizer);
  }
  return v4;
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

  -[VUILegacyCollectionView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (bottomPadding = self->_bottomPadding, v3, bottomPadding != 0.0))
  {
    -[VUILegacyCollectionView bounds](self, "bounds");
    v8 = self->_bottomPadding + v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VUILegacyCollectionView;
    -[VUILegacyCollectionView _visibleBounds](&v10, sel__visibleBounds);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)_performWithoutLayoutBelow:(id)a3
{
  char flags;

  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags | 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | flags & 1;
}

- (void)_notifyDidScroll
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILegacyCollectionView;
  -[VUILegacyCollectionView _notifyDidScroll](&v4, sel__notifyDidScroll);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0DB18D8], self);

}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UILongPressGestureRecognizer *v4;
  unsigned __int8 v5;
  void *v6;
  char v7;
  objc_super v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressRecognizer == v4)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      -[VUILegacyCollectionView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __56__VUILegacyCollectionView_gestureRecognizerShouldBegin___block_invoke;
        v10[3] = &unk_1E9FA02D8;
        v10[4] = self;
        v10[5] = &v11;
        -[VUILegacyCollectionView _performBlockWithLongPressedCellIndexPath:](self, "_performBlockWithLongPressedCellIndexPath:", v10);
      }
      v5 = *((_BYTE *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VUILegacyCollectionView;
    v5 = -[VUILegacyCollectionView gestureRecognizerShouldBegin:](&v9, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v5;
}

void __56__VUILegacyCollectionView_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "collectionView:shouldHandleLongPressForItemAtIndexPath:", *(_QWORD *)(a1 + 32), v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSIndexPath *v16;
  NSIndexPath *indexPathForLastFocusedItem;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VUILegacyCollectionView;
  -[VUILegacyCollectionView didUpdateFocusInContext:withAnimationCoordinator:](&v22, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDescendantOfView:", self))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[VUILegacyCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        -[VUILegacyCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isDescendantOfView:", v14) & 1) != 0)
          break;

        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_13;
        }
      }
      v15 = v13;

      if (!v15)
        goto LABEL_14;
      v16 = (NSIndexPath *)objc_msgSend(v15, "copy");
      indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
      self->_indexPathForLastFocusedItem = v16;

      v8 = v15;
    }
LABEL_13:

  }
LABEL_14:

}

- (BOOL)canBecomeFocused
{
  void *v4;
  char v5;
  objc_super v6;

  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    -[VUILegacyCollectionView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "collectionViewCanBecomeFocused:", self);

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUILegacyCollectionView;
    return -[VUILegacyCollectionView canBecomeFocused](&v6, sel_canBecomeFocused);
  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILegacyCollectionView;
  -[VUILegacyCollectionView setScrollEnabled:](&v3, sel_setScrollEnabled_, a3);
}

- (void)_longPressAction:(id)a3
{
  _QWORD v4[5];

  if (objc_msgSend(a3, "state") == 1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __44__VUILegacyCollectionView__longPressAction___block_invoke;
    v4[3] = &unk_1E9FA0300;
    v4[4] = self;
    -[VUILegacyCollectionView _performBlockWithLongPressedCellIndexPath:](self, "_performBlockWithLongPressedCellIndexPath:", v4);
  }
}

void __44__VUILegacyCollectionView__longPressAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView:didReceiveLongPressForItemAtIndexPath:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_performBlockWithLongPressedCellIndexPath:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[UILongPressGestureRecognizer locationInView:](self->_longPressRecognizer, "locationInView:", self);
  -[VUILegacyCollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5[2](v5, v4);

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
  float64x2_t v8;
  double top;
  CGFloat v10;
  float64x2_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUILegacyCollectionView;
  -[VUILegacyCollectionView _getGradientMaskBounds:startInsets:endInsets:intensities:](&v12, sel__getGradientMaskBounds_startInsets_endInsets_intensities_, a3, a4, a5, a6);
  if (a3)
  {
    v8.f64[0] = self->_gradientBoundsInsets.right;
    top = self->_gradientBoundsInsets.top;
    v10 = top + a3->origin.y;
    v11 = *(float64x2_t *)&self->_gradientBoundsInsets.left;
    a3->origin.x = v11.f64[0] + a3->origin.x;
    a3->origin.y = v10;
    v8.f64[1] = top;
    a3->size = (CGSize)vsubq_f64((float64x2_t)a3->size, vaddq_f64(v11, v8));
  }
}

- (NSIndexPath)indexPathForLastFocusedItem
{
  return self->_indexPathForLastFocusedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathForLastFocusedItem, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
}

@end
