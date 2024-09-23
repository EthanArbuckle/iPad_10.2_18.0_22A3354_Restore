@implementation CRLInteractiveCanvasRepContentSubviewReuser

- (CRLInteractiveCanvasRepContentSubviewReuser)initWithSubview:(id)a3 originalRepContentPile:(id)a4
{
  id v6;
  id v7;
  CRLInteractiveCanvasRepContentSubviewReuser *v8;
  uint64_t v9;
  CALayer *reusableSubviewLayer;
  NSArray *v11;
  NSArray *repContentPlatformViews;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLInteractiveCanvasRepContentSubviewReuser;
  v8 = -[CRLInteractiveCanvasRepContentSubviewReuser init](&v16, "init");
  if (v8)
  {
    if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___CRLInteractiveCanvasRepLayerPile))
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
      reusableSubviewLayer = v8->_reusableSubviewLayer;
      v8->_reusableSubviewLayer = (CALayer *)v9;
    }
    else if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___CRLInteractiveCanvasRepContentPlatformViewPile))
    {
      objc_storeStrong((id *)&v8->_originalRepContentPile, a4);
      reusableSubviewLayer = (CALayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));
      v11 = (NSArray *)-[CALayer copy](reusableSubviewLayer, "copy");
      repContentPlatformViews = v8->_repContentPlatformViews;
      v8->_repContentPlatformViews = v11;

    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244E18);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0CEEC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101244E38);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      reusableSubviewLayer = (CALayer *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewReuser initWithSubview:originalRepContentPile:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", reusableSubviewLayer, v14, 435, 0, "Rep content pile did not implement either CRLInteractiveCanvasRepLayerPile or CRLInteractiveCanvasRepContentPlatformViewPile: %@", v7);

    }
  }

  return v8;
}

- (BOOL)canReuseForRepContentLayersDuringBackgroundUpdate
{
  return self->_reusableSubviewLayer != 0;
}

- (void)reuseForRepContentLayers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  if (!-[CRLInteractiveCanvasRepContentSubviewReuser canReuseForRepContentLayersDuringBackgroundUpdate](self, "canReuseForRepContentLayersDuringBackgroundUpdate"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244E58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0CF80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244E78);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewReuser reuseForRepContentLayers:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 449, 0, "Reusing the subview for rep content layers must be allowed.");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer sublayers](self->_reusableSubviewLayer, "sublayers"));
  v9 = objc_msgSend(v4, "isEqualToArray:", v8);

  if ((v9 & 1) == 0)
    -[CALayer setSublayers:](self->_reusableSubviewLayer, "setSublayers:", v4);

}

- (BOOL)canReuseUnmodifiedForRepContentPile:(id)a3
{
  CRLInteractiveCanvasRepContentPile *originalRepContentPile;

  originalRepContentPile = self->_originalRepContentPile;
  if (originalRepContentPile)
    LOBYTE(originalRepContentPile) = -[CRLInteractiveCanvasRepContentPile isContentEqualToContentOfRepContentPile:](originalRepContentPile, "isContentEqualToContentOfRepContentPile:", a3);
  return (char)originalRepContentPile;
}

- (void)removeRepContentPlatformViews
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244E98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0D000();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244EB8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewReuser removeRepContentPlatformViews]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 464, 0, "This operation must only be performed on the main thread.");

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_repContentPlatformViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "removeFromSuperview", (_QWORD)v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repContentPlatformViews, 0);
  objc_storeStrong((id *)&self->_originalRepContentPile, 0);
  objc_storeStrong((id *)&self->_reusableSubviewLayer, 0);
}

@end
