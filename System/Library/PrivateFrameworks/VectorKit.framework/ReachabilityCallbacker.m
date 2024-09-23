@implementation ReachabilityCallbacker

- (ReachabilityCallbacker)initWithListener:(function<void)( queue:
{
  id v7;
  id v8;
  _QWORD *v9;
  ReachabilityCallbacker *v10;
  function<void ()> *f;
  function<void ()> *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;
  _QWORD v17[3];
  function<void ()> *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ReachabilityCallbacker;
  v8 = -[ReachabilityCallbacker init](&v16, sel_init);
  v9 = v8;
  v10 = (ReachabilityCallbacker *)v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 5, a4);
    f = (function<void ()> *)a3->__f_.__f_;
    if (f)
    {
      if (f == a3)
      {
        v18 = (function<void ()> *)v17;
        (*(void (**)(function<void ()> *, _QWORD *))(*(_QWORD *)a3->__f_.__buf_.__lx + 24))(a3, v17);
LABEL_7:
        std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](v17, v9 + 1);
        v12 = v18;
        if (v18 == (function<void ()> *)v17)
        {
          v13 = 4;
          v12 = (function<void ()> *)v17;
        }
        else
        {
          if (!v18)
          {
LABEL_12:
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel__reachabilityChanged_, *MEMORY[0x1E0D26AB8], 0);

            goto LABEL_13;
          }
          v13 = 5;
        }
        (*(void (**)(void))(*(_QWORD *)v12->__f_.__buf_.__lx + 8 * v13))();
        goto LABEL_12;
      }
      f = (function<void ()> *)(*(uint64_t (**)(function<void ()> *))(*(_QWORD *)f->__f_.__buf_.__lx + 16))(f);
    }
    v18 = f;
    goto LABEL_7;
  }
LABEL_13:

  return v10;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 6) = 850045863;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 13) = 0;
  return self;
}

- (void)dealloc
{
  void *v3;
  ReachabilityCallbacker *v4;
  uint64_t v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D26AB8], 0);

  v4 = (ReachabilityCallbacker *)*((_QWORD *)self + 4);
  *((_QWORD *)self + 4) = 0;
  if (v4 == (ReachabilityCallbacker *)((char *)self + 8))
  {
    v5 = 4;
    v4 = (ReachabilityCallbacker *)((char *)self + 8);
    goto LABEL_5;
  }
  if (v4)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
  }
  v6.receiver = self;
  v6.super_class = (Class)ReachabilityCallbacker;
  -[ReachabilityCallbacker dealloc](&v6, sel_dealloc);
}

- (void)clearListener
{
  std::mutex *v3;
  ReachabilityCallbacker *v4;
  uint64_t v5;

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = (ReachabilityCallbacker *)*((_QWORD *)self + 4);
  *((_QWORD *)self + 4) = 0;
  if (v4 == (ReachabilityCallbacker *)((char *)self + 8))
  {
    v5 = 4;
    v4 = (ReachabilityCallbacker *)((char *)self + 8);
    goto LABEL_5;
  }
  if (v4)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
  }
  std::mutex::unlock(v3);
}

- (void)_reachabilityChanged:(id)a3
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v4 = *((_QWORD *)self + 5);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ReachabilityCallbacker__reachabilityChanged___block_invoke;
  v5[3] = &unk_1E42F11D8;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  ReachabilityCallbacker *v3;
  uint64_t v4;

  std::mutex::~mutex((std::mutex *)((char *)self + 48));
  objc_storeStrong((id *)self + 5, 0);
  v3 = (ReachabilityCallbacker *)*((_QWORD *)self + 4);
  if (v3 == (ReachabilityCallbacker *)((char *)self + 8))
  {
    v4 = 4;
    v3 = (ReachabilityCallbacker *)((char *)self + 8);
  }
  else
  {
    if (!v3)
      return;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
}

void __47__ReachabilityCallbacker__reachabilityChanged___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  std::mutex *v2;
  uint64_t v3;
  char *v4;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (std::mutex *)(WeakRetained + 48);
    v4 = WeakRetained;
    std::mutex::lock((std::mutex *)(WeakRetained + 48));
    v3 = *((_QWORD *)v4 + 4);
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 48))(v3);
    std::mutex::unlock(v2);
    WeakRetained = v4;
  }

}

@end
