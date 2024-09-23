@implementation PLLazyObject

- (PLLazyObject)initWithRetriableBlock:(id)a3
{
  return -[PLLazyObject initWithRetry:block:](self, "initWithRetry:block:", 1, a3);
}

- (id)objectValue
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__PLLazyObject_objectValue__block_invoke;
  v3[3] = &unk_1E376C240;
  v3[4] = self;
  PLResultWithUnfairLock(&self->_lock, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __27__PLLazyObject_objectValue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 24))
  {
    v4 = *(_QWORD *)(v1 + 16);
    if (v4)
    {
      (*(void (**)(void))(v4 + 16))();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 24);
      *(_QWORD *)(v6 + 24) = v5;

      v1 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v1 + 8))
      {
        v8 = *(void **)(v1 + 16);
        *(_QWORD *)(v1 + 16) = 0;

        v1 = *(_QWORD *)(a1 + 32);
      }
    }
  }
  return *(id *)(v1 + 24);
}

- (PLLazyObject)initWithBlock:(id)a3
{
  return -[PLLazyObject initWithRetry:block:](self, "initWithRetry:block:", 0, a3);
}

- (PLLazyObject)initWithRetry:(BOOL)a3 block:(id)a4
{
  id v6;
  PLLazyObject *v7;
  uint64_t v8;
  id block;
  PLLazyObject *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLLazyObject;
  v7 = -[PLLazyObject init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    block = v7->_block;
    v7->_block = (id)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_shouldRetryBlockOnNil = a3;
    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_block, 0);
}

- (PLLazyObject)init
{
  return -[PLLazyObject initWithBlock:](self, "initWithBlock:", &__block_literal_global_8144);
}

- (PLLazyObject)initWithObject:(id)a3
{
  id v4;
  id v5;
  PLLazyObject *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__PLLazyObject_initWithObject___block_invoke;
  v8[3] = &unk_1E376C240;
  v9 = v4;
  v5 = v4;
  v6 = -[PLLazyObject initWithBlock:](self, "initWithBlock:", v8);

  return v6;
}

- (id)currentObjectValueWithoutForcingEvaluation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PLLazyObject_currentObjectValueWithoutForcingEvaluation__block_invoke;
  v3[3] = &unk_1E376C240;
  v3[4] = self;
  PLResultWithUnfairLock(&self->_lock, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)resetObject
{
  void *v4;
  _QWORD v5[5];

  if (!self->_shouldRetryBlockOnNil)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLazyObject.m"), 79, CFSTR("Only retriable lazy objects can be reset"));

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__PLLazyObject_resetObject__block_invoke;
  v5[3] = &unk_1E376C6E0;
  v5[4] = self;
  PLRunWithUnfairLock(&self->_lock, v5);
}

- (void)resetObjectWithHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *);
  _QWORD v6[5];

  v5 = (void (**)(id, void *))a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PLLazyObject_resetObjectWithHandler___block_invoke;
  v6[3] = &unk_1E376C240;
  v6[4] = self;
  PLResultWithUnfairLock(&self->_lock, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5[2](v5, v4);

}

- (void)invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __26__PLLazyObject_invalidate__block_invoke;
  v2[3] = &unk_1E376C6E0;
  v2[4] = self;
  PLRunWithUnfairLock(&self->_lock, v2);
}

- (void)invalidateWithHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *);
  _QWORD v6[5];

  v5 = (void (**)(id, void *))a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PLLazyObject_invalidateWithHandler___block_invoke;
  v6[3] = &unk_1E376C240;
  v6[4] = self;
  PLResultWithUnfairLock(&self->_lock, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5[2](v5, v4);

}

id __38__PLLazyObject_invalidateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = 0;

  return v4;
}

void __26__PLLazyObject_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

id __39__PLLazyObject_resetObjectWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  return v2;
}

void __27__PLLazyObject_resetObject__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

id __58__PLLazyObject_currentObjectValueWithoutForcingEvaluation__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __31__PLLazyObject_initWithObject___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __20__PLLazyObject_init__block_invoke()
{
  return 0;
}

@end
