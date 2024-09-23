@implementation WebGeolocationProviderIOS

- (void)dealloc
{
  m_tableForLLDB **m_table;
  void *m_ptr;
  objc_super v5;

  m_table = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
  if (m_table)
  {
    self->_pendingInitialPositionWebView.m_impl.var0.m_table = 0;
    WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
  }
  objc_msgSend(self->_sendLastPositionAsynchronouslyTimer.m_ptr, "invalidate");
  m_ptr = self->_sendLastPositionAsynchronouslyTimer.m_ptr;
  self->_sendLastPositionAsynchronouslyTimer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5.receiver = self;
  v5.super_class = (Class)WebGeolocationProviderIOS;
  -[WebGeolocationProviderIOS dealloc](&v5, sel_dealloc);
}

+ (id)sharedGeolocationProvider
{
  if ((_MergedGlobals_16 & 1) != 0)
  {
    if (qword_1ECEC9888 == -1)
      return (id)qword_1ECEC9890;
  }
  else
  {
    qword_1ECEC9890 = 0;
    _MergedGlobals_16 = 1;
    if (qword_1ECEC9888 == -1)
      return (id)qword_1ECEC9890;
  }
  dispatch_once(&qword_1ECEC9888, &__block_literal_global_2);
  return (id)qword_1ECEC9890;
}

void __54__WebGeolocationProviderIOS_sharedGeolocationProvider__block_invoke()
{
  WebGeolocationProviderIOS *v0;
  const void *v1;

  v0 = objc_alloc_init(WebGeolocationProviderIOS);
  v1 = (const void *)qword_1ECEC9890;
  qword_1ECEC9890 = (uint64_t)v0;
  if (v1)
    CFRelease(v1);
}

- (void)suspend
{
  void *m_ptr;
  m_tableForLLDB **m_table;
  void *v5;

  self->_isSuspended = 1;
  m_ptr = self->_lastPosition.m_ptr;
  self->_lastPosition.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  m_table = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
  if (m_table)
  {
    self->_pendingInitialPositionWebView.m_impl.var0.m_table = 0;
    WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
  }
  objc_msgSend(self->_sendLastPositionAsynchronouslyTimer.m_ptr, "invalidate");
  v5 = self->_sendLastPositionAsynchronouslyTimer.m_ptr;
  self->_sendLastPositionAsynchronouslyTimer.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  objc_msgSend(self->_coreLocationProvider.m_ptr, "stop");
}

- (void)resume
{
  m_tableForLLDB **m_table;
  unsigned int *v4;
  _WebCoreLocationUpdateThreadingProxy *v5;
  void *m_ptr;
  WebGeolocationCoreLocationProvider *v7;
  void *v8;
  unsigned int *m_tableForLLDB;
  m_tableForLLDB **v10;

  self->_isSuspended = 0;
  if (self->_shouldResetOnResume)
  {
    -[WebGeolocationProviderIOS resetGeolocation](self, "resetGeolocation");
    self->_shouldResetOnResume = 0;
  }
  else
  {
    m_table = self->_registeredWebViews.m_impl.var0.m_table;
    if (m_table && *((_DWORD *)m_table - 3)
      || (v4 = self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_tableForLLDB) != 0 && *(v4 - 3))
    {
      if (!self->_coreLocationProvider.m_ptr)
      {
        v5 = -[_WebCoreLocationUpdateThreadingProxy initWithProvider:]([_WebCoreLocationUpdateThreadingProxy alloc], "initWithProvider:", self);
        m_ptr = self->_coreLocationUpdateListenerProxy.m_ptr;
        self->_coreLocationUpdateListenerProxy.m_ptr = v5;
        if (m_ptr)
          CFRelease(m_ptr);
        v7 = -[WebGeolocationCoreLocationProvider initWithListener:]([WebGeolocationCoreLocationProvider alloc], "initWithListener:", self->_coreLocationUpdateListenerProxy.m_ptr);
        v8 = self->_coreLocationProvider.m_ptr;
        self->_coreLocationProvider.m_ptr = v7;
        if (v8)
          CFRelease(v8);
      }
      m_tableForLLDB = self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_tableForLLDB;
      if (m_tableForLLDB && *(m_tableForLLDB - 3))
        objc_msgSend(self->_coreLocationProvider.m_ptr, "requestGeolocationAuthorization");
      v10 = self->_registeredWebViews.m_impl.var0.m_table;
      if (v10)
      {
        if (*((_DWORD *)v10 - 3))
        {
          objc_msgSend(self->_coreLocationProvider.m_ptr, "setEnableHighAccuracy:", self->_enableHighAccuracy);
          objc_msgSend(self->_coreLocationProvider.m_ptr, "start");
        }
      }
    }
  }
}

- (void)_handlePendingInitialPosition:(id)a3
{
  m_tableForLLDB **m_table;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  WTF *v8;
  m_tableForLLDB **v9;
  uint64_t v10;
  uint64_t v11;
  m_tableForLLDB **v12;
  m_tableForLLDB **v13;
  unsigned int v14;
  m_tableForLLDB *v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  m_tableForLLDB **v20;
  void *m_ptr;

  if (self->_lastPosition.m_ptr)
  {
    m_table = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
    if (m_table)
    {
      v5 = *((unsigned int *)m_table - 3);
      if ((_DWORD)v5)
      {
        if (v5 >> 29)
        {
          __break(0xC471u);
          return;
        }
        v6 = WTF::fastMalloc((WTF *)(8 * v5));
        v8 = (WTF *)v6;
        v9 = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
        if (v9 && *((_DWORD *)v9 - 3))
        {
          v10 = *((unsigned int *)v9 - 1);
          if ((_DWORD)v10)
          {
            v11 = 8 * v10;
            v12 = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
            while ((unint64_t)*v12 + 1 <= 1)
            {
              ++v12;
              v11 -= 8;
              if (!v11)
                goto LABEL_22;
            }
          }
          else
          {
            v12 = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
          }
          v13 = &v9[v10];
          if (v12 != v13)
          {
            v14 = 0;
            v15 = *v12;
            v16 = 1;
LABEL_15:
            v17 = v16;
            *(_QWORD *)(v6 + 8 * v14++) = v15;
            while (++v12 != v13)
            {
              v15 = *v12;
              if ((unint64_t)*v12 + 1 > 1)
              {
                ++v16;
                if (v12 != v13)
                  goto LABEL_15;
                break;
              }
            }
            if (v14)
            {
              v18 = 0;
              v19 = 8 * v17;
              do
              {
                objc_msgSend(*(id *)((char *)v8 + v18), "_geolocationDidChangePosition:", self->_lastPosition.m_ptr);
                v18 += 8;
              }
              while (v19 != v18);
            }
          }
        }
LABEL_22:
        WTF::fastFree(v8, v7);
      }
    }
  }
  v20 = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
  if (v20)
  {
    self->_pendingInitialPositionWebView.m_impl.var0.m_table = 0;
    WTF::fastFree((WTF *)(v20 - 2), (void *)a2);
  }
  objc_msgSend(self->_sendLastPositionAsynchronouslyTimer.m_ptr, "invalidate", a3);
  m_ptr = self->_sendLastPositionAsynchronouslyTimer.m_ptr;
  self->_sendLastPositionAsynchronouslyTimer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)registerWebView:(id)a3
{
  uint64_t *p_registeredWebViews;
  m_tableForLLDB **v5;
  m_tableForLLDB **m_table;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  m_tableForLLDB *v12;
  int v13;
  _BOOL8 v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *m_ptr;
  _QWORD v20[3];
  WebView *v21;

  v21 = (WebView *)a3;
  m_table = self->_registeredWebViews.m_impl.var0.m_table;
  p_registeredWebViews = (uint64_t *)&self->_registeredWebViews;
  v5 = m_table;
  if (m_table)
  {
    v7 = *((_DWORD *)v5 - 2);
    v8 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
    v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
    v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
    v11 = v7 & ((v10 >> 31) ^ v10);
    v12 = v5[v11];
    if (v12 == a3)
      return;
    v13 = 1;
    while (v12)
    {
      v11 = (v11 + v13) & v7;
      v12 = v5[v11];
      ++v13;
      if (v12 == a3)
        return;
    }
  }
  WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add(p_registeredWebViews, (uint64_t *)&v21, (uint64_t)v20);
  v14 = CallUIDelegateReturningBoolean(1, v21, (objc_selector *)sel_webViewCanCheckGeolocationAuthorizationStatus_);
  if (v14)
  {
    if (!self->_isSuspended)
    {
      WTF::RunLoop::main((WTF::RunLoop *)v14);
      CFRetain(self);
      v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
      *v15 = &off_1E9D6DD40;
      v15[1] = self;
      v15[2] = self;
      v20[0] = v15;
      WTF::RunLoop::dispatch();
      v16 = v20[0];
      v20[0] = 0;
      if (v16)
        (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    }
    WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add((uint64_t *)&self->_pendingInitialPositionWebView, (uint64_t *)&v21, (uint64_t)v20);
    if (!self->_sendLastPositionAsynchronouslyTimer.m_ptr)
    {
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handlePendingInitialPosition_, 0, 0, 0.0);
      v18 = v17;
      if (v17)
        CFRetain(v17);
      m_ptr = self->_sendLastPositionAsynchronouslyTimer.m_ptr;
      self->_sendLastPositionAsynchronouslyTimer.m_ptr = v18;
      if (m_ptr)
        CFRelease(m_ptr);
      objc_msgSend((id)WebThreadNSRunLoop(), "addTimer:forMode:", self->_sendLastPositionAsynchronouslyTimer.m_ptr, *MEMORY[0x1E0C99748]);
    }
  }
}

- (void)unregisterWebView:(id)a3
{
  m_tableForLLDB **m_table;
  HashSet<WebView *, WTF::DefaultHash<WebView *>, WTF::HashTraits<WebView *>, WTF::HashTableTraits> *p_registeredWebViews;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  m_tableForLLDB *v13;
  int v14;
  m_tableForLLDB *v15;
  unsigned int v16;
  int v17;
  m_tableForLLDB **v18;
  unsigned int v19;
  unsigned int v20;
  HashSet<WebView *, WTF::DefaultHash<WebView *>, WTF::HashTraits<WebView *>, WTF::HashTableTraits> *p_pendingInitialPositionWebView;
  m_tableForLLDB **v23;
  unsigned int v24;
  uint64_t v25;
  m_tableForLLDB *v26;
  int v27;
  m_tableForLLDB **v28;
  unsigned int v29;
  unsigned int v30;
  _QWORD *v32;
  void *m_ptr;
  _QWORD *v34;

  p_registeredWebViews = &self->_registeredWebViews;
  m_table = self->_registeredWebViews.m_impl.var0.m_table;
  if (!m_table)
    return;
  v7 = *((_DWORD *)m_table - 2);
  v8 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
  v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
  v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
  v11 = (v10 >> 31) ^ v10;
  v12 = v7 & v11;
  v13 = m_table[v12];
  if (v13 == a3)
  {
LABEL_9:
    if (v12 != *((_DWORD *)m_table - 1))
    {
      m_table[v12] = (m_tableForLLDB *)-1;
      ++*((_DWORD *)p_registeredWebViews->m_impl.var0.m_table - 4);
      if (p_registeredWebViews->m_impl.var0.m_table)
      {
        --*((_DWORD *)p_registeredWebViews->m_impl.var0.m_table - 3);
        v18 = p_registeredWebViews->m_impl.var0.m_table;
        if (!p_registeredWebViews->m_impl.var0.m_table)
          goto LABEL_21;
LABEL_15:
        v19 = 6 * *((_DWORD *)v18 - 3);
        v20 = *((_DWORD *)v18 - 1);
        if (v19 < v20 && v20 >= 9)
          WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::rehash((uint64_t *)&self->_registeredWebViews, v20 >> 1, 0);
        goto LABEL_21;
      }
      MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
      v18 = p_registeredWebViews->m_impl.var0.m_table;
      if (p_registeredWebViews->m_impl.var0.m_table)
        goto LABEL_15;
    }
LABEL_21:
    p_pendingInitialPositionWebView = &self->_pendingInitialPositionWebView;
    v23 = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
    if (!v23)
      goto LABEL_39;
    v24 = *((_DWORD *)v23 - 2);
    v25 = v24 & v11;
    v26 = v23[v25];
    if (v26 != a3)
    {
      v27 = 1;
      while (v26)
      {
        v25 = ((_DWORD)v25 + v27) & v24;
        v26 = v23[v25];
        ++v27;
        if (v26 == a3)
          goto LABEL_26;
      }
      goto LABEL_39;
    }
LABEL_26:
    if (v25 == *((_DWORD *)v23 - 1))
    {
LABEL_39:
      if (!p_registeredWebViews->m_impl.var0.m_table || !*((_DWORD *)p_registeredWebViews->m_impl.var0.m_table - 3))
      {
        WTF::RunLoop::main((WTF::RunLoop *)p_pendingInitialPositionWebView);
        CFRetain(self);
        v32 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
        *v32 = &off_1E9D6DD68;
        v32[1] = self;
        v32[2] = self;
        v34 = v32;
        WTF::RunLoop::dispatch();
        if (v34)
          (*(void (**)(_QWORD *))(*v34 + 8))(v34);
        self->_enableHighAccuracy = 0;
        m_ptr = self->_lastPosition.m_ptr;
        self->_lastPosition.m_ptr = 0;
        if (m_ptr)
          CFRelease(m_ptr);
      }
      return;
    }
    v23[v25] = (m_tableForLLDB *)-1;
    ++*((_DWORD *)p_pendingInitialPositionWebView->m_impl.var0.m_table - 4);
    if (p_pendingInitialPositionWebView->m_impl.var0.m_table)
    {
      --*((_DWORD *)p_pendingInitialPositionWebView->m_impl.var0.m_table - 3);
      v28 = p_pendingInitialPositionWebView->m_impl.var0.m_table;
      if (!p_pendingInitialPositionWebView->m_impl.var0.m_table)
        goto LABEL_39;
    }
    else
    {
      MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
      v28 = p_pendingInitialPositionWebView->m_impl.var0.m_table;
      if (!p_pendingInitialPositionWebView->m_impl.var0.m_table)
        goto LABEL_39;
    }
    v29 = 6 * *((_DWORD *)v28 - 3);
    v30 = *((_DWORD *)v28 - 1);
    if (v29 < v30 && v30 >= 9)
      p_pendingInitialPositionWebView = (HashSet<WebView *, WTF::DefaultHash<WebView *>, WTF::HashTraits<WebView *>, WTF::HashTableTraits> *)WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::rehash((uint64_t *)p_pendingInitialPositionWebView, v30 >> 1, 0);
    goto LABEL_39;
  }
  v14 = 1;
  v15 = m_table[v12];
  v16 = v7 & v11;
  while (v15)
  {
    v16 = (v16 + v14) & v7;
    v15 = m_table[v16];
    ++v14;
    if (v15 == a3)
    {
      v17 = 1;
      while (v13)
      {
        v12 = ((_DWORD)v12 + v17) & v7;
        v13 = m_table[v12];
        ++v17;
        if (v13 == a3)
          goto LABEL_9;
      }
      goto LABEL_21;
    }
  }
}

- (id)lastPosition
{
  return self->_lastPosition.m_ptr;
}

- (void)setEnableHighAccuracy:(BOOL)a3
{
  _QWORD *v5;
  _QWORD *v6;

  if (self->_enableHighAccuracy)
    a3 = 1;
  self->_enableHighAccuracy = a3;
  WTF::RunLoop::main((WTF::RunLoop *)self);
  CFRetain(self);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v5 = &off_1E9D6DD90;
  v5[1] = self;
  v5[2] = self;
  v6 = v5;
  WTF::RunLoop::dispatch();
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
}

- (void)initializeGeolocationForWebView:(id)a3 listener:(id)a4
{
  HashMap<WTF::RetainPtr<WebView>, WTF::RetainPtr<id<WebGeolocationProviderInitializationListener>>, WTF::DefaultHash<WTF::RetainPtr<WebView>>, WTF::HashTraits<WTF::RetainPtr<WebView>>, WTF::HashTraits<WTF::RetainPtr<id<WebGeolocationProviderInitializationListener>>>, WTF::HashTableTraits> *p_webViewsWaitingForCoreLocationAuthorization;
  _DWORD *m_table;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  id *v14;
  id v15;
  id *v16;
  int v17;
  id v18;
  _DWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;

  v27 = a3;
  if (!CallUIDelegateReturningBoolean(1, (WebView *)a3, (objc_selector *)sel_webViewCanCheckGeolocationAuthorizationStatus_))return;
  p_webViewsWaitingForCoreLocationAuthorization = &self->_webViewsWaitingForCoreLocationAuthorization;
  if (a3)
    CFRetain(a3);
  m_table = p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table;
  if (p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table
    || (WTF::HashTable<WTF::RetainPtr<WebView>,WTF::KeyValuePair<WTF::RetainPtr<WebView>,WTF::RetainPtr<objc_object  {objcproto44WebGeolocationProviderInitializationListener}*>>,WTF::KeyValuePairKeyExtractor<WTF::RetainPtr<objc_object  {objcproto44WebGeolocationProviderInitializationListener}*>>,WTF::DefaultHash<WTF::RetainPtr<WebView>>,WTF::HashMap<WTF::RetainPtr<WebView>,objc_object  {objcproto44WebGeolocationProviderInitializationListener}*,WTF::DefaultHash,WTF::HashTraits<WTF::RetainPtr<WebView>>,WTF::HashMap<objc_object  {objcproto44WebGeolocationProviderInitializationListener}*>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits>::rehash((uint64_t *)&self->_webViewsWaitingForCoreLocationAuthorization, 8u), (m_table = p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table) != 0))
  {
    v9 = *(m_table - 2);
  }
  else
  {
    v9 = 0;
  }
  v10 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
  v11 = 9 * ((v10 + ~(v10 << 13)) ^ ((v10 + ~(v10 << 13)) >> 8));
  v12 = (v11 ^ (v11 >> 15)) + ~((v11 ^ (v11 >> 15)) << 27);
  v13 = v9 & ((v12 >> 31) ^ v12);
  v14 = (id *)&m_table[4 * v13];
  v15 = *v14;
  if (*v14)
  {
    v16 = 0;
    v17 = 1;
    while (v15 != a3)
    {
      if (v15 == (id)-1)
        v16 = v14;
      v13 = (v13 + v17) & v9;
      v14 = (id *)&m_table[4 * v13];
      v15 = *v14;
      ++v17;
      if (!*v14)
      {
        if (v16)
        {
          *v16 = 0;
          v16[1] = 0;
          --*((_DWORD *)p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table - 4);
          v14 = v16;
        }
        goto LABEL_15;
      }
    }
    if (a3)
      CFRelease(a3);
    goto LABEL_32;
  }
LABEL_15:
  *v14 = a3;
  if (a4)
    CFRetain(a4);
  v18 = v14[1];
  v14[1] = a4;
  if (v18)
    CFRelease(v18);
  if (p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table)
  {
    ++*((_DWORD *)p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table - 3);
    v19 = p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table;
    if (p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table)
      goto LABEL_21;
  }
  else
  {
    MEMORY[0xFFFFFFFFFFFFFFF4] = 1;
    v19 = p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table;
    if (p_webViewsWaitingForCoreLocationAuthorization->m_impl.var0.m_table)
    {
LABEL_21:
      v20 = (*(v19 - 4) + *(v19 - 3));
      v21 = *(v19 - 1);
      if (v21 <= 0x400)
        goto LABEL_22;
LABEL_29:
      if (v21 <= 2 * v20)
        goto LABEL_30;
      goto LABEL_32;
    }
  }
  v20 = *(v19 - 4);
  v21 = *(v19 - 1);
  if (v21 > 0x400)
    goto LABEL_29;
LABEL_22:
  if (3 * v21 <= 4 * v20)
  {
    if (!(_DWORD)v21)
    {
      v22 = 8;
LABEL_31:
      WTF::HashTable<WTF::RetainPtr<WebView>,WTF::KeyValuePair<WTF::RetainPtr<WebView>,WTF::RetainPtr<objc_object  {objcproto44WebGeolocationProviderInitializationListener}*>>,WTF::KeyValuePairKeyExtractor<WTF::RetainPtr<objc_object  {objcproto44WebGeolocationProviderInitializationListener}*>>,WTF::DefaultHash<WTF::RetainPtr<WebView>>,WTF::HashMap<WTF::RetainPtr<WebView>,objc_object  {objcproto44WebGeolocationProviderInitializationListener}*,WTF::DefaultHash,WTF::HashTraits<WTF::RetainPtr<WebView>>,WTF::HashMap<objc_object  {objcproto44WebGeolocationProviderInitializationListener}*>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits>::rehash((uint64_t *)&self->_webViewsWaitingForCoreLocationAuthorization, v22);
      goto LABEL_32;
    }
LABEL_30:
    v22 = (_DWORD)v21 << (6 * *(v19 - 3) >= (2 * v21));
    goto LABEL_31;
  }
LABEL_32:
  v23 = WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::add((uint64_t *)&self->_trackedWebViews, (uint64_t *)&v27, (uint64_t)&v26);
  WTF::RunLoop::main((WTF::RunLoop *)v23);
  if (self)
    CFRetain(self);
  v24 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v24 = &off_1E9D6DDB8;
  v24[1] = self;
  v24[2] = self;
  v26 = v24;
  WTF::RunLoop::dispatch();
  v25 = v26;
  v26 = 0;
  if (v25)
    (*(void (**)(_QWORD *))(*v25 + 8))(v25);
}

- (void)geolocationAuthorizationGranted
{
  unsigned int *m_tableForLLDB;
  uint64_t v3;
  char *v4;
  id *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  unsigned int *v9;
  char *v10;
  const void *v11;
  const void *v12;

  m_tableForLLDB = self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_tableForLLDB;
  self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_table = 0;
  if (m_tableForLLDB)
  {
    v3 = *(m_tableForLLDB - 1);
    v4 = (char *)&m_tableForLLDB[4 * v3];
    if (!*(m_tableForLLDB - 3))
    {
      v5 = (id *)&m_tableForLLDB[4 * v3];
      v4 = (char *)v5;
LABEL_10:
      v7 = (id *)&m_tableForLLDB[4 * *(m_tableForLLDB - 1)];
      if (v7 == v5)
        goto LABEL_14;
      goto LABEL_18;
    }
    v5 = (id *)m_tableForLLDB;
    if ((_DWORD)v3)
    {
      v6 = 16 * v3;
      v5 = (id *)m_tableForLLDB;
      while ((unint64_t)*v5 + 1 <= 1)
      {
        v5 += 2;
        v6 -= 16;
        if (!v6)
        {
          v5 = (id *)v4;
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (m_tableForLLDB)
    goto LABEL_10;
  v7 = 0;
  if (!v5)
    goto LABEL_14;
  do
  {
LABEL_18:
    objc_msgSend(v5[1], "initializationAllowedWebView:", *v5);
    v10 = (char *)(v5 + 2);
    v5 = (id *)v4;
    if (v10 != v4)
    {
      v5 = (id *)v10;
      while ((unint64_t)*v5 + 1 <= 1)
      {
        v5 += 2;
        if (v5 == (id *)v4)
        {
          v5 = (id *)v4;
          break;
        }
      }
    }
  }
  while (v5 != v7);
LABEL_14:
  if (m_tableForLLDB)
  {
    v8 = *(m_tableForLLDB - 1);
    if ((_DWORD)v8)
    {
      v9 = m_tableForLLDB;
      do
      {
        v11 = *(const void **)v9;
        if (*(_QWORD *)v9 != -1)
        {
          v12 = (const void *)*((_QWORD *)v9 + 1);
          *((_QWORD *)v9 + 1) = 0;
          if (v12)
          {
            CFRelease(v12);
            v11 = *(const void **)v9;
          }
          *(_QWORD *)v9 = 0;
          if (v11)
            CFRelease(v11);
        }
        v9 += 4;
        --v8;
      }
      while (v8);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
}

- (void)geolocationAuthorizationDenied
{
  unsigned int *m_tableForLLDB;
  uint64_t v3;
  char *v4;
  id *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  unsigned int *v9;
  char *v10;
  const void *v11;
  const void *v12;

  m_tableForLLDB = self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_tableForLLDB;
  self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_table = 0;
  if (m_tableForLLDB)
  {
    v3 = *(m_tableForLLDB - 1);
    v4 = (char *)&m_tableForLLDB[4 * v3];
    if (!*(m_tableForLLDB - 3))
    {
      v5 = (id *)&m_tableForLLDB[4 * v3];
      v4 = (char *)v5;
LABEL_10:
      v7 = (id *)&m_tableForLLDB[4 * *(m_tableForLLDB - 1)];
      if (v7 == v5)
        goto LABEL_14;
      goto LABEL_18;
    }
    v5 = (id *)m_tableForLLDB;
    if ((_DWORD)v3)
    {
      v6 = 16 * v3;
      v5 = (id *)m_tableForLLDB;
      while ((unint64_t)*v5 + 1 <= 1)
      {
        v5 += 2;
        v6 -= 16;
        if (!v6)
        {
          v5 = (id *)v4;
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (m_tableForLLDB)
    goto LABEL_10;
  v7 = 0;
  if (!v5)
    goto LABEL_14;
  do
  {
LABEL_18:
    objc_msgSend(v5[1], "initializationDeniedWebView:", *v5);
    v10 = (char *)(v5 + 2);
    v5 = (id *)v4;
    if (v10 != v4)
    {
      v5 = (id *)v10;
      while ((unint64_t)*v5 + 1 <= 1)
      {
        v5 += 2;
        if (v5 == (id *)v4)
        {
          v5 = (id *)v4;
          break;
        }
      }
    }
  }
  while (v5 != v7);
LABEL_14:
  if (m_tableForLLDB)
  {
    v8 = *(m_tableForLLDB - 1);
    if ((_DWORD)v8)
    {
      v9 = m_tableForLLDB;
      do
      {
        v11 = *(const void **)v9;
        if (*(_QWORD *)v9 != -1)
        {
          v12 = (const void *)*((_QWORD *)v9 + 1);
          *((_QWORD *)v9 + 1) = 0;
          if (v12)
          {
            CFRelease(v12);
            v11 = *(const void **)v9;
          }
          *(_QWORD *)v9 = 0;
          if (v11)
            CFRelease(v11);
        }
        v9 += 4;
        --v8;
      }
      while (v8);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
}

- (void)stopTrackingWebView:(id)a3
{
  uint64_t *p_trackedWebViews;
  m_tableForLLDB **v4;
  m_tableForLLDB **m_table;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  m_tableForLLDB *v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;

  m_table = self->_trackedWebViews.m_impl.var0.m_table;
  p_trackedWebViews = (uint64_t *)&self->_trackedWebViews;
  v4 = m_table;
  if (m_table)
  {
    v6 = *((_DWORD *)v4 - 2);
    v7 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
    v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    v10 = v6 & ((v9 >> 31) ^ v9);
    v11 = v4[v10];
    if (v11 == a3)
    {
LABEL_6:
      if (v10 == *((_DWORD *)v4 - 1))
        return;
      v4[v10] = (m_tableForLLDB *)-1;
      ++*(_DWORD *)(*p_trackedWebViews - 16);
      if (*p_trackedWebViews)
      {
        --*(_DWORD *)(*p_trackedWebViews - 12);
        v13 = *p_trackedWebViews;
        if (!*p_trackedWebViews)
          return;
      }
      else
      {
        MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
        v13 = *p_trackedWebViews;
        if (!*p_trackedWebViews)
          return;
      }
      v14 = 6 * *(_DWORD *)(v13 - 12);
      v15 = *(_DWORD *)(v13 - 4);
      if (v14 < v15 && v15 >= 9)
        WTF::HashTable<WebView *,WebView *,WTF::IdentityExtractor,WTF::DefaultHash<WebView *>,WTF::HashTraits<WebView *>,WTF::HashTraits<WebView *>>::rehash(p_trackedWebViews, v15 >> 1, 0);
    }
    else
    {
      v12 = 1;
      while (v11)
      {
        v10 = ((_DWORD)v10 + v12) & v6;
        v11 = v4[v10];
        ++v12;
        if (v11 == a3)
          goto LABEL_6;
      }
    }
  }
}

- (void)positionChanged:(id)a3
{
  m_tableForLLDB **m_table;
  void *m_ptr;
  void *v7;
  m_tableForLLDB **v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  WTF *v12;
  m_tableForLLDB **v13;
  uint64_t v14;
  uint64_t v15;
  m_tableForLLDB **v16;
  m_tableForLLDB **v17;
  unsigned int v18;
  m_tableForLLDB *v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;

  m_table = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
  if (m_table)
  {
    self->_pendingInitialPositionWebView.m_impl.var0.m_table = 0;
    WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
  }
  objc_msgSend(self->_sendLastPositionAsynchronouslyTimer.m_ptr, "invalidate");
  m_ptr = self->_sendLastPositionAsynchronouslyTimer.m_ptr;
  self->_sendLastPositionAsynchronouslyTimer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  if (a3)
    CFRetain(a3);
  v7 = self->_lastPosition.m_ptr;
  self->_lastPosition.m_ptr = a3;
  if (v7)
    CFRelease(v7);
  v8 = self->_registeredWebViews.m_impl.var0.m_table;
  if (v8)
  {
    v9 = *((unsigned int *)v8 - 3);
    if ((_DWORD)v9)
    {
      if (v9 >> 29)
      {
        __break(0xC471u);
      }
      else
      {
        v10 = WTF::fastMalloc((WTF *)(8 * v9));
        v12 = (WTF *)v10;
        v13 = self->_registeredWebViews.m_impl.var0.m_table;
        if (v13 && *((_DWORD *)v13 - 3))
        {
          v14 = *((unsigned int *)v13 - 1);
          if ((_DWORD)v14)
          {
            v15 = 8 * v14;
            v16 = self->_registeredWebViews.m_impl.var0.m_table;
            while ((unint64_t)*v16 + 1 <= 1)
            {
              ++v16;
              v15 -= 8;
              if (!v15)
                goto LABEL_30;
            }
          }
          else
          {
            v16 = self->_registeredWebViews.m_impl.var0.m_table;
          }
          v17 = &v13[v14];
          if (v16 != v17)
          {
            v18 = 0;
            v19 = *v16;
            v20 = 1;
LABEL_23:
            v21 = v20;
            *(_QWORD *)(v10 + 8 * v18++) = v19;
            while (++v16 != v17)
            {
              v19 = *v16;
              if ((unint64_t)*v16 + 1 > 1)
              {
                ++v20;
                if (v16 != v17)
                  goto LABEL_23;
                break;
              }
            }
            if (v18)
            {
              v22 = 0;
              v23 = 8 * v21;
              do
              {
                objc_msgSend(*(id *)((char *)v12 + v22), "_geolocationDidChangePosition:", self->_lastPosition.m_ptr);
                v22 += 8;
              }
              while (v23 != v22);
            }
          }
        }
LABEL_30:
        WTF::fastFree(v12, v11);
      }
    }
  }
}

- (void)errorOccurred:(id)a3
{
  void *m_ptr;
  m_tableForLLDB **m_table;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  WTF *v10;
  m_tableForLLDB **v11;
  uint64_t v12;
  uint64_t v13;
  m_tableForLLDB **v14;
  m_tableForLLDB **v15;
  unsigned int v16;
  m_tableForLLDB *v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;

  m_ptr = self->_lastPosition.m_ptr;
  self->_lastPosition.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  m_table = self->_registeredWebViews.m_impl.var0.m_table;
  if (m_table)
  {
    v7 = *((unsigned int *)m_table - 3);
    if ((_DWORD)v7)
    {
      if (v7 >> 29)
      {
        __break(0xC471u);
      }
      else
      {
        v8 = WTF::fastMalloc((WTF *)(8 * v7));
        v10 = (WTF *)v8;
        v11 = self->_registeredWebViews.m_impl.var0.m_table;
        if (v11 && *((_DWORD *)v11 - 3))
        {
          v12 = *((unsigned int *)v11 - 1);
          if ((_DWORD)v12)
          {
            v13 = 8 * v12;
            v14 = self->_registeredWebViews.m_impl.var0.m_table;
            while ((unint64_t)*v14 + 1 <= 1)
            {
              ++v14;
              v13 -= 8;
              if (!v13)
                goto LABEL_24;
            }
          }
          else
          {
            v14 = self->_registeredWebViews.m_impl.var0.m_table;
          }
          v15 = &v11[v12];
          if (v14 != v15)
          {
            v16 = 0;
            v17 = *v14;
            v18 = 1;
LABEL_17:
            v19 = v18;
            *(_QWORD *)(v8 + 8 * v16++) = v17;
            while (++v14 != v15)
            {
              v17 = *v14;
              if ((unint64_t)*v14 + 1 > 1)
              {
                ++v18;
                if (v14 != v15)
                  goto LABEL_17;
                break;
              }
            }
            if (v16)
            {
              v20 = 0;
              v21 = 8 * v19;
              do
              {
                objc_msgSend(*(id *)((char *)v10 + v20), "_geolocationDidFailWithMessage:", a3);
                v20 += 8;
              }
              while (v21 != v20);
            }
          }
        }
LABEL_24:
        WTF::fastFree(v10, v9);
      }
    }
  }
}

- (void)resetGeolocation
{
  unsigned int *m_tableForLLDB;
  uint64_t v4;
  unsigned int *v5;
  const void *v6;
  const void *v7;
  m_tableForLLDB **m_table;
  m_tableForLLDB **v9;
  void *m_ptr;
  m_tableForLLDB **v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  WTF *v15;
  m_tableForLLDB **v16;
  uint64_t v17;
  uint64_t v18;
  m_tableForLLDB **v19;
  m_tableForLLDB **v20;
  unsigned int v21;
  m_tableForLLDB *v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;

  if (self->_isSuspended)
  {
    self->_shouldResetOnResume = 1;
  }
  else
  {
    m_tableForLLDB = self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_tableForLLDB;
    if (m_tableForLLDB)
    {
      self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_table = 0;
      v4 = *(m_tableForLLDB - 1);
      if ((_DWORD)v4)
      {
        v5 = m_tableForLLDB;
        do
        {
          v6 = *(const void **)v5;
          if (*(_QWORD *)v5 != -1)
          {
            v7 = (const void *)*((_QWORD *)v5 + 1);
            *((_QWORD *)v5 + 1) = 0;
            if (v7)
            {
              CFRelease(v7);
              v6 = *(const void **)v5;
            }
            *(_QWORD *)v5 = 0;
            if (v6)
              CFRelease(v6);
          }
          v5 += 4;
          --v4;
        }
        while (v4);
      }
      WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
    }
    m_table = self->_registeredWebViews.m_impl.var0.m_table;
    if (m_table)
    {
      self->_registeredWebViews.m_impl.var0.m_table = 0;
      WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
    }
    v9 = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
    if (v9)
    {
      self->_pendingInitialPositionWebView.m_impl.var0.m_table = 0;
      WTF::fastFree((WTF *)(v9 - 2), (void *)a2);
    }
    objc_msgSend(self->_sendLastPositionAsynchronouslyTimer.m_ptr, "invalidate");
    m_ptr = self->_sendLastPositionAsynchronouslyTimer.m_ptr;
    self->_sendLastPositionAsynchronouslyTimer.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
    v11 = self->_trackedWebViews.m_impl.var0.m_table;
    if (v11)
    {
      v12 = *((unsigned int *)v11 - 3);
      if ((_DWORD)v12)
      {
        if (v12 >> 29)
        {
          __break(0xC471u);
        }
        else
        {
          v13 = WTF::fastMalloc((WTF *)(8 * v12));
          v15 = (WTF *)v13;
          v16 = self->_trackedWebViews.m_impl.var0.m_table;
          if (v16 && *((_DWORD *)v16 - 3))
          {
            v17 = *((unsigned int *)v16 - 1);
            if ((_DWORD)v17)
            {
              v18 = 8 * v17;
              v19 = self->_trackedWebViews.m_impl.var0.m_table;
              while ((unint64_t)*v19 + 1 <= 1)
              {
                ++v19;
                v18 -= 8;
                if (!v18)
                  goto LABEL_40;
              }
            }
            else
            {
              v19 = self->_trackedWebViews.m_impl.var0.m_table;
            }
            v20 = &v16[v17];
            if (v19 != v20)
            {
              v21 = 0;
              v22 = *v19;
              v23 = 1;
LABEL_33:
              v24 = v23;
              *(_QWORD *)(v13 + 8 * v21++) = v22;
              while (++v19 != v20)
              {
                v22 = *v19;
                if ((unint64_t)*v19 + 1 > 1)
                {
                  ++v23;
                  if (v19 != v20)
                    goto LABEL_33;
                  break;
                }
              }
              if (v21)
              {
                v25 = 0;
                v26 = 8 * v24;
                do
                {
                  objc_msgSend(*(id *)((char *)v15 + v25), "_resetAllGeolocationPermission");
                  v25 += 8;
                }
                while (v26 != v25);
              }
            }
          }
LABEL_40:
          WTF::fastFree(v15, v14);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  m_tableForLLDB **m_table;
  m_tableForLLDB **v6;
  m_tableForLLDB **v7;
  unsigned int *m_tableForLLDB;
  uint64_t v9;
  const void **v10;
  const void *v11;
  const void *v12;
  void *v13;
  void *v14;

  m_ptr = self->_lastPosition.m_ptr;
  self->_lastPosition.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_sendLastPositionAsynchronouslyTimer.m_ptr;
  self->_sendLastPositionAsynchronouslyTimer.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  m_table = self->_trackedWebViews.m_impl.var0.m_table;
  if (m_table)
    WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
  v6 = self->_registeredWebViews.m_impl.var0.m_table;
  if (v6)
    WTF::fastFree((WTF *)(v6 - 2), (void *)a2);
  v7 = self->_pendingInitialPositionWebView.m_impl.var0.m_table;
  if (v7)
    WTF::fastFree((WTF *)(v7 - 2), (void *)a2);
  m_tableForLLDB = self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v9 = *(m_tableForLLDB - 1);
    if ((_DWORD)v9)
    {
      v10 = (const void **)self->_webViewsWaitingForCoreLocationAuthorization.m_impl.var0.m_table;
      do
      {
        v11 = *v10;
        if (*v10 != (const void *)-1)
        {
          v12 = v10[1];
          v10[1] = 0;
          if (v12)
          {
            CFRelease(v12);
            v11 = *v10;
          }
          *v10 = 0;
          if (v11)
            CFRelease(v11);
        }
        v10 += 2;
        --v9;
      }
      while (v9);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
  v13 = self->_coreLocationUpdateListenerProxy.m_ptr;
  self->_coreLocationUpdateListenerProxy.m_ptr = 0;
  if (v13)
    CFRelease(v13);
  v14 = self->_coreLocationProvider.m_ptr;
  self->_coreLocationProvider.m_ptr = 0;
  if (v14)
    CFRelease(v14);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

- (_QWORD)registerWebView:(_QWORD *)a1
{
  const void *v2;

  *a1 = &off_1E9D6DD40;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)registerWebView:(WTF *)this
{
  const void *v3;

  *(_QWORD *)this = &off_1E9D6DD40;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)registerWebView:(uint64_t)a1
{
  WebGeolocationCoreLocationProvider *v2;
  _WebCoreLocationUpdateThreadingProxy *v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const void *v7;

  v2 = *(WebGeolocationCoreLocationProvider **)(*(_QWORD *)(a1 + 8) + 8);
  if (!v2)
  {
    v3 = -[_WebCoreLocationUpdateThreadingProxy initWithProvider:]([_WebCoreLocationUpdateThreadingProxy alloc], "initWithProvider:", *(_QWORD *)(a1 + 8));
    v4 = *(_QWORD *)(a1 + 8);
    v5 = *(const void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;
    if (v5)
      CFRelease(v5);
    v2 = -[WebGeolocationCoreLocationProvider initWithListener:]([WebGeolocationCoreLocationProvider alloc], "initWithListener:", *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16));
    v6 = *(_QWORD *)(a1 + 8);
    v7 = *(const void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v2;
    if (v7)
    {
      CFRelease(v7);
      v2 = *(WebGeolocationCoreLocationProvider **)(*(_QWORD *)(a1 + 8) + 8);
    }
  }
  return -[WebGeolocationCoreLocationProvider start](v2, "start");
}

- (_QWORD)unregisterWebView:(_QWORD *)a1
{
  const void *v2;

  *a1 = &off_1E9D6DD68;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)unregisterWebView:(WTF *)this
{
  const void *v3;

  *(_QWORD *)this = &off_1E9D6DD68;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)unregisterWebView:(uint64_t)a1
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 8), "stop");
}

- (_QWORD)setEnableHighAccuracy:(_QWORD *)a1
{
  const void *v2;

  *a1 = &off_1E9D6DD90;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)setEnableHighAccuracy:(WTF *)this
{
  const void *v3;

  *(_QWORD *)this = &off_1E9D6DD90;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)setEnableHighAccuracy:(uint64_t)a1
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 8), "setEnableHighAccuracy:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 8) + 24));
}

- (_QWORD)initializeGeolocationForWebView:(_QWORD *)a1 listener:
{
  const void *v2;

  *a1 = &off_1E9D6DDB8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)initializeGeolocationForWebView:(WTF *)this listener:(void *)a2
{
  const void *v3;

  *(_QWORD *)this = &off_1E9D6DDB8;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)initializeGeolocationForWebView:(uint64_t)a1 listener:
{
  WebGeolocationCoreLocationProvider *v2;
  _WebCoreLocationUpdateThreadingProxy *v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const void *v7;

  v2 = *(WebGeolocationCoreLocationProvider **)(*(_QWORD *)(a1 + 8) + 8);
  if (!v2)
  {
    v3 = -[_WebCoreLocationUpdateThreadingProxy initWithProvider:]([_WebCoreLocationUpdateThreadingProxy alloc], "initWithProvider:", *(_QWORD *)(a1 + 8));
    v4 = *(_QWORD *)(a1 + 8);
    v5 = *(const void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;
    if (v5)
      CFRelease(v5);
    v2 = -[WebGeolocationCoreLocationProvider initWithListener:]([WebGeolocationCoreLocationProvider alloc], "initWithListener:", *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16));
    v6 = *(_QWORD *)(a1 + 8);
    v7 = *(const void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v2;
    if (v7)
    {
      CFRelease(v7);
      v2 = *(WebGeolocationCoreLocationProvider **)(*(_QWORD *)(a1 + 8) + 8);
    }
  }
  return -[WebGeolocationCoreLocationProvider requestGeolocationAuthorization](v2, "requestGeolocationAuthorization");
}

@end
