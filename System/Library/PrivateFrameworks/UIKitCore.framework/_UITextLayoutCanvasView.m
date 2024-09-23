@implementation _UITextLayoutCanvasView

- (id)textRangeForBounds:(CGRect)a3 layoutIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  NSTextViewportLayoutController *viewportLayoutController;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSTextViewportLayoutController *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  CGRect v30;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__94;
  v28 = __Block_byref_object_dispose__94;
  v29 = 0;
  viewportLayoutController = self->_viewportLayoutController;
  v11 = MEMORY[0x1E0C809B0];
  if (a4)
    v12 = 4;
  else
    v12 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61___UITextLayoutCanvasView_textRangeForBounds_layoutIfNeeded___block_invoke;
  v23[3] = &unk_1E16C7A18;
  v23[4] = &v24;
  -[NSTextViewportLayoutController enumerateTextViewportElementsInRect:options:usingBlock:](viewportLayoutController, "enumerateTextViewportElementsInRect:options:usingBlock:", v12, v23, a3.origin.x);
  v13 = (void *)v25[5];
  if (!v13)
  {
    if (v4)
    {
      -[UIView frame](self, "frame");
      if (!CGRectIsEmpty(v30))
        -[_UITextLayoutCanvasView _performViewportLayout:](self, "_performViewportLayout:", 0);
    }
    v14 = self->_viewportLayoutController;
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __61___UITextLayoutCanvasView_textRangeForBounds_layoutIfNeeded___block_invoke_2;
    v22[3] = &unk_1E16C7A18;
    v22[4] = &v24;
    -[NSTextViewportLayoutController enumerateTextViewportElementsInRect:options:usingBlock:](v14, "enumerateTextViewportElementsInRect:options:usingBlock:", v12, v22, x, y, width, height);
    v13 = (void *)v25[5];
    if (!v13)
    {
      v15 = objc_alloc((Class)off_1E1679D70);
      -[NSTextLayoutManager documentRange](self->_textLayoutManager, "documentRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "initWithLocation:", v17);
      v19 = (void *)v25[5];
      v25[5] = v18;

      v13 = (void *)v25[5];
    }
  }
  v20 = v13;
  _Block_object_dispose(&v24, 8);

  return v20;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[_UITextLayoutCanvasView _performViewportLayout:](self, "_performViewportLayout:", 1);
  if (self->_hoverEffectsLayer)
  {
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    -[_UITextLayoutCanvasViewHoverEffectContainerLayer setFrame:](self->_hoverEffectsLayer, "setFrame:");

  }
  -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "contentsScale");
    v7 = v6;
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayScale");
    v10 = v9;

    if (v7 != v10)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v12 = layoutSubviews___s_category_0;
        if (!layoutSubviews___s_category_0)
        {
          v12 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&layoutSubviews___s_category_0);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = v13;
          objc_msgSend(v5, "contentsScale");
          v16 = v15;
          -[UIView traitCollection](self, "traitCollection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "displayScale");
          v19 = 134349570;
          v20 = v16;
          v21 = 2050;
          v22 = v18;
          v23 = 2082;
          v24 = "-[_UITextLayoutCanvasView layoutSubviews]";
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Updating customRenderController.contentsScale ”%{public}.0f” with traitCollection.displayScale ”%{public}.0f” from %{public}s", (uint8_t *)&v19, 0x20u);

        }
      }
      -[UIView traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayScale");
      -[_UITextLayoutCanvasView _updateContentsScaleForCustomRenderController:](self, "_updateContentsScaleForCustomRenderController:");

    }
  }

}

- (void)_performViewportLayout:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (!self->_inLayout)
  {
    v3 = a3;
    -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v3 && (*(_BYTE *)&self->_canvasViewFlags & 8) != 0)
      objc_msgSend(v6, "preLayoutNotify");
    self->_inLayout = 1;
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50___UITextLayoutCanvasView__performViewportLayout___block_invoke;
    v10[3] = &unk_1E16B1B28;
    v10[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10, v6);
    if (v3)
      -[_UITextLayoutCanvasView _viewportWillLayout](self, "_viewportWillLayout");
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __50___UITextLayoutCanvasView__performViewportLayout___block_invoke_2;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
    if (v3)
      -[_UITextLayoutCanvasView _viewportDidLayout](self, "_viewportDidLayout");
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __50___UITextLayoutCanvasView__performViewportLayout___block_invoke_3;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
    self->_inLayout = 0;
    if (v3 && (*(_BYTE *)&self->_canvasViewFlags & 8) != 0)
      objc_msgSend(v7, "postLayoutNotify");

  }
}

- (void)_viewportWillLayout
{
  NSMutableSet *v3;
  NSMutableSet *oldClientAuxiliaryViews;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_selectionContainerView)
  {
    v3 = (NSMutableSet *)-[NSMutableSet mutableCopy](self->_currentClientAuxiliaryViews, "mutableCopy");
    oldClientAuxiliaryViews = self->_oldClientAuxiliaryViews;
    self->_oldClientAuxiliaryViews = v3;

    -[NSMutableSet makeObjectsPerformSelector:](self->_oldClientAuxiliaryViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    -[NSMutableSet removeAllObjects](self->_currentClientAuxiliaryViews, "removeAllObjects");
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_selectionContainerView, 0);
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_selectionContainerView, "setFrame:");
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable keyEnumerator](self->_viewportElementViews, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableSet addObject:](self->_viewportElementsToRemove, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[_UITextLayoutCanvasView configureCustomTextRenderer](self, "configureCustomTextRenderer");
  -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginLayout");

}

- (void)_viewportDidLayout
{
  NSMutableSet *oldClientAuxiliaryViews;
  void *v4;
  void *v5;
  id v6;
  BOOL *p_layoutFragmentViewsNeedDisplay;
  NSMapTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _UITextLayoutCanvasView *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet removeAllObjects](self->_oldClientAuxiliaryViews, "removeAllObjects");
  oldClientAuxiliaryViews = self->_oldClientAuxiliaryViews;
  self->_oldClientAuxiliaryViews = 0;

  -[_UITextLayoutCanvasView _removeUnusedFragmentViews](self, "_removeUnusedFragmentViews");
  -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke;
    v27[3] = &unk_1E16B1B50;
    v6 = v4;
    v28 = v6;
    v29 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v27);

    p_layoutFragmentViewsNeedDisplay = &self->_layoutFragmentViewsNeedDisplay;
    if (self->_layoutFragmentViewsNeedDisplay && (*(_BYTE *)&self->_canvasViewFlags & 2) != 0)
      objc_msgSend(v6, "setNeedsDisplay");
  }
  else
  {
    p_layoutFragmentViewsNeedDisplay = &self->_layoutFragmentViewsNeedDisplay;
    if (self->_layoutFragmentViewsNeedDisplay)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = self->_viewportElementViews;
      v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v24 != v11)
              objc_enumerationMutation(v8);
            -[NSMapTable objectForKey:](self->_viewportElementViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setNeedsDisplay");

          }
          v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        }
        while (v10);
      }

    }
  }
  -[NSTextViewportLayoutController viewportRange](self->_viewportLayoutController, "viewportRange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    -[NSTextLayoutManager ensureLayoutForRange:](self->_textLayoutManager, "ensureLayoutForRange:", v14);
  -[_UITextLayoutCanvasView updateContentSizeIfNeeded](self, "updateContentSizeIfNeeded");
  -[_UITextLayoutCanvasView context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)-[NSMutableSet mutableCopy](self->_textAttachmentViews, "mutableCopy");
  objc_msgSend(v16, "minusSet:", self->_newTextAttachmentViews);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v15, "didRemoveTextAttachmentViews:", v16);
  v17 = (void *)-[NSMutableSet mutableCopy](self->_newTextAttachmentViews, "mutableCopy");
  objc_msgSend(v17, "minusSet:", self->_textAttachmentViews);
  if (objc_msgSend(v17, "count"))
    objc_msgSend(v15, "didAddTextAttachmentViews:", v17);
  -[NSMutableSet setSet:](self->_textAttachmentViews, "setSet:", self->_newTextAttachmentViews);
  -[NSMutableSet removeAllObjects](self->_newTextAttachmentViews, "removeAllObjects");
  *p_layoutFragmentViewsNeedDisplay = 0;
  -[_UITextLayoutCanvasView _internalTextLayoutController](self, "_internalTextLayoutController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "searchableObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __45___UITextLayoutCanvasView__viewportDidLayout__block_invoke_4;
    v21[3] = &unk_1E16B1B28;
    v22 = v19;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);

  }
}

- (void)updateContentSizeIfNeeded
{
  double v3;
  double v4;
  void *v6;
  id v7;

  -[NSTextLayoutManager ui_contentSizeForLastContainerView](self->_textLayoutManager, "ui_contentSizeForLastContainerView");
  if (self->_contentSize.width != v3 || self->_contentSize.height != v4)
  {
    self->_contentSize.width = v3;
    self->_contentSize.height = v4;
    -[NSTextLayoutManager textSelectionNavigation](self->_textLayoutManager, "textSelectionNavigation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flushLayoutCache");

    -[_UITextLayoutCanvasView context](self, "context");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textContainerUsageDidChangeToSize:", self->_contentSize.width, self->_contentSize.height);

  }
}

- (void)textViewportLayoutController:(id)a3 configureRenderingSurfaceForTextLayoutFragment:(id)a4
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _UITextLayoutCanvasView *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  _QWORD v46[12];
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v6 = a4;
  -[_UITextLayoutCanvasView context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContainerOrigin");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "textContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  objc_msgSend(v6, "layoutFragmentFrame");
  if (CGRectGetWidth(v47) <= v14)
  {
    objc_msgSend(v7, "_clipRectForFadedEdges");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[NSMapTable objectForKey:](self->_viewportElementViews, "objectForKey:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UIView addSubview:](self, "addSubview:", v25);
    v26 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __103___UITextLayoutCanvasView_textViewportLayoutController_configureRenderingSurfaceForTextLayoutFragment___block_invoke;
    v46[3] = &__block_descriptor_96_e44_v16__0____UIMutableTextLayoutFragmentView__8l;
    *(CGFloat *)&v46[4] = v9;
    *(CGFloat *)&v46[5] = v11;
    *(double *)&v46[6] = v14;
    v46[7] = v16;
    v46[8] = v18;
    v46[9] = v20;
    v46[10] = v22;
    v46[11] = v24;
    objc_msgSend(v25, "performChanges:", v46);
    -[NSMutableSet removeObject:](self->_viewportElementsToRemove, "removeObject:", v6);
    -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "didLayoutFragment:", v6);

    objc_msgSend(v6, "layoutFragmentFrame");
    v49 = CGRectOffset(v48, v9, v11);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    objc_msgSend(v6, "textLineFragments");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count") == 1)
    {
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "typographicBounds");
      v35 = v34;
      v37 = v36;

      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v51 = CGRectOffset(v50, v35, v37);
      x = v51.origin.x;
      y = v51.origin.y;
      width = v51.size.width;
      height = v51.size.height;
    }
    objc_msgSend(v25, "layoutIfNeeded");
    v39[0] = v26;
    v39[1] = 3221225472;
    v39[2] = __103___UITextLayoutCanvasView_textViewportLayoutController_configureRenderingSurfaceForTextLayoutFragment___block_invoke_2;
    v39[3] = &unk_1E16C7B00;
    v42 = x;
    v43 = y;
    v44 = width;
    v45 = height;
    v40 = v7;
    v41 = self;
    objc_msgSend(v25, "enumerateTextAttachmentViewsUsingBlock:", v39);
    if (self->_hoverEffectsLayer)

  }
}

- (CGRect)viewportBoundsForTextViewportLayoutController:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  -[UIView bounds](self, "bounds", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UITextLayoutCanvasView context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textContainerOrigin");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "enclosingScrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "bounds");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v18);
    v5 = v19;
    v7 = v20;
    v9 = v21;
    v11 = v22;
  }
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  v32 = CGRectOffset(v31, -v14, -v16);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (_UITextCanvasContext)context
{
  return (_UITextCanvasContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (_UITextLayoutCanvasView)initWithTextLayoutManager:(id)a3 textContainer:(id)a4
{
  id v7;
  id v8;
  _UITextLayoutCanvasView *v9;
  _UITextLayoutCanvasView *v10;
  void *v11;
  NSMutableSet *v12;
  NSMutableSet *textAttachmentViews;
  NSMutableSet *v14;
  NSMutableSet *newTextAttachmentViews;
  NSMutableSet *v16;
  NSMutableSet *viewportElementsToRemove;
  uint64_t v18;
  NSMapTable *viewportElementViews;
  uint64_t v20;
  NSTextViewportLayoutController *viewportLayoutController;
  UITraitChangeRegistration *traitChangeToken;
  void *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_UITextLayoutCanvasView;
  v9 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textLayoutManager, a3);
    objc_storeStrong((id *)&v10->_textContainer, a4);
    objc_msgSend(v7, "textContainers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_textContainerIndex = objc_msgSend(v11, "indexOfObject:", v8);

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    textAttachmentViews = v10->_textAttachmentViews;
    v10->_textAttachmentViews = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    newTextAttachmentViews = v10->_newTextAttachmentViews;
    v10->_newTextAttachmentViews = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    viewportElementsToRemove = v10->_viewportElementsToRemove;
    v10->_viewportElementsToRemove = v16;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    viewportElementViews = v10->_viewportElementViews;
    v10->_viewportElementViews = (NSMapTable *)v18;

    objc_msgSend(v7, "textViewportLayoutController");
    v20 = objc_claimAutoreleasedReturnValue();
    viewportLayoutController = v10->_viewportLayoutController;
    v10->_viewportLayoutController = (NSTextViewportLayoutController *)v20;

    -[NSTextViewportLayoutController setDelegate:](v10->_viewportLayoutController, "setDelegate:", v10);
    v10->_contentSize = (CGSize)*MEMORY[0x1E0C9D820];
    v10->_lastCustomRenderController = 0;
    traitChangeToken = v10->_traitChangeToken;
    v10->_traitChangeToken = 0;

    if (dyld_program_sdk_at_least())
      -[UIView _setHostsLayoutEngine:](v10, "_setHostsLayoutEngine:", 1);
    objc_opt_self();
    objc_storeStrong((id *)&v10->_hoverEffectsLayer, 0);
    if (v10->_hoverEffectsLayer)
    {
      -[_UITextLayoutCanvasViewHoverEffectContainerLayer setZPosition:](v10->_hoverEffectsLayer, "setZPosition:", 10000.0);
      -[UIView layer](v10, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addSublayer:", v10->_hoverEffectsLayer);

    }
  }

  return v10;
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextLayoutCanvasView;
  -[UIView setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[_UITextLayoutCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (void)textViewportLayoutControllerWillLayout:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!self->_inLayout)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("_UITextViewportLayoutControllerWillLayout"), v5);

    -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((*(_BYTE *)&self->_canvasViewFlags & 8) != 0)
        objc_msgSend(v7, "preLayoutNotify");

    }
    -[_UITextLayoutCanvasView _viewportWillLayout](self, "_viewportWillLayout");

  }
}

- (void)textViewportLayoutControllerDidLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (!self->_inLayout)
  {
    v4 = a3;
    -[_UITextLayoutCanvasView _viewportDidLayout](self, "_viewportDidLayout");
    -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((*(_BYTE *)&self->_canvasViewFlags & 8) != 0)
        objc_msgSend(v6, "postLayoutNotify");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("_UITextViewportLayoutControllerDidLayout"), v4);

  }
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueWritingToolsAnimatedLayoutInfo, 0);
  objc_storeStrong((id *)&self->_textEmphasisBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectionContainerView, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_traitChangeToken, 0);
  objc_storeStrong((id *)&self->_hoverEffectsLayer, 0);
  objc_storeStrong((id *)&self->_textRangesForHiddenFragmentViews, 0);
  objc_storeStrong((id *)&self->_oldClientAuxiliaryViews, 0);
  objc_storeStrong((id *)&self->_currentClientAuxiliaryViews, 0);
  objc_storeStrong((id *)&self->_newTextAttachmentViews, 0);
  objc_storeStrong((id *)&self->_textAttachmentViews, 0);
  objc_storeStrong((id *)&self->_viewportElementViews, 0);
  objc_storeStrong((id *)&self->_viewportElementsToRemove, 0);
  objc_storeStrong((id *)&self->_viewportLayoutController, 0);
}

- (void)setLayoutFragmentViewsNeedDisplay:(BOOL)a3
{
  self->_layoutFragmentViewsNeedDisplay = a3;
}

- (NSCustomTextRendering)customRenderController
{
  _UITextCanvasContext **p_context;
  id WeakRetained;
  id v4;
  void *v5;

  p_context = &self->_context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_context);
    objc_msgSend(v4, "customRenderController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSCustomTextRendering *)v5;
}

- (void)setSelectionContainerView:(id)a3
{
  UIView *v5;
  UIView **p_selectionContainerView;
  UIView *selectionContainerView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_selectionContainerView = &self->_selectionContainerView;
  selectionContainerView = self->_selectionContainerView;
  if (selectionContainerView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](selectionContainerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_selectionContainerView, a3);
    if (*p_selectionContainerView)
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_selectionContainerView, 0);
    -[_UITextLayoutCanvasView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setTextEmphasisBackgroundView:(id)a3 withTextView:(id)a4
{
  _UITextEmphasisBackgroundView *v8;
  id v9;
  _UITextEmphasisBackgroundView **p_textEmphasisBackgroundView;
  _UITextEmphasisBackgroundView *textEmphasisBackgroundView;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, double, double, double, double, uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id from;
  id location;

  v8 = (_UITextEmphasisBackgroundView *)a3;
  v9 = a4;
  p_textEmphasisBackgroundView = &self->_textEmphasisBackgroundView;
  textEmphasisBackgroundView = self->_textEmphasisBackgroundView;
  if (textEmphasisBackgroundView != v8)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextLayoutCanvasView.m"), 145, CFSTR("Improper text highlighting setup"));

      textEmphasisBackgroundView = *p_textEmphasisBackgroundView;
    }
    -[UIView removeFromSuperview](textEmphasisBackgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textEmphasisBackgroundView, a3);
    if (*p_textEmphasisBackgroundView)
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v9);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __70___UITextLayoutCanvasView_setTextEmphasisBackgroundView_withTextView___block_invoke;
      v16 = &unk_1E16C79A0;
      objc_copyWeak(&v17, &from);
      objc_copyWeak(&v18, &location);
      -[NSTextViewportLayoutController set_platformRenderingSurfaceUpdater:](self->_viewportLayoutController, "set_platformRenderingSurfaceUpdater:", &v13);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      -[NSTextViewportLayoutController set_platformRenderingSurfaceUpdater:](self->_viewportLayoutController, "set_platformRenderingSurfaceUpdater:", 0);
    }
    -[_UITextLayoutCanvasView setNeedsLayout](self, "setNeedsLayout", v13, v14, v15, v16);
  }

}

- (void)_updateTextEmphasisBackgroundViewForTextRange:(id)a3 inTextView:(id)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  NSTextLayoutManager *v13;
  NSTextViewportLayoutController *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _UITextLayoutCanvasView *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  BOOL IsEmpty;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[2];
  NSRect v39;
  CGRect v40;
  NSRect v41;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v38[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = self->_textLayoutManager;
  v14 = self->_viewportLayoutController;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  if ((objc_msgSend(v11, "isEmpty") & 1) == 0)
  {
    v38[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "_nsRangeForTextKitRanges:", v15);
    v18 = v17;

    objc_msgSend(v12, "textStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 + v18 <= (unint64_t)objc_msgSend(v19, "length"))
    {
      v20 = *(_QWORD *)off_1E1679170;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __91___UITextLayoutCanvasView__updateTextEmphasisBackgroundViewForTextRange_inTextView_bounds___block_invoke;
      v33[3] = &unk_1E16B6338;
      v33[4] = &v34;
      objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v20, v16, v18, 0, v33);
    }

  }
  if (*((_BYTE *)v35 + 24))
  {
    -[NSTextViewportLayoutController addRenderingSurface:key:group:placement:](v14, "addRenderingSurface:key:group:placement:", self->_textEmphasisBackgroundView, CFSTR("_UITextViewHighlightBackgroundView"), 1, 1);
    -[_UITextLayoutCanvasView context](self, "context");
    v21 = (_UITextLayoutCanvasView *)objc_claimAutoreleasedReturnValue();
    -[_UITextLayoutCanvasView textContainerOrigin](v21, "textContainerOrigin");
    v23 = v22;
    v25 = v24;
    -[UIView frame](self->_textEmphasisBackgroundView, "frame");
    v41.origin.x = v26;
    v41.origin.y = v27;
    v41.size.width = v28;
    v41.size.height = v29;
    v30 = y + v25;
    v31 = x + v23;
    v39.origin.x = v31;
    v39.origin.y = v30;
    v39.size.width = width;
    v39.size.height = height;
    if (!NSEqualRects(v39, v41))
      -[UIView setFrame:](self->_textEmphasisBackgroundView, "setFrame:", v31, v30, width, height);
    -[UIView setHidden:](self->_textEmphasisBackgroundView, "setHidden:", 0);
    -[_UITextEmphasisBackgroundView setTextRange:](self->_textEmphasisBackgroundView, "setTextRange:", v11);
    -[_UITextEmphasisBackgroundView setOrigin:](self->_textEmphasisBackgroundView, "setOrigin:", -x, -y);
    goto LABEL_10;
  }
  -[UIView superview](self->_textEmphasisBackgroundView, "superview");
  v21 = (_UITextLayoutCanvasView *)objc_claimAutoreleasedReturnValue();
  if (v21 != self)
  {
LABEL_10:

    goto LABEL_11;
  }
  -[UIView frame](self->_textEmphasisBackgroundView, "frame");
  IsEmpty = CGRectIsEmpty(v40);

  if (!IsEmpty)
    -[UIView setHidden:](self->_textEmphasisBackgroundView, "setHidden:", 1);
LABEL_11:
  _Block_object_dispose(&v34, 8);

}

- (void)flushFragmentViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMapTable keyEnumerator](self->_viewportElementViews, "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableSet addObject:](self->_viewportElementsToRemove, "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[_UITextLayoutCanvasView _removeUnusedFragmentViews](self, "_removeUnusedFragmentViews");
  -[NSMapTable removeAllObjects](self->_viewportElementViews, "removeAllObjects");
}

- (void)configureCustomTextRenderer
{
  NSCustomTextRendering *v3;
  NSCustomTextRendering *v4;
  char v5;
  char v6;
  char v7;
  char v8;
  void *v9;
  UITraitChangeRegistration *traitChangeToken;
  void *v11;
  UITraitChangeRegistration *v12;
  UITraitChangeRegistration *v13;
  UITraitChangeRegistration *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
  v3 = (NSCustomTextRendering *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_lastCustomRenderController != v3)
  {
    self->_lastCustomRenderController = v3;
    *(_BYTE *)&self->_canvasViewFlags = *(_BYTE *)&self->_canvasViewFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_canvasViewFlags = *(_BYTE *)&self->_canvasViewFlags & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_canvasViewFlags = *(_BYTE *)&self->_canvasViewFlags & 0xFB | v6;
    v7 = objc_opt_respondsToSelector();
    v8 = 0;
    if ((v7 & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = 8;
      else
        v8 = 0;
    }
    *(_BYTE *)&self->_canvasViewFlags = *(_BYTE *)&self->_canvasViewFlags & 0xF7 | v8;
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextLayoutCanvasView _updateTraitsForCustomTextRenderer:](self, "_updateTraitsForCustomTextRenderer:", v9);

    -[_UITextLayoutCanvasView _removeUnusedFragmentViews](self, "_removeUnusedFragmentViews");
    traitChangeToken = self->_traitChangeToken;
    if (self->_lastCustomRenderController)
    {
      if (!traitChangeToken)
      {
        v15[0] = objc_opt_class();
        v15[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v11, self, sel__traitsChanged);
        v12 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
        v13 = self->_traitChangeToken;
        self->_traitChangeToken = v12;

      }
    }
    else if (traitChangeToken)
    {
      -[UIView unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
      v14 = self->_traitChangeToken;
      self->_traitChangeToken = 0;

    }
  }

}

- (void)_traitsChanged
{
  id v3;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutCanvasView _updateTraitsForCustomTextRenderer:](self, "_updateTraitsForCustomTextRenderer:", v3);

}

- (void)_updateTraitsForCustomTextRenderer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "contentsScale");
    v8 = v7;
    objc_msgSend(v4, "displayScale");
    if (v8 != v9)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v10 = _updateTraitsForCustomTextRenderer____s_category;
        if (!_updateTraitsForCustomTextRenderer____s_category)
        {
          v10 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&_updateTraitsForCustomTextRenderer____s_category);
        }
        v11 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = v11;
          objc_msgSend(v6, "contentsScale");
          v14 = v13;
          objc_msgSend(v4, "displayScale");
          v16 = 134349570;
          v17 = v14;
          v18 = 2050;
          v19 = v15;
          v20 = 2082;
          v21 = "-[_UITextLayoutCanvasView _updateTraitsForCustomTextRenderer:]";
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Updating customRenderController.contentsScale ”%{public}.0f” with traitCollection.displayScale ”%{public}.0f” from %{public}s", (uint8_t *)&v16, 0x20u);

        }
      }
      objc_msgSend(v4, "displayScale");
      -[_UITextLayoutCanvasView _updateContentsScaleForCustomRenderController:](self, "_updateContentsScaleForCustomRenderController:");
    }
    if ((*(_BYTE *)&self->_canvasViewFlags & 2) != 0)
      objc_msgSend(v6, "setNeedsDisplay");
  }

}

- (void)_updateContentsScaleForCustomRenderController:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((*(_BYTE *)&self->_canvasViewFlags & 1) != 0)
    {
      objc_msgSend(v5, "contentsScale");
      v8 = v7;
      objc_msgSend(v6, "setContentsScale:", a3);
      if (v8 != a3)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v9 = _updateContentsScaleForCustomRenderController____s_category;
          if (!_updateContentsScaleForCustomRenderController____s_category)
          {
            v9 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v9, (unint64_t *)&_updateContentsScaleForCustomRenderController____s_category);
          }
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v11 = v10;
            objc_msgSend(v6, "contentsScale");
            v13 = 134349056;
            v14 = v12;
            _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Updated contents scale to %{public}.0f.", (uint8_t *)&v13, 0xCu);

          }
        }
      }
    }
  }

}

- (void)_removeUnusedFragmentViews
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_viewportElementsToRemove;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_viewportElementViews, "objectForKey:", v8, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "teardown");

        -[NSMapTable objectForKey:](self->_viewportElementViews, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeFromSuperview");

        -[NSMapTable removeObjectForKey:](self->_viewportElementViews, "removeObjectForKey:", v8);
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_viewportElementsToRemove, "removeAllObjects");
}

- (id)_internalTextLayoutController
{
  void *v2;
  void *v3;
  id v4;

  -[_UITextLayoutCanvasView context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLayoutController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)textRangeAtPoint:(CGPoint)a3
{
  return (id)-[NSTextViewportLayoutController locationAtPoint:](self->_viewportLayoutController, "locationAtPoint:", a3.x, a3.y);
}

- (BOOL)isViewHiddenForLayoutFragment:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "textElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "rangeInElement");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v7 = *(void **)(a1 + 472);
      v17 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __53___UITextLayoutCanvasView_isHidingViewsForTextRange___block_invoke;
      v11[3] = &unk_1E16C7A40;
      v13 = &v14;
      v8 = v6;
      v12 = v8;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
      LODWORD(v7) = *((unsigned __int8 *)v15 + 24);

      _Block_object_dispose(&v14, 8);
      v9 = (_DWORD)v7 != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateHiding:(uint64_t)a1 forViewsRenderingTextRange:
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 432), "keyEnumerator", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 432), "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[_UITextLayoutCanvasView isViewHiddenForLayoutFragment:](a1, v7))
            v9 = 0.0;
          else
            v9 = 1.0;
          objc_msgSend(v8, "setAlpha:", v9);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

  }
}

- (void)setLayoutFragmentViewsHidden:(BOOL)a3 forTextRange:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSArray *textRangesForHiddenFragmentViews;
  id v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  int v16;
  int v17;
  char v18;
  char v19;
  unint64_t v20;
  NSObject *v21;
  NSArray *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)-[NSArray mutableCopy](self->_textRangesForHiddenFragmentViews, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v9;

  if (v4)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__94;
    v33 = __Block_byref_object_dispose__94;
    v34 = v6;
    textRangesForHiddenFragmentViews = self->_textRangesForHiddenFragmentViews;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __69___UITextLayoutCanvasView_setLayoutFragmentViewsHidden_forTextRange___block_invoke;
    v26[3] = &unk_1E16C7A68;
    v27 = v34;
    p_buf = &buf;
    v12 = v10;
    v28 = v12;
    -[NSArray enumerateObjectsUsingBlock:](textRangesForHiddenFragmentViews, "enumerateObjectsUsingBlock:", v26);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      objc_msgSend(v12, "addObject:");

    _Block_object_dispose(&buf, 8);
  }
  else if (v10)
  {
    v13 = self->_textRangesForHiddenFragmentViews;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69___UITextLayoutCanvasView_setLayoutFragmentViewsHidden_forTextRange___block_invoke_2;
    v23[3] = &unk_1E16C7A90;
    v24 = v6;
    v25 = v10;
    -[NSArray enumerateObjectsWithOptions:usingBlock:](v13, "enumerateObjectsWithOptions:usingBlock:", 2, v23);

  }
  v14 = (NSArray *)objc_msgSend(v10, "copy");
  v15 = self->_textRangesForHiddenFragmentViews;
  self->_textRangesForHiddenFragmentViews = v14;

  if (os_variant_has_internal_diagnostics())
  {
    v16 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging"));
    v17 = byte_1EDDA80CC ? v16 : 1;
    if (v17 != 1
      || ((v18 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")), !byte_1EDDA80D4)? (v19 = 1): (v19 = v18), (v19 & 1) == 0))
    {
      v20 = setLayoutFragmentViewsHidden_forTextRange____s_category;
      if (!setLayoutFragmentViewsHidden_forTextRange____s_category)
      {
        v20 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&setLayoutFragmentViewsHidden_forTextRange____s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = self->_textRangesForHiddenFragmentViews;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "text ranges for hidden fragment views: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  -[_UITextLayoutCanvasView updateHiding:forViewsRenderingTextRange:]((uint64_t)self);

}

- (void)removeLayoutFragmentViewHiding
{
  NSArray *textRangesForHiddenFragmentViews;
  NSArray *v4;
  _QWORD v5[5];

  textRangesForHiddenFragmentViews = self->_textRangesForHiddenFragmentViews;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___UITextLayoutCanvasView_removeLayoutFragmentViewHiding__block_invoke;
  v5[3] = &unk_1E16C7AB8;
  v5[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](textRangesForHiddenFragmentViews, "enumerateObjectsUsingBlock:", v5);
  v4 = self->_textRangesForHiddenFragmentViews;
  self->_textRangesForHiddenFragmentViews = (NSArray *)MEMORY[0x1E0C9AA60];

}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_UITextLayoutCanvasView;
  -[UIView setNeedsDisplayInRect:](&v18, sel_setNeedsDisplayInRect_);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable objectEnumerator](self->_viewportElementViews, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v13, "frame");
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        if (CGRectIntersectsRect(v21, v22))
          objc_msgSend(v13, "setNeedsDisplay");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

}

- (void)setNeedsLayout
{
  _UITextLayoutCanvasView *v3;
  BOOL v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITextLayoutCanvasView;
  -[UIView setNeedsLayout](&v5, sel_setNeedsLayout);
  -[UIView superview](self->_textEmphasisBackgroundView, "superview");
  v3 = (_UITextLayoutCanvasView *)objc_claimAutoreleasedReturnValue();
  if (v3 == self)
  {
    v4 = -[UIView isHidden](self->_textEmphasisBackgroundView, "isHidden");

    if (!v4)
      -[UIView setNeedsDisplay](self->_textEmphasisBackgroundView, "setNeedsDisplay");
  }
  else
  {

  }
}

- (void)isEditingDidChange
{
  _UITextLayoutCanvasViewHoverEffectContainerLayer *hoverEffectsLayer;
  int v4;
  id WeakRetained;

  hoverEffectsLayer = self->_hoverEffectsLayer;
  if (hoverEffectsLayer)
  {
    v4 = -[_UITextLayoutCanvasViewHoverEffectContainerLayer isHidden](hoverEffectsLayer, "isHidden");
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    -[_UITextLayoutCanvasViewHoverEffectContainerLayer setHidden:](self->_hoverEffectsLayer, "setHidden:", objc_msgSend(WeakRetained, "isEditing"));

    if (v4)
    {
      if ((-[_UITextLayoutCanvasViewHoverEffectContainerLayer isHidden](self->_hoverEffectsLayer, "isHidden") & 1) == 0)
        -[_UITextLayoutCanvasView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UITextLayoutCanvasView *v5;
  _UITextLayoutCanvasView *v6;
  _UITextLayoutCanvasView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITextLayoutCanvasView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UITextLayoutCanvasView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (id)textViewportLayoutController:(id)a3 renderingSurfaceForTextLayoutFragment:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
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
  void *v25;
  __objc2_class **v26;
  _BOOL4 v27;
  double v28;

  v5 = a4;
  -[_UITextLayoutCanvasView context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContainerOrigin");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "textContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v13 = v12;
  v15 = v14;

  -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_clipRectForFadedEdges");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[NSMapTable objectForKey:](self->_viewportElementViews, "objectForKey:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v26 = off_1E167D0F0;
    if (v16)
      v26 = off_1E167D0E8;
    v25 = (void *)objc_msgSend(objc_alloc(*v26), "initWithLayoutFragment:containerOrigin:containerSize:clipRect:", v5, v8, v10, v13, v15, v18, v20, v22, v24);
    -[NSMapTable setObject:forKey:](self->_viewportElementViews, "setObject:forKey:", v25, v5);
    v27 = -[_UITextLayoutCanvasView isViewHiddenForLayoutFragment:]((uint64_t)self, v5);
    v28 = 1.0;
    if (v27)
      v28 = 0.0;
    objc_msgSend(v25, "setAlpha:", v28);
  }

  return v25;
}

- (CGRect)textViewportLayoutController:(id)a3 presentationLayoutFragmentFrameForTextLayoutFragment:(id)a4 proposedOrigin:(CGPoint)a5
{
  id v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  __int16 v39;
  void *v40;
  uint64_t v41;
  CGRect result;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "textParagraph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFragmentFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (v7)
  {
    -[_UITextLayoutCanvasView uniqueWritingToolsAnimatedLayoutInfo](self, "uniqueWritingToolsAnimatedLayoutInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v6, "rangeInElement");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "animatingTextRange");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "endLocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "compare:", v20);

      if (v21 == -1)
        goto LABEL_17;
      objc_msgSend(v16, "verticalAdjustmentForTextParagraph:", v7);
      v11 = v11 + v22;
      if (!os_variant_has_internal_diagnostics())
        goto LABEL_17;
      if (((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, (uint64_t)CFSTR("UITextAssistantRewriteLogging")) & 1) != 0|| !byte_1EDDA80CC)&& ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, (uint64_t)CFSTR("UITextAssistantProofreadLogging")) & 1) != 0|| !byte_1EDDA80D4))
      {
        goto LABEL_17;
      }
      v23 = textViewportLayoutController_presentationLayoutFragmentFrameForTextLayoutFragment_proposedOrigin____s_category;
      if (!textViewportLayoutController_presentationLayoutFragmentFrameForTextLayoutFragment_proposedOrigin____s_category)
      {
        v23 = __UILogCategoryGetNode("TextAssistantGeneral", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&textViewportLayoutController_presentationLayoutFragmentFrameForTextLayoutFragment_proposedOrigin____s_category);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v25 = v24;
      objc_msgSend(v6, "layoutFragmentFrame");
      v37 = 134218242;
      v38 = v11 - v26;
      v39 = 2112;
      v40 = v7;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Vertical adjustment of %g for textParagraph %@", (uint8_t *)&v37, 0x16u);
    }
    else
    {
      objc_msgSend(v7, "attributedString");
      v25 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v25, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3498], "_animatedTextSpacerAttributeKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject attribute:atIndex:effectiveRange:](v25, "attribute:atIndex:effectiveRange:", v27, 0, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v28, "presentationFrameForTextLayoutFragmentFrame:", v9, v11, v13, v15);
          v9 = v29;
          v11 = v30;
          v13 = v31;
          v15 = v32;

        }
      }
    }

LABEL_17:
  }

  v33 = v9;
  v34 = v11;
  v35 = v13;
  v36 = v15;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (BOOL)textViewportLayoutController:(id)a3 addRenderingSurface:(id)a4 group:(int64_t)a5 placement:(int64_t)a6
{
  id v11;
  id v12;
  UIView *selectionContainerView;
  _UITextLayoutCanvasView *v14;
  void *v15;
  _UITextLayoutCanvasView *v16;
  BOOL v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  NSMutableSet *currentClientAuxiliaryViews;
  NSMutableSet *v22;
  NSMutableSet *v23;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint8_t buf[16];
  uint8_t v29[16];
  CGRect v30;

  v11 = a3;
  v12 = a4;
  if (!v12)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "Received nil value in non-null parameter. Ignoring.", v29, 2u);
      }

    }
    else
    {
      v25 = textViewportLayoutController_addRenderingSurface_group_placement____s_category;
      if (!textViewportLayoutController_addRenderingSurface_group_placement____s_category)
      {
        v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v25, (unint64_t *)&textViewportLayoutController_addRenderingSurface_group_placement____s_category);
      }
      v26 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "Received nil value in non-null parameter. Ignoring.", buf, 2u);
      }
    }
  }
  selectionContainerView = self->_selectionContainerView;
  if (selectionContainerView)
  {
    -[UIView superview](selectionContainerView, "superview");
    v14 = (_UITextLayoutCanvasView *)objc_claimAutoreleasedReturnValue();

    if (v14 != self)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextLayoutCanvasView.m"), 823, CFSTR("Non-nil _selectionContainerView is not in the subtree. UIKit to fix."));

    }
  }
  -[UIView superview](self->_selectionContainerView, "superview");
  v16 = (_UITextLayoutCanvasView *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v17 = v16 == self;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    v19 = v12;
    if (a5)
    {
      if (a5 == 1)
      {
        if (a6)
          -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v19, 0);
        else
          -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v19, self->_selectionContainerView);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextLayoutCanvasView.m"), 849, CFSTR("Unsupported rendering group value, not Background or Contents. %ld"), a5);

      }
    }
    else if (a6)
    {
      -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v19, self->_selectionContainerView);
    }
    else
    {
      -[UIView addSubview:](self, "addSubview:", v19);
    }
    if (objc_msgSend(v19, "translatesAutoresizingMaskIntoConstraints"))
    {
      objc_msgSend(v19, "frame");
      if (CGRectEqualToRect(v30, *MEMORY[0x1E0C9D648]))
      {
        -[UIView bounds](self, "bounds");
        objc_msgSend(v19, "setFrame:");
        objc_msgSend(v19, "setAutoresizingMask:", 18);
      }
      objc_msgSend(v19, "_setHostsLayoutEngine:", 1);
    }
    currentClientAuxiliaryViews = self->_currentClientAuxiliaryViews;
    if (!currentClientAuxiliaryViews)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v22 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v23 = self->_currentClientAuxiliaryViews;
      self->_currentClientAuxiliaryViews = v22;

      currentClientAuxiliaryViews = self->_currentClientAuxiliaryViews;
    }
    -[NSMutableSet addObject:](currentClientAuxiliaryViews, "addObject:", v19);
    -[NSMutableSet removeObject:](self->_oldClientAuxiliaryViews, "removeObject:", v19);

  }
  return v18;
}

- (void)invalidateTemporaryAttributesInRange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((*(_BYTE *)&self->_canvasViewFlags & 4) != 0)
    {
      objc_msgSend(v7, "textKit2Ranges");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __64___UITextLayoutCanvasView_invalidateTemporaryAttributesInRange___block_invoke;
      v8[3] = &unk_1E16C7AB8;
      v8[4] = self;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

    }
    else
    {
      -[_UITextLayoutCanvasView customRenderController](self, "customRenderController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNeedsDisplay");

    }
  }

}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  _QWORD *ContextStack;
  CGContext *v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITextLayoutCanvasView context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textContainerOrigin");
  v10 = v9;
  v12 = v11;

  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeTranslation(&v17, v10, v12);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v14 = 0;
  else
    v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v14);
  v16 = v17;
  CGContextConcatCTM(v14, &v16);
  -[_UITextLayoutCanvasView textRangeForBounds:layoutIfNeeded:](self, "textRangeForBounds:layoutIfNeeded:", 1, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _UITextLayoutDrawRangeInContext(self->_textLayoutManager, v15, (uint64_t)v14);
  CGContextRestoreGState(v14);

}

- (NSTextLayoutManager)textLayoutManager
{
  return self->_textLayoutManager;
}

- (BOOL)layoutFragmentViewsNeedDisplay
{
  return self->_layoutFragmentViewsNeedDisplay;
}

- (UIView)selectionContainerView
{
  return self->_selectionContainerView;
}

- (_UITextEmphasisBackgroundView)textEmphasisBackgroundView
{
  return self->_textEmphasisBackgroundView;
}

- (_UIAnimatedTextLayoutInfo)uniqueWritingToolsAnimatedLayoutInfo
{
  return self->_uniqueWritingToolsAnimatedLayoutInfo;
}

- (void)setUniqueWritingToolsAnimatedLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueWritingToolsAnimatedLayoutInfo, a3);
}

@end
