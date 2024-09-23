@implementation WebGeolocationProviderInitializationListener

- (WebGeolocationProviderInitializationListener)initWithGeolocation:(NakedRef<WebCore::Geolocation>)a3
{
  WebGeolocationProviderInitializationListener *v4;
  WebGeolocationProviderInitializationListener *v5;
  Geolocation *m_ptr;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebGeolocationProviderInitializationListener;
  v4 = -[WebGeolocationProviderInitializationListener init](&v9, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (a3.var0)
    ++*((_DWORD *)a3.var0 + 8);
  m_ptr = v4->m_geolocation.m_ptr;
  v5->m_geolocation.m_ptr = a3.var0;
  if (!m_ptr)
    return v5;
  if (*((_DWORD *)m_ptr + 8) != 1)
  {
    --*((_DWORD *)m_ptr + 8);
    return v5;
  }
  v8 = MEMORY[0x1D82A3E0C]();
  MEMORY[0x1D82A3E18](v8);
  return v5;
}

- (void)initializationAllowedWebView:(id)a3
{
  uint64_t v5;
  objc_object *v6;
  WebGeolocationPolicyListener *v7;
  objc_object *v8;
  _QWORD *v9;
  objc_object *v10;
  Geolocation *m_ptr;

  v5 = WebCore::Geolocation::frame((WebCore::Geolocation *)self->m_geolocation.m_ptr);
  if (v5)
  {
    v6 = -[WebSecurityOrigin _initWithWebCoreSecurityOrigin:]([WebSecurityOrigin alloc], "_initWithWebCoreSecurityOrigin:", WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)(*(_QWORD *)(v5 + 296) + 192)));
    v7 = [WebGeolocationPolicyListener alloc];
    m_ptr = self->m_geolocation.m_ptr;
    v8 = -[WebGeolocationPolicyListener initWithGeolocation:forWebView:](v7, "initWithGeolocation:forWebView:", &m_ptr, a3);
    v9 = *(_QWORD **)(*(_QWORD *)(v5 + 280) + 16);
    if (((*(uint64_t (**)(_QWORD *))(*v9 + 1072))(v9) & 1) != 0)
      v10 = 0;
    else
      v10 = (objc_object *)v9[2];
    CallUIDelegate((WebView *)a3, (objc_selector *)sel_webView_decidePolicyForGeolocationRequestFromOrigin_frame_listener_, v6, v10, v8);
    if (v8)
      CFRelease(v8);
    if (v6)
      CFRelease(v6);
  }
}

- (void)initializationDeniedWebView:(id)a3
{
  Geolocation *m_ptr;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  m_ptr = self->m_geolocation.m_ptr;
  v6 = 0;
  WebCore::Geolocation::setIsAllowed((WebCore::Geolocation *)m_ptr, 0, (const WTF::String *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (void).cxx_destruct
{
  Geolocation *m_ptr;

  m_ptr = self->m_geolocation.m_ptr;
  self->m_geolocation.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 8) == 1)
    {
      MEMORY[0x1D82A3E0C]();
      JUMPOUT(0x1D82A3E18);
    }
    --*((_DWORD *)m_ptr + 8);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
