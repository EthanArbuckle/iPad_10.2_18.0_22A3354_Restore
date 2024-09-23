@implementation WebCLLocationManager

- (WebCLLocationManager)initWithWebsiteIdentifier:(const void *)a3 client:(Client *)a4 mode:(BOOL)a5
{
  WebCLLocationManager *v8;
  WTF::StringImpl *v9;
  WebCLLocationManager *v10;
  uint64_t v11;
  void *v12;
  StringImpl *v13;
  WTF::StringImpl *v14;
  id v16;
  __CFString *v17;
  uint64_t v18;
  void *m_ptr;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WebCLLocationManager;
  v8 = -[WebCLLocationManager init](&v20, sel_init);
  v10 = v8;
  if (v8)
  {
    v8->_isWaitingForAuthorization = 1;
    v8->_mode = a5;
    if (*(_QWORD *)a3 && *(_DWORD *)(*(_QWORD *)a3 + 4))
    {
      v16 = objc_alloc((Class)getCLLocationManagerClass());
      v17 = *(_QWORD *)a3 ? (__CFString *)WTF::StringImpl::operator NSString *() : &stru_1E3487BC0;
      v18 = objc_msgSend(v16, "initWithWebsiteIdentifier:", v17);
      m_ptr = v10->_locationManager.m_ptr;
      v10->_locationManager.m_ptr = (void *)v18;
      if (m_ptr)
        CFRelease(m_ptr);
    }
    if (!v10->_locationManager.m_ptr)
    {
      v11 = objc_msgSend(objc_alloc((Class)getCLLocationManagerClass()), "init");
      v12 = v10->_locationManager.m_ptr;
      v10->_locationManager.m_ptr = (void *)v11;
      if (v12)
        CFRelease(v12);
    }
    v10->_client = a4;
    v13 = *(StringImpl **)a3;
    if (*(_QWORD *)a3)
      *(_DWORD *)v13 += 2;
    v14 = (WTF::StringImpl *)v10->_websiteIdentifier.m_impl.m_ptr;
    v10->_websiteIdentifier.m_impl.m_ptr = v13;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v9);
      else
        *(_DWORD *)v14 -= 2;
    }
    objc_msgSend(v10->_locationManager.m_ptr, "setDelegate:", v10);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_locationManager.m_ptr, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WebCLLocationManager;
  -[WebCLLocationManager dealloc](&v3, sel_dealloc);
}

- (void)stop
{
  objc_msgSend(self->_locationManager.m_ptr, "stopUpdatingLocation");
}

- (void)setEnableHighAccuracy:(BOOL)a3
{
  void *m_ptr;
  uint64_t *v4;

  m_ptr = self->_locationManager.m_ptr;
  v4 = &_MergedGlobals_27;
  if (!a3)
    v4 = &qword_1ECE7A3E8;
  ((void (*)(void))*v4)();
  objc_msgSend(m_ptr, "setDesiredAccuracy:");
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  int v4;
  void (*v5)(void);

  v4 = objc_msgSend(self->_locationManager.m_ptr, "authorizationStatus", a3);
  if (!self->_isWaitingForAuthorization)
  {
    if ((v4 - 1) > 1)
      return;
    objc_msgSend(self->_locationManager.m_ptr, "stopUpdatingLocation");
    v5 = (void (*)(void))*((_QWORD *)self->_client->var0 + 6);
    goto LABEL_9;
  }
  if ((v4 - 1) < 2)
  {
    self->_isWaitingForAuthorization = 0;
    v5 = (void (*)(void))*((_QWORD *)self->_client->var0 + 3);
LABEL_9:
    v5();
    return;
  }
  if ((v4 - 3) >= 2)
  {
    if (!v4)
      objc_msgSend(self->_locationManager.m_ptr, "requestWhenInUseAuthorization");
  }
  else
  {
    self->_isWaitingForAuthorization = 0;
    (*((void (**)(Client *, String *))self->_client->var0 + 2))(self->_client, &self->_websiteIdentifier);
    if (self->_mode)
      objc_msgSend(self->_locationManager.m_ptr, "startUpdatingLocation");
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Client *client;
  _BYTE v11[112];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a4);
        client = self->_client;
        WebCore::GeolocationPositionData::GeolocationPositionData((WebCore::GeolocationPositionData *)v11, *(CLLocation **)(*((_QWORD *)&v12 + 1) + 8 * v9));
        (*((void (**)(Client *, String *, _BYTE *))client->var0 + 4))(client, &self->_websiteIdentifier, v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v6;
  Client *client;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (objc_msgSend(a4, "code", a3) != 1)
  {
    v6 = objc_msgSend(a4, "localizedDescription");
    client = self->_client;
    MEMORY[0x19AEA5508](&v10, v6);
    (*((void (**)(Client *, String *, WTF::StringImpl **))client->var0 + 5))(client, &self->_websiteIdentifier, &v10);
    v9 = v10;
    v10 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v8);
      else
        *(_DWORD *)v9 -= 2;
    }
  }
}

- (void).cxx_destruct
{
  StringImpl *m_ptr;
  void *v4;

  m_ptr = self->_websiteIdentifier.m_impl.m_ptr;
  self->_websiteIdentifier.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (WTF::StringImpl *)a2);
    else
      *(_DWORD *)m_ptr -= 2;
  }
  v4 = self->_locationManager.m_ptr;
  self->_locationManager.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
