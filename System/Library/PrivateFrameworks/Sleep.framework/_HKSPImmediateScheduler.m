@implementation _HKSPImmediateScheduler

- (_HKSPImmediateScheduler)init
{
  _HKSPImmediateScheduler *v2;
  uint64_t v3;
  NAScheduler *backingScheduler;
  _HKSPImmediateScheduler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKSPImmediateScheduler;
  v2 = -[_HKSPImmediateScheduler init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
    v3 = objc_claimAutoreleasedReturnValue();
    backingScheduler = v2->_backingScheduler;
    v2->_backingScheduler = (NAScheduler *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)_performOnMainThreadIfNecessary:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  NAScheduler *backingScheduler;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  backingScheduler = self->_backingScheduler;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51___HKSPImmediateScheduler_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E4E3C4D8;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  -[NAScheduler afterDelay:performBlock:](backingScheduler, "afterDelay:performBlock:", v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)performBlock:(id)a3
{
  id v4;
  NAScheduler *backingScheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  backingScheduler = self->_backingScheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40___HKSPImmediateScheduler_performBlock___block_invoke;
  v7[3] = &unk_1E4E3C4D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NAScheduler performBlock:](backingScheduler, "performBlock:", v7);

}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  NAScheduler *backingScheduler;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  backingScheduler = self->_backingScheduler;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50___HKSPImmediateScheduler_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E4E3CD70;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[NAScheduler performCancelableBlock:](backingScheduler, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NAScheduler)backingScheduler
{
  return self->_backingScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingScheduler, 0);
}

@end
