@implementation WebCoreReplayKitScreenRecorderHelper

- (WebCoreReplayKitScreenRecorderHelper)initWithCallback:(void *)a3
{
  WebCoreReplayKitScreenRecorderHelper *v4;
  void *v5;
  WebCoreReplayKitScreenRecorderHelper *v6;
  DefaultWeakPtrImpl *v7;
  unsigned int *m_ptr;
  unsigned int v9;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WebCoreReplayKitScreenRecorderHelper;
  v4 = -[WebCoreReplayKitScreenRecorderHelper init](&v12, sel_init);
  v6 = v4;
  if (v4)
  {
    v7 = *(DefaultWeakPtrImpl **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = (unsigned int *)v4->_callback.m_impl.m_ptr;
    v6->_callback.m_impl.m_ptr = v7;
    if (m_ptr)
    {
      do
      {
        v9 = __ldaxr(m_ptr);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, m_ptr));
      if (!v10)
      {
        atomic_store(1u, m_ptr);
        m_ptr = (unsigned int *)WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
    objc_msgSend((id)objc_msgSend((id)PAL::getRPScreenRecorderClass[0]((PAL *)m_ptr), "sharedRecorder"), "addObserver:forKeyPath:options:context:", v6, CFSTR("recording"), 1, 0);
  }
  return v6;
}

- (void)disconnect
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_callback.m_impl.m_ptr;
  self->_callback.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      m_ptr = (unsigned int *)WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
  objc_msgSend((id)objc_msgSend((id)PAL::getRPScreenRecorderClass[0]((PAL *)m_ptr), "sharedRecorder"), "removeObserver:forKeyPath:", self, CFSTR("recording"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  DefaultWeakPtrImpl *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  DefaultWeakPtrImpl *v19;
  WebCore::ReplayKitCaptureSource *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  _QWORD v24[4];

  m_ptr = self->_callback.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    v10 = objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CB8], a4);
    v11 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CC0]), "BOOLValue");
    v12 = *((_QWORD *)self->_callback.m_impl.m_ptr + 1);
    if (!*(_QWORD *)(v12 + 16))
      goto LABEL_12;
    v13 = *(_QWORD *)(v12 + 24);
    v24[0] = "ReplayKitCaptureSource";
    v24[1] = 23;
    v24[2] = "observeValueForKeyPath";
    v24[3] = v13;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v10);
    v15 = self->_callback.m_impl.m_ptr;
    if (v15)
      v16 = *((_QWORD *)v15 + 1) + 16;
    else
      v16 = 16;
    v17 = *(_QWORD *)v16;
    v18 = "will";
    if (!v11)
      v18 = "did";
    v23 = v18;
    v22 = (const char *)objc_msgSend(a3, "UTF8String");
    v21 = (const char *)objc_msgSend(v14, "UTF8String");
    if (*(_BYTE *)(v17 + 12))
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char const*,char [10],char const*,char [6],char const*>((uint64_t)&WebCore::LogWebRTC, 0, (WTF::Logger::LogSiteIdentifier *)v24, &v23, " change '", &v22, "' to ", &v21);
    if (v14)
    {
      CFRelease(v14);
      if ((v11 & 1) != 0)
        return;
    }
    else
    {
LABEL_12:
      if ((v11 & 1) != 0)
        return;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("recording")))
    {
      v19 = self->_callback.m_impl.m_ptr;
      if (v19)
        v20 = (WebCore::ReplayKitCaptureSource *)*((_QWORD *)v19 + 1);
      else
        v20 = 0;
      WebCore::ReplayKitCaptureSource::captureStateDidChange(v20);
    }
  }
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_callback.m_impl.m_ptr;
  self->_callback.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
