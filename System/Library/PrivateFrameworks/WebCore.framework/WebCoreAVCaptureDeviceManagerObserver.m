@implementation WebCoreAVCaptureDeviceManagerObserver

- (WebCoreAVCaptureDeviceManagerObserver)initWithCallback:(void *)a3
{
  WebCoreAVCaptureDeviceManagerObserver *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebCoreAVCaptureDeviceManagerObserver;
  result = -[WebCoreAVCaptureDeviceManagerObserver init](&v5, sel_init);
  if (result)
    result->m_callback = a3;
  return result;
}

- (void)disconnect
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  self->m_callback = 0;
}

- (void)deviceConnectedDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  if (self->m_callback)
  {
    WTF::RunLoop::main((WTF::RunLoop *)self);
    CFRetain(self);
    v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v4 = &off_1E3359528;
    v4[1] = self;
    v4[2] = self;
    v5 = v4;
    WTF::RunLoop::dispatch();
    if (v5)
      (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  if (self->m_callback)
  {
    v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("suspended"), a4, a5, a6);
    if ((v8 & 1) != 0
      || (v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("systemPreferredCamera")), (v8 & 1) != 0)
      || (v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("devices")), (_DWORD)v8))
    {
      WTF::RunLoop::main((WTF::RunLoop *)v8);
      CFRetain(self);
      v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
      *v9 = &off_1E3359578;
      v9[1] = self;
      v9[2] = self;
      v10 = v9;
      WTF::RunLoop::dispatch();
      if (v10)
        (*(void (**)(_QWORD *))(*v10 + 8))(v10);
    }
  }
}

- (_QWORD)deviceConnectedDidChange:(_QWORD *)a1
{
  const void *v2;

  *a1 = &off_1E3359528;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)deviceConnectedDidChange:(WTF *)this
{
  const void *v3;

  *(_QWORD *)this = &off_1E3359528;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (_QWORD)deviceConnectedDidChange:(_QWORD *)result
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(result[1] + 8);
  if (v1)
  {
    v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v2 = off_1E3359550;
    v3 = *(_QWORD *)(v1 + 56);
    v4 = WTF::fastMalloc((WTF *)0x20);
    *(_QWORD *)v4 = &off_1E33594D8;
    *(_QWORD *)(v4 + 8) = v1;
    *(_QWORD *)(v4 + 16) = v2;
    *(_BYTE *)(v4 + 24) = 0;
    v5 = (_QWORD *)v4;
    (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v3 + 32))(v3, &v5);
    result = v5;
    v5 = 0;
    if (result)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
  }
  return result;
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:change:context:
{
  const void *v2;

  *a1 = &off_1E3359578;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  const void *v3;

  *(_QWORD *)this = &off_1E3359578;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)result ofObject:change:context:
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(result[1] + 8);
  if (v1)
  {
    v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v2 = off_1E3359550;
    v3 = *(_QWORD *)(v1 + 56);
    v4 = WTF::fastMalloc((WTF *)0x20);
    *(_QWORD *)v4 = &off_1E33594D8;
    *(_QWORD *)(v4 + 8) = v1;
    *(_QWORD *)(v4 + 16) = v2;
    *(_BYTE *)(v4 + 24) = 0;
    v5 = (_QWORD *)v4;
    (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v3 + 32))(v3, &v5);
    result = v5;
    v5 = 0;
    if (result)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
  }
  return result;
}

@end
