@implementation WebCDMSessionAVContentKeySessionDelegate

- (WebCDMSessionAVContentKeySessionDelegate)initWithParent:(void *)a3
{
  WebCDMSessionAVContentKeySessionDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebCDMSessionAVContentKeySessionDelegate;
  result = -[WebCDMSessionAVContentKeySessionDelegate init](&v5, sel_init);
  if (result)
    result->m_parent = a3;
  return result;
}

- (void)invalidate
{
  self->m_parent = 0;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  unsigned __int8 *m_parent;
  unsigned __int8 *v6;
  const void *v8;
  unsigned __int8 *v9;
  unsigned __int8 v11;
  int v12;
  int v13;
  _QWORD v14[2];
  char v15;
  _QWORD v16[3];

  m_parent = (unsigned __int8 *)self->m_parent;
  if (m_parent)
  {
    v6 = m_parent + 128;
    if (__ldaxr(m_parent + 128))
    {
      __clrex();
    }
    else if (!__stxr(1u, v6))
    {
      goto LABEL_6;
    }
    MEMORY[0x19AEA534C](m_parent + 128, a2, a3);
LABEL_6:
    if (a4)
      CFRetain(a4);
    v8 = (const void *)*((_QWORD *)m_parent + 17);
    *((_QWORD *)m_parent + 17) = a4;
    if (v8)
      CFRelease(v8);
    v9 = m_parent + 124;
    if (__ldaxr(m_parent + 124))
    {
      __clrex();
    }
    else if (!__stxr(1u, v9))
    {
      goto LABEL_14;
    }
    MEMORY[0x19AEA534C](m_parent + 124, a2, a3);
LABEL_14:
    ++*((_DWORD *)m_parent + 30);
    v11 = atomic_load(m_parent + 125);
    if ((v11 & 1) != 0)
    {
      v15 = 0;
      v14[0] = m_parent + 125;
      v14[1] = &v15;
      v16[0] = WTF::ScopedLambdaRefFunctor<long ()(WTF::ParkingLot::UnparkResult),WTF::Condition::notifyOne(void)::{lambda(WTF::ParkingLot::UnparkResult)#1}>::implFunction;
      v16[1] = v16;
      v16[2] = v14;
      WTF::ParkingLot::unparkOneImpl();
    }
    v12 = __ldxr(v9);
    if (v12 == 1)
    {
      if (!__stlxr(0, v9))
      {
LABEL_21:
        v13 = __ldxr(v6);
        if (v13 == 1)
        {
          if (!__stlxr(0, v6))
            return;
        }
        else
        {
          __clrex();
        }
        WTF::Lock::unlockSlow((WTF::Lock *)(m_parent + 128));
        return;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)(m_parent + 124));
    goto LABEL_21;
  }
}

- (void)contentKeySessionContentProtectionSessionIdentifierDidChange:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  if (self->m_parent)
  {
    v4 = objc_msgSend(a3, "contentProtectionSessionIdentifier");
    if (v4)
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    CFRetain(self);
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
    *v5 = &off_1E334DD08;
    v5[1] = self;
    v5[2] = self;
    v5[3] = v4;
    v6 = v5;
    WTF::callOnMainThread();
    if (v6)
      (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  }
}

- (_QWORD)contentKeySessionContentProtectionSessionIdentifierDidChange:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E334DD08;
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

- (uint64_t)contentKeySessionContentProtectionSessionIdentifierDidChange:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E334DD08;
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

- (WTF::StringImpl)contentKeySessionContentProtectionSessionIdentifierDidChange:(uint64_t)a1
{
  uint64_t v1;
  WTF::StringImpl *v2;
  WTF::StringImpl *result;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  MEMORY[0x19AEA5508](&v5, *(_QWORD *)(a1 + 24));
  result = v5;
  if (v5)
    *(_DWORD *)v5 += 2;
  v4 = *(WTF::StringImpl **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = result;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
    {
      WTF::StringImpl::destroy(v4, v2);
      result = v5;
    }
    else
    {
      *(_DWORD *)v4 -= 2;
    }
  }
  v5 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

@end
