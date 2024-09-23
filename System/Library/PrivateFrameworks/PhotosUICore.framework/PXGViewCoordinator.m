@implementation PXGViewCoordinator

- (PXGViewCoordinator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewCoordinator.m"), 39, CFSTR("%s is not available as initializer"), "-[PXGViewCoordinator init]");

  abort();
}

- (PXGViewCoordinator)initWithContentLayout:(id)a3 containerView:(id)a4 belowSubview:(id)a5 containerViewController:(id)a6 configuration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, PXGViewCoordinator *);
  PXGViewCoordinator *v18;
  PXGViewCoordinator *v19;
  uint64_t v20;
  NSMapTable *backgroundColorByViewBeforeTransition;
  void *v22;
  uint64_t v23;
  void *v24;
  PXGTransitioningLayout *v25;
  PXGTransitioningLayout *v26;
  PXGTransitioningLayout *transitionLayout;
  PXGTransitioningLayout *v28;
  void *v29;
  void *v30;
  PXGView *v31;
  uint64_t v32;
  PXGView *tungstenView;
  PXGView *v34;
  void *v35;
  void *v36;
  objc_super v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, PXGViewCoordinator *))a7;
  v38.receiver = self;
  v38.super_class = (Class)PXGViewCoordinator;
  v18 = -[PXGViewCoordinator init](&v38, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contentLayout, a3);
    objc_storeWeak((id *)&v19->_containerView, v14);
    objc_storeWeak((id *)&v19->_belowSubview, v15);
    v19->_shouldMoveTungstenViewDuringTransition = 1;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    backgroundColorByViewBeforeTransition = v19->_backgroundColorByViewBeforeTransition;
    v19->_backgroundColorByViewBeforeTransition = (NSMapTable *)v20;

    if (v17)
      v17[2](v17, v19);
    if (v16)
    {
      v22 = (void *)_tungstenViewCoordinatorsByContainerViewController;
      if (!_tungstenViewCoordinatorsByContainerViewController)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)_tungstenViewCoordinatorsByContainerViewController;
        _tungstenViewCoordinatorsByContainerViewController = v23;

        v22 = (void *)_tungstenViewCoordinatorsByContainerViewController;
      }
      objc_msgSend(v22, "setObject:forKey:", v19, v16);
    }
    v25 = (PXGTransitioningLayout *)v13;
    if (-[PXGViewCoordinator shouldEmbedContentLayout](v19, "shouldEmbedContentLayout"))
    {
      v26 = -[PXGTransitioningLayout initWithContentLayout:]([PXGTransitioningLayout alloc], "initWithContentLayout:", v25);
      transitionLayout = v19->_transitionLayout;
      v19->_transitionLayout = v26;

      v28 = v19->_transitionLayout;
      v25 = v28;
    }
    v39[0] = &unk_1E53ECB40;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PXGViewCoordinator presentationType](v19, "presentationType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)&v19->_containerView, v14);
    v31 = [PXGView alloc];
    objc_msgSend(v14, "bounds");
    -[PXGViewCoordinator insets](v19, "insets");
    PXEdgeInsetsInsetRect();
    v32 = -[PXGView initWithFrame:allowedPresentationTypes:](v31, "initWithFrame:allowedPresentationTypes:", v30);
    tungstenView = v19->_tungstenView;
    v19->_tungstenView = (PXGView *)v32;

    -[PXGView setRootLayout:](v19->_tungstenView, "setRootLayout:", v25);
    -[PXGView setAutoresizingMask:](v19->_tungstenView, "setAutoresizingMask:", 18);
    v34 = v19->_tungstenView;
    -[PXGViewCoordinator mediaProvider](v19, "mediaProvider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGView registerAllTextureProvidersWithMediaProvider:](v34, "registerAllTextureProvidersWithMediaProvider:", v35);

    -[PXGViewCoordinator _addTungstenViewToContainerView](v19, "_addTungstenViewToContainerView");
    -[PXGView scrollViewController](v19->_tungstenView, "scrollViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setShowsHorizontalScrollIndicator:", -[PXGViewCoordinator showsHorizontalScrollIndicator](v19, "showsHorizontalScrollIndicator"));
    objc_msgSend(v36, "setShowsVerticalScrollIndicator:", -[PXGViewCoordinator showsVerticalScrollIndicator](v19, "showsVerticalScrollIndicator"));
    objc_msgSend(v36, "setContentInsetAdjustmentBehavior:", -[PXGViewCoordinator contentInsetAdjustmentBehavior](v19, "contentInsetAdjustmentBehavior"));

  }
  return v19;
}

- (void)prepareForTransitionInContainerView:(id)a3 withContentFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  NSMapTable *backgroundColorByViewBeforeTransition;
  void *v13;
  void *v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  -[PXGViewCoordinator tungstenView](self, "tungstenView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGViewCoordinator transitionLayout](self, "transitionLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v15, "bounds");
    objc_msgSend(v9, "setFrame:");
    -[PXGViewCoordinator transitionLayout](self, "transitionLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentFrameOverride:", x, y, width, height);

  }
  -[NSMapTable removeAllObjects](self->_backgroundColorByViewBeforeTransition, "removeAllObjects");
  if (-[PXGViewCoordinator shouldMoveTungstenViewDuringTransition](self, "shouldMoveTungstenViewDuringTransition"))
  {
    backgroundColorByViewBeforeTransition = self->_backgroundColorByViewBeforeTransition;
    objc_msgSend(v9, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](backgroundColorByViewBeforeTransition, "setObject:forKey:", v13, v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v14);

    objc_msgSend(v15, "addSubview:", v9);
  }
  objc_msgSend(v9, "forceUpdate");
  -[PXGViewCoordinator setIsPreparedForTransition:](self, "setIsPreparedForTransition:", 1);

}

- (void)restoreAfterTransition
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[PXGViewCoordinator isPreparedForTransition](self, "isPreparedForTransition"))
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    -[PXGViewCoordinator transitionLayout](self, "transitionLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentFrameOverride:", v3, v4, v5, v6);

    -[PXGViewCoordinator tungstenView](self, "tungstenView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGViewCoordinator containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[PXGViewCoordinator insets](self, "insets");
    PXEdgeInsetsInsetRect();
    objc_msgSend(v8, "setFrame:");
    -[PXGViewCoordinator _addTungstenViewToContainerView](self, "_addTungstenViewToContainerView");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSMapTable keyEnumerator](self->_backgroundColorByViewBeforeTransition, "keyEnumerator", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_backgroundColorByViewBeforeTransition, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBackgroundColor:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    -[NSMapTable removeAllObjects](self->_backgroundColorByViewBeforeTransition, "removeAllObjects");
    objc_msgSend(v8, "forceUpdate");
    -[PXGViewCoordinator setIsPreparedForTransition:](self, "setIsPreparedForTransition:", 0);

  }
}

- (void)_addTungstenViewToContainerView
{
  void *v3;
  void *v4;
  id v5;

  -[PXGViewCoordinator containerView](self, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGViewCoordinator tungstenView](self, "tungstenView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGViewCoordinator belowSubview](self, "belowSubview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "insertSubview:belowSubview:", v3, v4);
  else
    objc_msgSend(v5, "addSubview:", v3);

}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  self->_showsHorizontalScrollIndicator = a3;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  self->_showsVerticalScrollIndicator = a3;
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  self->_contentInsetAdjustmentBehavior = a3;
}

- (BOOL)shouldEmbedContentLayout
{
  return self->_shouldEmbedContentLayout;
}

- (void)setShouldEmbedContentLayout:(BOOL)a3
{
  self->_shouldEmbedContentLayout = a3;
}

- (BOOL)shouldMoveTungstenViewDuringTransition
{
  return self->_shouldMoveTungstenViewDuringTransition;
}

- (void)setShouldMoveTungstenViewDuringTransition:(BOOL)a3
{
  self->_shouldMoveTungstenViewDuringTransition = a3;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unsigned __int8)a3
{
  self->_presentationType = a3;
}

- (PXGView)tungstenView
{
  return self->_tungstenView;
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (UIView)belowSubview
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_belowSubview);
}

- (PXGTransitioningLayout)transitionLayout
{
  return self->_transitionLayout;
}

- (BOOL)isPreparedForTransition
{
  return self->_isPreparedForTransition;
}

- (void)setIsPreparedForTransition:(BOOL)a3
{
  self->_isPreparedForTransition = a3;
}

- (PXGLayout)contentLayout
{
  return self->_contentLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayout, 0);
  objc_storeStrong((id *)&self->_transitionLayout, 0);
  objc_destroyWeak((id *)&self->_belowSubview);
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_tungstenView, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_backgroundColorByViewBeforeTransition, 0);
}

+ (id)tungstenViewCoordinatorInContainerViewController:(id)a3
{
  return (id)objc_msgSend((id)_tungstenViewCoordinatorsByContainerViewController, "objectForKey:", a3);
}

@end
