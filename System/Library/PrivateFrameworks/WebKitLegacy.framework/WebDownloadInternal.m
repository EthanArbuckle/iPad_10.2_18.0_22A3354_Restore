@implementation WebDownloadInternal

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebDownloadInternal;
  -[WebDownloadInternal dealloc](&v2, sel_dealloc);
}

- (void)setRealDelegate:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->realDelegate.m_ptr;
  self->realDelegate.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v12;

  if (sel_downloadDidBegin_ == a3
    || sel_download_willSendRequest_redirectResponse_ == a3
    || sel_download_didReceiveResponse_ == a3
    || sel_download_didReceiveDataOfLength_ == a3
    || sel_download_shouldDecodeSourceDataOfMIMEType_ == a3
    || sel_download_decideDestinationWithSuggestedFilename_ == a3
    || sel_download_didCreateDestination_ == a3
    || sel_downloadDidFinish_ == a3
    || sel_download_didFailWithError_ == a3)
  {
    return objc_opt_respondsToSelector() & 1;
  }
  v12.receiver = self;
  v12.super_class = (Class)WebDownloadInternal;
  return -[WebDownloadInternal respondsToSelector:](&v12, sel_respondsToSelector_);
}

- (void)downloadDidBegin:(id)a3
{
  void *m_ptr;
  _QWORD *v5;
  _QWORD *v6;

  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr)
    CFRetain(m_ptr);
  if (a3)
    CFRetain(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v5 = &off_1E9D6D6D8;
  v5[1] = m_ptr;
  v5[2] = a3;
  v6 = v5;
  WTF::callOnMainThread();
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
}

- (id)download:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  WTF::WorkQueue *isMainThread;
  const void *v10;
  CFTypeRef v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef cf;
  id v19;
  id v20;
  id v21;
  WebDownloadInternal *v22;
  _QWORD *v23;

  v21 = a3;
  v22 = self;
  v19 = a5;
  v20 = a4;
  cf = 0;
  isMainThread = (WTF::WorkQueue *)WTF::isMainThread((WTF *)self);
  if ((_DWORD)isMainThread)
  {
    v10 = (const void *)objc_msgSend(self->realDelegate.m_ptr, "download:willSendRequest:redirectResponse:", a3, a4, a5);
    v11 = v10;
    if (v10)
      CFRetain(v10);
  }
  else
  {
    v12 = WTF::WorkQueue::main(isMainThread);
    v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x30);
    *v13 = off_1E9D6D700;
    v13[1] = &cf;
    v13[2] = &v22;
    v13[3] = &v21;
    v13[4] = &v20;
    v13[5] = &v19;
    v23 = v13;
    (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v12 + 24))(v12, &v23);
    v14 = v23;
    v23 = 0;
    if (v14)
      (*(void (**)(_QWORD *))(*v14 + 8))(v14);
    v11 = cf;
  }
  cf = 0;
  v15 = (id)CFMakeCollectable(v11);
  v16 = cf;
  cf = 0;
  if (v16)
    CFRelease(v16);
  return (id)v15;
}

- (void)download:(id)a3 didReceiveResponse:(id)a4
{
  void *m_ptr;
  _QWORD *v7;
  _QWORD *v8;

  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr)
    CFRetain(m_ptr);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v7 = &off_1E9D6D728;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
}

- (uint64_t)download:(uint64_t)a1 didReceiveResponse:
{
  return objc_msgSend(*(id *)(a1 + 8), "download:didReceiveResponse:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

- (void)download:(id)a3 didReceiveDataOfLength:(unint64_t)a4
{
  void *m_ptr;
  _QWORD *v7;
  _QWORD *v8;

  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr)
    CFRetain(m_ptr);
  if (a3)
    CFRetain(a3);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v7 = &off_1E9D6D750;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
}

- (BOOL)download:(id)a3 shouldDecodeSourceDataOfMIMEType:(id)a4
{
  WTF::WorkQueue *isMainThread;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  char v12;
  id v13;
  id v14;
  WebDownloadInternal *v15;
  _QWORD *v16;

  v14 = a3;
  v15 = self;
  v13 = a4;
  v12 = 0;
  isMainThread = (WTF::WorkQueue *)WTF::isMainThread((WTF *)self);
  if ((_DWORD)isMainThread)
    return objc_msgSend(self->realDelegate.m_ptr, "download:shouldDecodeSourceDataOfMIMEType:", a3, a4);
  v9 = WTF::WorkQueue::main(isMainThread);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v10 = off_1E9D6D778;
  v10[1] = &v12;
  v10[2] = &v15;
  v10[3] = &v14;
  v10[4] = &v13;
  v16 = v10;
  (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v9 + 24))(v9, &v16);
  v11 = v16;
  v16 = 0;
  if (v11)
    (*(void (**)(_QWORD *))(*v11 + 8))(v11);
  return v12 != 0;
}

- (void)download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4
{
  void *m_ptr;
  _QWORD *v7;
  _QWORD *v8;

  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr)
    CFRetain(m_ptr);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v7 = &off_1E9D6D7A0;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
}

- (void)download:(id)a3 didCreateDestination:(id)a4
{
  void *m_ptr;
  _QWORD *v7;
  _QWORD *v8;

  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr)
    CFRetain(m_ptr);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v7 = &off_1E9D6D7C8;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
}

- (void)downloadDidFinish:(id)a3
{
  void *m_ptr;
  _QWORD *v5;
  _QWORD *v6;

  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr)
    CFRetain(m_ptr);
  if (a3)
    CFRetain(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v5 = &off_1E9D6D7F0;
  v5[1] = m_ptr;
  v5[2] = a3;
  v6 = v5;
  WTF::callOnMainThread();
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
}

- (void)download:(id)a3 didFailWithError:(id)a4
{
  void *m_ptr;
  _QWORD *v7;
  _QWORD *v8;

  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr)
    CFRetain(m_ptr);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v7 = &off_1E9D6D818;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->realDelegate.m_ptr;
  self->realDelegate.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (_QWORD)downloadDidBegin:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E9D6D6D8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)downloadDidBegin:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E9D6D6D8;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)downloadDidBegin:(uint64_t)a1
{
  return objc_msgSend(*(id *)(a1 + 8), "downloadDidBegin:", *(_QWORD *)(a1 + 16));
}

- (void)download:(id)&& willSendRequest:redirectResponse:
{
  const void *v2;
  const void *v3;
  const void **v4;
  const void *v5;

  v2 = (const void *)objc_msgSend(*(id *)(**(_QWORD **)(a1 + 16) + 8), "download:willSendRequest:redirectResponse:", **(_QWORD **)(a1 + 24), **(_QWORD **)(a1 + 32), **(_QWORD **)(a1 + 40));
  v3 = v2;
  v4 = *(const void ***)(a1 + 8);
  if (v2)
    CFRetain(v2);
  v5 = *v4;
  *v4 = v3;
  if (v5)
    CFRelease(v5);
}

- (_QWORD)download:(_QWORD *)a1 didReceiveResponse:
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E9D6D728;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)download:(WTF *)this didReceiveResponse:(void *)a2
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E9D6D728;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (_QWORD)download:(_QWORD *)a1 didReceiveDataOfLength:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E9D6D750;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)download:(WTF *)this didReceiveDataOfLength:(void *)a2
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E9D6D750;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)download:(uint64_t)a1 didReceiveDataOfLength:
{
  return objc_msgSend(*(id *)(a1 + 8), "download:didReceiveDataOfLength:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

- (uint64_t)download:(id)&& shouldDecodeSourceDataOfMIMEType:
{
  uint64_t result;

  result = objc_msgSend(*(id *)(**(_QWORD **)(a1 + 16) + 8), "download:shouldDecodeSourceDataOfMIMEType:", **(_QWORD **)(a1 + 24), **(_QWORD **)(a1 + 32));
  **(_BYTE **)(a1 + 8) = result;
  return result;
}

- (_QWORD)download:(_QWORD *)a1 decideDestinationWithSuggestedFilename:
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E9D6D7A0;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)download:(WTF *)this decideDestinationWithSuggestedFilename:(void *)a2
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E9D6D7A0;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (uint64_t)download:(uint64_t)a1 decideDestinationWithSuggestedFilename:
{
  return objc_msgSend(*(id *)(a1 + 8), "download:decideDestinationWithSuggestedFilename:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

- (_QWORD)download:(_QWORD *)a1 didCreateDestination:
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E9D6D7C8;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)download:(WTF *)this didCreateDestination:(void *)a2
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E9D6D7C8;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (uint64_t)download:(uint64_t)a1 didCreateDestination:
{
  return objc_msgSend(*(id *)(a1 + 8), "download:didCreateDestination:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

- (_QWORD)downloadDidFinish:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E9D6D7F0;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)downloadDidFinish:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E9D6D7F0;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)downloadDidFinish:(uint64_t)a1
{
  return objc_msgSend(*(id *)(a1 + 8), "downloadDidFinish:", *(_QWORD *)(a1 + 16));
}

- (_QWORD)download:(_QWORD *)a1 didFailWithError:
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E9D6D818;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)download:(WTF *)this didFailWithError:(void *)a2
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E9D6D818;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (uint64_t)download:(uint64_t)a1 didFailWithError:
{
  return objc_msgSend(*(id *)(a1 + 8), "download:didFailWithError:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

@end
