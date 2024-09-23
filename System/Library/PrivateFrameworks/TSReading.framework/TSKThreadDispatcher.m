@implementation TSKThreadDispatcher

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TSKThreadDispatcher_sharedInstance__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_sInstance;
}

id __37__TSKThreadDispatcher_sharedInstance__block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedInstance_sInstance = (uint64_t)result;
  return result;
}

- (void)dispatch:(id)a3
{
  dispatch_async((dispatch_queue_t)-[TSKThreadDispatcher p_dispatchQueue](self, "p_dispatchQueue"), a3);
}

- (void)dispatchSelector:(SEL)a3 target:(id)a4 argument:(id)a5
{
  NSObject *v8;
  _QWORD block[7];

  v8 = -[TSKThreadDispatcher p_dispatchQueue](self, "p_dispatchQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__TSKThreadDispatcher_dispatchSelector_target_argument___block_invoke;
  block[3] = &unk_24D82A528;
  block[5] = a5;
  block[6] = a3;
  block[4] = a4;
  dispatch_async(v8, block);
}

uint64_t __56__TSKThreadDispatcher_dispatchSelector_target_argument___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (id)p_dispatchQueue
{
  return dispatch_get_global_queue(0, 0);
}

@end
