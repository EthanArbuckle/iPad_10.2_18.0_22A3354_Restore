@implementation WISObserver

- (WISObserver)init
{
  WISObserver *v2;
  WISObserver *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WISObserver;
  v2 = -[WISObserver init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    WISObserverConnection::create((WISObserverConnection *)v2, (uint64_t *)&v8);
    sub_24A574D78((uint64_t)&v3->observerConnection, &v8);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
    if (*((_QWORD *)&v8 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  return v3;
}

- (void)setDelegate:(id)a3 queue:(dispatch_queue_s *)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  WISObserverConnection *ptr;
  _QWORD v11[4];
  id v12;
  id v13;
  dispatch_object_t object;
  id from;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_initWeak(&from, v6);
  objc_msgSend_setDelegate_(self, v8, (uint64_t)v6, v9);

  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  ptr = self->observerConnection.__ptr_;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3321888768;
  v11[2] = sub_24A574F58;
  v11[3] = &unk_251BE15B0;
  objc_copyWeak(&v12, &from);
  objc_copyWeak(&v13, &location);
  object = (dispatch_object_t)a4;
  if (a4)
    dispatch_retain((dispatch_object_t)a4);
  WISObserverConnection::setStateChangedCallback((uint64_t)ptr, v11);
  if (object)
    dispatch_release(object);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  if (a4)
    dispatch_release((dispatch_object_t)a4);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)setConfiguration:(id)a3 callback:(id)a4
{
  id v6;
  WISObserverConnection *ptr;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  ptr = self->observerConnection.__ptr_;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_24A5750FC;
  v9[3] = &unk_251BE15E8;
  v10 = v6;
  v8 = v6;
  WISObserverConnection::setObserverConfiguration((uint64_t)ptr, a3, v9);

}

- (WISObserverDelegate)delegate
{
  return (WISObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  wis::WISServerConnection::~WISServerConnection((wis::WISServerConnection *)&self->observerConnection);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
