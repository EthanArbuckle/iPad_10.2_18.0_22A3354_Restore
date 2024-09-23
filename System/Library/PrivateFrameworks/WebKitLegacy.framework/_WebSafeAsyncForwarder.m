@implementation _WebSafeAsyncForwarder

- (_WebSafeAsyncForwarder)initWithForwarder:(id)a3
{
  _WebSafeAsyncForwarder *v4;
  _WebSafeAsyncForwarder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WebSafeAsyncForwarder;
  v4 = -[_WebSafeAsyncForwarder init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak((id *)&v4->_forwarder, a3);
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id Weak;
  id v6;
  _QWORD *v7;
  _QWORD *v8;

  if (WebThreadIsCurrent())
  {
    WTF::RunLoop::main((WTF::RunLoop *)objc_msgSend(a3, "retainArguments"));
    Weak = objc_loadWeak((id *)&self->_forwarder);
    v6 = Weak;
    if (Weak)
      CFRetain(Weak);
    if (a3)
      CFRetain(a3);
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v7 = &off_1E9D6C3E8;
    v7[1] = v6;
    v7[2] = a3;
    v8 = v7;
    WTF::RunLoop::dispatch();
    if (v8)
      (*(void (**)(_QWORD *))(*v8 + 8))(v8);
  }
  else
  {
    objc_msgSend(objc_loadWeak((id *)&self->_forwarder), "forwardInvocation:", a3);
  }
}

- (uint64_t)forwardInvocation:(uint64_t)a1
{
  return objc_msgSend(*(id *)(a1 + 8), "forwardInvocation:", *(_QWORD *)(a1 + 16));
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_loadWeak((id *)&self->_forwarder);
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(objc_loadWeak((id *)&self->_forwarder), "methodSignatureForSelector:", a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_forwarder);
}

- (_QWORD)forwardInvocation:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E9D6C3E8;
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

- (uint64_t)forwardInvocation:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E9D6C3E8;
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

@end
