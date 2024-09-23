@implementation TUIFeedView

- (TUIFeedView)initWithCoder:(id)a3
{
  id v4;
  TUIFeedView *v5;
  TUIFeedView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIFeedView;
  v5 = -[TUIFeedView initWithCoder:](&v8, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
    -[TUIFeedView _tui_commonInit](v5, "_tui_commonInit");

  return v6;
}

- (TUIFeedView)initWithFrame:(CGRect)a3
{
  TUIFeedView *v3;
  TUIFeedView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIFeedView;
  v3 = -[TUIFeedView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUIFeedView _tui_commonInit](v3, "_tui_commonInit");
  return v4;
}

- (void)_tui_commonInit
{
  CGSize size;
  TUILiveFloatingLayoutController *v4;
  TUILiveFloatingLayoutController *liveFloatingLayoutController;
  TUILivePinningLayoutController *v6;
  TUILivePinningLayoutController *livePinningLayoutController;
  TUILiveOverscrollingLayoutController *v8;
  TUILiveOverscrollingLayoutController *liveOverscrollingLayoutController;
  TUIMutableViewState *v10;
  TUIMutableViewState *currentViewState;
  id v12;

  size = CGRectNull.size;
  self->_previousVisibleBounds.origin = CGRectNull.origin;
  self->_previousVisibleBounds.size = size;
  sub_11CEA0(self);
  v4 = objc_alloc_init(TUILiveFloatingLayoutController);
  liveFloatingLayoutController = self->_liveFloatingLayoutController;
  self->_liveFloatingLayoutController = v4;

  v6 = objc_alloc_init(TUILivePinningLayoutController);
  livePinningLayoutController = self->_livePinningLayoutController;
  self->_livePinningLayoutController = v6;

  v8 = objc_alloc_init(TUILiveOverscrollingLayoutController);
  liveOverscrollingLayoutController = self->_liveOverscrollingLayoutController;
  self->_liveOverscrollingLayoutController = v8;

  v10 = objc_alloc_init(TUIMutableViewState);
  currentViewState = self->_currentViewState;
  self->_currentViewState = v10;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "_scrollViewDidEndDeceleration:", _UIScrollViewDidEndDeceleratingNotification, self);

}

- (void)addSectionView:(id)a3 respectingZIndex:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  BOOL v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderModel"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "config");
    v8 = v39;
  }
  else
  {
    v8 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView subviews](self, "subviews"));
  v10 = v9;
  if (v4 && objc_msgSend(v9, "count"))
  {
    v31 = v10;
    v11 = objc_opt_class(TUIFeedSectionView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    v13 = TUIDynamicCast(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (!v14)
      goto LABEL_12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "renderModel"));
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "config");
      v17 = v39;
    }
    else
    {
      v17 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
    }
    v18 = v17 > v8;

    if (!v18)
    {
      -[TUIFeedView addSubview:](self, "addSubview:", v5);
    }
    else
    {
LABEL_12:
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v19 = v31;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            v24 = objc_opt_class(TUIFeedSectionView);
            v25 = TUIDynamicCast(v24, v23);
            v26 = (id)objc_claimAutoreleasedReturnValue(v25);

            v14 = v26;
            if (v26)
              v27 = v26 == v5;
            else
              v27 = 1;
            if (!v27)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "renderModel"));
              v29 = v28;
              if (v28)
              {
                objc_msgSend(v28, "config");
                v30 = v39;
              }
              else
              {
                v30 = 0;
                v37 = 0;
                v38 = 0;
                v39 = 0;
              }

              if (v8 < v30)
              {
                -[TUIFeedView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v5, v23);
LABEL_32:

                goto LABEL_33;
              }
              if (v8 == v30)
              {
                -[TUIFeedView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, v14);
                goto LABEL_32;
              }
            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
          if (v20)
            continue;
          break;
        }
      }

      -[TUIFeedView addSubview:](self, "addSubview:", v5);
    }
LABEL_33:

    v10 = v31;
  }
  else
  {
    -[TUIFeedView addSubview:](self, "addSubview:", v5);
  }

}

- (void)setCurrentViewState:(id)a3
{
  TUIMutableViewState *v4;
  TUIMutableViewState *v5;
  NSArray *sectionModels;
  TUIMutableViewState *v7;
  TUIMutableViewState *v8;
  _QWORD v9[4];
  TUIMutableViewState *v10;

  v4 = (TUIMutableViewState *)a3;
  v5 = v4;
  if (self->_currentViewState != v4)
  {
    if (!v4)
      v5 = objc_alloc_init(TUIMutableViewState);
    v7 = v5;
    objc_storeStrong((id *)&self->_currentViewState, v5);
    sectionModels = self->_sectionModels;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_11E22C;
    v9[3] = &unk_241D78;
    v8 = v7;
    v10 = v8;
    -[NSArray enumerateObjectsUsingBlock:](sectionModels, "enumerateObjectsUsingBlock:", v9);

    v5 = v8;
  }

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  id v5;
  NSArray *sectionModels;
  _QWORD v7[5];
  objc_super v8;

  v5 = -[TUIFeedView semanticContentAttribute](self, "semanticContentAttribute");
  v8.receiver = self;
  v8.super_class = (Class)TUIFeedView;
  -[TUIFeedView setSemanticContentAttribute:](&v8, "setSemanticContentAttribute:", a3);
  if (v5 != (id)a3)
  {
    sectionModels = self->_sectionModels;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_11E2F8;
    v7[3] = &unk_241D98;
    v7[4] = a3;
    -[NSArray enumerateObjectsUsingBlock:](sectionModels, "enumerateObjectsUsingBlock:", v7);
    sub_11CEA0(self);
    -[TUIFeedView reloadWithRenderModel:](self, "reloadWithRenderModel:", self->_renderModel);
  }
}

- (void)renderReferenceOverridesChanged
{
  void *v3;
  NSArray *v4;
  NSArray *overrides;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controllerHost);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "renderOverrideProvider"));
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "renderOverrides"));
  overrides = self->_overrides;
  self->_overrides = v4;

}

- (void)setControllerHost:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  NSArray *v8;
  NSArray *overrides;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controllerHost);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_controllerHost, obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "renderOverrideProvider"));
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderOverrides"));
    overrides = self->_overrides;
    self->_overrides = v8;

    v5 = obj;
  }

}

- (void)invalidateRenderReferenceOverride:(id)a3
{
  TUIRenderModelCollection *renderModel;
  void *v5;
  id v6;

  v6 = a3;
  renderModel = self->_renderModel;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection uids](renderModel, "uids"));
  -[TUIRenderModelCollection invalidateRenderOverride:flags:feedView:uids:](renderModel, "invalidateRenderOverride:flags:feedView:uids:", v6, 0, self, v5);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUIFeedView bounds](self, "bounds");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)TUIFeedView;
    -[TUIFeedView setBounds:](&v8, "setBounds:", x, y, width, height);
    if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      *(_BYTE *)&self->_flags |= 1u;
      -[TUIFeedView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUIFeedView frame](self, "frame");
  v27.origin.x = v8;
  v27.origin.y = v9;
  v27.size.width = v10;
  v27.size.height = v11;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  if (!CGRectEqualToRect(v25, v27))
  {
    -[TUIFeedView bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v24.receiver = self;
    v24.super_class = (Class)TUIFeedView;
    -[TUIFeedView setFrame:](&v24, "setFrame:", x, y, width, height);
    -[TUIFeedView bounds](self, "bounds");
    v28.origin.x = v20;
    v28.origin.y = v21;
    v28.size.width = v22;
    v28.size.height = v23;
    v26.origin.x = v13;
    v26.origin.y = v15;
    v26.size.width = v17;
    v26.size.height = v19;
    if (!CGRectEqualToRect(v26, v28) && (*(_BYTE *)&self->_flags & 1) == 0)
    {
      *(_BYTE *)&self->_flags |= 1u;
      -[TUIFeedView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)layoutSubviews
{
  char flags;
  TUIRenderModelCollection *renderModel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIFeedView;
  -[TUIFeedView layoutSubviews](&v5, "layoutSubviews");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags = flags & 0xFE;
    -[TUIFeedView _updateVisibleSubviews](self, "_updateVisibleSubviews");
    renderModel = self->_renderModel;
    -[TUIFeedView bounds](self, "bounds");
    -[TUIRenderModelCollection updateVisibleBounds:](renderModel, "updateVisibleBounds:");
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        return;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)&self->_flags = flags & 0xFD;
  -[TUIFeedView _updateInvalidatedSubviews](self, "_updateInvalidatedSubviews");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return;
LABEL_4:
  -[TUIFeedView _updateVisibleOverlays](self, "_updateVisibleOverlays");
}

- (void)_scrollViewDidEndDeceleration:(id)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  -[TUIFeedView setNeedsLayout](self, "setNeedsLayout", a3);
}

- (BOOL)_shouldExtendVisibleBounds:(CGRect)a3
{
  void *v3;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned __int8 v9;
  BOOL v10;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock");
  if ((v9 & 1) != 0
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView window](self, "window")),
        objc_msgSend(v3, "isRotating")))
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v10 = CGRectIntersectsRect(v12, self->_previousVisibleBounds);
    if ((v9 & 1) != 0)
      return v10;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CGRect)_visibleBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  -[TUIFeedView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (qword_2CB778 != -1)
    dispatch_once(&qword_2CB778, &stru_241FB8);
  v11 = *(double *)&qword_2CA3C8;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  v12 = -(v11 * CGRectGetWidth(v22));
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v13 = -(v11 * CGRectGetHeight(v23));
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v25 = CGRectInset(v24, v12, v13);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  if (-[TUIFeedView _shouldExtendVisibleBounds:](self, "_shouldExtendVisibleBounds:"))
  {
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v27 = CGRectUnion(v26, self->_previousVisibleBounds);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_updateVisibleSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  _QWORD v12[9];

  -[TUIFeedView _visibleBounds](self, "_visibleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  self->_previousVisibleBounds.origin.x = v3;
  self->_previousVisibleBounds.origin.y = v5;
  self->_previousVisibleBounds.size.width = v7;
  self->_previousVisibleBounds.size.height = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_11EA34;
  v12[3] = &unk_241DC0;
  v12[4] = self;
  *(CGFloat *)&v12[5] = v4;
  *(CGFloat *)&v12[6] = v6;
  *(CGFloat *)&v12[7] = v8;
  *(CGFloat *)&v12[8] = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

- (void)_updateInvalidatedSubviews
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11EC40;
  v4[3] = &unk_241DE8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (void)setRenderModel:(id)a3
{
  TUIRenderModelCollection *v5;
  TUIRenderModelCollection **p_renderModel;
  TUIFeedViewInvalidationContext *v7;
  void *v8;
  id v9;
  TUIRenderModelCollection *v10;

  v5 = (TUIRenderModelCollection *)a3;
  p_renderModel = &self->_renderModel;
  if (self->_renderModel != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v7 = objc_alloc_init(TUIFeedViewInvalidationContext);
    -[TUILiveFloatingLayoutController setRenderModel:withInvalidationContext:](self->_liveFloatingLayoutController, "setRenderModel:withInvalidationContext:", *p_renderModel, v7);
    -[TUILivePinningLayoutController setRenderModel:withInvalidationContext:](self->_livePinningLayoutController, "setRenderModel:withInvalidationContext:", *p_renderModel, v7);
    -[TUILiveOverscrollingLayoutController setRenderModel:withInvalidationContext:](self->_liveOverscrollingLayoutController, "setRenderModel:withInvalidationContext:", *p_renderModel, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewInvalidationContext invalidatedIndexPaths](v7, "invalidatedIndexPaths"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
      -[TUIFeedView invalidateWithContext:](self, "invalidateWithContext:", v7);

    v5 = v10;
  }

}

- (void)reloadWithRenderModel:(id)a3
{
  id v4;
  TUIRenderModelCollection *renderModel;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  NSArray *v14;
  NSArray *sectionViews;
  NSArray *v16;
  NSArray *sectionModels;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  NSMutableArray *v23;
  NSMutableArray *v24;

  v4 = a3;
  renderModel = self->_renderModel;
  self->_renderModel = 0;

  v6 = objc_opt_new(NSMutableArray);
  v7 = objc_opt_new(NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "matchingSectionUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "matchingSectionUID"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_11F038;
  v19[3] = &unk_241E38;
  v19[4] = self;
  v18 = v4;
  v20 = v18;
  v10 = v8;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  v12 = v6;
  v23 = v12;
  v13 = v7;
  v24 = v13;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
  v14 = (NSArray *)-[NSMutableArray copy](v12, "copy");
  sectionViews = self->_sectionViews;
  self->_sectionViews = v14;

  v16 = (NSArray *)-[NSMutableArray copy](v13, "copy");
  sectionModels = self->_sectionModels;
  self->_sectionModels = v16;

  *(_BYTE *)&self->_flags |= 1u;
  -[TUIFeedView setNeedsLayout](self, "setNeedsLayout");

}

- (id)liveLayoutAttributesForRenderModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  int *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "liveTransform"));
  v6 = objc_msgSend(v5, "kind");
  if (v6 == (id)objc_opt_class(TUIFloatingLiveTransform))
  {
    v10 = &OBJC_IVAR___TUIFeedView__liveFloatingLayoutController;
LABEL_8:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v10), "liveAttributesForRenderModel:", v4));
    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "kind");
  if (v7 == (id)objc_opt_class(TUIPinningLiveTransform))
  {
    v10 = &OBJC_IVAR___TUIFeedView__livePinningLayoutController;
    goto LABEL_8;
  }
  v8 = objc_msgSend(v5, "kind");
  if (v8 == (id)objc_opt_class(TUIOverscrollingLiveTransform))
  {
    v10 = &OBJC_IVAR___TUIFeedView__liveOverscrollingLayoutController;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)updateLiveTransformsIfNecessaryWithViewSize:(double)a3 contentOffset:(double)a4 contentInsets:(double)a5 safeAreaInsets:(double)a6 hasTabBar:(double)a7
{
  char *v26;
  double bottom;
  void *v29;
  id v30;
  TUIFeedViewInvalidationContext *v32;

  v32 = objc_alloc_init(TUIFeedViewInvalidationContext);
  v26 = (char *)objc_msgSend(a1, "contentInsetAdjustmentBehavior");
  if (v26 == (_BYTE *)&dword_0 + 2)
    top = UIEdgeInsetsZero.top;
  bottom = UIEdgeInsetsZero.bottom;
  objc_msgSend(a1[23], "didUpdateContentOffset:withInvalidationContext:", v32, a4, a5 + top);
  if (v26 == (_BYTE *)&dword_0 + 2)
    a14 = bottom;
  if (a8 > a14)
    a14 = a8;
  objc_msgSend(a1[24], "updatePinningTransformsWithViewBounds:adjustedViewBounds:invalidationContext:hasTabBar:", v32, a10, a4, a5, a2, a3, a4, a6 + a5 + top, a2, a3 - (a6 + top + a14));
  objc_msgSend(a1[25], "updateOverscrollingTransformsWithContentOffset:invalidationContext:", v32, a4, a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewInvalidationContext invalidatedIndexPaths](v32, "invalidatedIndexPaths"));
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    objc_msgSend(a1, "invalidateWithContext:", v32);
    objc_msgSend(a1, "layoutIfNeeded");
  }

}

- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  double x;
  double y;
  double width;
  double height;
  void *v15;
  _QWORD *v16;
  void *v17;
  dispatch_time_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[9];
  CGRect v22;
  CGRect v23;

  v7 = a5;
  v10 = a3;
  -[TUIFeedView saveViewStateForVisibleViews](self, "saveViewStateForVisibleViews");
  -[TUIRenderModelCollection boundingRectForMatchingQuery:viewState:](self->_renderModel, "boundingRectForMatchingQuery:viewState:", v10, self->_currentViewState);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v23.origin.x = CGRectNull.origin.x;
  v23.origin.y = CGRectNull.origin.y;
  v23.size.width = CGRectNull.size.width;
  v23.size.height = CGRectNull.size.height;
  if (!CGRectEqualToRect(v22, v23))
  {
    -[TUIFeedView tui_scrollToRect:atScrollPosition:animated:delegate:](self, "tui_scrollToRect:atScrollPosition:animated:delegate:", a4, v7, self, x, y, width, height);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView scrollingDelegate](self, "scrollingDelegate"));
    objc_msgSend(v15, "didScrollToQuery:", v10);

    if (UIAccessibilityIsVoiceOverRunning() && !a6)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_11FA38;
      v21[3] = &unk_241E60;
      *(double *)&v21[5] = x;
      *(double *)&v21[6] = y;
      *(double *)&v21[7] = width;
      *(double *)&v21[8] = height;
      v21[4] = self;
      v16 = objc_retainBlock(v21);
      v17 = v16;
      if (v7)
      {
        v18 = dispatch_time(0, 1000000000);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_11FBD0;
        v19[3] = &unk_23F2E0;
        v20 = v17;
        dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, v19);

      }
      else
      {
        ((void (*)(_QWORD *))v16[2])(v16);
      }

    }
  }

}

- (UIEdgeInsets)contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView rectScrollingDelegate](self, "rectScrollingDelegate"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView rectScrollingDelegate](self, "rectScrollingDelegate"));
    objc_msgSend(v9, "contentInsetsForScrollingToRectWithContentInsets:", top, left, bottom, right);
    top = v10;
    left = v11;
    bottom = v12;
    right = v13;

  }
  v14 = top;
  v15 = left;
  v16 = bottom;
  v17 = right;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGPoint)contentOffsetFromProposedContentOffset:(CGPoint)a3 atScrollPosition:(unint64_t)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection anchorSet](self->_renderModel, "anchorSet", a4));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection anchorSet](self->_renderModel, "anchorSet"));
    objc_msgSend(v8, "proposeAnchorOffsetWithScrollView:velocity:target:", self, CGPointZero.x, CGPointZero.y, x, y);
    x = v9;
    y = v10;

  }
  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)_updateLayoutAttributes:(id)a3
{
  id v3;
  NSUUID *renderQueryUUID;
  void *v5;
  void *v6;
  NSString *renderQueryUID;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  TUIRenderReferenceIdentifier *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id obj;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *i;
  NSArray *v28;
  void *v29;
  void *v30;
  void *v31;
  NSUUID *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v20 = a3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v20;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "indexPath"));
        v3 = objc_msgSend(v25, "tui_section");
        renderQueryUUID = self->_renderQueryUUID;
        if (renderQueryUUID)
        {
          v32 = renderQueryUUID;
        }
        else
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v3));
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entry"));
          v32 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));

        }
        renderQueryUID = self->_renderQueryUID;
        if (renderQueryUID)
        {
          v8 = renderQueryUID;
        }
        else
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v3));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entry"));
          v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uid"));

        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "refId"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "refInstance"));
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v28 = self->_overrides;
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v34 != v12)
                objc_enumerationMutation(v28);
              v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
              v15 = (TUIRenderReferenceIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "query"));
              if (-[TUIRenderReferenceIdentifier matchesUUID:uid:](v15, "matchesUUID:uid:", v32, v8))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "query"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "renderModel"));
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
                v19 = objc_msgSend(v16, "matchesRefId:refInstance:identifier:", v29, v30, v18);

                if (!v19)
                  continue;
                v15 = -[TUIRenderReferenceIdentifier initWithUUID:uid:refId:refInstance:]([TUIRenderReferenceIdentifier alloc], "initWithUUID:uid:refId:refInstance:", v32, v8, v29, v30);
                objc_msgSend(v14, "updateLayoutAttributes:forIdentifier:", v31, v15);
              }

            }
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v11);
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v24);
  }

}

- (void)setImpressionSnapshot:(id)a3
{
  TUIImpressionSnapshot *v5;
  TUIFeedViewInvalidationContext *v6;
  void *v7;
  id v8;
  TUIImpressionSnapshot *v9;

  v5 = (TUIImpressionSnapshot *)a3;
  if (self->_impressionSnapshot != v5)
  {
    v9 = v5;
    v6 = objc_alloc_init(TUIFeedViewInvalidationContext);
    -[TUIFeedView _invalidateImpressionsWithContext:](self, "_invalidateImpressionsWithContext:", v6);
    objc_storeStrong((id *)&self->_impressionSnapshot, a3);
    -[TUIFeedView _invalidateImpressionsWithContext:](self, "_invalidateImpressionsWithContext:", v6);
    -[TUIFeedView _updateHasOverlays](self, "_updateHasOverlays");
    -[TUIFeedView _updateVisibleOverlays](self, "_updateVisibleOverlays");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewInvalidationContext invalidatedIndexPaths](v6, "invalidatedIndexPaths"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      *(_BYTE *)&self->_flags |= 1u;
      -[TUIFeedView setNeedsLayout](self, "setNeedsLayout");
      -[TUIFeedView invalidateWithContext:](self, "invalidateWithContext:", v6);
    }

    v5 = v9;
  }

}

- (void)_invalidateImpressionsWithContext:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  if (self->_impressionSnapshot)
  {
    v5 = objc_opt_new(NSMutableArray);
    -[TUIRenderModelCollection appendImpressionLayoutAttributes:forElementsInRect:snapshot:](self->_renderModel, "appendImpressionLayoutAttributes:forElementsInRect:snapshot:", v5, self->_impressionSnapshot, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "indexPath", (_QWORD)v11));
          objc_msgSend(v4, "invalidateIndexPath:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)setStats:(id)a3
{
  TUIStatsFeed **p_stats;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  NSDictionary *statsIndicatorViews;
  CGFloat Width;
  BOOL v12;
  double v13;
  double v14;
  NSMutableArray *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *j;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  TUIRenderModelTransform *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  TUIStatsFeed *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  CGRect v48;

  p_stats = &self->_stats;
  v36 = (TUIStatsFeed *)a3;
  if (*p_stats != v36)
  {
    objc_storeStrong((id *)&self->_stats, a3);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_statsIndicatorViews, "allValues", v36));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v7);
    }

    statsIndicatorViews = self->_statsIndicatorViews;
    self->_statsIndicatorViews = 0;

    -[TUIFeedView bounds](self, "bounds");
    Width = CGRectGetWidth(v48);
    v12 = Width > 320.0;
    v13 = Width + -10.0;
    if (v12)
      v14 = 310.0;
    else
      v14 = v13;
    v15 = objc_opt_new(NSMutableArray);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[TUIStatsFeed currentEntriesUID](*p_stats, "currentEntriesUID"));
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v16)
    {
      v17 = 0;
      v18 = *(_QWORD *)v39;
      v19 = 0.0;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", (char *)j + v17));

          objc_msgSend(v23, "offset");
          v26 = v25;
          if (v24 <= v19)
            v27 = v19;
          else
            v27 = v24;
          v28 = v27;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[TUIStatsIndicatorView renderModelWithIdentifier:stats:uid:](TUIStatsIndicatorView, "renderModelWithIdentifier:stats:uid:", &off_253C10, *p_stats, v21));
          v30 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", v29);
          -[TUIRenderModelTransform setZIndex:](v30, "setZIndex:", 1000);
          -[TUIRenderModelTransform size](v30, "size");
          -[TUIRenderModelTransform setSize:](v30, "setSize:", v14);
          -[TUIRenderModelTransform size](v30, "size");
          v32 = v31;
          -[TUIRenderModelTransform size](v30, "size");
          -[TUIRenderModelTransform setCenter:](v30, "setCenter:", v26 + v32 * 0.5 + 5.0, v28 + v33 * 0.5 + 5.0);
          -[NSMutableArray addObject:](v15, "addObject:", v30);
          objc_msgSend(v29, "size");
          v35 = v34;

          v19 = v28 + v35 + 5.0;
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        v17 += (uint64_t)j;
      }
      while (v16);
    }

    objc_storeStrong((id *)&self->_statsIndicatorModels, v15);
    -[TUIFeedView _updateHasOverlays](self, "_updateHasOverlays");
    -[TUIFeedView _updateVisibleOverlays](self, "_updateVisibleOverlays");

  }
}

- (void)_updateHasOverlays
{
  char v2;

  if (self->_impressionSnapshot)
    v2 = 4;
  else
    v2 = 4 * (self->_stats != 0);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v2;
}

- (void)_updateVisibleOverlays
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSArray *statsIndicatorModels;
  NSDictionary *v13;
  NSDictionary *statsIndicatorViews;
  NSDictionary *v15;
  _QWORD v16[5];
  NSDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  -[TUIFeedView _visibleBounds](self, "_visibleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", self->_statsIndicatorViews);
  statsIndicatorModels = self->_statsIndicatorModels;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1209FC;
  v16[3] = &unk_241E88;
  v16[4] = self;
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  v13 = (NSDictionary *)v11;
  v17 = v13;
  -[NSArray enumerateObjectsUsingBlock:](statsIndicatorModels, "enumerateObjectsUsingBlock:", v16);
  statsIndicatorViews = self->_statsIndicatorViews;
  self->_statsIndicatorViews = v13;
  v15 = v13;

}

- (void)applyUpdateCollection:(id)a3 updates:(id)a4
{
  void (**v7)(_QWORD);
  TUIRenderUpdateCollection **p_currentUpdateCollection;
  TUIRenderUpdateCollection *v9;
  id v10;

  v10 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v7)
  {
    p_currentUpdateCollection = &self->_currentUpdateCollection;
    objc_storeStrong((id *)p_currentUpdateCollection, a3);
    v7[2](v7);
    v9 = *p_currentUpdateCollection;
    *p_currentUpdateCollection = 0;

  }
}

- (void)performBatchUpdatesWithRenderModel:(id)a3 flags:(unint64_t)a4 block:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  TUIIndexMapper *v12;
  void *v13;
  TUIIndexMapper *v14;
  TUIIndexMapper *sectionIndexMapper;
  void *v16;
  unsigned int v17;
  dispatch_group_t v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD *v22;
  void *v23;
  NSObject *v24;
  OS_dispatch_group *animatedUpdateCompletionGroup;
  void *v26;
  TUIIndexMapper *v27;
  void (**v28)(_QWORD);
  _QWORD v29[4];
  NSObject *v30;
  _QWORD v31[5];
  id v32;
  NSObject *v33;
  id v34;
  unint64_t v35;
  char v36;

  v10 = a3;
  v11 = (void (**)(_QWORD))a5;
  v28 = (void (**)(_QWORD))a6;
  v12 = [TUIIndexMapper alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
  v14 = -[TUIIndexMapper initWithCount:](v12, "initWithCount:", objc_msgSend(v13, "count"));
  sectionIndexMapper = self->_sectionIndexMapper;
  self->_sectionIndexMapper = v14;

  v11[2](v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIAnimationState currentState](_TUIAnimationState, "currentState"));
  v17 = objc_msgSend(v16, "shouldCaptureCALayerAnimations", v16, v10);
  if (v17)
    v18 = dispatch_group_create();
  else
    v18 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_121064;
  v31[3] = &unk_241F48;
  v31[4] = self;
  v19 = v10;
  v32 = v19;
  v35 = a4;
  v20 = v18;
  v33 = v20;
  v36 = v17;
  v21 = v16;
  v34 = v21;
  v22 = objc_retainBlock(v31);
  v23 = v22;
  if (v17)
  {
    objc_storeStrong((id *)&self->_animatedUpdateCompletionGroup, v18);
    dispatch_group_enter(v20);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_122024;
    v29[3] = &unk_241F70;
    v24 = v20;
    v30 = v24;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v23, v29, 0.0, 0.0);
    animatedUpdateCompletionGroup = self->_animatedUpdateCompletionGroup;
    self->_animatedUpdateCompletionGroup = 0;

    v26 = v28;
    if (v28)
      TUIDispatchGroupNotifyViaRunloopIfMain(v24, &_dispatch_main_q, v28);

  }
  else
  {
    v26 = v28;
    ((void (*)(_QWORD *))v22[2])(v22);
    if (v28)
      v28[2](v28);
  }
  v27 = self->_sectionIndexMapper;
  self->_sectionIndexMapper = 0;

}

- (void)insertSections:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_122088;
  v3[3] = &unk_241F98;
  v3[4] = self;
  objc_msgSend(a3, "enumerateIndexesUsingBlock:", v3);
}

- (void)deleteSections:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1220FC;
  v3[3] = &unk_241F98;
  v3[4] = self;
  objc_msgSend(a3, "enumerateIndexesUsingBlock:", v3);
}

- (void)moveSection:(unint64_t)a3 toSection:(unint64_t)a4
{
  -[TUIIndexMapper moveFromIndex:toIndex:](self->_sectionIndexMapper, "moveFromIndex:toIndex:", a3, a4);
}

- (void)_invalidateIndexPaths:(id)a3
{
  NSUInteger v4;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  unsigned __int8 v14;
  NSArray *sectionModels;
  id v16;
  void *v17;
  id v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  NSUInteger v30;
  __int16 v31;
  NSArray *v32;
  _BYTE v33[128];

  v19 = a3;
  v4 = -[NSArray count](self->_sectionModels, "count");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v19;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "tui_section");
        if ((unint64_t)v10 >= v4)
        {
          if (_TUIDeviceHasInternalInstall())
          {
            v12 = TUIDefaultLog();
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              sectionModels = self->_sectionModels;
              *(_DWORD *)buf = 134218498;
              v28 = v10;
              v29 = 2048;
              v30 = v4;
              v31 = 2112;
              v32 = sectionModels;
              _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "invalid section addressed: %lu (of %lu) with _sectionModels: %@", buf, 0x20u);
            }

            if (_TUIDeviceHasInternalInstall())
            {
              v16 = objc_alloc((Class)NSException);
              v25 = CFSTR("indexPath");
              v26 = v9;
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
              v18 = objc_msgSend(v16, "initWithName:reason:userInfo:", CFSTR("InvalidSection"), CFSTR("An invalid indexPath was used"), v17);

              objc_exception_throw(v18);
            }
          }
          v11 = 0;
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionModels, "objectAtIndexedSubscript:", v10));
        }
        v14 = objc_msgSend(v11, "invalidateViewAtIndexPath:", v9);

        v6 |= v14;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v5);

    if ((v6 & 1) != 0 && (*(_BYTE *)&self->_flags & 2) == 0)
    {
      *(_BYTE *)&self->_flags |= 2u;
      -[TUIFeedView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {

  }
}

- (id)viewAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "tui_section");
  if (v5 >= (id)-[NSArray count](self->_sectionModels, "count"))
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionModels, "objectAtIndexedSubscript:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleViewAtIndexPath:", v4));

  }
  return v7;
}

- (void)invalidateWithContext:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "invalidatedIndexPaths"));
  -[TUIFeedView _invalidateIndexPaths:](self, "_invalidateIndexPaths:");

}

+ (BOOL)areFeedUpdatesAnimated
{
  if (qword_2CB770)
    return objc_msgSend((id)qword_2CB770, "BOOLValue");
  else
    return +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
}

+ (void)performAnimatedFeedUpdates:(id)a3
{
  void (**v3)(void);
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void (**v9)(void);

  v3 = (void (**)(void))a3;
  if (v3)
  {
    v9 = v3;
    v4 = (id)qword_2CB770;
    if (!qword_2CB770)
    {
      v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled")));
      v6 = (void *)qword_2CB770;
      qword_2CB770 = v5;

    }
    v7 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
    v9[2]();
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v7);
    v8 = (void *)qword_2CB770;
    qword_2CB770 = (uint64_t)v4;

    v3 = v9;
  }

}

- (void)suspendReuseOfView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));
  v6 = objc_msgSend(v5, "tui_section");

  if (v6 < (id)-[NSArray count](self->_sectionModels, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionModels, "objectAtIndexedSubscript:", v6));
    objc_msgSend(v7, "suspendReuseOfView:", v8);

  }
}

- (void)resumeReuseOfView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));
  v6 = objc_msgSend(v5, "tui_section");

  if (v6 < (id)-[NSArray count](self->_sectionModels, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sectionModels, "objectAtIndexedSubscript:", v6));
    objc_msgSend(v7, "resumeReuseOfView:", v8);

  }
}

- (id)visibleViews
{
  NSMutableArray *v3;
  NSArray *sectionModels;
  NSMutableArray *v5;
  id v6;
  _QWORD v8[4];
  NSMutableArray *v9;

  v3 = objc_opt_new(NSMutableArray);
  sectionModels = self->_sectionModels;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_12285C;
  v8[3] = &unk_241D78;
  v5 = v3;
  v9 = v5;
  -[NSArray enumerateObjectsUsingBlock:](sectionModels, "enumerateObjectsUsingBlock:", v8);
  v6 = -[NSMutableArray copy](v5, "copy");

  return v6;
}

- (void)appendRenderOverrideObservers:(id)a3
{
  id v4;
  NSArray *sectionModels;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "addObject:", self);
  sectionModels = self->_sectionModels;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_122918;
  v7[3] = &unk_241D78;
  v6 = v4;
  v8 = v6;
  -[NSArray enumerateObjectsUsingBlock:](sectionModels, "enumerateObjectsUsingBlock:", v7);

}

- (void)saveViewStateForVisibleViews
{
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedView visibleViews](self, "visibleViews"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewStateSave"));
        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutAttributes"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPath"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection identifierForViewAtIndexPath:](self->_renderModel, "identifierForViewAtIndexPath:", v9));
          -[TUIMutableViewState setViewState:forIdentifier:](self->_currentViewState, "setViewState:forIdentifier:", v7, v10);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

- (void)restoreViewStateForVisibleViews
{
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedView visibleViews](self, "visibleViews"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutAttributes"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPath"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection identifierForViewAtIndexPath:](self->_renderModel, "identifierForViewAtIndexPath:", v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIViewState viewStateForIdentifier:](self->_currentViewState, "viewStateForIdentifier:", v9));
        objc_msgSend(v6, "viewStateRestore:", v10);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  NSArray *obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tui_identifierUUID"));

  if (v5)
  {
    v47 = 0uLL;
    v48 = 0uLL;
    v45 = 0uLL;
    v46 = 0uLL;
    obj = self->_sectionModels;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v46;
      v30 = *(_QWORD *)v46;
      while (1)
      {
        v32 = v6;
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "renderModel"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tui_identifierUUID"));
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if (v14)
          {
            v15 = objc_opt_new(NSMutableArray);
            objc_msgSend(v10, "appendVisibleView:", v15);
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v16 = v15;
            v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v42;
              while (2)
              {
                for (j = 0; j != v17; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v42 != v18)
                    objc_enumerationMutation(v16);
                  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "descendentViewWithIdentifier:", v4));

                  if (v20)
                  {
                    v21 = v16;
                    v7 = (void *)v20;
                    goto LABEL_29;
                  }
                  v7 = 0;
                }
                v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
                v7 = 0;
                if (v17)
                  continue;
                break;
              }

LABEL_19:
              v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tui_identifierWithoutUUID"));
              v39 = 0u;
              v40 = 0u;
              v37 = 0u;
              v38 = 0u;
              v22 = v16;
              v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
              if (v23)
              {
                v24 = *(_QWORD *)v38;
LABEL_21:
                v25 = 0;
                while (1)
                {
                  if (*(_QWORD *)v38 != v24)
                    objc_enumerationMutation(v22);
                  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v25), "descendentViewWithIdentifier:", v21));
                  if (v7)
                    break;
                  if (v23 == (id)++v25)
                  {
                    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
                    if (v23)
                      goto LABEL_21;
                    goto LABEL_27;
                  }
                }
              }
              else
              {
LABEL_27:
                v7 = 0;
              }

              v8 = v30;
LABEL_29:

            }
            else
            {

              if (!v7)
                goto LABEL_19;
            }

            continue;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
        if (!v6)
          goto LABEL_43;
      }
    }
    goto LABEL_42;
  }
  v35 = 0uLL;
  v36 = 0uLL;
  v33 = 0uLL;
  v34 = 0uLL;
  obj = (NSArray *)objc_claimAutoreleasedReturnValue(-[TUIFeedView visibleViews](self, "visibleViews"));
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (!v26)
  {
LABEL_42:
    v7 = 0;
    goto LABEL_43;
  }
  v27 = *(_QWORD *)v34;
LABEL_36:
  v28 = 0;
  while (1)
  {
    if (*(_QWORD *)v34 != v27)
      objc_enumerationMutation(obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v28), "descendentViewWithIdentifier:", v4));
    if (v7)
      break;
    if (v26 == (id)++v28)
    {
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      if (v26)
        goto LABEL_36;
      goto LABEL_42;
    }
  }
LABEL_43:

  return v7;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView visibleViews](self, "visibleViews", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "descendentViewWithRefId:", v4));
      if (v9)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v5 = objc_opt_class(TUIUIKitButton);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TUIFeedView;
    v8 = -[TUIFeedView touchesShouldCancelInContentView:](&v10, "touchesShouldCancelInContentView:", v4);
  }

  return v8;
}

- (double)_contentBottomForScrollObservation
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIFeedView;
  -[TUIFeedView _contentBottomForScrollObservation](&v5, "_contentBottomForScrollObservation");
  -[TUIFeedView bounds](self, "bounds");
  return self->_contentHeightFactorForScrollingGuess * v3;
}

- (BOOL)_accessibilityScrollingEnabled
{
  return 1;
}

- (TUIFeedViewSubviewsDelegate)subviewsDelegate
{
  return (TUIFeedViewSubviewsDelegate *)objc_loadWeakRetained((id *)&self->_subviewsDelegate);
}

- (void)setSubviewsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_subviewsDelegate, a3);
}

- (TUIFeedViewRectScrollingDelegate)rectScrollingDelegate
{
  return (TUIFeedViewRectScrollingDelegate *)objc_loadWeakRetained((id *)&self->_rectScrollingDelegate);
}

- (void)setRectScrollingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rectScrollingDelegate, a3);
}

- (TUIFeedViewScrollDelegate)scrollingDelegate
{
  return (TUIFeedViewScrollDelegate *)objc_loadWeakRetained((id *)&self->_scrollingDelegate);
}

- (void)setScrollingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollingDelegate, a3);
}

- (TUIStatsFeed)stats
{
  return self->_stats;
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (TUIViewFactory)viewFactory
{
  return (TUIViewFactory *)objc_loadWeakRetained((id *)&self->_viewFactory);
}

- (void)setViewFactory:(id)a3
{
  objc_storeWeak((id *)&self->_viewFactory, a3);
}

- (TUIImpressionSnapshot)impressionSnapshot
{
  return self->_impressionSnapshot;
}

- (TUIFeedControllerHosting)controllerHost
{
  return (TUIFeedControllerHosting *)objc_loadWeakRetained((id *)&self->_controllerHost);
}

- (TUILiveFloatingLayoutController)liveFloatingLayoutController
{
  return self->_liveFloatingLayoutController;
}

- (void)setLiveFloatingLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_liveFloatingLayoutController, a3);
}

- (TUILivePinningLayoutController)livePinningLayoutController
{
  return self->_livePinningLayoutController;
}

- (void)setLivePinningLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_livePinningLayoutController, a3);
}

- (TUILiveOverscrollingLayoutController)liveOverscrollingLayoutController
{
  return self->_liveOverscrollingLayoutController;
}

- (void)setLiveOverscrollingLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_liveOverscrollingLayoutController, a3);
}

- (NSUUID)renderQueryUUID
{
  return self->_renderQueryUUID;
}

- (void)setRenderQueryUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)renderQueryUID
{
  return self->_renderQueryUID;
}

- (void)setRenderQueryUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (TUIMutableViewState)currentViewState
{
  return self->_currentViewState;
}

- (unint64_t)applyPhase
{
  return self->_applyPhase;
}

- (void)setApplyPhase:(unint64_t)a3
{
  self->_applyPhase = a3;
}

- (double)contentHeightFactorForScrollingGuess
{
  return self->_contentHeightFactorForScrollingGuess;
}

- (void)setContentHeightFactorForScrollingGuess:(double)a3
{
  self->_contentHeightFactorForScrollingGuess = a3;
}

- (NSArray)overrides
{
  return self->_overrides;
}

- (TUIRenderUpdateCollection)currentUpdateCollection
{
  return self->_currentUpdateCollection;
}

- (OS_dispatch_group)animatedUpdateCompletionGroup
{
  return self->_animatedUpdateCompletionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedUpdateCompletionGroup, 0);
  objc_storeStrong((id *)&self->_currentUpdateCollection, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_currentViewState, 0);
  objc_storeStrong((id *)&self->_renderQueryUID, 0);
  objc_storeStrong((id *)&self->_renderQueryUUID, 0);
  objc_storeStrong((id *)&self->_liveOverscrollingLayoutController, 0);
  objc_storeStrong((id *)&self->_livePinningLayoutController, 0);
  objc_storeStrong((id *)&self->_liveFloatingLayoutController, 0);
  objc_destroyWeak((id *)&self->_controllerHost);
  objc_storeStrong((id *)&self->_impressionSnapshot, 0);
  objc_destroyWeak((id *)&self->_viewFactory);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_destroyWeak((id *)&self->_scrollingDelegate);
  objc_destroyWeak((id *)&self->_rectScrollingDelegate);
  objc_destroyWeak((id *)&self->_subviewsDelegate);
  objc_storeStrong((id *)&self->_sectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_sectionViews, 0);
  objc_storeStrong((id *)&self->_sectionModels, 0);
  objc_storeStrong((id *)&self->_statsIndicatorViews, 0);
  objc_storeStrong((id *)&self->_statsIndicatorModels, 0);
}

@end
