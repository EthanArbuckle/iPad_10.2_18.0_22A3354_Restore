@implementation SRHMediaEventsCollector

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _MergedGlobals = (uint64_t)os_log_create("com.apple.SensorKit", "SRHMediaEventsCollector");
}

- (SRHMediaEventsCollector)initWithScrollView:(id)a3 scrollMonitor:(id)a4
{
  return -[SRHMediaEventsCollector initWithScrollView:scrollMonitor:mediaViewsStore:](self, "initWithScrollView:scrollMonitor:mediaViewsStore:", a3, a4, -[SRHMediaViewsStore initWithScrollView:]([SRHMediaViewsStore alloc], "initWithScrollView:", a3));
}

- (SRHMediaEventsCollector)initWithScrollView:(id)a3 scrollMonitor:(id)a4 mediaViewsStore:(id)a5
{
  SRHMediaEventsCollector *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SRHMediaEventsCollector;
  v8 = -[SRHMediaEventsCollector init](&v10, sel_init);
  if (v8)
  {
    v8->_scrollView = (UIScrollView *)a3;
    v8->_scrollViewMonitor = (UIScrollViewMonitor *)a4;
    v8->_mediaViewsStore = (SRHMediaViewsStore *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_scrollView = 0;
  self->_scrollViewMonitor = 0;

  self->_mediaViewsStore = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRHMediaEventsCollector;
  -[SRHMediaEventsCollector dealloc](&v3, sel_dealloc);
}

- (void)scrollViewMonitorDidStartMonitoring:(id)a3
{
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = (_QWORD *)qword_254419A30;
  v15 = qword_254419A30;
  if (!qword_254419A30)
  {
    v7 = (void *)UIKitLibrary();
    v6 = dlsym(v7, "UIApplicationDidBecomeActiveNotification");
    v13[3] = (uint64_t)v6;
    qword_254419A30 = (uint64_t)v6;
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
    goto LABEL_8;
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_didBecomeActive, *v6, 0);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v9 = (_QWORD *)qword_254419A38;
  v15 = qword_254419A38;
  if (!qword_254419A38)
  {
    v10 = (void *)UIKitLibrary();
    v9 = dlsym(v10, "UIApplicationWillResignActiveNotification");
    v13[3] = (uint64_t)v9;
    qword_254419A38 = (uint64_t)v9;
  }
  _Block_object_dispose(&v12, 8);
  if (!v9)
  {
LABEL_8:
    dlerror();
    v11 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_willResignActive, *v9, 0);
  -[SRHMediaEventsCollector _addMediaSubviewsOfView:](self, "_addMediaSubviewsOfView:", a3);
  -[SRHMediaViewsStore processScrollViewOffset](self->_mediaViewsStore, "processScrollViewOffset");
}

- (void)scrollViewMonitorDidStopMonitoring:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3), "removeObserver:", self);
  -[SRHMediaViewsStore removeAllViews](self->_mediaViewsStore, "removeAllViews");
}

- (void)scrollViewMonitorScrollDid:(id)a3 addView:(id)a4 removeView:(id)a5
{
  if (a4)
  {
    NSClassFromString(CFSTR("UIScrollView"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[SRHMediaEventsCollector _addMediaSubviewsOfView:](self, "_addMediaSubviewsOfView:", a4);
  }
  else if (a5)
  {
    NSClassFromString(CFSTR("UIScrollView"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[SRHMediaEventsCollector _removeMediaSubviewsOfView:](self, "_removeMediaSubviewsOfView:", a5);
  }
}

- (void)scrollViewMonitorScrollDidScrolled:(id)a3
{
  -[SRHMediaViewsStore processScrollViewOffset](self->_mediaViewsStore, "processScrollViewOffset", a3);
}

- (void)didBecomeActive
{
  NSObject *v3;
  UIScrollView *scrollView;
  int v5;
  UIScrollView *v6;
  __int16 v7;
  SRHMediaEventsCollector *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = _MergedGlobals;
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_INFO))
  {
    scrollView = self->_scrollView;
    v5 = 134218240;
    v6 = scrollView;
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_245CD0000, v3, OS_LOG_TYPE_INFO, "App did become active, scrollView:%p, self:%p", (uint8_t *)&v5, 0x16u);
  }
  -[SRHMediaViewsStore markViewsAsOnScreen](self->_mediaViewsStore, "markViewsAsOnScreen");
}

- (void)willResignActive
{
  NSObject *v3;
  UIScrollView *scrollView;
  int v5;
  UIScrollView *v6;
  __int16 v7;
  SRHMediaEventsCollector *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = _MergedGlobals;
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_INFO))
  {
    scrollView = self->_scrollView;
    v5 = 134218240;
    v6 = scrollView;
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_245CD0000, v3, OS_LOG_TYPE_INFO, "App will become inactive, scrollView:%p, self:%p", (uint8_t *)&v5, 0x16u);
  }
  -[SRHMediaViewsStore markViewsAsOffScreen](self->_mediaViewsStore, "markViewsAsOffScreen");
}

- (void)_checkViewForMediaContent:(id)a3 withCompletionHandler:(id)a4
{
  NSObject *v6;
  objc_class *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL8 v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  const char *v14;
  objc_class *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  Class (*v19)(uint64_t);
  void *v20;
  _BYTE *v21;
  _BYTE buf[24];
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isHidden"))
  {
    v6 = _MergedGlobals;
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = NSStringFromClass(v7);
      _os_log_debug_impl(&dword_245CD0000, v6, OS_LOG_TYPE_DEBUG, "View:%p, class:%@ is hidden", buf, 0x16u);
    }
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = qword_254419A40;
  if (!qword_254419A40)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getUIImageViewClass_block_invoke;
    v20 = &unk_2516F0E60;
    v21 = buf;
    __getUIImageViewClass_block_invoke((uint64_t)&v17);
  }
  _Block_object_dispose(buf, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend((id)objc_msgSend(a3, "image"), "imageAsset");
    v9 = _MergedGlobals;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2048;
    v23 = (void (*)(uint64_t, uint64_t))v8;
    v14 = "View:%p, class:%@, is UIImageView class and not hidden, asset:%p";
LABEL_19:
    _os_log_debug_impl(&dword_245CD0000, v9, OS_LOG_TYPE_DEBUG, v14, buf, 0x20u);
    goto LABEL_8;
  }
  NSClassFromString(CFSTR("CKImageBalloonView"));
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_16;
  v11 = (void *)objc_msgSend(a3, "performSelector:", sel_image);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = qword_254419A48;
  if (!qword_254419A48)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __getUIImageClass_block_invoke;
    v20 = &unk_2516F0E60;
    v21 = buf;
    __getUIImageClass_block_invoke((uint64_t)&v17);
  }
  _Block_object_dispose(buf, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v8 = objc_msgSend(v11, "imageAsset");
  v9 = _MergedGlobals;
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    v23 = (void (*)(uint64_t, uint64_t))v8;
    v14 = "View:%p, class:%@ asset:%p";
    goto LABEL_19;
  }
LABEL_8:
  v10 = v8 != 0;
LABEL_17:
  (*((void (**)(id, _BOOL8, _QWORD))a4 + 2))(a4, v10, 0);
}

- (void)_addMediaSubviewsOfView:(id)a3
{
  -[SRHMediaEventsCollector _addMediaSubviewsOfView:viewsTraversed:](self, "_addMediaSubviewsOfView:viewsTraversed:", a3, 0);
}

- (void)_removeMediaSubviewsOfView:(id)a3
{
  -[SRHMediaEventsCollector _removeMediaSubviewsOfView:viewsTraversed:](self, "_removeMediaSubviewsOfView:viewsTraversed:", a3, 0);
}

- (int64_t)_addMediaSubviewsOfView:(id)a3 viewsTraversed:(int64_t)a4
{
  int64_t v4;
  NSObject *v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, int);
  void *v21;
  SRHMediaEventsCollector *v22;
  id v23;
  uint8_t buf[8];
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  if (a4 < 5000)
  {
    v4 = a4 + 1;
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __66__SRHMediaEventsCollector__addMediaSubviewsOfView_viewsTraversed___block_invoke;
    v21 = &unk_2516F0E38;
    v22 = self;
    v23 = a3;
    -[SRHMediaEventsCollector _checkViewForMediaContent:withCompletionHandler:](self, "_checkViewForMediaContent:withCompletionHandler:");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)objc_msgSend(a3, "subviews", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v4 = -[SRHMediaEventsCollector _addMediaSubviewsOfView:viewsTraversed:](self, "_addMediaSubviewsOfView:viewsTraversed:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), v4);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      }
      while (v10);
    }
  }
  else
  {
    v5 = _MergedGlobals;
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245CD0000, v5, OS_LOG_TYPE_ERROR, "Adding view. Stop subviews parsing. View is too big.", buf, 2u);
    }
  }
  return v4;
}

uint64_t __66__SRHMediaEventsCollector__addMediaSubviewsOfView_viewsTraversed___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "addViewToStore:", *(_QWORD *)(result + 40));
  return result;
}

- (int64_t)_removeMediaSubviewsOfView:(id)a3 viewsTraversed:(int64_t)a4
{
  int64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, int);
  void *v21;
  SRHMediaEventsCollector *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  if (a4 < 5000)
  {
    v6 = a3;
    v8 = MEMORY[0x24BDAC760];
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __69__SRHMediaEventsCollector__removeMediaSubviewsOfView_viewsTraversed___block_invoke;
    v21 = &unk_2516F0E38;
    v22 = self;
    v23 = a3;
    -[SRHMediaEventsCollector _checkViewForMediaContent:withCompletionHandler:](self, "_checkViewForMediaContent:withCompletionHandler:");
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x3052000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    v34 = qword_254419A50;
    if (!qword_254419A50)
    {
      v24 = v8;
      v25 = 3221225472;
      v26 = __getUICollectionViewCellClass_block_invoke;
      v27 = &unk_2516F0E60;
      v28 = buf;
      __getUICollectionViewCellClass_block_invoke((uint64_t)&v24);
    }
    _Block_object_dispose(buf, 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x3052000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    v34 = qword_254419A58;
    if (!qword_254419A58)
    {
      v24 = v8;
      v25 = 3221225472;
      v26 = __getUITableViewCellClass_block_invoke;
      v27 = &unk_2516F0E60;
      v28 = buf;
      __getUITableViewCellClass_block_invoke((uint64_t)&v24);
    }
    _Block_object_dispose(buf, 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
LABEL_10:
      v6 = (id)objc_msgSend(v6, "contentView");
    v9 = (void *)objc_msgSend(v6, "subviews");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v35, 16);
    ++v4;
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          v4 = -[SRHMediaEventsCollector _removeMediaSubviewsOfView:viewsTraversed:](self, "_removeMediaSubviewsOfView:viewsTraversed:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v4);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v35, 16);
      }
      while (v10);
    }
  }
  else
  {
    v5 = _MergedGlobals;
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245CD0000, v5, OS_LOG_TYPE_ERROR, "Removing view. Stop subviews parsing. View is too big.", buf, 2u);
    }
  }
  return v4;
}

uint64_t __69__SRHMediaEventsCollector__removeMediaSubviewsOfView_viewsTraversed___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "removeViewFromStore:", *(_QWORD *)(result + 40));
  return result;
}

@end
