@implementation WebKitFullScreenListener

- (WebKitFullScreenListener)initWithElement:(void *)a3
{
  WebKitFullScreenListener *v4;
  WebKitFullScreenListener *v5;
  Element *m_ptr;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebKitFullScreenListener;
  v4 = -[WebKitFullScreenListener init](&v8, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (a3)
    *((_DWORD *)a3 + 6) += 2;
  m_ptr = v4->_element.m_ptr;
  v5->_element.m_ptr = (Element *)a3;
  if (!m_ptr)
    return v5;
  if (*((_DWORD *)m_ptr + 6) != 2)
  {
    *((_DWORD *)m_ptr + 6) -= 2;
    return v5;
  }
  if ((*((_WORD *)m_ptr + 15) & 0x400) != 0)
    return v5;
  WebCore::Node::removedLastRef((WebCore::Node *)m_ptr);
  return v5;
}

- (void)webkitWillEnterFullScreen
{
  Element *m_ptr;
  WebCore::FullscreenManager *v4;

  m_ptr = self->_element.m_ptr;
  if (m_ptr)
  {
    v4 = *(WebCore::FullscreenManager **)(*(_QWORD *)(*((_QWORD *)m_ptr + 5) + 8) + 1992);
    if (!v4)
    {
      v4 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(*(WebCore::Document **)(*((_QWORD *)m_ptr + 5) + 8));
      m_ptr = self->_element.m_ptr;
    }
    WebCore::FullscreenManager::willEnterFullscreen(v4, m_ptr);
  }
}

- (void)webkitDidEnterFullScreen
{
  Element *m_ptr;
  WebCore::Document *v3;
  WebCore::FullscreenManager *v4;

  m_ptr = self->_element.m_ptr;
  if (m_ptr)
  {
    v3 = *(WebCore::Document **)(*((_QWORD *)m_ptr + 5) + 8);
    v4 = (WebCore::FullscreenManager *)*((_QWORD *)v3 + 249);
    if (!v4)
      v4 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(v3);
    WebCore::FullscreenManager::didEnterFullscreen(v4);
  }
}

- (void)webkitWillExitFullScreen
{
  Element *m_ptr;
  WebCore::Document *v3;
  WebCore::FullscreenManager *v4;

  m_ptr = self->_element.m_ptr;
  if (m_ptr)
  {
    v3 = *(WebCore::Document **)(*((_QWORD *)m_ptr + 5) + 8);
    v4 = (WebCore::FullscreenManager *)*((_QWORD *)v3 + 249);
    if (!v4)
      v4 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(v3);
    WebCore::FullscreenManager::willExitFullscreen(v4);
  }
}

- (void)webkitDidExitFullScreen
{
  Element *m_ptr;
  WebCore::Document *v3;
  WebCore::FullscreenManager *v4;

  m_ptr = self->_element.m_ptr;
  if (m_ptr)
  {
    v3 = *(WebCore::Document **)(*((_QWORD *)m_ptr + 5) + 8);
    v4 = (WebCore::FullscreenManager *)*((_QWORD *)v3 + 249);
    if (!v4)
      v4 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(v3);
    WebCore::FullscreenManager::didExitFullscreen(v4);
  }
}

- (void).cxx_destruct
{
  Element *m_ptr;

  m_ptr = self->_element.m_ptr;
  self->_element.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 6) == 2)
    {
      if ((*((_WORD *)m_ptr + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)m_ptr);
    }
    else
    {
      *((_DWORD *)m_ptr + 6) -= 2;
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
