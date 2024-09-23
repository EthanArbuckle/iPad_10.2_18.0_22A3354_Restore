@implementation THWPagedCanvasController

- (THWPagedCanvasController)initWithDocumentRoot:(id)a3
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  CGSize size;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWPagedCanvasController;
  v5 = -[THWPagedCanvasController init](&v11, "init");
  if (v5)
  {
    v6 = objc_opt_class(THDocumentRoot, v4);
    v7 = (id)TSUDynamicCast(v6, a3);
    *(_OWORD *)(v5 + 136) = xmmword_3146B0;
    size = CGRectNull.size;
    *(CGPoint *)(v5 + 152) = CGRectNull.origin;
    *((_QWORD *)v5 + 6) = v7;
    *(CGSize *)(v5 + 168) = size;
    *((_QWORD *)v5 + 12) = 0x7FFFFFFFFFFFFFFFLL;
    *((int64x2_t *)v5 + 7) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v5[42] = 1;
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v5 + 2) = dispatch_queue_create("com.apple.iBooks.PagedCanvasRasterize", v9);
    v5[44] = 1;
  }
  return (THWPagedCanvasController *)v5;
}

- (THWPagedCanvasController)init
{
  return -[THWPagedCanvasController initWithDocumentRoot:](self, "initWithDocumentRoot:", 0);
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_rasterizeQueue);
  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasController;
  -[THWPagedCanvasController dealloc](&v3, "dealloc");
}

- (void)invalidateViews
{
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (!self->_scrollView)
      -[TSDInteractiveCanvasController invalidateRepsIfSynced](self->_interactiveCanvasController, "invalidateRepsIfSynced");
  }
}

- (id)bookNavigatorForInteractiveCanvasController:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_delegate, "bookNavigationForPagedCanvasController:") & 1) != 0)
    return -[THWPagedCanvasControllerDelegate bookNavigationForPagedCanvasController:](self->_delegate, "bookNavigationForPagedCanvasController:", self);
  else
    return 0;
}

- (id)documentNavigatorForInteractiveCanvasController:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_delegate, "documentNavigatorForPagedCanvasController:") & 1) != 0)
    return -[THWPagedCanvasControllerDelegate documentNavigatorForPagedCanvasController:](self->_delegate, "documentNavigatorForPagedCanvasController:", self);
  else
    return 0;
}

- (BOOL)createViewIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  THScrollView **p_scrollView;
  double height;
  double width;
  double y;
  double x;
  BOOL v11;
  void *v13;
  void *v14;
  unint64_t v15;
  UIView *v16;

  if (self->_wrapperView)
    return 0;
  p_scrollView = &self->_scrollView;
  if (self->_scrollView)
    return 0;
  if (self->_layerHost)
    return 0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((-[THWPagedCanvasControllerDelegate pagedCanvasControllerDeferViewCreation:](self->_delegate, "pagedCanvasControllerDeferViewCreation:", self) & 1) != 0)return 0;
  -[THWPagedCanvasController pushDisableInfoUpdates](self, "pushDisableInfoUpdates");
  v13 = (void *)objc_opt_class(THInteractiveCanvasController);
  v14 = (void *)objc_opt_class(THScrollView);
  THCanvasAndScrollViewCreateWithClass(self, (id *)&self->_interactiveCanvasController, (id *)&self->_layerHost, p_scrollView, v13, 0, v14);
  if (self->_clippingLayerHost)
  {
    v15 = -[THWPagedCanvasController pageIndex](self, "pageIndex");
    -[THWClippingLayerHost setInteractiveCanvasController:](self->_clippingLayerHost, "setInteractiveCanvasController:", 0);
    -[THWClippingLayerHost teardownAndTransferCanvasLayersToHost:](self->_clippingLayerHost, "teardownAndTransferCanvasLayersToHost:", -[THWPagedCanvasController layerHost](self, "layerHost"));

    self->_clippingLayerHost = 0;
  }
  else
  {
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v11 = 1;
  -[THScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 1);
  v16 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
  self->_wrapperView = v16;
  -[UIView addSubview:](v16, "addSubview:", self->_scrollView);
  -[THScrollView hideScrollIndicators](self->_scrollView, "hideScrollIndicators");
  -[TSDInteractiveCanvasController disableAllGestures](self->_interactiveCanvasController, "disableAllGestures");
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasLayer"), "setAllowsPinchZoom:", 0);
  -[TSDInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](self->_interactiveCanvasController, "setNestedCanvasAllowLayoutAndRenderOnThread:", 0);
  -[TSDInteractiveCanvasController setAllowLayoutAndRenderOnThread:](self->_interactiveCanvasController, "setAllowLayoutAndRenderOnThread:", 1);
  -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](self->_interactiveCanvasController, "setCreateRepsForOffscreenLayouts:", 1);
  -[THWPagedCanvasController p_setFrame:scale:pageIndex:](self, "p_setFrame:scale:pageIndex:", v15, x, y, width, height, a4);
  -[THWPagedCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  -[THWPagedCanvasController popDisableInfoUpdates](self, "popDisableInfoUpdates");
  -[THWPagedCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  return v11;
}

- (void)p_updateWithDelegate
{
  THWPagedCanvasControllerDelegate *delegate;
  id v4;

  delegate = self->_delegate;
  if (delegate)
  {
    if (self->_scrollView)
    {
      if ((objc_opt_respondsToSelector(delegate, "pagedCanvasController:shouldDisableScrollingAtContentEdgesForScrollView:") & 1) != 0)
      {
        v4 = -[THWPagedCanvasControllerDelegate pagedCanvasController:shouldDisableScrollingAtContentEdgesForScrollView:](self->_delegate, "pagedCanvasController:shouldDisableScrollingAtContentEdgesForScrollView:", self, self->_scrollView);
        self->_mayPassScrollEventsToNextResponder = (char)v4;
        -[THScrollView setMayPassScrollEventsToNextResponder:](self->_scrollView, "setMayPassScrollEventsToNextResponder:", v4);
      }
      if ((objc_opt_respondsToSelector(self->_delegate, "pagedCanvasController:shouldDisableScrollingWhenCursorIsHiddenForScrollView:") & 1) != 0)-[THScrollView setShouldDisableScrollingWhenCursorIsHidden:](self->_scrollView, "setShouldDisableScrollingWhenCursorIsHidden:", -[THWPagedCanvasControllerDelegate pagedCanvasController:shouldDisableScrollingWhenCursorIsHiddenForScrollView:](self->_delegate, "pagedCanvasController:shouldDisableScrollingWhenCursorIsHiddenForScrollView:", self, self->_scrollView));
    }
    -[THWPagedCanvasController p_rebuildContentSize](self, "p_rebuildContentSize");
    if ((objc_opt_respondsToSelector(self->_delegate, "pagedCanvasController:customizeLayerHost:") & 1) != 0)
      -[THWPagedCanvasControllerDelegate pagedCanvasController:customizeLayerHost:](self->_delegate, "pagedCanvasController:customizeLayerHost:", self, -[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"));
    -[THWPagedCanvasController p_updateContentsScale](self, "p_updateContentsScale");
    -[THWPagedCanvasController p_rebuild](self, "p_rebuild");
    -[TSDInteractiveCanvasController layoutIfNeeded](self->_interactiveCanvasController, "layoutIfNeeded");
  }
}

- (void)p_updateContentsScale
{
  id v3;

  if (self->_clippingLayerHost)
  {
    v3 = -[TSDInteractiveCanvasController canvas](self->_interactiveCanvasController, "canvas");
    -[THWPagedCanvasControllerDelegate pagedCanvasControllerContentsScale:](self->_delegate, "pagedCanvasControllerContentsScale:", self);
    objc_msgSend(v3, "i_setContentsScale:");
  }
}

- (BOOL)createLayerHostIfNeededWithFrame:(CGRect)a3 viewScale:(double)a4
{
  BOOL v5;
  double height;
  double width;
  double y;
  double x;

  if (self->_scrollView || self->_layerHost || self->_interactiveCanvasController || self->_clippingLayerHost)
    return 0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  THCanvasAndClippingLayerHostCreateWithClass(self, (id *)&self->_interactiveCanvasController, &self->_clippingLayerHost, 0);
  v5 = 1;
  -[TSDInteractiveCanvasController setNestedCanvasAllowLayoutAndRenderOnThread:](self->_interactiveCanvasController, "setNestedCanvasAllowLayoutAndRenderOnThread:", 1);
  -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](self->_interactiveCanvasController, "setCreateRepsForOffscreenLayouts:", 1);
  -[THWPagedCanvasController setFrame:scale:](self, "setFrame:scale:", x, y, width, height, a4);
  -[THWPagedCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  -[THWPagedCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  return v5;
}

- (CALayer)alternateLayerForView
{
  return -[THWClippingLayerHost layer](self->_clippingLayerHost, "layer");
}

- (double)p_verticalOverflow
{
  double result;

  if ((objc_opt_respondsToSelector(self->_delegate, "pagedCanvasControllerVerticalOverflow:") & 1) == 0)
    return 0.0;
  -[THWPagedCanvasControllerDelegate pagedCanvasControllerVerticalOverflow:](self->_delegate, "pagedCanvasControllerVerticalOverflow:", self);
  return result;
}

- (double)p_adjustScale:(double)a3 andFrame:(CGRect *)a4
{
  double result;

  if ((objc_opt_respondsToSelector(self->_delegate, "pagedCanvasController:adjustScale:andFrame:") & 1) == 0)
    return a3;
  -[THWPagedCanvasControllerDelegate pagedCanvasController:adjustScale:andFrame:](self->_delegate, "pagedCanvasController:adjustScale:andFrame:", self, a4, a3);
  return result;
}

- (void)setFrame:(CGRect)a3 scale:(double)a4
{
  -[THWPagedCanvasController p_setFrame:scale:pageIndex:](self, "p_setFrame:scale:pageIndex:", -[THWPagedCanvasController pageIndex](self, "pageIndex"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)p_setFrame:(CGRect)a3 scale:(double)a4 pageIndex:(unint64_t)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  TSDInteractiveCanvasController *interactiveCanvasController;
  double x;
  double y;
  double width;
  double height;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v35 = a3;
  -[THWPagedCanvasController p_adjustScale:andFrame:](self, "p_adjustScale:andFrame:", &v35, a4);
  v8 = v7;
  if (self->_clippingLayerHost)
  {
    -[THWPagedCanvasController p_verticalOverflow](self, "p_verticalOverflow");
    *(float *)&v9 = v8 * v9;
    v35 = CGRectInset(v35, 0.0, -ceilf(*(float *)&v9));
    -[CALayer bounds](-[THWClippingLayerHost clippingLayer](self->_clippingLayerHost, "clippingLayer"), "bounds");
    v11 = v10;
    v13 = v12;
    -[THWClippingLayerHost setFrame:](self->_clippingLayerHost, "setFrame:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
    -[CALayer bounds](-[THWClippingLayerHost clippingLayer](self->_clippingLayerHost, "clippingLayer"), "bounds");
    if (v11 != v15 || v13 != v14)
    {
      interactiveCanvasController = self->_interactiveCanvasController;
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
      v22 = v8;
LABEL_7:
      -[TSDInteractiveCanvasController setViewScale:andScrollViewFrame:maintainPosition:animated:](interactiveCanvasController, "setViewScale:andScrollViewFrame:maintainPosition:animated:", 0, 0, v22, x, y, width, height);
      -[THWPagedCanvasController p_rebuildWithPageIndex:](self, "p_rebuildWithPageIndex:", a5);
    }
  }
  else if (self->_wrapperView)
  {
    if (self->_scrollView)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        -[THWPagedCanvasController p_verticalOverflow](self, "p_verticalOverflow");
        *(float *)&v23 = v8 * v23;
        v36 = CGRectInset(v35, 0.0, -ceilf(*(float *)&v23));
        v35 = v36;
        v24 = TSDRectWithSize(-[UIView setFrame:](self->_wrapperView, "setFrame:", *(_QWORD *)&v36.origin.x, *(_QWORD *)&v36.origin.y, *(_QWORD *)&v36.size.width, *(_QWORD *)&v36.size.height));
        v26 = v25;
        v28 = v27;
        v30 = v29;
        -[THScrollView frame](self->_scrollView, "frame");
        v38.origin.x = v31;
        v38.origin.y = v32;
        v38.size.width = v33;
        v38.size.height = v34;
        v37.origin.x = v24;
        v37.origin.y = v26;
        v37.size.width = v28;
        v37.size.height = v30;
        if (!CGRectEqualToRect(v37, v38))
        {
          interactiveCanvasController = self->_interactiveCanvasController;
          v22 = v8;
          x = v24;
          y = v26;
          width = v28;
          height = v30;
          goto LABEL_7;
        }
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  self->_delegate = (THWPagedCanvasControllerDelegate *)a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13E9CC;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[THWPagedCanvasController p_updateWithDelegate](self, "p_updateWithDelegate");
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_13E9D4;
    v4[3] = &unk_427830;
    v4[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (unint64_t)pageIndex
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double pageOffset;
  double v10;
  char *v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[TSDInteractiveCanvasController visibleBoundsRect](self->_interactiveCanvasController, "visibleBoundsRect");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (CGRectIsEmpty(v12))
    return 0x7FFFFFFFFFFFFFFFLL;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  pageOffset = (double)self->_pageOffset;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v10 = MidX + pageOffset * CGRectGetWidth(v14);
  if (v10 >= 0.0)
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v11 = (char *)(v10 / CGRectGetWidth(v15));
  }
  else
  {
    v11 = 0;
  }
  if (v11 <= (char *)-[THWPagedCanvasControllerDelegate pageCountForPagedCanvasController:](-[THWPagedCanvasController delegate](self, "delegate"), "pageCountForPagedCanvasController:", self)- 1)return (unint64_t)v11;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  THScrollView *v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  TSDInteractiveCanvasController *interactiveCanvasController;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double pageOffset;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v4 = a4;
  v7 = -[THWPagedCanvasController scrollView](self, "scrollView");
  -[TSDInteractiveCanvasController visibleBoundsRect](self->_interactiveCanvasController, "visibleBoundsRect");
  if (self->_clippingLayerHost)
  {
    interactiveCanvasController = self->_interactiveCanvasController;
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](interactiveCanvasController, "layerHost"), "canvasLayer"), "unscaledSize");
    -[TSDInteractiveCanvasController convertUnscaledToBoundsSize:](interactiveCanvasController, "convertUnscaledToBoundsSize:");
    v42 = v13;
    -[TSDInteractiveCanvasController visibleBoundsRect](self->_interactiveCanvasController, "visibleBoundsRect");
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
    pageOffset = (double)self->_pageOffset;
    v19 = CGRectGetWidth(v44) * pageOffset;
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v20 = -(v19 - (double)a3 * CGRectGetWidth(v45));
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v21 = CGRectGetWidth(v46);
    v22 = TSUClamp(v20, -v19, v42 - v19 - v21);
    v23 = objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "bounds");
    v26 = TSDRectWithOriginAndSize(v23, v22, 0.0, v24, v25);
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "setBounds:", v26, v27, v28, v29);
    -[THWPagedCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
  }
  else if (v7)
  {
    v30 = v8;
    v31 = v9;
    v32 = v10;
    v33 = v11;
    if (!CGRectIsEmpty(*(CGRect *)&v8))
    {
      -[THScrollView contentSize](v7, "contentSize");
      v43 = v34;
      v35 = (double)self->_pageOffset;
      v47.origin.x = v30;
      v47.origin.y = v31;
      v47.size.width = v32;
      v47.size.height = v33;
      v36 = CGRectGetWidth(v47) * v35;
      v48.origin.x = v30;
      v48.origin.y = v31;
      v48.size.width = v32;
      v48.size.height = v33;
      v37 = -(v36 - (double)a3 * CGRectGetWidth(v48));
      v49.origin.x = v30;
      v49.origin.y = v31;
      v49.size.width = v32;
      v49.size.height = v33;
      v38 = CGRectGetWidth(v49);
      v39 = TSUClamp(v37, -v36, v43 - v36 - v38);
      -[THScrollView contentOffset](v7, "contentOffset");
      if (v39 != v41 || v40 != 0.0)
        -[THScrollView setContentOffset:animated:](v7, "setContentOffset:animated:", v4, v39, 0.0);
    }
  }
}

- (void)setPageIndex:(unint64_t)a3
{
  -[THWPagedCanvasController setPageIndex:animated:](self, "setPageIndex:animated:", a3, 0);
}

- (void)setMinimizeInfoChange:(BOOL)a3
{
  if (self->_minimizeInfoChange != a3)
  {
    self->_minimizeInfoChange = a3;
    if (!a3)
      -[THWPagedCanvasController p_updateInfosToDisplayForced:](self, "p_updateInfosToDisplayForced:", 1);
  }
}

- (void)setPadInfos:(BOOL)a3
{
  if (self->_padInfos != a3)
  {
    self->_padInfos = a3;
    -[THWPagedCanvasController p_updateInfosToDisplayForced:](self, "p_updateInfosToDisplayForced:", 1);
  }
}

- (void)teardownController
{
  -[TSDInteractiveCanvasController teardown](self->_interactiveCanvasController, "teardown");
  -[THWClippingLayerHost teardown](self->_clippingLayerHost, "teardown");
}

- (void)teardownView
{
  -[THScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  -[TSDCanvasLayerHosting teardown](self->_layerHost, "teardown");
}

- (void)invalidateLayers
{
  -[TSDInteractiveCanvasController invalidateLayers](self->_interactiveCanvasController, "invalidateLayers");
}

- (void)invalidateLayoutsAndFrames
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = objc_msgSend(-[TSDInteractiveCanvasController layoutController](self->_interactiveCanvasController, "layoutController"), "rootLayout");
  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v2, "addLayoutsToArray:", v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(TSDLayout);
        *(_QWORD *)&v11 = TSUDynamicCast(v9, v8).n128_u64[0];
        if (v10)
        {
          v12 = v10;
          objc_msgSend(v10, "invalidateFrame", v11);
          objc_msgSend(v12, "invalidateChildren");
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v11);
    }
    while (v5);
  }

}

- (void)updateInfosToDisplay
{
  -[THWPagedCanvasController p_updateInfosToDisplayForced:](self, "p_updateInfosToDisplayForced:", 1);
}

- (void)p_updateInfosToDisplay
{
  -[THWPagedCanvasController p_updateInfosToDisplayForced:](self, "p_updateInfosToDisplayForced:", 0);
}

- (void)p_updateInfosToDisplayForced:(BOOL)a3
{
  THWPagedCanvasControllerDelegate *v5;
  THWPagedCanvasControllerDelegate *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  id v16;
  NSUInteger v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  unint64_t v22;
  NSUInteger v23;
  unint64_t v24;
  NSUInteger v25;
  TSUPointerSet *v26;
  NSUInteger v27;
  NSUInteger v28;
  BOOL v29;
  TSUPointerSet *v30;
  id v31;
  unsigned int v32;
  BOOL v33;
  BOOL v34;
  unint64_t preloadPageIndex;
  unsigned int v36;
  BOOL v37;
  id v38;
  unint64_t preloadedPageIndex;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  id v44;
  CGFloat v45;
  unint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v5 = -[THWPagedCanvasController delegate](self, "delegate");
  if (v5)
  {
    v6 = v5;
    -[TSDInteractiveCanvasController visibleBoundsRect](-[THWPagedCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "visibleBoundsRect");
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    v48 = CGRectUnion(v47, self->_targetVisibleRect);
    v11 = v48.origin.x;
    v45 = v48.origin.y;
    v12 = v48.size.width;
    v13 = v48.size.height;
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "bounds");
    v14 = CGRectGetWidth(v49);
    if (v14 > 0.0)
    {
      v15 = v14;
      v16 = -[THWPagedCanvasControllerDelegate pageCountForPagedCanvasController:](v6, "pageCountForPagedCanvasController:", self);
      if (v16)
      {
        v17 = (NSUInteger)v16;
        v50.origin.x = x;
        v50.origin.y = y;
        v50.size.width = width;
        v50.size.height = height;
        v18 = (unint64_t)(fmax(CGRectGetMinX(v50), 0.0) / v15 + (double)self->_pageOffset);
        v51.origin.x = x;
        v51.origin.y = y;
        v51.size.width = width;
        v51.size.height = height;
        v19 = (unint64_t)(fmax(CGRectGetMaxX(v51) + -1.0, 0.0) / v15 + (double)self->_pageOffset) - v18;
        v52.origin.x = v11;
        v52.origin.y = v45;
        v52.size.width = v12;
        v52.size.height = v13;
        v20 = (unint64_t)(fmax(CGRectGetMinX(v52), 0.0) / v15 + (double)self->_pageOffset);
        v53.origin.x = v11;
        v53.origin.y = v45;
        v53.size.width = v12;
        v53.size.height = v13;
        v21 = fmax(CGRectGetMaxX(v53) + -1.0, 0.0) / v15 + (double)self->_pageOffset;
        v22 = v20 - 1;
        if (!v20)
          v22 = 0;
        if (v17 >= v22)
          v23 = v22;
        else
          v23 = v17;
        v24 = (unint64_t)v21 + 2;
        if (v24 >= v17)
          v24 = v17;
        v46 = v24;
        v25 = v24 - v23;
        v26 = +[TSUPointerSet setWithArray:](TSUPointerSet, "setWithArray:", -[TSDInteractiveCanvasController infosToDisplay](self->_interactiveCanvasController, "infosToDisplay", *(_QWORD *)&v11));
        if (self->_padInfos)
          v27 = v23;
        else
          v27 = v18;
        if (!self->_padInfos)
          v25 = v19 + 1;
        if (!self->_minimizeInfoChange || ((v28 = v19 + 1, v27 == v18) ? (v29 = v25 == v28) : (v29 = 0), v29))
        {
          v33 = v27 != 0x7FFFFFFFFFFFFFFFLL && a3;
          if (!v33
            && (v27 == self->_loadedPageRange.location ? (v34 = v25 == self->_loadedPageRange.length) : (v34 = 0), v34))
          {
            v31 = 0;
            v32 = 0;
          }
          else
          {
            v31 = -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v27, v25);
            v32 = 1;
          }
        }
        else
        {
          v30 = v26;
          v31 = objc_msgSend(-[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v27, v25), "tsu_arrayWithObjectsInSet:", -[TSUPointerSet setByAddingObjectsFromArray:](v26, "setByAddingObjectsFromArray:", -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v18, v28)));
          v32 = -[TSUPointerSet isEqualToSet:](+[TSUPointerSet setWithArray:](TSUPointerSet, "setWithArray:", v31), "isEqualToSet:", v30) ^ 1;
          v27 = v18;
          v25 = v28;
        }
        preloadPageIndex = self->_preloadPageIndex;
        if (preloadPageIndex == 0x7FFFFFFFFFFFFFFFLL)
          v36 = 0;
        else
          v36 = v32;
        if ((self->_preloadedPageIndex != preloadPageIndex || v36)
          && ((self->_preloadedPageIndex = preloadPageIndex, preloadPageIndex >= v27)
            ? (v37 = preloadPageIndex - v27 >= v25)
            : (v37 = 1),
              v37))
        {
          if (!v31)
          {
            v31 = -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v27, v25);
            preloadPageIndex = self->_preloadedPageIndex;
          }
          if (preloadPageIndex == 0x7FFFFFFFFFFFFFFFLL)
            v38 = 0;
          else
            v38 = -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, preloadPageIndex, 1);
          if (objc_msgSend(v38, "count"))
          {
            preloadedPageIndex = self->_preloadedPageIndex;
            if (preloadedPageIndex >= v23)
              v40 = v23;
            else
              v40 = self->_preloadedPageIndex;
            if (preloadedPageIndex + 1 > v46)
              v41 = preloadedPageIndex + 1;
            else
              v41 = v46;
            if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              v42 = preloadedPageIndex + 1;
            else
              v42 = v41;
            v43 = -[THWPagedCanvasControllerDelegate pagedCanvasController:infosToDisplayForPageRange:](v6, "pagedCanvasController:infosToDisplayForPageRange:", self, v40, v42 - v40);
            v44 = objc_msgSend(objc_alloc((Class)TSUMutablePointerSet), "initWithArray:", v31);
            objc_msgSend(v44, "addObjectsFromArray:", v38);
            v31 = objc_msgSend(v43, "tsu_arrayWithObjectsInSet:", v44);

          }
        }
        else if (!v32)
        {
          return;
        }
        if (self->_delegate && !self->_disableInfoUpdates)
        {
          if ((objc_opt_respondsToSelector(v6, "pagedCanvasController:willUpdateWithInfosToDisplay:") & 1) != 0)
            -[THWPagedCanvasControllerDelegate pagedCanvasController:willUpdateWithInfosToDisplay:](v6, "pagedCanvasController:willUpdateWithInfosToDisplay:", self, v31);
          -[TSDInteractiveCanvasController setInfosToDisplay:](-[THWPagedCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "setInfosToDisplay:", v31);
          self->_loadedPageRange.location = v27;
          self->_loadedPageRange.length = v25;
        }
      }
    }
  }
}

- (void)p_updateRenderedPageIndexes
{
  THWPagedCanvasControllerDelegate *v3;

  v3 = -[THWPagedCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v3, "pagedCanvasController:renderedPageIndexSetFromReps:") & 1) != 0)
  {

    self->_renderedPageIndexes = (NSIndexSet *)-[THWPagedCanvasControllerDelegate pagedCanvasController:renderedPageIndexSetFromReps:](v3, "pagedCanvasController:renderedPageIndexSetFromReps:", self, objc_msgSend(-[TSDInteractiveCanvasController canvas](self->_interactiveCanvasController, "canvas"), "topLevelReps"));
  }
}

- (void)p_rebuild
{
  -[THWPagedCanvasController p_rebuildWithPageIndex:](self, "p_rebuildWithPageIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)p_rebuildContentSize
{
  THWPagedCanvasControllerDelegate *v3;
  THWPagedCanvasControllerDelegate *v4;
  double v5;
  double v6;
  double v7;
  double height;
  double v9;
  double width;

  v3 = -[THWPagedCanvasController delegate](self, "delegate");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "bounds");
    -[TSDInteractiveCanvasController convertBoundsToUnscaledSize:](self->_interactiveCanvasController, "convertBoundsToUnscaledSize:", v5, v6);
    height = v7;
    width = v9
          * (double)(unint64_t)-[THWPagedCanvasControllerDelegate pageCountForPagedCanvasController:](v4, "pageCountForPagedCanvasController:", self);
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setUnscaledSize:", width, height);
}

- (void)p_rebuildWithPageIndex:(unint64_t)a3
{
  double v5;
  id v6;
  CATransform3D v7;
  CATransform3D v8;

  -[THWPagedCanvasController p_rebuildContentSize](self, "p_rebuildContentSize");
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "clippingLayer"), "bounds");
  CATransform3DMakeTranslation(&v8, -(v5 * (double)self->_pageOffset), 0.0, 0.0);
  v6 = objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "layer");
  v7 = v8;
  objc_msgSend(v6, "setSublayerTransform:", &v7);
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    -[THWPagedCanvasController setPageIndex:animated:](self, "setPageIndex:animated:", a3, 0);
  -[THWPagedCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
}

- (void)p_updateMostVisiblePageIndex
{
  unint64_t v3;
  unint64_t mostVisiblePageIndex;
  unint64_t v5;
  THWPagedCanvasControllerDelegate *v6;
  THWPagedCanvasControllerDelegate *v7;

  v3 = -[THWPagedCanvasController pageIndex](self, "pageIndex");
  mostVisiblePageIndex = self->_mostVisiblePageIndex;
  if (v3 != mostVisiblePageIndex)
  {
    v5 = v3;
    self->_mostVisiblePageIndex = v3;
    v6 = -[THWPagedCanvasController delegate](self, "delegate");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL && mostVisiblePageIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      if ((objc_opt_respondsToSelector(v6, "pagedCanvasController:mostVisiblePageChangedToPageIndex:") & 1) != 0)
        -[THWPagedCanvasControllerDelegate pagedCanvasController:mostVisiblePageChangedToPageIndex:](v7, "pagedCanvasController:mostVisiblePageChangedToPageIndex:", self, self->_mostVisiblePageIndex);
    }
  }
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class(THWPEditingController, a2);
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (BOOL)allowCopy
{
  return 0;
}

- (BOOL)allowHighlighting
{
  return 0;
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  self->_targetVisibleRect = a4;
  if (self->_disableThreadedLayoutAndRenderDuringAnimation)
    objc_msgSend(a3, "pushThreadedLayoutAndRenderDisabled");
  -[THWPagedCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay", a3);
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  CGSize size;

  if (!a4)
  {
    size = CGRectNull.size;
    self->_targetVisibleRect.origin = CGRectNull.origin;
    self->_targetVisibleRect.size = size;
  }
  if (self->_disableThreadedLayoutAndRenderDuringAnimation)
    objc_msgSend(a3, "popThreadedLayoutAndRenderDisabled");
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
    -[THWPagedCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
  -[THWPagedCanvasController p_updateMostVisiblePageIndex](self, "p_updateMostVisiblePageIndex");
  if ((objc_opt_respondsToSelector(self->_delegate, "pagedCanvasControllerDidScroll:") & 1) != 0)
    -[THWPagedCanvasControllerDelegate pagedCanvasControllerDidScroll:](self->_delegate, "pagedCanvasControllerDidScroll:", self);
}

- (id)p_enclosingInteractiveCanvasController
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  id v6;
  id result;

  v3 = objc_opt_class(TSDInteractiveCanvasController);
  v4 = objc_opt_class(TSDCanvasView);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, objc_msgSend(-[THScrollView superview](self->_scrollView, "superview"), "superview")).n128_u64[0];
  TSUDynamicCast(v3, objc_msgSend(v6, "controller", v5));
  return result;
}

- (CGPoint)interactiveCanvasController:(id)a3 restrictedContentOffset:(CGPoint)a4 forViewScale:(double)a5
{
  CGFloat y;
  double x;
  char *v8;
  double width;
  CGFloat height;
  double pageOffset;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;
  CGRect v25;
  CGRect v26;

  y = a4.y;
  x = a4.x;
  if (-[TSDInteractiveCanvasController currentlyScrolling](self->_interactiveCanvasController, "currentlyScrolling", a3, a4.x, a4.y, a5))
  {
    if ((objc_opt_respondsToSelector(self->_delegate, "pagedCanvasControllerRestrictVisibleToRenderedContent:") & 1) != 0)
    {
      if (-[THWPagedCanvasControllerDelegate pagedCanvasControllerRestrictVisibleToRenderedContent:](self->_delegate, "pagedCanvasControllerRestrictVisibleToRenderedContent:", self))
      {
        if (self->_renderedPageIndexes)
        {
          if (-[THWPagedCanvasController pageIndex](self, "pageIndex"))
          {
            v8 = -[THWPagedCanvasController pageIndex](self, "pageIndex");
            if (v8 < (char *)-[THWPagedCanvasControllerDelegate pageCountForPagedCanvasController:](self->_delegate, "pageCountForPagedCanvasController:", self)- 1)
            {
              -[TSDInteractiveCanvasController visibleUnscaledRect](self->_interactiveCanvasController, "visibleUnscaledRect");
              width = v25.size.width;
              height = v25.size.height;
              pageOffset = (double)self->_pageOffset;
              v25.origin.x = x;
              v25.origin.y = y;
              v12 = (uint64_t)(CGRectGetMinX(v25) / v25.size.width + pageOffset);
              v13 = (double)self->_pageOffset;
              v26.origin.x = x;
              v26.origin.y = y;
              v26.size.width = width;
              v26.size.height = height;
              v14 = (uint64_t)((CGRectGetMaxX(v26) + -1.0) / width + v13);
              if (v12 <= v14)
              {
                v15 = v14 + 1;
                v16 = 0x7FFFFFFFFFFFFFFFLL;
                v17 = 0x7FFFFFFFFFFFFFFFLL;
                do
                {
                  v18 = -[NSIndexSet containsIndex:](self->_renderedPageIndexes, "containsIndex:", v12);
                  if ((v18 & (v17 == 0x7FFFFFFFFFFFFFFFLL)) != 0)
                    v17 = v12;
                  if (v18)
                    v16 = v12;
                  ++v12;
                }
                while (v15 != v12);
                if (v17 != 0x7FFFFFFFFFFFFFFFLL && v16 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v20 = (double)v17;
                  v21 = (double)v16;
LABEL_21:
                  x = TSUClamp(x, width * v20, width * v21);
                  goto LABEL_22;
                }
              }
              if (-[NSIndexSet count](self->_renderedPageIndexes, "count"))
              {
                v20 = (double)-[NSIndexSet firstIndex](self->_renderedPageIndexes, "firstIndex");
                v21 = (double)-[NSIndexSet lastIndex](self->_renderedPageIndexes, "lastIndex");
                goto LABEL_21;
              }
            }
          }
        }
      }
    }
  }
LABEL_22:
  v22 = x;
  v23 = y;
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)interactiveCanvasControllerWillScroll:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  THWPagedCanvasControllerDelegate *v6;

  if (!self->_currentlyScrolling)
  {
    objc_msgSend(-[THWPagedCanvasController p_enclosingInteractiveCanvasController](self, "p_enclosingInteractiveCanvasController", a3), "embeddedCanvasWillBeginScrolling");
    self->_currentlyScrolling = 1;
    v4 = -[THWPagedCanvasController pageIndex](self, "pageIndex");
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = v4;
      v6 = -[THWPagedCanvasController delegate](self, "delegate");
      if ((objc_opt_respondsToSelector(v6, "pagedCanvasController:willScrollFromPageIndex:") & 1) != 0)
        -[THWPagedCanvasControllerDelegate pagedCanvasController:willScrollFromPageIndex:](v6, "pagedCanvasController:willScrollFromPageIndex:", self, v5);
    }
  }
}

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  THWPagedCanvasControllerDelegate *v4;
  unint64_t v5;

  if (self->_currentlyScrolling)
  {
    self->_currentlyScrolling = 0;
    objc_msgSend(-[THWPagedCanvasController p_enclosingInteractiveCanvasController](self, "p_enclosingInteractiveCanvasController", a3), "embeddedCanvasDidEndScrolling");
  }
  v4 = -[THWPagedCanvasController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector(v4, "pagedCanvasControllerDidStopScrolling:") & 1) != 0)
    -[THWPagedCanvasControllerDelegate pagedCanvasControllerDidStopScrolling:](v4, "pagedCanvasControllerDidStopScrolling:", self);
  if (v4)
  {
    v5 = -[THWPagedCanvasController pageIndex](self, "pageIndex");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      -[THWPagedCanvasControllerDelegate pagedCanvasController:didScrollToPageIndex:](v4, "pagedCanvasController:didScrollToPageIndex:", self, v5);
  }
  -[THWPagedCanvasController p_updateMostVisiblePageIndex](self, "p_updateMostVisiblePageIndex");
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  return -[THWPagedCanvasControllerDelegate pagedCanvasController:geometryProviderForLayout:](-[THWPagedCanvasController delegate](self, "delegate", a3), "pagedCanvasController:geometryProviderForLayout:", self, a4);
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  THWPagedCanvasControllerDelegate *v8;

  v8 = -[THWPagedCanvasController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector(v8, "pagedCanvasController:delegateConformingToProtocol:forRep:") & 1) != 0)
    return -[THWPagedCanvasControllerDelegate pagedCanvasController:delegateConformingToProtocol:forRep:](v8, "pagedCanvasController:delegateConformingToProtocol:forRep:", self, a4, a5);
  if (-[THWPagedCanvasControllerDelegate conformsToProtocol:](v8, "conformsToProtocol:", a4))
    return v8;
  return 0;
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  THWPagedCanvasControllerDelegate *v5;

  v5 = -[THWPagedCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "pagedCanvasControllerDidLayout:") & 1) != 0)
    -[THWPagedCanvasControllerDelegate pagedCanvasControllerDidLayout:](v5, "pagedCanvasControllerDidLayout:", self);
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
    -[THWPagedCanvasController p_updateRenderedPageIndexes](self, "p_updateRenderedPageIndexes");
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  THWPagedCanvasControllerDelegate *v5;

  v5 = -[THWPagedCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "pagedCanvasControllerDidLayoutAndRenderOnBackgroundThread::") & 1) != 0)
    -[THWPagedCanvasControllerDelegate pagedCanvasControllerDidLayoutAndRenderOnBackgroundThread:](v5, "pagedCanvasControllerDidLayoutAndRenderOnBackgroundThread:", self);
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
  {
    -[THWPagedCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
    -[THWPagedCanvasController p_updateRenderedPageIndexes](self, "p_updateRenderedPageIndexes");
  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForScrollViewHitTesting:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[THWPagedCanvasController p_verticalOverflow](self, "p_verticalOverflow");
  v11 = v10;
  objc_msgSend(a3, "viewScale");
  *(float *)&v12 = v11 * v12;
  v13 = ceilf(*(float *)&v12);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27 = CGRectInset(v26, 0.0, v13);
  v14 = v27.origin.x;
  v15 = v27.origin.y;
  v16 = v27.size.width;
  v17 = v27.size.height;
  if ((objc_opt_respondsToSelector(-[THWPagedCanvasController delegate](self, "delegate"), "pagedCanvasController:expandBoundsForScrollViewHitTesting:") & 1) != 0)
  {
    -[THWPagedCanvasControllerDelegate pagedCanvasController:expandBoundsForScrollViewHitTesting:](-[THWPagedCanvasController delegate](self, "delegate"), "pagedCanvasController:expandBoundsForScrollViewHitTesting:", self, v14, v15, v16, v17);
    v14 = v18;
    v15 = v19;
    v16 = v20;
    v17 = v21;
  }
  v22 = v14;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectInfinite.origin.x;
  y = CGRectInfinite.origin.y;
  width = CGRectInfinite.size.width;
  height = CGRectInfinite.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return -[THWPagedCanvasControllerDelegate pagedCanvasController:primaryTargetForGesture:](-[THWPagedCanvasController delegate](self, "delegate", a3), "pagedCanvasController:primaryTargetForGesture:", self, a4);
}

- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  if ((objc_opt_respondsToSelector(-[THWPagedCanvasController delegate](self, "delegate", a3), "pagedCanvasController:canvasViewShouldBecomeFirstResponder:") & 1) != 0)return -[THWPagedCanvasControllerDelegate pagedCanvasController:canvasViewShouldBecomeFirstResponder:](-[THWPagedCanvasController delegate](self, "delegate"), "pagedCanvasController:canvasViewShouldBecomeFirstResponder:", self, a4);
  else
    return 1;
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return -[THWPagedCanvasControllerDelegate pagedCanvasController:allowsEditMenuForRep:](-[THWPagedCanvasController delegate](self, "delegate", a3), "pagedCanvasController:allowsEditMenuForRep:", self, a4);
}

- (BOOL)interactiveCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  return -[THWPagedCanvasControllerDelegate pagedCanvasController:allowsHyperlinkWithGesture:forRep:](-[THWPagedCanvasController delegate](self, "delegate", a3), "pagedCanvasController:allowsHyperlinkWithGesture:forRep:", self, a4, a5);
}

- (BOOL)allowSelectionPopoverForInteractiveCanvasController:(id)a3
{
  return -[THWPagedCanvasControllerDelegate allowSelectionPopoverForPagedCanvasController:](-[THWPagedCanvasController delegate](self, "delegate", a3), "allowSelectionPopoverForPagedCanvasController:", self);
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return -[THWPagedCanvasControllerDelegate pagedCanvasController:shouldBeginEditingTHWPRep:withGesture:](-[THWPagedCanvasController delegate](self, "delegate", a3), "pagedCanvasController:shouldBeginEditingTHWPRep:withGesture:", self, a4, a5);
}

- (BOOL)shouldClipToScrollViewBoundsInVisibleBounds
{
  return 1;
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  THWPagedCanvasControllerDelegate *v4;

  v4 = -[THWPagedCanvasController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector(v4, "pagedCanvasControllerIsRelatedCanvasScrolling:") & 1) != 0)
    return -[THWPagedCanvasControllerDelegate pagedCanvasControllerIsRelatedCanvasScrolling:](v4, "pagedCanvasControllerIsRelatedCanvasScrolling:", self);
  else
    return 0;
}

- (void)setupImmediatePressGestureWithSimultaneousGestures:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (-[TSDInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"))
  {
    v5 = TSWPImmediatePress;
    -[TSDInteractiveCanvasController enableGestureKinds:](self->_interactiveCanvasController, "enableGestureKinds:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", TSWPImmediatePress));
    v6 = -[TSDInteractiveCanvasController gestureRecognizerWithKind:](self->_interactiveCanvasController, "gestureRecognizerWithKind:", v5);
    objc_msgSend(-[TSDInteractiveCanvasController gestureDispatcher](self->_interactiveCanvasController, "gestureDispatcher"), "allowSimultaneousRecognitionByRecognizers:", v6, -[THScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer"), 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(a3);
          objc_msgSend(-[TSDInteractiveCanvasController gestureDispatcher](self->_interactiveCanvasController, "gestureDispatcher"), "allowSimultaneousRecognitionByRecognizers:", v6, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), 0);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)setupImmediatePressGesture
{
  -[THWPagedCanvasController setupImmediatePressGestureWithSimultaneousGestures:](self, "setupImmediatePressGestureWithSimultaneousGestures:", 0);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_msgSend(-[TSDInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"), "setUserInteractionEnabled:", a3);
  -[THScrollView setUserInteractionEnabled:](self->_scrollView, "setUserInteractionEnabled:", v3);
  -[THScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v3);
  -[UIView setUserInteractionEnabled:](self->_wrapperView, "setUserInteractionEnabled:", v3);
}

- (BOOL)userInteractionEnabled
{
  return objc_msgSend(-[TSDInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"), "isUserInteractionEnabled");
}

- (void)setPreloadPageIndex:(unint64_t)a3
{
  if (self->_preloadPageIndex != a3)
  {
    self->_preloadPageIndex = a3;
    -[THWPagedCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
  }
}

- (void)setPageOffset:(unint64_t)a3
{
  unint64_t v5;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL
    && self->_pageOffset != a3
    && (unint64_t)-[THWPagedCanvasControllerDelegate pageCountForPagedCanvasController:](self->_delegate, "pageCountForPagedCanvasController:", self) > a3)
  {
    v5 = -[THWPagedCanvasController pageIndex](self, "pageIndex");
    self->_pageOffset = a3;
    -[THWPagedCanvasController p_rebuildWithPageIndex:](self, "p_rebuildWithPageIndex:", v5);
  }
}

- (void)p_updateRasterizeOnLayer
{
  BOOL rasterize;
  THWClippingLayerHost *clippingLayerHost;
  CALayer *v5;
  NSObject *rasterizeQueue;
  _QWORD block[6];
  BOOL v8;

  rasterize = self->_rasterize;
  clippingLayerHost = self->_clippingLayerHost;
  if (clippingLayerHost)
    v5 = -[THWClippingLayerHost clippingLayer](clippingLayerHost, "clippingLayer");
  else
    v5 = -[UIView layer](self->_wrapperView, "layer");
  rasterizeQueue = self->_rasterizeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_140090;
  block[3] = &unk_428E10;
  block[4] = v5;
  block[5] = self;
  v8 = rasterize;
  dispatch_async(rasterizeQueue, block);
}

- (void)setRasterize:(BOOL)a3
{
  if (self->_rasterize != a3)
  {
    self->_rasterize = a3;
    -[THWPagedCanvasController p_updateRasterizeOnLayer](self, "p_updateRasterizeOnLayer");
  }
}

- (void)pushDisableInfoUpdates
{
  ++self->_disableInfoUpdates;
}

- (void)popDisableInfoUpdates
{
  unint64_t disableInfoUpdates;
  unint64_t v3;

  disableInfoUpdates = self->_disableInfoUpdates;
  if (disableInfoUpdates)
  {
    v3 = disableInfoUpdates - 1;
    self->_disableInfoUpdates = v3;
    if (!v3)
      -[THWPagedCanvasController p_updateInfosToDisplay](self, "p_updateInfosToDisplay");
  }
}

- (void)forceStopScrollingAtCurrentPageIndex
{
  if (self->_currentlyScrolling)
  {
    -[THWPagedCanvasController setPageIndex:animated:](self, "setPageIndex:animated:", -[THWPagedCanvasController pageIndex](self, "pageIndex"), 0);
    -[TSDInteractiveCanvasController forceStopScrolling](-[THWPagedCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "forceStopScrolling");
  }
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (UIView)view
{
  return self->_wrapperView;
}

- (THScrollView)scrollView
{
  return self->_scrollView;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->_layerHost;
}

- (THWPagedCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (TSWPLongPressGestureRecognizer)immediatePressGesture
{
  return self->_immediatePressGesture;
}

- (void)setImmediatePressGesture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)minimizeInfoChange
{
  return self->_minimizeInfoChange;
}

- (BOOL)padInfos
{
  return self->_padInfos;
}

- (unint64_t)preloadPageIndex
{
  return self->_preloadPageIndex;
}

- (unint64_t)pageOffset
{
  return self->_pageOffset;
}

- (BOOL)rasterize
{
  return self->_rasterize;
}

- (BOOL)disableThreadedLayoutAndRenderDuringAnimation
{
  return self->_disableThreadedLayoutAndRenderDuringAnimation;
}

- (void)setDisableThreadedLayoutAndRenderDuringAnimation:(BOOL)a3
{
  self->_disableThreadedLayoutAndRenderDuringAnimation = a3;
}

- (_NSRange)loadedPageRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_loadedPageRange.length;
  location = self->_loadedPageRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLoadedPageRange:(_NSRange)a3
{
  self->_loadedPageRange = a3;
}

- (CGRect)targetVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetVisibleRect.origin.x;
  y = self->_targetVisibleRect.origin.y;
  width = self->_targetVisibleRect.size.width;
  height = self->_targetVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetVisibleRect:(CGRect)a3
{
  self->_targetVisibleRect = a3;
}

- (unint64_t)preloadedPageIndex
{
  return self->_preloadedPageIndex;
}

- (unint64_t)mostVisiblePageIndex
{
  return self->_mostVisiblePageIndex;
}

- (THWClippingLayerHost)clippingLayerHost
{
  return self->_clippingLayerHost;
}

- (BOOL)needRestore
{
  return self->_needRestore;
}

- (void)setNeedRestore:(BOOL)a3
{
  self->_needRestore = a3;
}

- (BOOL)mayPassScrollEventsToNextResponder
{
  return self->_mayPassScrollEventsToNextResponder;
}

- (void)setMayPassScrollEventsToNextResponder:(BOOL)a3
{
  self->_mayPassScrollEventsToNextResponder = a3;
}

@end
