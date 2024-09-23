@implementation PPKVOObserver

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_observee, "removeObserver:forKeyPath:", self, self->_key);
  v3.receiver = self;
  v3.super_class = (Class)PPKVOObserver;
  -[PPKVOObserver dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void (**handler)(void);

  if (self->_observee == a4 && objc_msgSend(a3, "isEqualToString:", self->_key))
  {
    handler = (void (**)(void))self->_handler;
    if (handler)
      handler[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong(&self->_observee, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (PPKVOObserver)observerWithName:(id)a3 object:(id)a4 key:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PPKVOObserver *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  void *v24;
  id handler;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id location;
  objc_super v31;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [PPKVOObserver alloc];
  v14 = v12;
  v15 = v10;
  v16 = v11;
  v17 = v9;
  if (v13)
  {
    v31.receiver = v13;
    v31.super_class = (Class)PPKVOObserver;
    v18 = objc_msgSendSuper2(&v31, sel_init);
    v13 = (PPKVOObserver *)v18;
    if (v18)
    {
      objc_storeStrong(v18 + 1, a3);
      objc_storeStrong((id *)&v13->_key, a5);
      objc_storeStrong(&v13->_observee, a4);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.proactive.PPKVOObserver.%@"), v14));
      v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), v20);
      queue = v13->_queue;
      v13->_queue = (OS_dispatch_queue *)v22;

      location = 0;
      objc_initWeak(&location, v13);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__PPKVOObserver_initWithName_key_observee_handler___block_invoke;
      aBlock[3] = &unk_1E7E19260;
      objc_copyWeak(&v29, &location);
      v28 = v17;
      v24 = _Block_copy(aBlock);
      handler = v13->_handler;
      v13->_handler = v24;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);

    }
  }

  objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v13, v15, 0, 0);
  return v13;
}

void __51__PPKVOObserver_initWithName_key_observee_handler___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v3;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_async(WeakRetained[5], *(dispatch_block_t *)(a1 + 32));
    WeakRetained = v3;
  }

}

@end
