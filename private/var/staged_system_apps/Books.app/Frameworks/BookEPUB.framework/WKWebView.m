@implementation WKWebView

- (unint64_t)be_imageFilterMode
{
  return 0;
}

- (id)_be_contentViewStateDescriptionForState:(int)a3
{
  if (a3 > 0xE)
    return CFSTR("unknown");
  else
    return off_378290[a3];
}

- (void)setBe_contentViewState:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;

  v3 = *(_QWORD *)&a3;
  v5 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  v6 = _BookEPUBLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_identifier](self, "be_identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _be_contentViewStateDescriptionForState:](self, "_be_contentViewStateDescriptionForState:", v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _be_contentViewStateDescriptionForState:](self, "_be_contentViewStateDescriptionForState:", v3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView URL](self, "URL"));
    v13 = 138544386;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 2160;
    v20 = 1752392040;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Transitioning webView:%{public}@ #webViewState from:%{public}@ to:%{public}@ for url:%{mask.hash}@", (uint8_t *)&v13, 0x34u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  objc_setAssociatedObject(self, "be_contentViewState", v12, (char *)&dword_0 + 1);

}

- (int)be_contentViewState
{
  id AssociatedObject;
  void *v3;
  void *v4;
  int v5;

  AssociatedObject = objc_getAssociatedObject(self, "be_contentViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = 0;

  return v5;
}

- (void)_invalidStateTransition:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  v6 = _BookEPUBLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_identifier](self, "be_identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _be_contentViewStateDescriptionForState:](self, "_be_contentViewStateDescriptionForState:", v5));
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Error Transitioning webView:%{public}@ #webViewState from:%{public}@ in Method:%{public}@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)be_willAttemptFontRegistration
{
  unsigned int v3;

  v3 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  if (v3 > 0xB || ((1 << v3) & 0x991) == 0)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_willAttemptFontRegistration"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 5);
}

- (void)be_fontRegistrationCompleted:(BOOL)a3
{
  if ((-[WKWebView be_contentViewState](self, "be_contentViewState", a3) & 0xFFFFFFFE) != 4)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_fontRegistrationCompleted"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 6);
}

- (void)be_willSkipLoad
{
  unsigned int v3;

  v3 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  if (v3 > 0xD || ((1 << v3) & 0x2840) == 0)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_willSkipLoad"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 10);
}

- (void)be_willAttemptLoad:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  if (-[WKWebView be_contentViewState](self, "be_contentViewState") == 8)
  {
    v5 = _BookEPUBLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_identifier](self, "be_identifier"));
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "#webViewState webView:%{public}@ attempting load of:%{public}@", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_willAttemptLoad"));
  }
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 9);

}

- (void)be_completedLoad
{
  unsigned int v3;
  uint64_t v4;

  v3 = -[WKWebView be_contentViewState](self, "be_contentViewState") - 2;
  if (v3 < 9 && ((0x183u >> v3) & 1) != 0)
  {
    v4 = dword_2E49E8[v3];
  }
  else
  {
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_completedLoad"));
    v4 = 11;
  }
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", v4);
}

- (void)be_paginationOperationCanceled
{
  unsigned int v3;

  v3 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  if (v3 > 0xE)
    goto LABEL_6;
  if (((1 << v3) & 0x40EE) != 0)
    return;
  if (((1 << v3) & 0x3C00) == 0)
  {
    if (v3 == 9)
    {
      -[WKWebView stopLoading](self, "stopLoading");
      goto LABEL_7;
    }
LABEL_6:
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_paginationOperationCanceled"));
  }
LABEL_7:
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 13);
}

- (void)be_failedLoad
{
  if ((-[WKWebView be_contentViewState](self, "be_contentViewState") | 4) == 0xD)
    -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 12);
  else
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_failedLoad"));
}

- (void)be_preparingForReuse
{
  unsigned int v3;

  v3 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  if (v3 - 8 >= 6 && v3 != 6)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_preparingForReuse"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 1);
}

- (void)be_willLoadAboutBlank
{
  if (-[WKWebView be_contentViewState](self, "be_contentViewState") != 1)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_willLoadAboutBlank"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 2);
}

- (void)be_processingContentViewForHost
{
  if (-[WKWebView be_contentViewState](self, "be_contentViewState") != 3)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_processingContentViewForHost"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 4);
}

- (void)be_returningContentViewToPool
{
  if (-[WKWebView be_contentViewState](self, "be_contentViewState") != 3)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_returningContentViewToPool"));
}

- (void)be_discardingContentView
{
  if (-[WKWebView be_contentViewState](self, "be_contentViewState") != 3)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_discardingContentView"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 14);
}

- (void)be_prepareForLoad
{
  unsigned int v3;

  v3 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  if (v3 > 0xD || ((1 << v3) & 0x3940) == 0)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_prepareForLoad"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 8);
}

- (void)be_prepareForReload
{
  unsigned int v3;

  v3 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  if (v3 > 0xB || ((1 << v3) & 0xB40) == 0)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_prepareForLoad"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 8);
}

- (void)be_willFullyConfigure
{
  unsigned int v3;

  v3 = -[WKWebView be_contentViewState](self, "be_contentViewState");
  if (v3 - 10 >= 4)
  {
    if (v3 == 5)
      return;
    if (v3 != 6)
      -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_willFullyConfigure"));
  }
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 7);
}

- (void)be_willProcessDeferredFontRegistration
{
  if ((-[WKWebView be_contentViewState](self, "be_contentViewState") & 0xFFFFFFFE) != 6)
    -[WKWebView _invalidStateTransition:](self, "_invalidStateTransition:", CFSTR("be_willProcessDeferredFontRegistration"));
  -[WKWebView setBe_contentViewState:](self, "setBe_contentViewState:", 7);
}

- (void)setBe_identifier:(id)a3
{
  objc_setAssociatedObject(self, "be_identifier", a3, (char *)&dword_0 + 1);
}

- (NSString)be_identifier
{
  return (NSString *)objc_getAssociatedObject(self, "be_identifier");
}

- (void)setBe_textZoomFactor:(double)a3
{
  -[WKWebView _setTextZoomFactor:](self, "_setTextZoomFactor:", a3);
}

- (double)be_textZoomFactor
{
  double result;

  -[WKWebView _textZoomFactor](self, "_textZoomFactor");
  return result;
}

- (void)setBe_paginationMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    a3 = 0;
  -[WKWebView _setPaginationMode:](self, "_setPaginationMode:", a3);
}

- (int64_t)be_paginationMode
{
  int64_t result;

  result = (int64_t)-[WKWebView _paginationMode](self, "_paginationMode");
  if ((unint64_t)(result - 1) >= 4)
    return 0;
  return result;
}

- (double)be_pageLength
{
  double result;

  -[WKWebView _pageLength](self, "_pageLength");
  return result;
}

- (unint64_t)be_pageCount
{
  return (unint64_t)-[WKWebView _pageCount](self, "_pageCount");
}

- (double)be_gapBetweenPages
{
  double result;

  -[WKWebView _gapBetweenPages](self, "_gapBetweenPages");
  return result;
}

- (BOOL)be_paginationBehavesLikeColumns
{
  return -[WKWebView _paginationBehavesLikeColumns](self, "_paginationBehavesLikeColumns");
}

- (BOOL)be_paginationLineGridEnabled
{
  return -[WKWebView _paginationLineGridEnabled](self, "_paginationLineGridEnabled");
}

- (void)setBe_viewScale:(double)a3
{
  -[WKWebView _setViewScale:](self, "_setViewScale:", a3);
}

- (double)be_viewScale
{
  double result;

  -[WKWebView _viewScale](self, "_viewScale");
  return result;
}

- (id)be_viewForFindUI
{
  return -[WKWebView _viewForFindUI](self, "_viewForFindUI");
}

- (void)be_suspendAllMediaPlayback
{
  -[WKWebView _suspendAllMediaPlayback](self, "_suspendAllMediaPlayback");
}

- (void)be_resumeAllMediaPlayback
{
  -[WKWebView _resumeAllMediaPlayback](self, "_resumeAllMediaPlayback");
}

- (void)be_doAfterNextPresentationUpdate:(id)a3
{
  -[WKWebView _doAfterNextPresentationUpdate:](self, "_doAfterNextPresentationUpdate:", a3);
}

- (void)be_doAfterNextStablePresentationUpdate:(id)a3
{
  -[WKWebView _doAfterNextStablePresentationUpdate:](self, "_doAfterNextStablePresentationUpdate:", a3);
}

- (CGPoint)be_convertPointFromContentsToView:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[WKWebView _convertPointFromContentsToView:](self, "_convertPointFromContentsToView:", a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setBe_navigationHandler:(id)a3
{
  objc_setAssociatedObject(self, "be_navigationHandler", a3, (char *)&dword_0 + 1);
}

- (BENavigationHandler)be_navigationHandler
{
  return (BENavigationHandler *)objc_getAssociatedObject(self, "be_navigationHandler");
}

- (void)setBe_userContentController:(id)a3
{
  objc_setAssociatedObject(self, "be_userContentController", a3, (char *)&dword_0 + 1);
}

- (WKUserContentController)be_userContentController
{
  return (WKUserContentController *)objc_getAssociatedObject(self, "be_userContentController");
}

- (void)setBe_gutterLength:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_setAssociatedObject(self, "be_gutterLength", v4, (char *)&dword_0 + 1);

}

- (double)be_gutterLength
{
  id AssociatedObject;
  void *v3;
  double v4;
  double v5;

  AssociatedObject = objc_getAssociatedObject(self, "be_gutterLength");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setBe_isHorizontalScroll:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, "be_isHorizontalScroll", v4, (char *)&dword_0 + 1);

}

- (BOOL)be_isHorizontalScroll
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, "be_isHorizontalScroll");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBe_uiHandler:(id)a3
{
  objc_setAssociatedObject(self, "be_uiHandler", a3, (char *)&dword_0 + 1);
}

- (BEUIHandler)be_uiHandler
{
  return (BEUIHandler *)objc_getAssociatedObject(self, "be_uiHandler");
}

- (void)setBe_appliedContentBlockingRule:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_setAssociatedObject(self, "be_appliedContentBlockingRule", v4, (char *)&dword_0 + 1);

}

- (unint64_t)be_appliedContentBlockingRule
{
  id AssociatedObject;
  void *v3;
  id v4;

  AssociatedObject = objc_getAssociatedObject(self, "be_appliedContentBlockingRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

- (double)be_scrollingPageWidth
{
  unint64_t v3;
  double result;
  CGRect v5;

  v3 = (unint64_t)-[WKWebView _paginationMode](self, "_paginationMode");
  if (v3 > 4)
    return 0.0;
  if (((1 << v3) & 0x19) != 0)
  {
    -[WKWebView bounds](self, "bounds");
    return CGRectGetWidth(v5);
  }
  else
  {
    -[WKWebView _pageLength](self, "_pageLength");
  }
  return result;
}

- (double)be_scrollingPageHeight
{
  char *v3;
  double result;
  CGRect v5;

  v3 = (char *)-[WKWebView _paginationMode](self, "_paginationMode");
  if ((unint64_t)v3 >= 3)
  {
    if ((unint64_t)(v3 - 3) > 1)
      return 0.0;
    else
      -[WKWebView _pageLength](self, "_pageLength");
  }
  else
  {
    -[WKWebView bounds](self, "bounds");
    return CGRectGetHeight(v5);
  }
  return result;
}

- (double)be_scale
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = objc_opt_class(_BEFixedLayoutWKWebView);
  v4 = BUDynamicCast(v3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "be_initialScale");
    v8 = v7;
  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

- (NSString)be_logDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_identifier](self, "be_identifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView URL](self, "URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self, "scrollView"));
  objc_msgSend(v7, "contentOffset");
  v22[0] = v8;
  v22[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v22, "{CGPoint=dd}"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_requestedContentOffset](self, "be_requestedContentOffset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self, "scrollView"));
  objc_msgSend(v12, "contentSize");
  v21[0] = v13;
  v21[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v21, "{CGSize=dd}"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_estimatedContentSizeValue](self, "be_estimatedContentSizeValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@> url: %@\n\tcontentOffset: %@ requestedOffset: %@\n\tcontentSize: %@ estimatedSize: %@"), v19, v5, v6, v10, v11, v15, v16));

  return (NSString *)v17;
}

- (BOOL)be_hasPendingOperations
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, "be_hasPendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBe_hasPendingOperations:(BOOL)a3
{
  _BOOL8 v3;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  id v9;

  v3 = a3;
  v5 = NSStringFromSelector("be_hasPendingOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[WKWebView willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_setAssociatedObject(self, "be_hasPendingOperations", v7, (char *)&dword_0 + 1);

  v8 = NSStringFromSelector("be_hasPendingOperations");
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[WKWebView didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (NSString)be_configurationKey
{
  return (NSString *)objc_getAssociatedObject(self, "be_configurationKey");
}

- (void)setBe_configurationKey:(id)a3
{
  objc_setAssociatedObject(self, "be_configurationKey", a3, (char *)&dword_0 + 1);
}

- (NSValue)be_estimatedContentSizeValue
{
  return (NSValue *)objc_getAssociatedObject(self, "be_estimatedContentSizeValue");
}

- (void)setBe_estimatedContentSizeValue:(id)a3
{
  objc_setAssociatedObject(self, "be_estimatedContentSizeValue", a3, (char *)&dword_0 + 1);
}

- (NSValue)be_requestedContentOffset
{
  return (NSValue *)objc_getAssociatedObject(self, "be_requestedContentOffset");
}

- (void)setBe_requestedContentOffset:(id)a3
{
  objc_setAssociatedObject(self, "be_requestedContentOffset", a3, (char *)&dword_0 + 1);
}

- (id)be_requestedContentOffsetShouldBypassJS
{
  return objc_getAssociatedObject(self, "be_requestedContentOffsetShouldBypassJS");
}

- (void)setBe_requestedContentOffsetShouldBypassJS:(id)a3
{
  objc_setAssociatedObject(self, "be_requestedContentOffsetShouldBypassJS", a3, (char *)&dword_0 + 1);
}

- (void)be_setContentOffset:(CGPoint)a3
{
  -[WKWebView be_setContentOffset:bypassingJS:](self, "be_setContentOffset:bypassingJS:", 0, a3.x, a3.y);
}

- (void)be_setContentOffset:(CGPoint)a3 bypassingJS:(BOOL)a4
{
  -[WKWebView be_setContentOffset:bypassingJS:completion:](self, "be_setContentOffset:bypassingJS:completion:", a4, 0, a3.x, a3.y);
}

- (void)be_setContentOffset:(CGPoint)a3 completion:(id)a4
{
  -[WKWebView be_setContentOffset:bypassingJS:completion:](self, "be_setContentOffset:bypassingJS:completion:", 0, a4, a3.x, a3.y);
}

- (void)be_setContentOffset:(CGPoint)a3 bypassingJS:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  double v24;
  double v25;
  _QWORD v26[2];

  v5 = a4;
  y = a3.y;
  x = a3.x;
  v9 = a5;
  *(double *)v26 = x;
  *(double *)&v26[1] = y;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v26, "{CGPoint=dd}"));
  -[WKWebView setBe_requestedContentOffset:](self, "setBe_requestedContentOffset:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  -[WKWebView setBe_requestedContentOffsetShouldBypassJS:](self, "setBe_requestedContentOffsetShouldBypassJS:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self, "scrollView"));
  -[WKWebView convertPoint:fromView:](self, "convertPoint:fromView:", v12, x, y);
  -[WKWebView _convertPointFromViewToContents:](self, "_convertPointFromViewToContents:");
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self, "scrollView"));
  objc_msgSend(v17, "setContentOffset:", x, y);

  if (v5)
  {
    v18 = objc_retainBlock(v9);
    v19 = v18;
    if (v18)
      (*((void (**)(id))v18 + 2))(v18);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("window.scrollTo(%@, %@);"),
                      v20,
                      v21));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1FCB4;
    v22[3] = &unk_3781F8;
    v22[4] = self;
    v24 = x;
    v25 = y;
    v23 = v9;
    -[WKWebView evaluateJavaScript:completionHandler:](self, "evaluateJavaScript:completionHandler:", v19, v22);

  }
}

- (void)be_applyRequestedContentOffset
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat y;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  CGPoint v29;
  CGPoint v30;
  CGRect v31;
  CGRect v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_requestedContentOffset](self, "be_requestedContentOffset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_requestedContentOffsetShouldBypassJS](self, "be_requestedContentOffsetShouldBypassJS"));
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v3)
  {
    objc_msgSend(v3, "CGPointValue");
    v7 = v6;
    v9 = v8;
    y = CGPointZero.y;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self, "scrollView"));
    objc_msgSend(v11, "contentSize");
    v13 = v12;
    v15 = v14;

    v31.origin.x = CGPointZero.x;
    v31.origin.y = y;
    v31.size.width = v13;
    v31.size.height = v15;
    v30.x = v7;
    v30.y = v9;
    if (CGRectContainsPoint(v31, v30))
    {
      -[WKWebView be_setContentOffset:bypassingJS:](self, "be_setContentOffset:bypassingJS:", v5, v7, v9);
      -[WKWebView setBe_requestedContentOffset:](self, "setBe_requestedContentOffset:", 0);
      -[WKWebView setBe_requestedContentOffsetShouldBypassJS:](self, "setBe_requestedContentOffsetShouldBypassJS:", 0);
    }
    else
    {
      v16 = _BookEPUBLog();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_identifier](self, "be_identifier"));
        v32.origin.x = CGPointZero.x;
        v32.origin.y = y;
        v32.size.width = v13;
        v32.size.height = v15;
        v19 = NSStringFromCGRect(v32);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v29.x = v7;
        v29.y = v9;
        v21 = NSStringFromCGPoint(v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v23 = 138543874;
        v24 = v18;
        v25 = 2114;
        v26 = v20;
        v27 = 2114;
        v28 = v22;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "be_applyRequestedContentOffset - contentSizeRect: WebView: %{public}@ %{public}@ does not contain %{public}@.  Skipping..", (uint8_t *)&v23, 0x20u);

      }
    }
  }

}

- (BOOL)be_hasCompletedLoad
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, "be_hasCompletedLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBe_hasCompletedLoad:(BOOL)a3
{
  _BOOL8 v3;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  id v9;

  v3 = a3;
  v5 = NSStringFromSelector("be_hasCompletedLoad");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[WKWebView willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_setAssociatedObject(self, "be_hasCompletedLoad", v7, (char *)&dword_0 + 1);

  v8 = NSStringFromSelector("be_hasCompletedLoad");
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[WKWebView didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (BOOL)be_requiresReload
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, "be_requiresReload");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBe_requiresReload:(BOOL)a3
{
  _BOOL8 v3;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  id v9;

  v3 = a3;
  v5 = NSStringFromSelector("be_requiresReload");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[WKWebView willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_setAssociatedObject(self, "be_requiresReload", v7, (char *)&dword_0 + 1);

  v8 = NSStringFromSelector("be_requiresReload");
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[WKWebView didChangeValueForKey:](self, "didChangeValueForKey:", v9);

}

- (NSArray)be_fontFamiliesHavingFailedRegistration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _be_failedFontFamilies](self, "_be_failedFontFamilies"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return (NSArray *)v3;
}

- (id)_be_failedFontFamilies
{
  id AssociatedObject;
  id v4;

  AssociatedObject = objc_getAssociatedObject(self, "_be_failedFontFamilies");
  v4 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = objc_alloc_init((Class)NSMutableSet);
    objc_setAssociatedObject(self, "_be_failedFontFamilies", v4, (char *)&dword_0 + 1);
  }
  return v4;
}

- (void)be_fontFamilyFailedToRegister:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = _BookEPUBLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v8)
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "be_fontFamilyFailedToRegister #staleCache failing '%@'", (uint8_t *)&v13, 0xCu);
    }

    v9 = NSStringFromSelector("be_fontFamiliesHavingFailedRegistration");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[WKWebView willChangeValueForKey:](self, "willChangeValueForKey:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _be_failedFontFamilies](self, "_be_failedFontFamilies"));
    objc_msgSend(v11, "addObject:", v4);

    v12 = NSStringFromSelector("be_fontFamiliesHavingFailedRegistration");
    v7 = objc_claimAutoreleasedReturnValue(v12);
    -[WKWebView didChangeValueForKey:](self, "didChangeValueForKey:", v7);
  }
  else if (v8)
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "be_fontFamilyFailedToRegister: #staleCache Attempt to mark fontFamily '%@' as failed!", (uint8_t *)&v13, 0xCu);
  }

}

- (void)be_fontFamilySuccessfullyRegistered:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _be_failedFontFamilies](self, "_be_failedFontFamilies"));
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      v7 = NSStringFromSelector("be_fontFamiliesHavingFailedRegistration");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      -[WKWebView willChangeValueForKey:](self, "willChangeValueForKey:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _be_failedFontFamilies](self, "_be_failedFontFamilies"));
      objc_msgSend(v9, "removeObject:", v4);

      v10 = NSStringFromSelector("be_fontFamiliesHavingFailedRegistration");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[WKWebView didChangeValueForKey:](self, "didChangeValueForKey:", v11);

    }
  }
  else
  {
    v12 = _BookEPUBLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "be_fontFamilyFailedToRegister: Attempt to mark fontFamily '%@' as failed!", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (BOOL)be_isFontRegistered:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = objc_opt_class(BEWKWebView);
  v6 = BUDynamicCast(v5, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "be_isFontRegistered:", v4);

  return v8;
}

- (void)be_clearRegisteredFonts
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = objc_opt_class(BEWKWebView);
  v4 = BUDynamicCast(v3, self);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "be_clearRegisteredFonts");

}

- (void)be_configureFontWithStyleManager:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(BEWKWebView);
  v9 = BUDynamicCast(v8, self);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "be_configureFontWithStyleManager:completion:", v7, v6);

}

- (void)setBe_textInteractionDelegate:(id)a3
{
  BESetWeakAssociatedObject(self, "be_textInteractionDelegate", a3);
}

- (UITextInteractionDelegatePrivate)be_textInteractionDelegate
{
  return (UITextInteractionDelegatePrivate *)BEGetWeakAssociatedObject(self, "be_textInteractionDelegate");
}

- (void)setBe_textInteractionAssistantDelegate:(id)a3
{
  BESetWeakAssociatedObject(self, "be_textInteractionAssistantDelegate", a3);
}

- (BEUIWKTextInteractionAssistantDelegate)be_textInteractionAssistantDelegate
{
  return (BEUIWKTextInteractionAssistantDelegate *)BEGetWeakAssociatedObject(self, "be_textInteractionAssistantDelegate");
}

- (NSString)be_selectedText
{
  void *v3;
  void *v4;

  if (-[WKWebView be_hasSelection](self, "be_hasSelection"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self, "be_textInputChild"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedText"));

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)be_clearSelection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self, "be_textInputChild"));
  objc_msgSend(v2, "clearSelection");

}

- (BOOL)be_hasSelection
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_webSelectionRects](self, "be_webSelectionRects"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)be_webSelectionRects
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self, "be_textInputChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "webSelectionRects"));

  return (NSArray *)v3;
}

- (NSArray)be_selectionRects
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_webSelectionRects](self, "be_webSelectionRects", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "rect");
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)be_selectForWebView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self, "be_textInputChild"));
  objc_msgSend(v5, "selectForWebView:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactionAssistant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionView"));
  objc_msgSend(v7, "showSelectionCommandsAfterDelay:", 0.2);

  if (v4)
  {
    v8 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_20950;
    block[3] = &unk_378220;
    v10 = v4;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (BOOL)be_hasSelectablePositionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  unsigned __int8 v6;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_textInputChild](self, "be_textInputChild"));
  v6 = objc_msgSend(v5, "hasSelectablePositionAtPoint:", x, y);

  return v6;
}

- (UIWKInteractionViewProtocol)be_textInputChild
{
  id AssociatedObject;
  void *v4;
  WKWebView *v5;
  id v6;
  void *v7;

  AssociatedObject = objc_getAssociatedObject(self, "be_textInputChild");
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v5 = self;
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v5, 0);
    if (objc_msgSend(v6, "count"))
    {
      while (1)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
        if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___UIWKInteractionViewProtocol))
        {
          if ((objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___UITextInputPrivate) & 1) != 0)
            break;
        }
        objc_msgSend(v6, "removeObjectAtIndex:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));
        objc_msgSend(v6, "addObjectsFromArray:", v7);

        if (!objc_msgSend(v6, "count"))
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      v4 = 0;
    }

    objc_setAssociatedObject(v5, "be_textInputChild", v4, (char *)&dword_0 + 1);
  }
  return (UIWKInteractionViewProtocol *)v4;
}

- (void)be_takeSnapshotWithDefaultConfigurationCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)WKSnapshotConfiguration);
  -[WKWebView takeSnapshotWithConfiguration:completionHandler:](self, "takeSnapshotWithConfiguration:completionHandler:", v5, v4);

}

- (void)be_evaluateJavaScript:(id)a3 completion:(id)a4
{
  -[WKWebView be_evaluateJavaScript:afterNextPresentationUpdate:completion:](self, "be_evaluateJavaScript:afterNextPresentationUpdate:completion:", a3, 0, a4);
}

- (void)be_evaluateJavaScript:(id)a3 afterNextPresentationUpdate:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_20C40;
  v16[3] = &unk_378270;
  v10 = v8;
  v17 = v10;
  v11 = v9;
  v18 = v11;
  v16[4] = self;
  v12 = objc_retainBlock(v16);
  v13 = v12;
  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_21054;
    v14[3] = &unk_378220;
    v15 = v12;
    -[WKWebView _doAfterNextPresentationUpdateWithoutWaitingForPainting:](self, "_doAfterNextPresentationUpdateWithoutWaitingForPainting:", v14);

  }
  else
  {
    ((void (*)(_QWORD *))v12[2])(v12);
  }

}

- (void)be_updateAXCurrentReadingStateWithMessage:(id)a3 forValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(BEWKWebView);
  v9 = BUDynamicCast(v8, self);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "be_updateAXCurrentReadingStateWithMessage:forValue:", v7, v6);

}

- (id)be_updateAXValueForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("BEWebProcessPluginIdentifierParameterKey");
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView be_identifier](self, "be_identifier"));
  v8[1] = CFSTR("BEWebProcessPluginMessageParameterKey");
  v9[0] = v5;
  v9[1] = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  return v6;
}

@end
