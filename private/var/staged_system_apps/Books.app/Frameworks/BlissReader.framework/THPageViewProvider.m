@implementation THPageViewProvider

- (THPageViewProvider)initWithInteractiveCanvasController:(id)a3 pageSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  THPageViewProvider *v7;
  NSObject *v8;
  objc_super v10;

  height = a4.height;
  width = a4.width;
  v10.receiver = self;
  v10.super_class = (Class)THPageViewProvider;
  v7 = -[THPageViewProvider init](&v10, "init");
  if (v7)
  {
    v7->_icc = (TSDInteractiveCanvasController *)a3;
    v7->_pageSize.width = width;
    v7->_pageSize.height = height;
    v7->_pageHostMutex = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iBooks.THPageViewProvider.mutex", 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7->_previewLoadQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iBooks.THPageViewProvider.previewLoadQueue", v8);
    v7->_previewEnabled = 1;
    -[THPageViewProvider p_updatePageViewsWithInfos:](v7, "p_updatePageViewsWithInfos:", -[TSDInteractiveCanvasController infosToDisplay](v7->_icc, "infosToDisplay"));
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THPageViewProvider;
  -[THPageViewProvider dealloc](&v3, "dealloc");
}

- (void)teardown
{
  NSObject *pageHostMutex;
  NSObject *previewLoadQueue;

  -[THPageViewProvider p_updatePageViewsWithInfos:removeUnused:](self, "p_updatePageViewsWithInfos:removeUnused:", 0, 1);
  if (-[TSURetainedPointerKeyDictionary count](self->_pageInfoToPageHost, "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider teardown]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m"), 61, CFSTR("there should be no pageHosts left:\n%@"), self->_pageInfoToPageHost);

  self->_pageInfoToPageHost = 0;
  self->_pageHostForRecycling = 0;
  pageHostMutex = self->_pageHostMutex;
  if (pageHostMutex)
  {
    dispatch_barrier_sync(pageHostMutex, &stru_428090);
    dispatch_release((dispatch_object_t)self->_pageHostMutex);
    self->_pageHostMutex = 0;
  }
  previewLoadQueue = self->_previewLoadQueue;
  if (previewLoadQueue)
  {
    dispatch_barrier_sync(previewLoadQueue, &stru_4280B0);
    dispatch_release((dispatch_object_t)self->_previewLoadQueue);
    self->_previewLoadQueue = 0;
  }
  self->_delegate = 0;
}

- (BOOL)p_recursivelyFindPageInfos:(id)a3 callingBlock:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  _BYTE v23[128];

  v22 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (!v7)
    return (char)v7;
  v9 = v7;
  v10 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(a3);
      v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
      v13 = objc_opt_class(THModelPageInfo, v8);
      v14 = TSUDynamicCast(v13, v12);
      if (v14)
      {
        (*((void (**)(id, uint64_t, char *))a4 + 2))(a4, v14, &v22);
LABEL_8:
        if (v22)
          goto LABEL_15;
        continue;
      }
      v15 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDContainerInfo, v12);
      if (!v15)
        goto LABEL_8;
      v16 = -[THPageViewProvider p_recursivelyFindPageInfos:callingBlock:](self, "p_recursivelyFindPageInfos:callingBlock:", objc_msgSend(v15, "childInfos"), a4);
      v22 = v16;
      if (v16)
      {
LABEL_15:
        LOBYTE(v7) = 1;
        return (char)v7;
      }
    }
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
      continue;
    break;
  }
  LOBYTE(v7) = v22 != 0;
  return (char)v7;
}

- (void)p_updatePageViewsWithInfos:(id)a3
{
  -[THPageViewProvider p_updatePageViewsWithInfos:removeUnused:](self, "p_updatePageViewsWithInfos:removeUnused:", a3, -[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](self->_icc, "currentlyWaitingOnThreadedLayoutAndRender") ^ 1);
}

- (int64_t)p_relativePageIndexForPageInfo:(id)a3
{
  _BYTE *v5;

  if ((objc_opt_respondsToSelector(self->_delegate, "pageViewProvider:absolutePageIndexForPageInfo:") & 1) != 0)
    v5 = -[THPageViewProviderDelegate pageViewProvider:absolutePageIndexForPageInfo:](self->_delegate, "pageViewProvider:absolutePageIndexForPageInfo:", self, a3);
  else
    v5 = objc_msgSend(a3, "absolutePageIndex");
  return v5
       - (_BYTE *)-[THPageViewProviderDelegate pageViewProviderStartAbsolutePageIndex:](self->_delegate, "pageViewProviderStartAbsolutePageIndex:", self);
}

- (void)p_updatePageViewsWithInfos:(id)a3 removeUnused:(BOOL)a4
{
  id v7;
  id v8;
  NSObject *pageHostMutex;
  uint64_t v10;
  _QWORD block[8];
  CGSize pageSize;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  _QWORD v21[5];

  v7 = objc_alloc_init((Class)NSMutableArray);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_69E34;
  v21[3] = &unk_4280D8;
  v21[4] = v7;
  -[THPageViewProvider p_recursivelyFindPageInfos:callingBlock:](self, "p_recursivelyFindPageInfos:callingBlock:", a3, v21);
  v8 = objc_alloc_init((Class)NSMutableArray);
  pageSize = self->_pageSize;
  -[TSDInteractiveCanvasController viewScale](self->_icc, "viewScale");
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = sub_69E40;
  v19 = sub_69E50;
  v20 = 0;
  pageHostMutex = self->_pageHostMutex;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_69E5C;
  block[3] = &unk_428100;
  block[4] = v7;
  block[5] = self;
  v13 = v10;
  block[6] = v8;
  block[7] = &v15;
  v14 = a4;
  dispatch_sync(pageHostMutex, block);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_icc, "layerHost"), "subviewsController"), "addSubviews:", v8);
    -[THPageViewProviderDelegate pageViewProviderViewsAdded:pageIndexSet:](self->_delegate, "pageViewProviderViewsAdded:pageIndexSet:", self, v16[5]);
  }

  -[THPageViewProvider p_recyclePageHosts](self, "p_recyclePageHosts");
  _Block_object_dispose(&v15, 8);
}

- (void)p_recyclePageHosts
{
  id v3;
  NSObject *pageHostMutex;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  _BYTE v20[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider p_recyclePageHosts]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m"), 234, CFSTR("This operation must only be performed on the main thread."));
  if (!self->_pageHostMutex)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider p_recyclePageHosts]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m"), 236, CFSTR("invalid nil value for '%s'"), "_pageHostMutex");
  v3 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_69E40;
  v18 = sub_69E50;
  v19 = 0;
  pageHostMutex = self->_pageHostMutex;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A428;
  block[3] = &unk_427D68;
  block[5] = v3;
  block[6] = &v14;
  block[4] = self;
  dispatch_sync(pageHostMutex, block);
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self->_icc, "layerHost"), "subviewsController"), "removeSubviews:", v3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = (void *)v15[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "teardown");
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

- (CGRect)p_unclippedVisibleBounds
{
  THPageViewProviderDelegate *delegate;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  delegate = self->_delegate;
  if (delegate)
    -[THPageViewProviderDelegate pageViewProviderUnclippedVisibleBounds:](delegate, "pageViewProviderUnclippedVisibleBounds:", self);
  else
    -[TSDInteractiveCanvasController visibleBoundsRect](self->_icc, "visibleBoundsRect");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)p_updateRenderedPageHosts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  NSObject *pageHostMutex;
  _QWORD v13[9];
  unsigned __int8 v14;

  -[THPageViewProvider p_unclippedVisibleBounds](self, "p_unclippedVisibleBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[TSDInteractiveCanvasController currentlyScrolling](self->_icc, "currentlyScrolling");
  pageHostMutex = self->_pageHostMutex;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_6A6F8;
  v13[3] = &unk_428128;
  v13[4] = self;
  v13[5] = v4;
  v13[6] = v6;
  v13[7] = v8;
  v13[8] = v10;
  v14 = v11;
  dispatch_sync(pageHostMutex, v13);
}

- (void)canvasDidStopScrolling
{
  if ((-[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](self->_icc, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0&& !self->_disabledCount)
  {
    -[THPageViewProvider p_recyclePageHosts](self, "p_recyclePageHosts");
  }
  -[THPageViewProvider p_updateRenderedPageHosts](self, "p_updateRenderedPageHosts");
}

- (void)canvasDidLayout
{
  if ((-[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](self->_icc, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
  {
    -[THPageViewProvider p_updateRenderedPageHosts](self, "p_updateRenderedPageHosts");
    if (!self->_disabledCount)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
        -[THPageViewProvider p_recyclePageHosts](self, "p_recyclePageHosts");
    }
  }
}

- (void)canvasDidLayoutAndRenderOnBackgroundThread
{
  if ((-[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](self->_icc, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0&& !self->_disabledCount)
  {
    -[THPageViewProvider p_updateRenderedPageHosts](self, "p_updateRenderedPageHosts");
    -[THPageViewProvider p_recyclePageHosts](self, "p_recyclePageHosts");
  }
}

- (void)pushDisabled
{
  ++self->_disabledCount;
}

- (void)popDisabled
{
  unint64_t disabledCount;

  disabledCount = self->_disabledCount;
  if (disabledCount)
  {
    self->_disabledCount = disabledCount - 1;
    if ((-[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](self->_icc, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0&& !self->_disabledCount)
    {
      -[THPageViewProvider p_updateRenderedPageHosts](self, "p_updateRenderedPageHosts");
    }
  }
}

- (id)p_pageInfoForAbsolutePageIndex:(unint64_t)a3
{
  id v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_69E40;
  v13 = sub_69E50;
  v14 = 0;
  v5 = -[TSDInteractiveCanvasController infosToDisplay](self->_icc, "infosToDisplay");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6AA38;
  v8[3] = &unk_428150;
  v8[4] = &v9;
  v8[5] = a3;
  -[THPageViewProvider p_recursivelyFindPageInfos:callingBlock:](self, "p_recursivelyFindPageInfos:callingBlock:", v5, v8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)pageHostForAbsolutePageIndex:(unint64_t)a3
{
  id v5;
  id result;

  v5 = -[THPageViewProvider p_pageInfoForAbsolutePageIndex:](self, "p_pageInfoForAbsolutePageIndex:");
  if (!v5
    || (result = -[TSURetainedPointerKeyDictionary objectForKey:](self->_pageInfoToPageHost, "objectForKey:", v5)) == 0)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider pageHostForAbsolutePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m"), 373, CFSTR("failed to find a page host for page index %lu"), a3);
    return 0;
  }
  return result;
}

- (void)enumeratePageHostsUsingBlock:(id)a3
{
  TSURetainedPointerKeyDictionary *pageInfoToPageHost;
  _QWORD v4[5];

  if (a3)
  {
    pageInfoToPageHost = self->_pageInfoToPageHost;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_6AB8C;
    v4[3] = &unk_428178;
    v4[4] = a3;
    -[TSURetainedPointerKeyDictionary enumerateKeysAndObjectsUsingBlock:](pageInfoToPageHost, "enumerateKeysAndObjectsUsingBlock:", v4);
  }
}

- (void)syncPerformBlock:(id)a3
{
  if (a3)
    dispatch_sync((dispatch_queue_t)self->_pageHostMutex, a3);
}

- (id)layerAndSubviewHostForPageInfo:(id)a3
{
  NSObject *pageHostMutex;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_69E40;
  v11 = sub_69E50;
  v12 = 0;
  if (a3)
  {
    pageHostMutex = self->_pageHostMutex;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6AC64;
    block[3] = &unk_4281A0;
    block[5] = a3;
    block[6] = &v7;
    block[4] = self;
    dispatch_sync(pageHostMutex, block);
    v4 = (void *)v8[5];
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)pageLayerAndSubviewHostRecycle:(id)a3
{
  NSObject *pageHostMutex;
  _QWORD block[6];

  pageHostMutex = self->_pageHostMutex;
  if (pageHostMutex
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageViewProvider pageLayerAndSubviewHostRecycle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageViewProvider.m"), 434, CFSTR("invalid nil value for '%s'"), "_pageHostMutex"), (pageHostMutex = self->_pageHostMutex) != 0))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6AE54;
    block[3] = &unk_426E28;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(pageHostMutex, block);
  }
}

- (CGSize)pageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pageSize.width;
  height = self->_pageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (THPageViewProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THPageViewProviderDelegate *)a3;
}

- (BOOL)previewEnabled
{
  return self->_previewEnabled;
}

- (void)setPreviewEnabled:(BOOL)a3
{
  self->_previewEnabled = a3;
}

@end
