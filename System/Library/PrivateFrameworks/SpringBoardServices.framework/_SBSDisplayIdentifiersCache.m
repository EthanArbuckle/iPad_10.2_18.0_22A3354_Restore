@implementation _SBSDisplayIdentifiersCache

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___SBSDisplayIdentifiersCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, block);
  return (id)sharedInstance___sharedInstance;
}

- (id)displayIdentifiers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49___SBSDisplayIdentifiersCache_displayIdentifiers__block_invoke;
  v5[3] = &unk_1E288FD20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)registerChangedBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___SBSDisplayIdentifiersCache_registerChangedBlock___block_invoke;
  block[3] = &unk_1E288FFD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (_SBSDisplayIdentifiersCache)init
{
  _SBSDisplayIdentifiersCache *v2;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  NSObject *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SBSDisplayIdentifiersCache;
  v2 = -[_SBSDisplayIdentifiersCache init](&v10, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    objc_initWeak(&location, v2);
    v5 = v2->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35___SBSDisplayIdentifiersCache_init__block_invoke;
    v7[3] = &unk_1E288FFB0;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("com.apple.springboard.display-identifiers.changed", &v2->_changedToken, v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_changedToken);
  v3.receiver = self;
  v3.super_class = (Class)_SBSDisplayIdentifiersCache;
  -[_SBSDisplayIdentifiersCache dealloc](&v3, sel_dealloc);
}

- (void)_queue_noteChanged
{
  NSSet *v3;
  NSSet *displayIdentifiers;
  void *v5;
  id v6;
  _QWORD v7[4];
  NSSet *v8;
  id v9;

  v3 = self->_displayIdentifiers;
  displayIdentifiers = self->_displayIdentifiers;
  self->_displayIdentifiers = 0;

  if (self->_changedBlock)
  {
    v5 = (void *)MEMORY[0x193FF87DC]();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49___SBSDisplayIdentifiersCache__queue_noteChanged__block_invoke;
    v7[3] = &unk_1E288D2E8;
    v9 = v5;
    v8 = v3;
    v6 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changedBlock, 0);
  objc_storeStrong((id *)&self->_displayIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
