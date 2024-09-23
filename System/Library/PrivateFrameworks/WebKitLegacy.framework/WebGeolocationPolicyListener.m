@implementation WebGeolocationPolicyListener

- (WebGeolocationPolicyListener)initWithGeolocation:(NakedPtr<WebCore:(id)a4 :Geolocation>)a3 forWebView:
{
  WebGeolocationPolicyListener *v6;
  WebGeolocationPolicyListener *v7;
  uint64_t v8;
  Geolocation *m_ptr;
  void *v10;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WebGeolocationPolicyListener;
  v6 = -[WebGeolocationPolicyListener init](&v13, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v8 = *(_QWORD *)a3.var0;
  if (*(_QWORD *)a3.var0)
    ++*(_DWORD *)(v8 + 32);
  m_ptr = v6->_geolocation.m_ptr;
  v7->_geolocation.m_ptr = (Geolocation *)v8;
  if (!m_ptr)
  {
LABEL_7:
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (*((_DWORD *)m_ptr + 8) != 1)
  {
    --*((_DWORD *)m_ptr + 8);
    goto LABEL_7;
  }
  v12 = MEMORY[0x1D82A3E0C]();
  MEMORY[0x1D82A3E18](v12);
  if (a4)
LABEL_8:
    CFRetain(a4);
LABEL_9:
  v10 = v7->_webView.m_ptr;
  v7->_webView.m_ptr = a4;
  if (v10)
    CFRelease(v10);
  return v7;
}

- (void)allow
{
  WebThreadRun();
}

WTF::StringImpl *__37__WebGeolocationPolicyListener_allow__block_invoke(uint64_t a1)
{
  WebCore::Geolocation *v1;
  StringImpl *v2;
  WTF::StringImpl *result;
  WTF::StringImpl *v4;

  v1 = *(WebCore::Geolocation **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = 0;
  WebCore::Geolocation::setIsAllowed(v1, 1, (const WTF::String *)&v4);
  result = v4;
  v4 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

- (void)deny
{
  WebThreadRun();
}

WTF::StringImpl *__36__WebGeolocationPolicyListener_deny__block_invoke(uint64_t a1)
{
  WebCore::Geolocation *v1;
  StringImpl *v2;
  WTF::StringImpl *result;
  WTF::StringImpl *v4;

  v1 = *(WebCore::Geolocation **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = 0;
  WebCore::Geolocation::setIsAllowed(v1, 0, (const WTF::String *)&v4);
  result = v4;
  v4 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

- (void)denyOnlyThisRequest
{
  WebThreadRun();
}

uint64_t __51__WebGeolocationPolicyListener_denyOnlyThisRequest__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deny");
  return WebCore::Geolocation::resetIsAllowed(*(WebCore::Geolocation **)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)shouldClearCache
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend(self->_webView.m_ptr, "preferences"), "_alwaysRequestGeolocationPermission");
}

- (void).cxx_destruct
{
  void *m_ptr;
  Geolocation *v4;

  m_ptr = self->_webView.m_ptr;
  self->_webView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_geolocation.m_ptr;
  self->_geolocation.m_ptr = 0;
  if (v4)
  {
    if (*((_DWORD *)v4 + 8) == 1)
    {
      MEMORY[0x1D82A3E0C]();
      JUMPOUT(0x1D82A3E18);
    }
    --*((_DWORD *)v4 + 8);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
