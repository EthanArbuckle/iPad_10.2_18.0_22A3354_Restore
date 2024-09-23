@implementation PLAtomicObject

- (void)atomicallyPerformBlockAndWait:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PLAtomicObject_atomicallyPerformBlockAndWait___block_invoke;
  v6[3] = &unk_1E376C7A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  PLRunWithUnfairLock(&self->_lock, v6);

}

uint64_t __48__PLAtomicObject_atomicallyPerformBlockAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (PLAtomicObject)initWithObject:(id)a3
{
  id v5;
  PLAtomicObject *v6;
  PLAtomicObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAtomicObject;
  v6 = -[PLAtomicObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (void)invalidateWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PLAtomicObject_invalidateWithHandler___block_invoke;
  v6[3] = &unk_1E376C7A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  PLRunWithUnfairLock(&self->_lock, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

void __40__PLAtomicObject_invalidateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

@end
