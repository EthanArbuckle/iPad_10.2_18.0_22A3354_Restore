@implementation WebAVSampleBufferListenerPrivate

- (WebAVSampleBufferListenerPrivate)initWithClient:(void *)a3
{
  void *v4;
  WebAVSampleBufferListenerPrivate *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WebAVSampleBufferListenerPrivate;
  v5 = -[WebAVSampleBufferListenerPrivate init](&v15, sel_init);
  if (v5)
  {
    v6 = *((_QWORD *)a3 + 1);
    if (v6)
      goto LABEL_16;
    v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v6 = 1;
    *(_QWORD *)(v6 + 8) = a3;
    v7 = (unsigned int *)*((_QWORD *)a3 + 1);
    *((_QWORD *)a3 + 1) = v6;
    if (!v7)
      goto LABEL_16;
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v4);
    }
    v6 = *((_QWORD *)a3 + 1);
    if (v6)
    {
LABEL_16:
      do
        v10 = __ldaxr((unsigned int *)v6);
      while (__stlxr(v10 + 1, (unsigned int *)v6));
    }
    m_ptr = (unsigned int *)v5->_client.m_impl.m_ptr;
    v5->_client.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr)
    {
      do
      {
        v12 = __ldaxr(m_ptr);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, m_ptr));
      if (!v13)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v4);
      }
    }
  }
  return v5;
}

- (void)invalidate
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;
  uint64_t m_size;
  id *m_buffer;
  uint64_t v8;
  id v9;
  uint64_t v10;
  WTF *v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  WTF *v19;
  uint64_t v20;
  const void *v21;

  m_ptr = (unsigned int *)self->_client.m_impl.m_ptr;
  self->_client.m_impl.m_ptr = 0;
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
  m_size = self->_videoRenderers.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = (id *)self->_videoRenderers.m_buffer;
    v8 = 8 * m_size;
    do
    {
      objc_msgSend(*m_buffer, "removeObserver:forKeyPath:", self, CFSTR("error"));
      v9 = *m_buffer++;
      objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("outputObscuredDueToInsufficientExternalProtection"));
      v8 -= 8;
    }
    while (v8);
  }
  if (self->_videoRenderers.m_capacity)
  {
    v10 = self->_videoRenderers.m_size;
    v11 = (WTF *)self->_videoRenderers.m_buffer;
    if ((_DWORD)v10)
    {
      v12 = 8 * v10;
      do
      {
        v13 = *(const void **)v11;
        *(_QWORD *)v11 = 0;
        if (v13)
          CFRelease(v13);
        v11 = (WTF *)((char *)v11 + 8);
        v12 -= 8;
      }
      while (v12);
      self->_videoRenderers.m_size = 0;
      v11 = (WTF *)self->_videoRenderers.m_buffer;
    }
    if (v11)
    {
      self->_videoRenderers.m_buffer = 0;
      self->_videoRenderers.m_capacity = 0;
      WTF::fastFree(v11, (void *)a2);
    }
  }
  v14 = self->_audioRenderers.m_size;
  if ((_DWORD)v14)
  {
    v15 = (void **)self->_audioRenderers.m_buffer;
    v16 = 8 * v14;
    do
    {
      v17 = *v15++;
      objc_msgSend(v17, "removeObserver:forKeyPath:", self, CFSTR("error"));
      v16 -= 8;
    }
    while (v16);
  }
  if (self->_audioRenderers.m_capacity)
  {
    v18 = self->_audioRenderers.m_size;
    v19 = (WTF *)self->_audioRenderers.m_buffer;
    if ((_DWORD)v18)
    {
      v20 = 8 * v18;
      do
      {
        v21 = *(const void **)v19;
        *(_QWORD *)v19 = 0;
        if (v21)
          CFRelease(v21);
        v19 = (WTF *)((char *)v19 + 8);
        v20 -= 8;
      }
      while (v20);
      self->_audioRenderers.m_size = 0;
      v19 = (WTF *)self->_audioRenderers.m_buffer;
    }
    if (v19)
    {
      self->_audioRenderers.m_buffer = 0;
      self->_audioRenderers.m_capacity = 0;
      WTF::fastFree(v19, (void *)a2);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
}

- (void)beginObservingVideoRenderer:(id)a3
{
  unint64_t m_size;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  WTF *m_buffer;
  void *v10;
  WTF *v11;
  uint64_t v12;
  WTF *v13;
  const void *v14;
  const void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PAL *v20;
  void *v21;
  _BOOL4 v22;

  m_size = self->_videoRenderers.m_size;
  if ((_DWORD)m_size != self->_videoRenderers.m_capacity)
  {
    *((_QWORD *)self->_videoRenderers.m_buffer + m_size) = a3;
    if (!a3)
      goto LABEL_23;
    goto LABEL_22;
  }
  v6 = m_size + (m_size >> 2);
  if (v6 >= 0x10)
    v7 = v6 + 1;
  else
    v7 = 16;
  if (v7 <= m_size + 1)
    v8 = m_size + 1;
  else
    v8 = v7;
  if (v8 >> 29)
  {
    __break(0xC471u);
    return;
  }
  m_buffer = (WTF *)self->_videoRenderers.m_buffer;
  v11 = (WTF *)WTF::fastMalloc((WTF *)(8 * v8));
  self->_videoRenderers.m_capacity = v8;
  self->_videoRenderers.m_buffer = v11;
  if ((_DWORD)m_size)
  {
    v12 = 8 * m_size;
    v13 = m_buffer;
    do
    {
      v14 = *(const void **)v13;
      *(_QWORD *)v13 = 0;
      *(_QWORD *)v11 = v14;
      v15 = *(const void **)v13;
      *(_QWORD *)v13 = 0;
      if (v15)
        CFRelease(v15);
      v11 = (WTF *)((char *)v11 + 8);
      v13 = (WTF *)((char *)v13 + 8);
      v12 -= 8;
    }
    while (v12);
    v11 = (WTF *)self->_videoRenderers.m_buffer;
  }
  if (m_buffer)
  {
    if (v11 == m_buffer)
    {
      self->_videoRenderers.m_buffer = 0;
      self->_videoRenderers.m_capacity = 0;
    }
    WTF::fastFree(m_buffer, v10);
    v11 = (WTF *)self->_videoRenderers.m_buffer;
  }
  m_size = self->_videoRenderers.m_size;
  *((_QWORD *)v11 + m_size) = a3;
  if (a3)
  {
LABEL_22:
    CFRetain(a3);
    LODWORD(m_size) = self->_videoRenderers.m_size;
  }
LABEL_23:
  self->_videoRenderers.m_size = m_size + 1;
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("error"), 1, _MergedGlobals_51);
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("outputObscuredDueToInsufficientExternalProtection"), 1, off_1ECE7D3F0);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_layerFailedToDecode_, PAL::get_AVFoundation_AVSampleBufferDisplayLayerFailedToDecodeNotification((PAL *)v16), a3);
  v17 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_layerFailedToDecode_, PAL::get_AVFoundation_AVSampleBufferVideoRendererDidFailToDecodeNotification((PAL *)v17), a3);
  v18 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_layerRequiresFlushToResumeDecodingChanged_, PAL::get_AVFoundation_AVSampleBufferDisplayLayerRequiresFlushToResumeDecodingDidChangeNotification((PAL *)v18), a3);
  v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (PAL *)objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_layerRequiresFlushToResumeDecodingChanged_, PAL::get_AVFoundation_AVSampleBufferVideoRendererRequiresFlushToResumeDecodingDidChangeNotification((PAL *)v19), a3);
  {
    if (PAL::canLoad_AVFoundation_AVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification(void)::loaded)
    {
LABEL_25:
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_layerReadyForDisplayChanged_, PAL::constantAVFoundationAVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification, a3);
    }
  }
  else
  {
    v22 = PAL::init_AVFoundation_AVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification(v20);
    PAL::canLoad_AVFoundation_AVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification(void)::loaded = v22;
    if (v22)
      goto LABEL_25;
  }
}

- (void)stopObservingVideoRenderer:(id)a3
{
  uint64_t m_size;
  id *m_buffer;
  uint64_t v7;
  const void **v8;
  const void *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PAL *v16;
  void *v17;
  _BOOL4 v18;

  objc_msgSend(a3, "removeObserver:forKeyPath:", self, CFSTR("error"));
  objc_msgSend(a3, "removeObserver:forKeyPath:", self, CFSTR("outputObscuredDueToInsufficientExternalProtection"));
  m_size = self->_videoRenderers.m_size;
  m_buffer = (id *)self->_videoRenderers.m_buffer;
  if ((_DWORD)m_size)
  {
    v7 = 0;
    while (m_buffer[v7] != a3)
    {
      if (m_size == ++v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = -1;
  }
  v8 = (const void **)&m_buffer[v7];
  v9 = *v8;
  *v8 = 0;
  if (v9)
  {
    CFRelease(v9);
    m_size = self->_videoRenderers.m_size;
  }
  v10 = (char *)(v8 + 1);
  v11 = (char *)self->_videoRenderers.m_buffer + 8 * m_size;
  while (v10 != v11)
  {
    *((_QWORD *)v10 - 1) = *(_QWORD *)v10;
    *(_QWORD *)v10 = 0;
    v10 += 8;
  }
  self->_videoRenderers.m_size = m_size - 1;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v12, "removeObserver:name:object:", self, PAL::get_AVFoundation_AVSampleBufferDisplayLayerFailedToDecodeNotification((PAL *)v12), a3);
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v13, "removeObserver:name:object:", self, PAL::get_AVFoundation_AVSampleBufferVideoRendererDidFailToDecodeNotification((PAL *)v13), a3);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v14, "removeObserver:name:object:", self, PAL::get_AVFoundation_AVSampleBufferDisplayLayerRequiresFlushToResumeDecodingDidChangeNotification((PAL *)v14), a3);
  v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (PAL *)objc_msgSend(v15, "removeObserver:name:object:", self, PAL::get_AVFoundation_AVSampleBufferVideoRendererRequiresFlushToResumeDecodingDidChangeNotification((PAL *)v15), a3);
  {
    if (!PAL::canLoad_AVFoundation_AVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification(void)::loaded)
      return;
    goto LABEL_13;
  }
  v18 = PAL::init_AVFoundation_AVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification(v16);
  PAL::canLoad_AVFoundation_AVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification(void)::loaded = v18;
  if (v18)
  {
LABEL_13:
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v17, "removeObserver:name:object:", self, PAL::constantAVFoundationAVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification, a3);
  }
}

- (void)beginObservingAudioRenderer:(id)a3
{
  unint64_t m_size;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  WTF *m_buffer;
  void *v10;
  WTF *v11;
  uint64_t v12;
  WTF *v13;
  const void *v14;
  const void *v15;
  void *v16;

  m_size = self->_audioRenderers.m_size;
  if ((_DWORD)m_size != self->_audioRenderers.m_capacity)
  {
    *((_QWORD *)self->_audioRenderers.m_buffer + m_size) = a3;
    if (!a3)
    {
LABEL_23:
      self->_audioRenderers.m_size = m_size + 1;
      objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("error"), 1, _MergedGlobals_51);
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_audioRendererWasAutomaticallyFlushed_, PAL::get_AVFoundation_AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification((PAL *)v16), a3);
      return;
    }
LABEL_22:
    CFRetain(a3);
    LODWORD(m_size) = self->_audioRenderers.m_size;
    goto LABEL_23;
  }
  v6 = m_size + (m_size >> 2);
  if (v6 >= 0x10)
    v7 = v6 + 1;
  else
    v7 = 16;
  if (v7 <= m_size + 1)
    v8 = m_size + 1;
  else
    v8 = v7;
  if (!(v8 >> 29))
  {
    m_buffer = (WTF *)self->_audioRenderers.m_buffer;
    v11 = (WTF *)WTF::fastMalloc((WTF *)(8 * v8));
    self->_audioRenderers.m_capacity = v8;
    self->_audioRenderers.m_buffer = v11;
    if ((_DWORD)m_size)
    {
      v12 = 8 * m_size;
      v13 = m_buffer;
      do
      {
        v14 = *(const void **)v13;
        *(_QWORD *)v13 = 0;
        *(_QWORD *)v11 = v14;
        v15 = *(const void **)v13;
        *(_QWORD *)v13 = 0;
        if (v15)
          CFRelease(v15);
        v11 = (WTF *)((char *)v11 + 8);
        v13 = (WTF *)((char *)v13 + 8);
        v12 -= 8;
      }
      while (v12);
      v11 = (WTF *)self->_audioRenderers.m_buffer;
    }
    if (m_buffer)
    {
      if (v11 == m_buffer)
      {
        self->_audioRenderers.m_buffer = 0;
        self->_audioRenderers.m_capacity = 0;
      }
      WTF::fastFree(m_buffer, v10);
      v11 = (WTF *)self->_audioRenderers.m_buffer;
    }
    m_size = self->_audioRenderers.m_size;
    *((_QWORD *)v11 + m_size) = a3;
    if (!a3)
      goto LABEL_23;
    goto LABEL_22;
  }
  __break(0xC471u);
}

- (void)stopObservingAudioRenderer:(id)a3
{
  void *v5;
  uint64_t m_size;
  id *m_buffer;
  uint64_t v8;
  const void **v9;
  const void *v10;
  char *v11;
  char *v12;

  objc_msgSend(a3, "removeObserver:forKeyPath:", self, CFSTR("error"));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", self, PAL::get_AVFoundation_AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification((PAL *)v5), a3);
  m_size = self->_audioRenderers.m_size;
  m_buffer = (id *)self->_audioRenderers.m_buffer;
  if ((_DWORD)m_size)
  {
    v8 = 0;
    while (m_buffer[v8] != a3)
    {
      if (m_size == ++v8)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8 = -1;
  }
  v9 = (const void **)&m_buffer[v8];
  v10 = *v9;
  *v9 = 0;
  if (v10)
  {
    CFRelease(v10);
    m_size = self->_audioRenderers.m_size;
  }
  v11 = (char *)(v9 + 1);
  v12 = (char *)self->_audioRenderers.m_buffer + 8 * m_size;
  while (v11 != v12)
  {
    *((_QWORD *)v11 - 1) = *(_QWORD *)v11;
    *(_QWORD *)v11 = 0;
    v11 += 8;
  }
  self->_audioRenderers.m_size = m_size - 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  const void *v9;
  PAL *v10;
  PAL *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t isKindOfClass;
  char v15;
  id v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  objc_super v21;
  _QWORD *v22;

  if (_MergedGlobals_51 != a6)
  {
    if (off_1ECE7D3F0 != a6)
    {
      v21.receiver = self;
      v21.super_class = (Class)WebAVSampleBufferListenerPrivate;
      -[WebAVSampleBufferListenerPrivate observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
      return;
    }
    PAL::getAVSampleBufferDisplayLayerClass((PAL *)self);
    isKindOfClass = objc_opt_isKindOfClass();
    if (a4 && (isKindOfClass & 1) != 0
      || (PAL::getAVSampleBufferVideoRendererClass[0]((PAL *)isKindOfClass),
          v15 = objc_opt_isKindOfClass(),
          v16 = 0,
          a4)
      && (v15 & 1) != 0)
    {
      CFRetain(a4);
      v16 = a4;
    }
    v17 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if (self)
      CFRetain(self);
    v18 = WTF::fastMalloc((WTF *)0x28);
    *(_QWORD *)v18 = &off_1E3485A90;
    *(_QWORD *)(v18 + 8) = self;
    *(_QWORD *)(v18 + 16) = self;
    *(_QWORD *)(v18 + 24) = v16;
    *(_BYTE *)(v18 + 32) = v17;
    v22 = (_QWORD *)v18;
    WTF::ensureOnMainThread();
LABEL_19:
    v19 = v22;
    v22 = 0;
    if (v19)
      (*(void (**)(_QWORD *))(*v19 + 8))(v19);
    return;
  }
  v9 = (const void *)objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
  {
    v10 = (PAL *)CFRetain(v9);
    PAL::getAVSampleBufferDisplayLayerClass(v10);
    v11 = (PAL *)objc_opt_isKindOfClass();
    if (((a4 != 0) & v11) == 0
      && (PAL::getAVSampleBufferVideoRendererClass[0](v11), v12 = objc_opt_isKindOfClass(), a4 == 0 || (v12 & 1) == 0))
    {
      PAL::getAVSampleBufferAudioRendererClass((PAL *)v12);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        CFRelease(v9);
        return;
      }
      if (a4)
        CFRetain(a4);
      if (self)
        CFRetain(self);
      v20 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
      *v20 = &off_1E3485A68;
      v20[1] = self;
      v20[2] = self;
      v20[3] = a4;
      v20[4] = v9;
      v22 = v20;
      WTF::ensureOnMainThread();
    }
    else
    {
      CFRetain(a4);
      if (self)
        CFRetain(self);
      v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
      *v13 = &off_1E3485A40;
      v13[1] = self;
      v13[2] = self;
      v13[3] = a4;
      v13[4] = v9;
      v22 = v13;
      WTF::ensureOnMainThread();
    }
    goto LABEL_19;
  }
}

- (void)layerFailedToDecode:(id)a3
{
  PAL *v5;
  uint64_t isKindOfClass;
  char v7;
  const void *v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  const void *v12;
  _QWORD *v13;
  _QWORD *v14;

  v5 = (PAL *)objc_msgSend(a3, "object");
  PAL::getAVSampleBufferDisplayLayerClass(v5);
  isKindOfClass = objc_opt_isKindOfClass();
  if (v5 && (isKindOfClass & 1) != 0
    || (PAL::getAVSampleBufferVideoRendererClass[0]((PAL *)isKindOfClass), v7 = objc_opt_isKindOfClass(), v8 = 0, v5)
    && (v7 & 1) != 0)
  {
    v9 = (const void *)objc_msgSend(a3, "object");
    v8 = v9;
    if (v9)
      CFRetain(v9);
  }
  v10 = (void *)objc_msgSend(a3, "userInfo");
  v11 = objc_msgSend(v10, "valueForKey:", PAL::get_AVFoundation_AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey((PAL *)v10));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = (const void *)v11;
  else
    v12 = 0;
  if (v12)
    CFRetain(v12);
  if (self)
    CFRetain(self);
  v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v13 = &off_1E3485AB8;
  v13[1] = self;
  v13[2] = self;
  v13[3] = v8;
  v13[4] = v12;
  v14 = v13;
  WTF::ensureOnMainThread();
  if (v14)
    (*(void (**)(_QWORD *))(*v14 + 8))(v14);
}

- (void)layerRequiresFlushToResumeDecodingChanged:(id)a3
{
  PAL *v5;
  uint64_t isKindOfClass;
  char v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v5 = (PAL *)objc_msgSend(a3, "object");
  PAL::getAVSampleBufferDisplayLayerClass(v5);
  isKindOfClass = objc_opt_isKindOfClass();
  if (v5 && (isKindOfClass & 1) != 0
    || (PAL::getAVSampleBufferVideoRendererClass[0]((PAL *)isKindOfClass), v7 = objc_opt_isKindOfClass(), v8 = 0, v5)
    && (v7 & 1) != 0)
  {
    v9 = (void *)objc_msgSend(a3, "object");
    v8 = v9;
    if (v9)
      CFRetain(v9);
  }
  v10 = objc_msgSend(v8, "requiresFlushToResumeDecoding");
  if (self)
    CFRetain(self);
  v11 = WTF::fastMalloc((WTF *)0x28);
  *(_QWORD *)v11 = &off_1E3485AE0;
  *(_QWORD *)(v11 + 8) = self;
  *(_QWORD *)(v11 + 16) = self;
  *(_QWORD *)(v11 + 24) = v8;
  *(_BYTE *)(v11 + 32) = v10;
  v12 = v11;
  WTF::ensureOnMainThread();
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
}

- (void)layerReadyForDisplayChanged:(id)a3
{
  PAL *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (PAL *)objc_msgSend(a3, "object");
  PAL::getAVSampleBufferDisplayLayerClass(v4);
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4)
  {
    CFRetain(v4);
    v5 = -[PAL isReadyForDisplay](v4, "isReadyForDisplay");
    if (self)
      CFRetain(self);
    v6 = WTF::fastMalloc((WTF *)0x28);
    *(_QWORD *)v6 = &off_1E3485B08;
    *(_QWORD *)(v6 + 8) = self;
    *(_QWORD *)(v6 + 16) = self;
    *(_QWORD *)(v6 + 24) = v4;
    *(_BYTE *)(v6 + 32) = v5;
    v7 = v6;
    WTF::ensureOnMainThread();
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
}

- (void)audioRendererWasAutomaticallyFlushed:(id)a3
{
  PAL *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v5 = (PAL *)objc_msgSend(a3, "object");
  PAL::getAVSampleBufferAudioRendererClass(v5);
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v5 = 0;
  if (v5)
    CFRetain(v5);
  v10 = 0uLL;
  v6 = (void *)objc_msgSend(a3, "userInfo");
  v7 = (void *)objc_msgSend(v6, "valueForKey:", PAL::get_AVFoundation_AVSampleBufferAudioRendererFlushTimeKey((PAL *)v6));
  if (!v7)
  {
    v10 = 0uLL;
    if (!self)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v7, "CMTimeValue");
  if (self)
LABEL_9:
    CFRetain(self);
LABEL_10:
  v8 = WTF::fastMalloc((WTF *)0x38);
  *(_QWORD *)v8 = &off_1E3485B30;
  *(_QWORD *)(v8 + 8) = self;
  *(_QWORD *)(v8 + 16) = self;
  *(_QWORD *)(v8 + 24) = v5;
  *(_OWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 48) = 0;
  v9 = v8;
  WTF::ensureOnMainThread();
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
}

- (void).cxx_destruct
{
  uint64_t m_size;
  const void **m_buffer;
  uint64_t v5;
  const void *v6;
  WTF *v7;
  uint64_t v8;
  const void **v9;
  uint64_t v10;
  const void *v11;
  WTF *v12;
  unsigned int *m_ptr;
  unsigned int v14;
  unsigned int v15;

  m_size = self->_audioRenderers.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = (const void **)self->_audioRenderers.m_buffer;
    v5 = 8 * m_size;
    do
    {
      v6 = *m_buffer;
      *m_buffer = 0;
      if (v6)
        CFRelease(v6);
      ++m_buffer;
      v5 -= 8;
    }
    while (v5);
  }
  v7 = (WTF *)self->_audioRenderers.m_buffer;
  if (v7)
  {
    self->_audioRenderers.m_buffer = 0;
    self->_audioRenderers.m_capacity = 0;
    WTF::fastFree(v7, (void *)a2);
  }
  v8 = self->_videoRenderers.m_size;
  if ((_DWORD)v8)
  {
    v9 = (const void **)self->_videoRenderers.m_buffer;
    v10 = 8 * v8;
    do
    {
      v11 = *v9;
      *v9 = 0;
      if (v11)
        CFRelease(v11);
      ++v9;
      v10 -= 8;
    }
    while (v10);
  }
  v12 = (WTF *)self->_videoRenderers.m_buffer;
  if (v12)
  {
    self->_videoRenderers.m_buffer = 0;
    self->_videoRenderers.m_capacity = 0;
    WTF::fastFree(v12, (void *)a2);
  }
  m_ptr = (unsigned int *)self->_client.m_impl.m_ptr;
  self->_client.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v14 = __ldaxr(m_ptr);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, m_ptr));
    if (!v15)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:change:context:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3485A90;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3485A90;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)result ofObject:change:context:
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result[1] + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 40))(v2, result[3], result[4]);
  }
  return result;
}

- (uint64_t)observeValueForKeyPath:(uint64_t)result ofObject:change:context:
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 8) + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
      return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 56))(v2, *(unsigned __int8 *)(result + 32));
  }
  return result;
}

- (_QWORD)layerFailedToDecode:(_QWORD *)a1
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E3485AB8;
  v2 = (const void *)a1[4];
  a1[4] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[3];
  a1[3] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[2];
  a1[2] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)layerFailedToDecode:(WTF *)this
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E3485AB8;
  v3 = (const void *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (uint64_t)layerFailedToDecode:(uint64_t)result
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *i;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(unsigned int *)(v1 + 28);
  if ((_DWORD)v2)
  {
    for (i = *(_QWORD **)(v1 + 16); *i != *(_QWORD *)(result + 24); ++i)
    {
      if (!--v2)
        return result;
    }
    v4 = *(_QWORD *)(v1 + 8);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 8);
      if (v5)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
    }
  }
  return result;
}

- (_QWORD)layerRequiresFlushToResumeDecodingChanged:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3485AE0;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)layerRequiresFlushToResumeDecodingChanged:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3485AE0;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)layerRequiresFlushToResumeDecodingChanged:(uint64_t)result
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *i;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(unsigned int *)(v1 + 28);
  if ((_DWORD)v2)
  {
    for (i = *(_QWORD **)(v1 + 16); *i != *(_QWORD *)(result + 24); ++i)
    {
      if (!--v2)
        return result;
    }
    v4 = *(_QWORD *)(v1 + 8);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 8);
      if (v5)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
    }
  }
  return result;
}

- (_QWORD)layerReadyForDisplayChanged:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3485B08;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)layerReadyForDisplayChanged:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3485B08;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)layerReadyForDisplayChanged:(uint64_t)result
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *i;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(unsigned int *)(v1 + 28);
  if ((_DWORD)v2)
  {
    for (i = *(_QWORD **)(v1 + 16); *i != *(_QWORD *)(result + 24); ++i)
    {
      if (!--v2)
        return result;
    }
    v4 = *(_QWORD *)(v1 + 8);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 8);
      if (v5)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 32))(v5);
    }
  }
  return result;
}

- (_QWORD)audioRendererWasAutomaticallyFlushed:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3485B30;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)audioRendererWasAutomaticallyFlushed:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3485B30;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)audioRendererWasAutomaticallyFlushed:(uint64_t)result
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *i;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(unsigned int *)(v1 + 44);
  if ((_DWORD)v2)
  {
    for (i = *(_QWORD **)(v1 + 32); *i != *(_QWORD *)(result + 24); ++i)
    {
      if (!--v2)
        return result;
    }
    v4 = *(_QWORD *)(v1 + 8);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 8);
      if (v5)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 48))(v5);
    }
  }
  return result;
}

@end
