@implementation MTMediaContentSourceiOSMusicLibrary

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance_0;
}

void __53__MTMediaContentSourceiOSMusicLibrary_sharedInstance__block_invoke()
{
  MTMediaContentSourceiOSMusicLibrary *v0;
  void *v1;

  v0 = objc_alloc_init(MTMediaContentSourceiOSMusicLibrary);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (MTMediaContentSourceiOSMusicLibrary)init
{
  MTMediaContentSourceiOSMusicLibrary *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTMediaContentSourceiOSMusicLibrary;
  v2 = -[MTMediaContentSourceiOSMusicLibrary init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -15);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MTMediaContentSourceiOSMusicLibrary", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)determineiTunesMatchEnabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, MTMediaContentSourceiOSMusicLibrary *);
  _QWORD aBlock[4];
  id v8;

  v4 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__MTMediaContentSourceiOSMusicLibrary_determineiTunesMatchEnabledWithCompletion___block_invoke;
  aBlock[3] = &unk_24FD62C88;
  v8 = v4;
  v5 = v4;
  v6 = (void (**)(void *, MTMediaContentSourceiOSMusicLibrary *))_Block_copy(aBlock);
  v6[2](v6, self);

}

uint64_t __81__MTMediaContentSourceiOSMusicLibrary_determineiTunesMatchEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)iTunesMatchEnabled
{
  return self->_iTunesMatchEnabled;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
