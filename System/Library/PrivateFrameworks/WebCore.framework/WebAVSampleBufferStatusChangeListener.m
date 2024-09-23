@implementation WebAVSampleBufferStatusChangeListener

- (WebAVSampleBufferStatusChangeListener)initWithParent:(void *)a3
{
  void *v4;
  WebAVSampleBufferStatusChangeListener *v5;
  uint64_t v6;
  ThreadSafeWeakPtrControlBlock *v8;
  int v9;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WebAVSampleBufferStatusChangeListener;
  v5 = -[WebAVSampleBufferStatusChangeListener init](&v17, sel_init);
  if (v5)
  {
    if (!a3 || (v6 = *((_QWORD *)a3 + 1)) == 0)
    {
      v8 = 0;
      goto LABEL_16;
    }
    if (__ldaxr((unsigned __int8 *)v6))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v6))
    {
      goto LABEL_9;
    }
    MEMORY[0x19AEA534C](v6);
LABEL_9:
    if (*(_QWORD *)(v6 + 24))
    {
      ++*(_QWORD *)(v6 + 16);
      v8 = (ThreadSafeWeakPtrControlBlock *)v6;
    }
    else
    {
      v8 = 0;
    }
    v9 = __ldxr((unsigned __int8 *)v6);
    if (v9 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v6))
      {
LABEL_16:
        m_ptr = v5->_parent.m_controlBlock.m_ptr;
        v5->_parent.m_controlBlock.m_ptr = v8;
        if (!m_ptr)
          goto LABEL_29;
        if (__ldaxr((unsigned __int8 *)m_ptr))
        {
          __clrex();
        }
        else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
        {
          goto LABEL_21;
        }
        MEMORY[0x19AEA534C](m_ptr);
LABEL_21:
        v12 = *((_QWORD *)m_ptr + 2) - 1;
        *((_QWORD *)m_ptr + 2) = v12;
        if (v12)
        {
          v16 = __ldxr((unsigned __int8 *)m_ptr);
          if (v16 == 1)
          {
            if (!__stlxr(0, (unsigned __int8 *)m_ptr))
              goto LABEL_29;
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
          goto LABEL_29;
        }
        v13 = *((_QWORD *)m_ptr + 1);
        v14 = __ldxr((unsigned __int8 *)m_ptr);
        if (v14 == 1)
        {
          if (!__stlxr(0, (unsigned __int8 *)m_ptr))
          {
            if (!v13)
              goto LABEL_28;
            goto LABEL_29;
          }
        }
        else
        {
          __clrex();
        }
        WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
        if (!v13)
LABEL_28:
          WTF::fastFree((WTF *)m_ptr, v4);
LABEL_29:
        v5->_parent.m_objectOfCorrectType = (LocalSampleBufferDisplayLayer *)a3;
        return v5;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v6);
    goto LABEL_16;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[WebAVSampleBufferStatusChangeListener invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WebAVSampleBufferStatusChangeListener;
  -[WebAVSampleBufferStatusChangeListener dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;

  -[WebAVSampleBufferStatusChangeListener stop](self, "stop");
  m_ptr = self->_parent.m_controlBlock.m_ptr;
  self->_parent.m_controlBlock.m_ptr = 0;
  if (!m_ptr)
    goto LABEL_14;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr);
LABEL_6:
  v6 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v6;
  if (v6)
  {
    v9 = __ldxr((unsigned __int8 *)m_ptr);
    if (v9 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        goto LABEL_14;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    goto LABEL_14;
  }
  v7 = *((_QWORD *)m_ptr + 1);
  v8 = __ldxr((unsigned __int8 *)m_ptr);
  if (v8 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!v7)
        goto LABEL_13;
      goto LABEL_14;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!v7)
LABEL_13:
    WTF::fastFree((WTF *)m_ptr, v3);
LABEL_14:
  self->_parent.m_objectOfCorrectType = 0;
}

- (void)begin:(id)a3
{
  id v3;
  void *m_ptr;

  v3 = a3;
  if (a3)
    CFRetain(a3);
  m_ptr = self->_displayLayer.m_ptr;
  self->_displayLayer.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v3 = self->_displayLayer.m_ptr;
  }
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, 0);
  objc_msgSend(self->_displayLayer.m_ptr, "addObserver:forKeyPath:options:context:", self, CFSTR("error"), 1, 0);
}

- (void)stop
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_displayLayer.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "removeObserver:forKeyPath:", self, CFSTR("status"));
    objc_msgSend(self->_displayLayer.m_ptr, "removeObserver:forKeyPath:", self, CFSTR("error"));
    v4 = self->_displayLayer.m_ptr;
    self->_displayLayer.m_ptr = 0;
    if (v4)
      CFRelease(v4);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  PAL::getAVSampleBufferDisplayLayerClass((PAL *)self);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("status")))
    {
      if (self)
        CFRetain(self);
      v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v8 = &off_1E3202B40;
      v8[1] = self;
      v10 = v8;
      WTF::callOnMainThread();
    }
    else
    {
      if (!objc_msgSend(a3, "isEqualToString:", CFSTR("error")))
        return;
      if (self)
        CFRetain(self);
      v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v9 = &off_1E3202B68;
      v9[1] = self;
      v10 = v9;
      WTF::callOnMainThread();
    }
    if (v10)
      (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  }
}

- (void).cxx_destruct
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  int v9;

  m_ptr = self->_parent.m_controlBlock.m_ptr;
  self->_parent.m_controlBlock.m_ptr = 0;
  if (!m_ptr)
    goto LABEL_14;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_6:
  v5 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v5;
  if (!v5)
  {
    v6 = *((_QWORD *)m_ptr + 1);
    v7 = __ldxr((unsigned __int8 *)m_ptr);
    if (v7 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
      {
        if (v6)
          goto LABEL_14;
LABEL_13:
        WTF::fastFree((WTF *)m_ptr, (void *)a2);
        goto LABEL_14;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (v6)
      goto LABEL_14;
    goto LABEL_13;
  }
  v9 = __ldxr((unsigned __int8 *)m_ptr);
  if (v9 != 1)
  {
    __clrex();
    goto LABEL_20;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
LABEL_20:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
LABEL_14:
  v8 = self->_displayLayer.m_ptr;
  self->_displayLayer.m_ptr = 0;
  if (v8)
    CFRelease(v8);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:change:context:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3202B68;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3202B68;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (unsigned)observeValueForKeyPath:(unsigned __int8 *)result ofObject:change:context:
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 **v3;
  int v5;

  v1 = *((_QWORD *)result + 1);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return result;
  v3 = *(unsigned __int8 ***)(v1 + 24);
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
LABEL_5:
    result = (unsigned __int8 *)MEMORY[0x19AEA534C](v2);
    goto LABEL_6;
  }
  if (__stxr(1u, (unsigned __int8 *)v2))
    goto LABEL_5;
LABEL_6:
  if (*(_QWORD *)(v2 + 24))
    ++*(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v2);
  if (v5 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v2))
    {
      if (!v3)
        return result;
      goto LABEL_12;
    }
  }
  else
  {
    __clrex();
  }
  result = (unsigned __int8 *)WTF::Lock::unlockSlow((WTF::Lock *)v2);
  if (v3)
  {
LABEL_12:
    WebCore::LocalSampleBufferDisplayLayer::layerErrorDidChange((WebCore::LocalSampleBufferDisplayLayer *)v3);
    return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::SampleBufferDisplayLayer,(WTF::DestructionThread)2>(v3[1]);
  }
  return result;
}

@end
