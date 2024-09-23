@implementation _UICollectionViewLayoutSwipeViewManipulator

- (_UICollectionViewLayoutSwipeViewManipulator)initWithCollectionView:(id)a3 swipeActionsModule:(id)a4
{
  id v6;
  id v7;
  _UICollectionViewLayoutSwipeViewManipulator *v8;
  _UICollectionViewLayoutSwipeViewManipulator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewLayoutSwipeViewManipulator;
  v8 = -[_UICollectionViewLayoutSwipeViewManipulator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    objc_storeWeak((id *)&v9->_swipeActionsModule, v7);
  }

  return v9;
}

- (void)moveSwipedView:(id)a3 atIndexPath:(id)a4 withSwipeInfo:(id *)a5 animator:(id)a6
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v8 = a4;
  v9 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (v9)
  {
    v11 = objc_loadWeakRetained((id *)&self->_swipeActionsModule);
    objc_msgSend(v11, "_performForcedCollectionViewLayoutPreservingExistingLayoutAttributes");

  }
  objc_msgSend(WeakRetained, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UIInvalidateSwipeActionsLayoutForItemAtIndexPath(v12, v8);

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __97___UICollectionViewLayoutSwipeViewManipulator_moveSwipedView_atIndexPath_withSwipeInfo_animator___block_invoke;
  v20 = &unk_1E16B1B50;
  v21 = WeakRetained;
  v22 = v8;
  v13 = v8;
  v14 = WeakRetained;
  v15 = _Block_copy(&v17);
  v16 = v15;
  if (v9)
    objc_msgSend(v9, "addAnimations:", v15, v17, v18, v19, v20, v21, v22);
  else
    (*((void (**)(void *))v15 + 2))(v15);

}

- (CGRect)restingFrameForSwipedView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
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
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;
  CGRect result;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutAttributesForDecorationViewOfKind:atIndexPath:", CFSTR("UICollectionViewListLayoutElementKindSwipeActions"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_diagnostics())
  {
    if (v8)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      v24 = 138412290;
      v25 = v5;
      _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "Missing layout attributes for swipe actions view at index path: %@", (uint8_t *)&v24, 0xCu);
    }

LABEL_13:
    v10 = *MEMORY[0x1E0C9D628];
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_4;
  }
  if (!v8)
  {
    v22 = restingFrameForSwipedView_atIndexPath____s_category;
    if (!restingFrameForSwipedView_atIndexPath____s_category)
    {
      v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&restingFrameForSwipedView_atIndexPath____s_category);
    }
    v23 = *(NSObject **)(v22 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = 138412290;
      v25 = v5;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Missing layout attributes for swipe actions view at index path: %@", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_3:
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
LABEL_4:

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_swipeActionsModule);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
