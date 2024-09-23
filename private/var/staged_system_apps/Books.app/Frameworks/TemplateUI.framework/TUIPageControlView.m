@implementation TUIPageControlView

+ (id)renderModelWithStateToRenderModel:(id)a3 pressScale:(double)a4 touchInsets:(UIEdgeInsets)a5 identifier:(id)a6 pointer:(id)a7 scrollIdentifier:(id)a8 kind:(unint64_t)a9
{
  double right;
  double bottom;
  double left;
  double top;
  id v18;
  id v19;
  id v20;
  id v21;
  _TUIRenderModelPageControl *v22;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a3;
  v22 = -[_TUIRenderModelPageControl initWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:]([_TUIRenderModelPageControl alloc], "initWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:", v21, v20, v19, v18, a9, a4, top, left, bottom, right);

  return v22;
}

+ (id)tuiReuseIdentifier
{
  return CFSTR("TUIReuseIdentifierPageControlView");
}

- (void)renderModelUpdated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TUIPagedScrollable *v10;
  TUIPagedScrollable *pagedScrollable;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUIPageControlView;
  -[TUIControlView renderModelUpdated](&v12, "renderModelUpdated");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "renderModel"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scrollIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUUID](self, "tui_querySectionUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tui_identifierByPrependingUUID:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pagedScrollableController"));
  v10 = (TUIPagedScrollable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pagedScrollableWithIdentifier:", v7));

  pagedScrollable = self->_pagedScrollable;
  if (v10 != pagedScrollable)
  {
    -[TUIPagedScrollable removeObserver:](pagedScrollable, "removeObserver:", self);
    objc_storeStrong((id *)&self->_pagedScrollable, v10);
    -[TUIPagedScrollable addObserver:](self->_pagedScrollable, "addObserver:", self);
    -[TUIPageControlView _updateEnabled](self, "_updateEnabled");
  }

}

- (void)viewDidEndDisplay
{
  TUIPagedScrollable *pagedScrollable;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIPageControlView;
  -[TUIControlView viewDidEndDisplay](&v4, "viewDidEndDisplay");
  -[TUIPagedScrollable removeObserver:](self->_pagedScrollable, "removeObserver:", self);
  pagedScrollable = self->_pagedScrollable;
  self->_pagedScrollable = 0;

}

- (BOOL)showContents
{
  return self->_showContents;
}

- (void)_updateEnabled
{
  void *v3;
  uint64_t v4;
  char *v5;
  _BOOL4 v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "renderModel"));

  if (objc_msgSend(v7, "actionKind") == (char *)&dword_0 + 2
    && -[TUIPagedScrollable pageIndex](self->_pagedScrollable, "pageIndex"))
  {
    v4 = 1;
  }
  else if (objc_msgSend(v7, "actionKind") == (char *)&dword_0 + 1)
  {
    v5 = (char *)-[TUIPagedScrollable pageIndex](self->_pagedScrollable, "pageIndex") + 1;
    v4 = v5 < -[TUIPagedScrollable pageCount](self->_pagedScrollable, "pageCount");
  }
  else
  {
    v4 = 0;
  }
  if (self->_actionEnabled != (_DWORD)v4)
  {
    self->_actionEnabled = v4;
    -[TUIInteractiveBaseView setEnabled:](self, "setEnabled:", v4);
  }
  if ((unint64_t)-[TUIPagedScrollable pageCount](self->_pagedScrollable, "pageCount") > 1)
    v6 = v4;
  else
    v6 = 0;
  if (self->_showContents != v6)
  {
    self->_showContents = v6;
    -[TUIInteractiveBaseView invalidateShowContents](self, "invalidateShowContents");
  }

}

- (BOOL)isEnabledWithRenderModel:(id)a3
{
  return self->_actionEnabled;
}

- (void)_buttonPressed:(id)a3
{
  void *v4;
  TUIPagedScrollable **p_pagedScrollable;
  uint64_t v6;
  char *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView layoutAttributes](self, "layoutAttributes", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel"));

  if (objc_msgSend(v8, "actionKind") == (char *)&dword_0 + 2)
  {
    p_pagedScrollable = &self->_pagedScrollable;
    if (-[TUIPagedScrollable pageIndex](self->_pagedScrollable, "pageIndex"))
    {
      v6 = -1;
LABEL_7:
      -[TUIPagedScrollable pagedScrollableActionChangeToPageIndex:](*p_pagedScrollable, "pagedScrollableActionChangeToPageIndex:", (char *)-[TUIPagedScrollable pageIndex](*p_pagedScrollable, "pageIndex") + v6);
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v8, "actionKind") == (char *)&dword_0 + 1)
  {
    p_pagedScrollable = &self->_pagedScrollable;
    v7 = (char *)-[TUIPagedScrollable pageIndex](self->_pagedScrollable, "pageIndex") + 1;
    if (v7 < -[TUIPagedScrollable pageCount](*p_pagedScrollable, "pageCount"))
    {
      v6 = 1;
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pagedScrollable, 0);
}

@end
