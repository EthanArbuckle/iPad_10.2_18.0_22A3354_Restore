@implementation WebPluginController

- (id)plugInViewWithArguments:(id)a3 fromPluginPackage:(id)a4
{
  return 0;
}

+ (void)addPlugInView:(id)a3
{
  id v4;
  const void *v5;

  if ((byte_1ECEC9794 & 1) != 0)
  {
    if (qword_1ECEC97A8)
      goto LABEL_5;
  }
  else
  {
    qword_1ECEC97A8 = 0;
    byte_1ECEC9794 = 1;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = (const void *)qword_1ECEC97A8;
  qword_1ECEC97A8 = (uint64_t)v4;
  if (v5)
    CFRelease(v5);
LABEL_5:
  if (a3)
    objc_msgSend((id)qword_1ECEC97A8, "addObject:", a3);
}

+ (BOOL)isPlugInView:(id)a3
{
  void *v3;

  if (byte_1ECEC9794 == 1)
  {
    v3 = (void *)qword_1ECEC97A8;
  }
  else
  {
    v3 = 0;
    qword_1ECEC97A8 = 0;
    byte_1ECEC9794 = 1;
  }
  return objc_msgSend(v3, "containsObject:", a3);
}

- (WebPluginController)initWithDocumentView:(id)a3
{
  WebPluginController *v4;
  WebPluginController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebPluginController;
  v4 = -[WebPluginController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_documentView = (WAKView *)a3;
    v4->_views = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_checksInProgress = (NSMutableSet *)CFSetCreateMutable(0, 0, 0);
  }
  return v5;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (WebDataSource *)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebPluginController;
  -[WebPluginController dealloc](&v3, sel_dealloc);
}

- (BOOL)plugInsAreRunning
{
  uint64_t v3;
  BOOL v4;

  v3 = -[NSMutableArray count](self->_views, "count");
  v4 = !self->_started || v3 == 0;
  return !v4;
}

- (id)superlayerForPluginView:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  WebCore::LocalFrameView *v6;
  uint64_t v7;

  v4 = -[WebPluginController webFrame](self, "webFrame");
  if (v4
    && (v5 = *(_QWORD *)(v4[1] + 8)) != 0
    && (v6 = *(WebCore::LocalFrameView **)(v5 + 288)) != 0
    && (v7 = WebCore::LocalFrameView::graphicsLayerForPlatformWidget(v6, (WAKView *)a3)) != 0)
  {
    return (id)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 584))(v7);
  }
  else
  {
    return 0;
  }
}

- (void)stopOnePlugin:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) != 0)
  {
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v4);
    MEMORY[0x1D82A3494](v6);
    objc_msgSend(a3, "webPlugInStop");
  }
  else
  {
    v5 = objc_opt_respondsToSelector();
    if ((v5 & 1) == 0)
      return;
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v5);
    MEMORY[0x1D82A3494](v6);
    objc_msgSend(a3, "pluginStop");
  }
  JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v6);
}

- (void)stopOnePluginForPageCache:(id)a3
{
  uint64_t v5;
  _BYTE v6[24];

  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
  {
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v5);
    MEMORY[0x1D82A3494](v6);
    objc_msgSend(a3, "webPlugInStopForPageCache");
    JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v6);
  }
  else
  {
    -[WebPluginController stopOnePlugin:](self, "stopOnePlugin:", a3);
  }
}

- (void)destroyOnePlugin:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) != 0)
  {
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v4);
    MEMORY[0x1D82A3494](v6);
    objc_msgSend(a3, "webPlugInDestroy");
  }
  else
  {
    v5 = objc_opt_respondsToSelector();
    if ((v5 & 1) == 0)
      return;
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v5);
    MEMORY[0x1D82A3494](v6);
    objc_msgSend(a3, "pluginDestroy");
  }
  JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v6);
}

- (void)startAllPlugins
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];

  if (!self->_started)
  {
    -[NSMutableArray count](self->_views, "count");
    v3 = -[NSMutableArray count](self->_views, "count");
    if (v3 >= 1)
    {
      v4 = 0;
      v5 = v3;
      v6 = (_QWORD *)MEMORY[0x1E0DD1108];
      do
      {
        v7 = (void *)-[NSMutableArray objectAtIndex:](self->_views, "objectAtIndex:", v4);
        v8 = objc_opt_respondsToSelector();
        if ((v8 & 1) != 0)
        {
          if (!*v6)
            WebCore::commonVMSlow((WebCore *)v8);
          MEMORY[0x1D82A3494](v10);
          objc_msgSend(v7, "webPlugInStart");
        }
        else
        {
          v9 = objc_opt_respondsToSelector();
          if ((v9 & 1) == 0)
            goto LABEL_8;
          if (!*v6)
            WebCore::commonVMSlow((WebCore *)v9);
          MEMORY[0x1D82A3494](v10);
          objc_msgSend(v7, "pluginStart");
        }
        JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v10);
LABEL_8:
        ++v4;
      }
      while (v5 != v4);
    }
    self->_started = 1;
  }
}

- (void)stopAllPlugins
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  if (self->_started)
  {
    -[NSMutableArray count](self->_views, "count");
    v3 = -[NSMutableArray count](self->_views, "count");
    if (v3 >= 1)
    {
      v4 = 0;
      v5 = v3;
      do
        -[WebPluginController stopOnePlugin:](self, "stopOnePlugin:", -[NSMutableArray objectAtIndex:](self->_views, "objectAtIndex:", v4++));
      while (v5 != v4);
    }
    self->_started = 0;
  }
}

- (void)stopPluginsForPageCache
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;

  if (self->_started)
  {
    v3 = -[NSMutableArray count](self->_views, "count");
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)
        -[WebPluginController stopOnePluginForPageCache:](self, "stopOnePluginForPageCache:", -[NSMutableArray objectAtIndex:](self->_views, "objectAtIndex:", i));
    }
    self->_started = 0;
  }
}

- (void)restorePluginsFromCache
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;

  v3 = -[WAKView _webView](self->_documentView, "_webView");
  v4 = -[NSMutableArray count](self->_views, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      objc_msgSend((id)objc_msgSend(v3, "_UIKitDelegateForwarder"), "webView:willAddPlugInView:", v3, -[NSMutableArray objectAtIndex:](self->_views, "objectAtIndex:", i));
  }
}

- (void)addPlugin:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];

  if (!self->_documentView || (-[NSMutableArray containsObject:](self->_views, "containsObject:") & 1) != 0)
    return;
  -[NSMutableArray addObject:](self->_views, "addObject:", a3);
  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
  {
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v5);
    MEMORY[0x1D82A3494](v10);
    objc_msgSend(a3, "webPlugInInitialize");
  }
  else
  {
    v6 = objc_opt_respondsToSelector();
    if ((v6 & 1) == 0)
      goto LABEL_12;
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v6);
    MEMORY[0x1D82A3494](v10);
    objc_msgSend(a3, "pluginInitialize");
  }
  JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v10);
LABEL_12:
  if (!self->_started)
    return;
  v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) != 0)
  {
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v7);
    MEMORY[0x1D82A3494](v10);
    objc_msgSend(a3, "webPlugInStart");
  }
  else
  {
    v8 = objc_opt_respondsToSelector();
    if ((v8 & 1) == 0)
      goto LABEL_22;
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v8);
    MEMORY[0x1D82A3494](v10);
    objc_msgSend(a3, "pluginStart");
  }
  JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v10);
LABEL_22:
  v9 = objc_opt_respondsToSelector();
  if ((v9 & 1) != 0)
  {
    if (!*MEMORY[0x1E0DD1108])
      WebCore::commonVMSlow((WebCore *)v9);
    MEMORY[0x1D82A3494](v10);
    objc_msgSend(a3, "setContainingWindow:", -[WAKView window](self->_documentView, "window"));
    JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v10);
  }
}

- (void)destroyPlugin:(id)a3
{
  void *v5;

  if (-[NSMutableArray containsObject:](self->_views, "containsObject:"))
  {
    if (self->_started)
      -[WebPluginController stopOnePlugin:](self, "stopOnePlugin:", a3);
    -[WebPluginController destroyOnePlugin:](self, "destroyOnePlugin:", a3);
    if (byte_1ECEC9794 == 1)
    {
      v5 = (void *)qword_1ECEC97A8;
    }
    else
    {
      v5 = 0;
      qword_1ECEC97A8 = 0;
      byte_1ECEC9794 = 1;
    }
    objc_msgSend(v5, "removeObject:", a3);
    -[NSMutableArray removeObject:](self->_views, "removeObject:", a3);
  }
}

- (void)_webPluginContainerCancelCheckIfAllowedToLoadRequest:(id)a3
{
  objc_msgSend(a3, "cancel");
  -[NSMutableSet removeObject:](self->_checksInProgress, "removeObject:", a3);
}

- (void)_cancelOutstandingChecks
{
  NSMutableSet *checksInProgress;

  checksInProgress = self->_checksInProgress;
  if (checksInProgress)
  {
    CFSetApplyFunction((CFSetRef)checksInProgress, (CFSetApplierFunction)cancelOutstandingCheck, 0);

    self->_checksInProgress = 0;
  }
}

- (void)destroyAllPlugins
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[WebPluginController stopAllPlugins](self, "stopAllPlugins");
  -[NSMutableArray count](self->_views, "count");
  -[WebPluginController _cancelOutstandingChecks](self, "_cancelOutstandingChecks");
  v3 = -[NSMutableArray count](self->_views, "count");
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = v3;
    do
    {
      while (1)
      {
        v6 = -[NSMutableArray objectAtIndex:](self->_views, "objectAtIndex:", v4);
        -[WebPluginController destroyOnePlugin:](self, "destroyOnePlugin:", v6);
        if (byte_1ECEC9794 != 1)
          break;
        objc_msgSend((id)qword_1ECEC97A8, "removeObject:", v6);
        if (v5 == ++v4)
          goto LABEL_7;
      }
      qword_1ECEC97A8 = 0;
      byte_1ECEC9794 = 1;
      objc_msgSend(0, "removeObject:", v6);
      ++v4;
    }
    while (v5 != v4);
  }
LABEL_7:
  -[NSMutableArray makeObjectsPerformSelector:](self->_views, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  self->_views = 0;
  self->_documentView = 0;
}

- (BOOL)processingUserGesture
{
  return WebCore::UserGestureIndicator::processingUserGesture(0, (const Document *)a2);
}

- (id)_webPluginContainerCheckIfAllowedToLoadRequest:(id)a3 inFrame:(id)a4 resultObject:(id)a5 selector:(SEL)a6
{
  WebPluginContainerCheck *v7;

  v7 = +[WebPluginContainerCheck checkWithRequest:target:resultObject:selector:controller:contextInfo:](WebPluginContainerCheck, "checkWithRequest:target:resultObject:selector:controller:contextInfo:", a3, a4, a5, a6, self, 0);
  -[NSMutableSet addObject:](self->_checksInProgress, "addObject:", v7);
  -[WebPluginContainerCheck start](v7, "start");
  return v7;
}

- (void)webPlugInContainerLoadRequest:(id)a3 inFrame:(id)a4
{
  WebFrame *v6;
  WebFrame *v7;
  uint64_t v8;
  uint64_t v9;
  LocalFrame *m_ptr;
  StringImpl *v11;
  StringImpl *v12;
  const __CFString *v13;
  StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[200];
  _BYTE v38[216];
  WTF::StringImpl *v39;
  char v40;

  if (a3)
  {
    if (self->_documentView)
    {
      v6 = -[WebDataSource webFrame](self->_dataSource, "webFrame");
      if (v6)
      {
        v7 = v6;
        if (!a4)
          a4 = CFSTR("_top");
        v8 = objc_msgSend((id)objc_msgSend(a3, "URL"), "_webkit_scriptIfJavaScriptURL");
        if (v8)
        {
          v9 = v8;
          if (-[WebFrame findFrameNamed:](v7, "findFrameNamed:", a4) == v7)
            -[WebFrame _stringByEvaluatingJavaScriptFromString:](v7, "_stringByEvaluatingJavaScriptFromString:", v9);
          return;
        }
        m_ptr = v7->_private->coreFrame.m_ptr;
        MEMORY[0x1D82A4D48](v37, a3);
        v36 = 0;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        *(_OWORD *)v17 = 0u;
        WebCore::SubstituteData::SubstituteData((WebCore::SubstituteData *)v17);
        MEMORY[0x1D82A4FE8](v38, m_ptr, v37, v17);
        WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v17, v11);
        WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v37, v12);
        WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a4, v13);
        v15 = v17[0];
        if (v17[0])
          *(_DWORD *)v17[0] += 2;
        v16 = v39;
        v39 = v15;
        if (v16)
        {
          if (*(_DWORD *)v16 == 2)
          {
            WTF::StringImpl::destroy(v16, v14);
            if (!v15)
            {
LABEL_21:
              v40 = 1;
              WebCore::FrameLoader::load();
              MEMORY[0x1D82A4FF4](v38);
              return;
            }
LABEL_18:
            if (*(_DWORD *)v15 == 2)
              WTF::StringImpl::destroy(v15, v14);
            else
              *(_DWORD *)v15 -= 2;
            goto LABEL_21;
          }
          *(_DWORD *)v16 -= 2;
        }
        if (!v15)
          goto LABEL_21;
        goto LABEL_18;
      }
    }
  }
}

- (void)webPlugInContainerWillShowFullScreenForView:(id)a3
{
  id v4;

  v4 = -[WebDataSource _webView](self->_dataSource, "_webView");
  objc_msgSend((id)objc_msgSend(v4, "_UIKitDelegateForwarder"), "webView:willShowFullScreenForPlugInView:", v4, a3);
}

- (void)webPlugInContainerDidHideFullScreenForView:(id)a3
{
  id v4;

  v4 = -[WebDataSource _webView](self->_dataSource, "_webView");
  objc_msgSend((id)objc_msgSend(v4, "_UIKitDelegateForwarder"), "webView:didHideFullScreenForPlugInView:", v4, a3);
}

- (void)webPlugInContainerShowStatus:(id)a3
{
  const __CFString *v3;
  id v4;

  if (a3)
    v3 = (const __CFString *)a3;
  else
    v3 = &stru_1E9D6EC48;
  v4 = -[WebDataSource _webView](self->_dataSource, "_webView");
  objc_msgSend((id)objc_msgSend(v4, "_UIDelegateForwarder"), "webView:setStatusText:", v4, v3);
}

- (id)webFrame
{
  return -[WebDataSource webFrame](self->_dataSource, "webFrame");
}

- (id)webView
{
  return (id)objc_msgSend(-[WebPluginController webFrame](self, "webFrame"), "webView");
}

- (id)URLPolicyCheckReferrer
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[WebPluginController webFrame](self, "webFrame"), "_dataSource"), "response"), "URL"), "_web_originalDataAsString");
}

- (void)pluginView:(id)a3 receivedResponse:(id)a4
{
  const void *v7;
  WebDataSource *dataSource;
  StringImpl *v9;
  CFTypeRef v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  CFTypeRef cf;
  uint64_t v18;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "webPlugInMainResourceDidReceiveResponse:", a4);
    return;
  }
  v7 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "_initWithPluginErrorCode:contentURL:pluginPageURL:pluginName:MIMEType:", 204, objc_msgSend(a4, "URL"), 0, 0, objc_msgSend(a4, "MIMEType"));
  dataSource = self->_dataSource;
  if (dataSource)
    -[WebDataSource _documentLoader](dataSource, "_documentLoader");
  else
    v18 = 0;
  MEMORY[0x1D82A44F0](&v14, v7);
  WebCore::DocumentLoader::cancelMainResourceLoad();
  v10 = cf;
  cf = 0;
  if (v10)
    CFRelease(v10);
  v11 = v16;
  v16 = 0;
  if (!v11)
  {
LABEL_11:
    v12 = v15;
    v15 = 0;
    if (!v12)
      goto LABEL_16;
    goto LABEL_14;
  }
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    goto LABEL_11;
  }
  WTF::StringImpl::destroy(v11, v9);
  v12 = v15;
  v15 = 0;
  if (!v12)
    goto LABEL_16;
LABEL_14:
  if (*(_DWORD *)v12 == 2)
  {
    WTF::StringImpl::destroy(v12, v9);
    v13 = v14;
    v14 = 0;
    if (!v13)
      goto LABEL_21;
    goto LABEL_19;
  }
  *(_DWORD *)v12 -= 2;
LABEL_16:
  v13 = v14;
  v14 = 0;
  if (!v13)
  {
LABEL_21:
    if (!v7)
      return;
    goto LABEL_22;
  }
LABEL_19:
  if (*(_DWORD *)v13 != 2)
  {
    *(_DWORD *)v13 -= 2;
    goto LABEL_21;
  }
  WTF::StringImpl::destroy(v13, v9);
  if (!v7)
    return;
LABEL_22:
  CFRelease(v7);
}

- (void)pluginView:(id)a3 receivedData:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "webPlugInMainResourceDidReceiveData:", a4);
}

- (void)pluginView:(id)a3 receivedError:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "webPlugInMainResourceDidFailWithError:", a4);
}

- (void)pluginViewFinishedLoading:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "webPlugInMainResourceDidFinishLoading");
}

@end
