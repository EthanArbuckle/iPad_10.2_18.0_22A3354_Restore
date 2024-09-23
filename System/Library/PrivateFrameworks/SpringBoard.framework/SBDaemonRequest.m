@implementation SBDaemonRequest

void __43__SBDaemonRequest_dispatchDisablerOnQueue___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D17E5334]();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)dispatchEnablerOnQueue:(id)a3
{
  void *v4;
  NSObject *queue;

  queue = a3;
  v4 = (void *)MEMORY[0x1D17E5550](self->_enabler);
  if (v4)
    dispatch_async(queue, v4);

}

+ (id)requestWithEnabler:(id)a3 disabler:(id)a4
{
  id v5;
  id v6;
  SBDaemonRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SBDaemonRequest);
  -[SBDaemonRequest setEnabler:](v7, "setEnabler:", v6);

  -[SBDaemonRequest setDisabler:](v7, "setDisabler:", v5);
  return v7;
}

- (void)setEnabler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDisabler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disabler, 0);
  objc_storeStrong(&self->_enabler, 0);
}

- (void)dispatchDisablerOnQueue:(id)a3
{
  _QWORD block[5];

  if (self->_disabler)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SBDaemonRequest_dispatchDisablerOnQueue___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)a3, block);
  }
}

- (id)enabler
{
  return self->_enabler;
}

- (id)disabler
{
  return self->_disabler;
}

@end
