@implementation TUIEmbeddedCollectionView

- (TUIViewRegistry)registry
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "registry"));

  return (TUIViewRegistry *)v3;
}

+ (id)renderModelWithUpdateController:(id)a3 uid:(id)a4 UUID:(id)a5 identifier:(id)a6 scrollIdentifier:(id)a7 ancestorScrollIdentifier:(id)a8 scrollPolicy:(id)a9 pageGap:(double)a10 gradientInsets:(UIEdgeInsets)a11 gradientFraction:(UIEdgeInsets)a12 acceptsDrop:(BOOL)a13 dropHandler:(id)a14 decelerationRate:(double)a15
{
  double bottom;
  double left;
  double top;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  TUIEmbeddedCollectionViewRenderModel *v33;
  TUIRenderModelView *v34;
  double right;

  right = a11.right;
  bottom = a11.bottom;
  left = a11.left;
  top = a11.top;
  v25 = a14;
  v26 = a9;
  v27 = a8;
  v28 = a7;
  v29 = a6;
  v30 = a5;
  v31 = a4;
  v32 = a3;
  v33 = -[TUIEmbeddedCollectionViewRenderModel initWithUpdateController:uid:UUID:]([TUIEmbeddedCollectionViewRenderModel alloc], "initWithUpdateController:uid:UUID:", v32, v31, v30);

  -[TUIEmbeddedCollectionViewRenderModel setScrollPolicy:](v33, "setScrollPolicy:", v26);
  -[TUIEmbeddedCollectionViewRenderModel setPageGap:](v33, "setPageGap:", a10);
  -[TUIEmbeddedCollectionViewRenderModel setGradientInsets:](v33, "setGradientInsets:", top, left, bottom, right);
  -[TUIEmbeddedCollectionViewRenderModel setGradientFraction:](v33, "setGradientFraction:", a12.top, a12.left, a12.bottom, a12.right);
  -[TUIEmbeddedCollectionViewRenderModel setIdentifier:](v33, "setIdentifier:", v29);
  -[TUIEmbeddedCollectionViewRenderModel setAcceptsDrop:](v33, "setAcceptsDrop:", a13);
  -[TUIEmbeddedCollectionViewRenderModel setDropHandler:](v33, "setDropHandler:", v25);

  -[TUIEmbeddedCollectionViewRenderModel setDecelerationRate:](v33, "setDecelerationRate:", a15);
  -[TUIEmbeddedCollectionViewRenderModel setScrollIdentifier:](v33, "setScrollIdentifier:", v28);

  -[TUIEmbeddedCollectionViewRenderModel setAncestorScrollIdentifier:](v33, "setAncestorScrollIdentifier:", v27);
  v34 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierEmbeddedCollectionView"), v29, v33);

  return v34;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIEmbeddedCollectionView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v7.receiver, v7.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  -[TUIEmbeddedCollectionView configureWithModel:](self, "configureWithModel:", v6);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIEmbeddedCollectionView;
  -[TUIEmbeddedCollectionView didMoveToWindow](&v3, "didMoveToWindow");
  -[TUIEmbeddedCollectionView _updateVisibilityCollector](self, "_updateVisibilityCollector");
  -[TUIVisibilityCollector updateVisible](self->_visibilityCollector, "updateVisible");
}

- (void)setFactory:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_factory, obj);
    -[TUIEmbeddedCollectionView _updateModel](self, "_updateModel");
    v5 = obj;
  }

}

- (void)setUpdateController:(id)a3
{
  TUIRenderUpdateCollectionController *v5;
  TUIRenderUpdateCollectionController **p_updateController;
  TUIRenderUpdateCollectionController *updateController;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double y;
  void *v13;
  void *v14;
  TUIFeedView *feedView;
  double v16;
  double v17;
  void *v18;
  void *v19;
  TUIRenderUpdateCollectionController *v20;

  v5 = (TUIRenderUpdateCollectionController *)a3;
  p_updateController = &self->_updateController;
  updateController = self->_updateController;
  if (updateController == v5)
    goto LABEL_12;
  v20 = v5;
  -[TUIRenderUpdateCollectionController unregisterDelegate:](updateController, "unregisterDelegate:", self);
  objc_storeStrong((id *)&self->_updateController, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollectionController registerDelegate:](*p_updateController, "registerDelegate:", self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "first"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  -[TUIFeedView setControllerHost:](self->_feedView, "setControllerHost:", v10);

  -[TUIFeedView reloadWithRenderModel:](self->_feedView, "reloadWithRenderModel:", v9);
  if (objc_msgSend(v9, "layoutDirection") == (char *)&dword_0 + 2
    && -[TUIFeedView effectiveUserInterfaceLayoutDirection](self->_feedView, "effectiveUserInterfaceLayoutDirection") != (char *)&dword_0 + 1)
  {
    v11 = 4;
  }
  else
  {
    if (objc_msgSend(v9, "layoutDirection") != (char *)&dword_0 + 1
      || !-[TUIFeedView effectiveUserInterfaceLayoutDirection](self->_feedView, "effectiveUserInterfaceLayoutDirection"))
    {
      goto LABEL_9;
    }
    v11 = 3;
  }
  -[TUIFeedView setSemanticContentAttribute:](self->_feedView, "setSemanticContentAttribute:", v11);
LABEL_9:
  y = CGPointZero.y;
  -[TUIFeedView setContentOffset:](self->_feedView, "setContentOffset:", CGPointZero.x, y);
  -[TUIEmbeddedCollectionView _updateInsets:](self, "_updateInsets:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView _collectionRenderModel](self, "_collectionRenderModel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anchorSet"));

  if (v14)
  {
    feedView = self->_feedView;
    -[TUIFeedView contentOffset](feedView, "contentOffset");
    objc_msgSend(v14, "proposeAnchorOffsetWithScrollView:velocity:target:", feedView, CGPointZero.x, y, v16, v17);
    -[TUIFeedView setContentOffset:](self->_feedView, "setContentOffset:");
  }
  -[TUIRenderUpdateCollectionController applyInitialUpdate](*p_updateController, "applyInitialUpdate");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView controllerHost](self->_feedView, "controllerHost"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "triggerStateManager"));
  objc_msgSend(v19, "registerEmbeddedCollectionDelegate:", self);

  v5 = v20;
LABEL_12:

}

- (void)_resetUpdateController
{
  -[TUIEmbeddedCollectionView configureWithModel:](self, "configureWithModel:", 0);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIEmbeddedCollectionView;
  -[TUIReusableBaseView prepareForReuse](&v3, "prepareForReuse");
  -[TUIEmbeddedCollectionView _resetUpdateController](self, "_resetUpdateController");
  -[TUIFeedView setContentOffset:](self->_feedView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
}

- (void)viewWillDisplay
{
  void *v3;
  TUIEmbeddedCollectionViewRenderModel *renderModel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TUIPagedScrollableProviding *v10;
  TUIPagedScrollableProviding *pagedScrollable;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUIEmbeddedCollectionView;
  -[TUIReusableBaseView viewWillDisplay](&v14, "viewWillDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  -[TUIFeedView setControllerHost:](self->_feedView, "setControllerHost:", v3);

  renderModel = self->_renderModel;
  if (renderModel)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel identifier](renderModel, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUUID](self, "tui_querySectionUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tui_identifierByPrependingUUID:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pagedScrollableController"));
    v10 = (TUIPagedScrollableProviding *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "registerPagedScrollableWithWithIdentifier:action:", v7, self));
    pagedScrollable = self->_pagedScrollable;
    self->_pagedScrollable = v10;

    -[TUIEmbeddedCollectionView _updatePagedScrollable](self, "_updatePagedScrollable");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView controllerHost](self->_feedView, "controllerHost"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "embeddedScrollViewCoordinator"));
  objc_msgSend(v13, "registerEmbeddedScrollView:", self);

}

- (void)viewDidEndDisplay
{
  TUIEmbeddedCollectionViewRenderModel *renderModel;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TUIPagedScrollableProviding *pagedScrollable;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TUIScrollablePolicy *scrollPolicy;
  TUIScrollableObserverInstance *scrollObserver;
  objc_super v16;

  if (self->_pagedScrollable)
  {
    renderModel = self->_renderModel;
    if (renderModel)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel identifier](renderModel, "identifier"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUUID](self, "tui_querySectionUUID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tui_identifierByPrependingUUID:", v5));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pagedScrollableController"));
      objc_msgSend(v8, "unregisterPagedScrollableWithIdentifier:", v6);

      pagedScrollable = self->_pagedScrollable;
      self->_pagedScrollable = 0;

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)TUIEmbeddedCollectionView;
  -[TUIReusableBaseView viewDidEndDisplay](&v16, "viewDidEndDisplay");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView controllerHost](self->_feedView, "controllerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "triggerStateManager"));
  objc_msgSend(v11, "unregisterEmbeddedCollectionDelegate:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView controllerHost](self->_feedView, "controllerHost"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "embeddedScrollViewCoordinator"));
  objc_msgSend(v13, "unregisterEmbeddedScrollView:", self);

  -[TUIFeedView setControllerHost:](self->_feedView, "setControllerHost:", 0);
  scrollPolicy = self->_scrollPolicy;
  self->_scrollPolicy = 0;

  -[TUIScrollableObserverInstance reset](self->_scrollObserver, "reset");
  scrollObserver = self->_scrollObserver;
  self->_scrollObserver = 0;

  -[TUIEmbeddedCollectionView _updateVisibilityCollector](self, "_updateVisibilityCollector");
  -[TUIEmbeddedCollectionView _resetUpdateController](self, "_resetUpdateController");
}

- (void)appendRenderOverrideObservers:(id)a3
{
  -[TUIFeedView appendRenderOverrideObservers:](self->_feedView, "appendRenderOverrideObservers:", a3);
}

- (void)_updateInsets:(id)a3
{
  TUIEmbeddedCollectionViewRenderModel *renderModel;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets *p_insets;
  char *v15;
  double v16;
  double left;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  _QWORD v27[13];

  renderModel = self->_renderModel;
  v5 = a3;
  -[TUIEmbeddedCollectionViewRenderModel _computedContentInsetsWithRenderModel:](renderModel, "_computedContentInsetsWithRenderModel:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  p_insets = &self->_insets;
  self->_insets.top = -v6;
  self->_insets.left = -v8;
  self->_insets.bottom = -v10;
  self->_insets.right = -v12;
  v15 = (char *)objc_msgSend(v5, "layoutDirection");

  if (v15 == (_BYTE *)&dword_0 + 2)
    v16 = v9;
  else
    v16 = v13;
  if (v15 == (_BYTE *)&dword_0 + 2)
    v9 = v13;
  -[TUIEmbeddedCollectionView bounds](self, "bounds");
  left = self->_insets.left;
  v19 = p_insets->top + v18;
  v21 = v20 - (left + self->_insets.right);
  v23 = v22 - (p_insets->top + self->_insets.bottom);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_890EC;
  v27[3] = &unk_240238;
  v27[4] = self;
  *(double *)&v27[5] = v7;
  *(double *)&v27[6] = v9;
  *(double *)&v27[7] = v11;
  *(double *)&v27[8] = v16;
  *(double *)&v27[9] = v24 + left;
  *(CGFloat *)&v27[10] = v19;
  *(double *)&v27[11] = v21;
  *(double *)&v27[12] = v23;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "viewVisibilityController"));
  objc_msgSend(v26, "updatedVisibleBoundsOfScrollView:", self->_feedView);

}

- (void)applyUpdate:(id)a3 controller:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  TUIRenderUpdateCollectionController *v10;
  id updated;
  NSObject *v12;
  TUIRenderUpdateCollectionController *updateController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = (TUIRenderUpdateCollectionController *)a4;
  updated = TUIViewUpdateLog();
  v12 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_17D8C8(self, v8, v12);

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  updateController = self->_updateController;

  if (updateController == v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
    -[TUIEmbeddedCollectionView _updateInsets:](self, "_updateInsets:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hostingController"));

    objc_msgSend(v16, "beginViewUpdates");
    objc_msgSend(v8, "applyToFeedView:completion:", self->_feedView, v9);
    objc_msgSend(v16, "endViewUpdates");
    -[TUIVisibilityCollector updateSections](self->_visibilityCollector, "updateSections");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView renderModel](self->_feedView, "renderModel"));
    -[TUIEmbeddedCollectionView visibleBounds](self, "visibleBounds");
    objc_msgSend(v17, "updateVisibleBounds:");

  }
  else if (v9)
  {
    v9[2](v9);
  }

}

- (void)configureWithModel:(id)a3
{
  TUIEmbeddedCollectionViewRenderModel **p_renderModel;
  TUIVisibilityCollector *visibilityCollector;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TUIPagedScrollableProviding *pagedScrollable;
  TUIScrollablePolicy *scrollPolicy;
  TUIScrollablePolicy *v14;
  TUIScrollableObserverInstance *scrollObserver;
  TUIScrollablePolicy *v16;
  TUIScrollablePolicy *v17;
  TUIScrollablePolicy *v18;
  TUIFeedView *feedView;
  void *v20;
  void *v21;
  void *v22;
  TUIScrollableObserverInstance *v23;
  TUIScrollableObserverInstance *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  TUIPagedScrollableProviding *v30;
  TUIPagedScrollableProviding *v31;
  TUIEmbeddedCollectionViewRenderModel *v32;

  p_renderModel = &self->_renderModel;
  v32 = (TUIEmbeddedCollectionViewRenderModel *)a3;
  if (*p_renderModel != v32)
  {
    -[TUIVisibilityCollector teardown](self->_visibilityCollector, "teardown");
    visibilityCollector = self->_visibilityCollector;
    self->_visibilityCollector = 0;

    if (self->_pagedScrollable && *p_renderModel)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel identifier](*p_renderModel, "identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUUID](self, "tui_querySectionUUID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tui_identifierByPrependingUUID:", v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pagedScrollableController"));
      objc_msgSend(v11, "unregisterPagedScrollableWithIdentifier:", v9);

      pagedScrollable = self->_pagedScrollable;
      self->_pagedScrollable = 0;

    }
    objc_storeStrong((id *)&self->_renderModel, a3);
    -[TUIEmbeddedCollectionViewRenderModel prepare](*p_renderModel, "prepare");
    -[TUIEmbeddedCollectionView _updateModel](self, "_updateModel");
    scrollPolicy = self->_scrollPolicy;
    v14 = (TUIScrollablePolicy *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel scrollPolicy](*p_renderModel, "scrollPolicy"));

    if (scrollPolicy != v14)
    {
      -[TUIScrollableObserverInstance reset](self->_scrollObserver, "reset");
      scrollObserver = self->_scrollObserver;
      self->_scrollObserver = 0;

      v16 = (TUIScrollablePolicy *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel scrollPolicy](*p_renderModel, "scrollPolicy"));
      v17 = self->_scrollPolicy;
      self->_scrollPolicy = v16;

      if ((objc_opt_respondsToSelector(self->_scrollPolicy, "newScrollableObserverInstanceWithView:host:uuid:uid:") & 1) != 0)
      {
        v18 = self->_scrollPolicy;
        feedView = self->_feedView;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel UUID](*p_renderModel, "UUID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel uid](*p_renderModel, "uid"));
        v23 = (TUIScrollableObserverInstance *)-[TUIScrollablePolicy newScrollableObserverInstanceWithView:host:uuid:uid:](v18, "newScrollableObserverInstanceWithView:host:uuid:uid:", feedView, v20, v21, v22);
        v24 = self->_scrollObserver;
        self->_scrollObserver = v23;

        -[TUIEmbeddedCollectionView _updateScrollObserver](self, "_updateScrollObserver");
      }
    }
    -[TUIEmbeddedCollectionView _updateVisibilityCollector](self, "_updateVisibilityCollector");
    if (*p_renderModel)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel identifier](*p_renderModel, "identifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUUID](self, "tui_querySectionUUID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tui_identifierByPrependingUUID:", v26));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pagedScrollableController"));
      v30 = (TUIPagedScrollableProviding *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "registerPagedScrollableWithWithIdentifier:action:", v27, self));
      v31 = self->_pagedScrollable;
      self->_pagedScrollable = v30;

      -[TUIEmbeddedCollectionView _updatePagedScrollable](self, "_updatePagedScrollable");
    }
  }

}

- (CGRect)_leadingGradientFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double top;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  -[TUIEmbeddedCollectionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[TUIEmbeddedCollectionView bounds](self, "bounds");
  top = self->_insets.top;
  v9 = v8 + top;
  v11 = v10 - (top + self->_insets.bottom);
  -[TUIEmbeddedCollectionViewRenderModel gradientInsets](self->_renderModel, "gradientInsets");
  v13 = v12;
  -[TUIEmbeddedCollectionViewRenderModel gradientFraction](self->_renderModel, "gradientFraction");
  v15 = v14;
  v20.origin.x = v4;
  v20.origin.y = v9;
  v20.size.width = v6;
  v20.size.height = v11;
  v16 = CGRectGetMinX(v20) + fmin(v13, 0.0);
  v17 = fabs(v13 * v15);
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v17;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (CGRect)_trailingGradientFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MaxX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect result;

  -[TUIEmbeddedCollectionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[TUIEmbeddedCollectionView bounds](self, "bounds");
  top = self->_insets.top;
  v9 = v8 + top;
  v11 = v10 - (top + self->_insets.bottom);
  -[TUIEmbeddedCollectionViewRenderModel gradientInsets](self->_renderModel, "gradientInsets");
  v13 = v12;
  -[TUIEmbeddedCollectionViewRenderModel gradientFraction](self->_renderModel, "gradientFraction");
  v15 = v14;
  v22.origin.x = v4;
  v22.origin.y = v9;
  v22.size.width = v6;
  v22.size.height = v11;
  MaxX = CGRectGetMaxX(v22);
  v17 = v13 * (1.0 - v15);
  if (v13 >= 0.0)
    v17 = v13 * v15;
  v18 = MaxX - v17;
  v19 = fabs(v13 * v15);
  v20 = v9;
  v21 = v11;
  result.size.height = v21;
  result.size.width = v19;
  result.origin.y = v20;
  result.origin.x = v18;
  return result;
}

- (void)_updateModel
{
  id WeakRetained;
  double top;
  double left;
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
  double v17;
  _BOOL8 v18;
  _TUIEmbeddedCollectionGradientView *v19;
  _TUIEmbeddedCollectionGradientView *v20;
  _TUIEmbeddedCollectionGradientView *leadingGradientView;
  _TUIEmbeddedCollectionGradientView *v22;
  _TUIEmbeddedCollectionGradientView *v23;
  _TUIEmbeddedCollectionGradientView *trailingGradientView;
  void *v25;
  unsigned int v26;
  void *v27;
  _TUIEmbeddedCollectionGradientView *v28;
  _TUIEmbeddedCollectionGradientView *v29;
  _TUIEmbeddedCollectionGradientView *v30;
  void *v31;
  void *v32;
  TUIEmbeddedCollectionViewRenderModel *renderModel;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[9];

  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  if (WeakRetained)
  {
    if (self->_renderModel)
    {
      -[TUIEmbeddedCollectionView bounds](self, "bounds");
      top = self->_insets.top;
      left = self->_insets.left;
      v7 = v6 + left;
      v9 = v8 + top;
      v11 = v10 - (left + self->_insets.right);
      v13 = v12 - (top + self->_insets.bottom);
      -[TUIEmbeddedCollectionViewRenderModel gradientInsets](self->_renderModel, "gradientInsets");
      v15 = v14;
      v17 = v16;
      v18 = v16 != 0.0 || v14 != 0.0;
      if (!self->_feedView)
      {
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_89A6C;
        v37[3] = &unk_240260;
        v37[4] = self;
        *(double *)&v37[5] = v7;
        *(double *)&v37[6] = v9;
        *(double *)&v37[7] = v11;
        *(double *)&v37[8] = v13;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v37);
      }
      if (v18)
      {
        if (!self->_leadingGradientView && v15 != 0.0)
        {
          v19 = [_TUIEmbeddedCollectionGradientView alloc];
          -[TUIEmbeddedCollectionView _leadingGradientFrame](self, "_leadingGradientFrame");
          v20 = -[_TUIEmbeddedCollectionGradientView initWithFrame:](v19, "initWithFrame:");
          leadingGradientView = self->_leadingGradientView;
          self->_leadingGradientView = v20;

          -[_TUIEmbeddedCollectionGradientView configureGradientWithAxis:leading:](self->_leadingGradientView, "configureGradientWithAxis:leading:", 1, 1);
          -[TUIEmbeddedCollectionView addSubview:](self, "addSubview:", self->_leadingGradientView);
        }
        -[TUIEmbeddedCollectionView _leadingGradientFrame](self, "_leadingGradientFrame");
        -[_TUIEmbeddedCollectionGradientView setFrame:](self->_leadingGradientView, "setFrame:");
        if (!self->_trailingGradientView && v17 != 0.0)
        {
          v22 = [_TUIEmbeddedCollectionGradientView alloc];
          -[TUIEmbeddedCollectionView _trailingGradientFrame](self, "_trailingGradientFrame");
          v23 = -[_TUIEmbeddedCollectionGradientView initWithFrame:](v22, "initWithFrame:");
          trailingGradientView = self->_trailingGradientView;
          self->_trailingGradientView = v23;

          -[_TUIEmbeddedCollectionGradientView configureGradientWithAxis:leading:](self->_trailingGradientView, "configureGradientWithAxis:leading:", 1, 0);
          -[TUIEmbeddedCollectionView addSubview:](self, "addSubview:", self->_trailingGradientView);
        }
        -[TUIEmbeddedCollectionView _trailingGradientFrame](self, "_trailingGradientFrame");
        -[_TUIEmbeddedCollectionGradientView setFrame:](self->_trailingGradientView, "setFrame:");
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView layer](self, "layer"));
      v26 = objc_msgSend(v25, "allowsGroupBlending");

      if (v18 != v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView layer](self, "layer"));
        objc_msgSend(v27, "setAllowsGroupBlending:", v18);

      }
      v28 = self->_leadingGradientView;
      if (v28 && v15 == 0.0)
      {
        -[_TUIEmbeddedCollectionGradientView removeFromSuperview](v28, "removeFromSuperview");
        v29 = self->_leadingGradientView;
        self->_leadingGradientView = 0;

        v28 = self->_leadingGradientView;
      }
      if (v28)
      {
        if (v17 == 0.0)
        {
          -[_TUIEmbeddedCollectionGradientView removeFromSuperview](self->_trailingGradientView, "removeFromSuperview");
          v30 = self->_trailingGradientView;
          self->_trailingGradientView = 0;

        }
      }
      -[TUIFeedView setFrame:](self->_feedView, "setFrame:", v7, v9, v11, v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "viewVisibilityController"));
      objc_msgSend(v32, "updatedVisibleBoundsOfScrollView:", self->_feedView);

      renderModel = self->_renderModel;
    }
    else
    {
      renderModel = 0;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel uid](renderModel, "uid"));
    -[TUIFeedView setRenderQueryUID:](self->_feedView, "setRenderQueryUID:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel UUID](self->_renderModel, "UUID"));
    -[TUIFeedView setRenderQueryUUID:](self->_feedView, "setRenderQueryUUID:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel updateController](self->_renderModel, "updateController"));
    -[TUIEmbeddedCollectionView setUpdateController:](self, "setUpdateController:", v36);

    -[TUIEmbeddedCollectionView _updateVisibilityCollector](self, "_updateVisibilityCollector");
  }
}

- (id)_collectionRenderModel
{
  return -[TUIFeedView renderModel](self->_feedView, "renderModel");
}

- (void)_updateVisibilityCollector
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TUIVisibilityCollector *v9;
  TUIVisibilityCollector *visibilityCollector;
  TUIVisibilityCollector *v11;
  TUIVisibilityCollector *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView controllerHost](self->_feedView, "controllerHost"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibilityController"));

  v4 = objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView _collectionRenderModel](self, "_collectionRenderModel"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView window](self, "window")),
        v6,
        v5,
        v6))
  {
    if (!self->_visibilityCollector)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel scrollIdentifier](self->_renderModel, "scrollIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel ancestorScrollIdentifier](self->_renderModel, "ancestorScrollIdentifier"));
      v9 = (TUIVisibilityCollector *)objc_msgSend(v13, "newCollectorForProvider:withIdentifier:parentIdentifier:", self, v7, v8);
      visibilityCollector = self->_visibilityCollector;
      self->_visibilityCollector = v9;

      -[TUIVisibilityCollector updateSections](self->_visibilityCollector, "updateSections");
      -[TUIVisibilityCollector updateVisible](self->_visibilityCollector, "updateVisible");
    }
  }
  else
  {
    v11 = self->_visibilityCollector;
    if (v11)
    {
      -[TUIVisibilityCollector teardown](v11, "teardown");
      v12 = self->_visibilityCollector;
      self->_visibilityCollector = 0;

    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  id v13;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView _collectionRenderModel](self, "_collectionRenderModel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anchorSet"));

  if (a5 && v10)
  {
    objc_msgSend(v10, "proposeAnchorOffsetWithScrollView:velocity:target:", v13, x, y, a5->x, a5->y);
    a5->x = v11;
    a5->y = v12;
  }

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[TUIEmbeddedCollectionView _updateScrollObserver](self, "_updateScrollObserver", a3);
  -[TUIEmbeddedCollectionView _updatePagedScrollable](self, "_updatePagedScrollable");
  -[TUIVisibilityCollector updateVisibleBounds](self->_visibilityCollector, "updateVisibleBounds");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[TUIEmbeddedCollectionView _updateScrollObserver](self, "_updateScrollObserver", a3);
  -[TUIEmbeddedCollectionView _updatePagedScrollable](self, "_updatePagedScrollable");
  -[TUIVisibilityCollector updateVisibleBounds](self->_visibilityCollector, "updateVisibleBounds");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[TUIEmbeddedCollectionView _updateScrollObserver](self, "_updateScrollObserver", a3);
  -[TUIEmbeddedCollectionView _updatePagedScrollable](self, "_updatePagedScrollable");
  -[TUIVisibilityCollector updateVisibleBounds](self->_visibilityCollector, "updateVisibleBounds");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    -[TUIEmbeddedCollectionView _updateScrollObserver](self, "_updateScrollObserver", a3);
    -[TUIEmbeddedCollectionView _updatePagedScrollable](self, "_updatePagedScrollable");
    -[TUIVisibilityCollector updateVisibleBounds](self->_visibilityCollector, "updateVisibleBounds");
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[TUIVisibilityCollector updateVisibleBounds](self->_visibilityCollector, "updateVisibleBounds");
  -[TUIEmbeddedCollectionView _updateScrollObserver](self, "_updateScrollObserver");
  -[TUIEmbeddedCollectionView _updatePagedScrollable](self, "_updatePagedScrollable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewVisibilityController"));
  objc_msgSend(v5, "updatedVisibleBoundsOfScrollView:", self->_feedView);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView _collectionRenderModel](self, "_collectionRenderModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anchorSet"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "computeTriggerStatesInScrollView:axis:", v11, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView controllerHost](self->_feedView, "controllerHost"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "triggerStateManager"));
    objc_msgSend(v10, "updateEmbeddedTriggerStatesWithNewStates:updateEvent:", v8, 3);

  }
}

- (void)_updateScrollObserver
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
  id v13;

  if ((-[TUIFeedView isDragging](self->_feedView, "isDragging") & 1) != 0)
    v3 = &dword_0 + 1;
  else
    v3 = -[TUIFeedView isDecelerating](self->_feedView, "isDecelerating");
  -[TUIEmbeddedCollectionView visibleBounds](self, "visibleBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollectionController renderModel](self->_updateController, "renderModel"));
  if (objc_msgSend(v13, "layoutDirection") == (char *)&dword_0 + 2)
  {
    objc_msgSend(v13, "size");
    v5 = v12 - v9 - v5;
  }
  -[TUIScrollableObserverInstance updateScrollingWithVisibleBounds:active:](self->_scrollObserver, "updateScrollingWithVisibleBounds:active:", v3, v5, v7, v9, v11);

}

- (void)_updatePagedScrollable
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;

  if (self->_pagedScrollable)
  {
    -[TUIFeedView contentOffset](self->_feedView, "contentOffset");
    v4 = v3;
    -[TUIEmbeddedCollectionViewRenderModel pageGap](self->_renderModel, "pageGap");
    v6 = v5;
    -[TUIEmbeddedCollectionView bounds](self, "bounds");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollectionController renderModel](self->_updateController, "renderModel"));
    objc_msgSend(v9, "size");
    v11 = v10;

    v12 = v4 - self->_insets.left;
    v13 = vcvtpd_u64_f64((v6 + v11) / (v6 + v8));
    v14 = v8 + v12;
    v15 = floor(fmax(v12, 0.0) / (v6 + v8));
    if (v14 >= v11)
      v15 = (double)(v13 - 1);
    -[TUIPagedScrollableProviding updateWithPageIndex:pageCount:](self->_pagedScrollable, "updateWithPageIndex:pageCount:", (unint64_t)v15);
  }
}

- (void)pagedScrollableActionChangeToPageIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double left;
  double v10;
  double v11;

  -[TUIFeedView contentOffset](self->_feedView, "contentOffset");
  v6 = v5;
  -[TUIEmbeddedCollectionView bounds](self, "bounds");
  v8 = v7;
  left = self->_insets.left;
  -[TUIEmbeddedCollectionViewRenderModel pageGap](self->_renderModel, "pageGap");
  v11 = left + (double)a3 * (v8 + v10);
  -[TUIFeedView bounds](self->_feedView, "bounds");
  -[TUIFeedView tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:](self->_feedView, "tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:", 0, self->_feedView, v11, v6);
  -[TUIFeedView setContentOffset:animated:](self->_feedView, "setContentOffset:animated:", 1);
}

- (void)parentFeedDidUpdateTriggerStatesWithEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView _collectionRenderModel](self, "_collectionRenderModel"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anchorSet"));

  v6 = v11;
  if (v11)
  {
    if (a3 == 1)
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "feedNotVisibleTriggerStatesForAxis:", 1));
    else
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "computeTriggerStatesInScrollView:axis:", self->_feedView, 1));
    v8 = v7;
    if (objc_msgSend(v7, "hasUpdates"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView controllerHost](self->_feedView, "controllerHost"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "triggerStateManager"));
      objc_msgSend(v10, "updateEmbeddedTriggerStatesWithNewStates:updateEvent:", v8, a3);

    }
    v6 = v11;
  }

}

- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5
{
  TUIViewFactory **p_factory;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;

  p_factory = &self->_factory;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_factory);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewFactoryDequeueReusableSubviewWithReuseIdentifier:indexPath:host:", v10, v9, v8));

  return v12;
}

- (void)viewFactoryPrepareToReuseHost:(id)a3
{
  TUIViewFactory **p_factory;
  id v4;
  void *v5;
  id WeakRetained;

  p_factory = &self->_factory;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_factory);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "subviewPool"));
  objc_msgSend(v5, "prepareToReuseHost:", v4);

}

- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4
{
  TUIViewFactory **p_factory;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  p_factory = &self->_factory;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_factory);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "subviewPool"));
  objc_msgSend(v8, "reuseSubviews:host:", v7, v6);

}

- (TUIReusableSubviewPool)subviewPool
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "subviewPool"));

  return (TUIReusableSubviewPool *)v3;
}

- (id)viewStateSave
{
  TUIEmbeddedCollectionViewState *v3;
  void *v4;
  id v5;

  v3 = objc_opt_new(TUIEmbeddedCollectionViewState);
  -[TUIFeedView saveViewStateForVisibleViews](self->_feedView, "saveViewStateForVisibleViews");
  -[TUIFeedView contentOffset](self->_feedView, "contentOffset");
  -[TUIEmbeddedCollectionViewState setContentOffset:](v3, "setContentOffset:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView currentViewState](self->_feedView, "currentViewState"));
  v5 = objc_msgSend(v4, "copy");
  -[TUIEmbeddedCollectionViewState setEmbeddedState:](v3, "setEmbeddedState:", v5);

  return v3;
}

- (void)viewStateRestore:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    v8 = v7;
    -[TUIFeedView bounds](self->_feedView, "bounds");
    -[TUIFeedView tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:](self->_feedView, "tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:", 0, self->_feedView, v6 - self->_insets.left, v8 - self->_insets.top, v9 + self->_insets.left + self->_insets.right, v10 + self->_insets.top + self->_insets.bottom);
    -[TUIFeedView setContentOffset:](self->_feedView, "setContentOffset:");
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "embeddedState"));

    v11 = objc_msgSend(v12, "mutableCopy");
    -[TUIFeedView setCurrentViewState:](self->_feedView, "setCurrentViewState:", v11);

  }
}

- (BOOL)acceptsDrop
{
  return -[TUIEmbeddedCollectionViewRenderModel acceptsDrop](self->_renderModel, "acceptsDrop");
}

- (TUIElementActionTriggerHandler)dropHandler
{
  return -[TUIEmbeddedCollectionViewRenderModel dropHandler](self->_renderModel, "dropHandler");
}

- (id)visibilityProviderHostingLayer
{
  return -[TUIFeedView layer](self->_feedView, "layer");
}

- (id)visibilityProviderWindowLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView window](self->_feedView, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));

  return v3;
}

- (CGRect)visibilityProviderVisibleBounds
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView layer](self->_feedView, "layer"));
  objc_msgSend(v2, "bounds");
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

- (id)visibilityProviderSections
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView _collectionRenderModel](self, "_collectionRenderModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sections"));

  return v3;
}

- (BOOL)visibilityProviderIsVisible
{
  BOOL v3;
  void *v4;

  if ((-[TUIEmbeddedCollectionView isHidden](self, "isHidden") & 1) != 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionView window](self, "window"));
  v3 = v4 != 0;

  return v3;
}

- (BOOL)visibilityProviderIsScrolling
{
  if ((-[TUIFeedView isDragging](self->_feedView, "isDragging") & 1) != 0
    || (-[TUIFeedView isTracking](self->_feedView, "isTracking") & 1) != 0
    || (-[TUIFeedView isDecelerating](self->_feedView, "isDecelerating") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[TUIFeedView _isAnimatingScroll](self->_feedView, "_isAnimatingScroll");
  }
}

- (CGRect)visibleBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TUIFeedView bounds](self->_feedView, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)scrollView
{
  return self->_feedView;
}

- (void)updateWithImpressionSnapshot:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[TUIFeedView setImpressionSnapshot:](self->_feedView, "setImpressionSnapshot:", v4);

}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4;
  id v5;
  TUIEmbeddedCollectionView *v6;
  TUIEmbeddedCollectionViewRenderModel *renderModel;
  void *v8;
  unsigned int v9;
  TUIEmbeddedCollectionView *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIEmbeddedCollectionView;
  v5 = -[TUIReusableBaseView descendentViewWithIdentifier:](&v12, "descendentViewWithIdentifier:", v4);
  v6 = (TUIEmbeddedCollectionView *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    renderModel = self->_renderModel;
    if (renderModel
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedCollectionViewRenderModel scrollIdentifier](renderModel, "scrollIdentifier")),
          v9 = objc_msgSend(v4, "isEqual:", v8),
          v8,
          v9))
    {
      v10 = self;
    }
    else
    {
      v10 = (TUIEmbeddedCollectionView *)objc_claimAutoreleasedReturnValue(-[TUIFeedView descendentViewWithIdentifier:](self->_feedView, "descendentViewWithIdentifier:", v4));
    }
    v6 = v10;
  }

  return v6;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIEmbeddedCollectionView;
  v5 = -[TUIReusableBaseView descendentViewWithRefId:](&v8, "descendentViewWithRefId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView descendentViewWithRefId:](self->_feedView, "descendentViewWithRefId:", v4));

  return v6;
}

- (TUIViewFactory)factory
{
  return (TUIViewFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (TUIRenderUpdateCollectionController)updateController
{
  return self->_updateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_pagedScrollable, 0);
  objc_storeStrong((id *)&self->_visibilityCollector, 0);
  objc_storeStrong((id *)&self->_trailingGradientView, 0);
  objc_storeStrong((id *)&self->_leadingGradientView, 0);
  objc_storeStrong((id *)&self->_feedView, 0);
  objc_storeStrong((id *)&self->_scrollObserver, 0);
  objc_storeStrong((id *)&self->_scrollPolicy, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
