@implementation PXSchedulerTrackedAnimation

- (PXSchedulerTrackedAnimation)initWithScheduler:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  PXSchedulerTrackedAnimation *v8;
  PXSchedulerTrackedAnimation *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXSchedulerTrackedAnimation;
  v8 = -[PXSchedulerTrackedAnimation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scheduler, v6);
    objc_storeStrong((id *)&v9->_label, a4);
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__PXSchedulerTrackedAnimation_dealloc__block_invoke;
    v6[3] = &unk_2514D11A8;
    v7 = WeakRetained;
    px_perform_on_main_runloop(2, v6);

  }
  v5.receiver = self;
  v5.super_class = (Class)PXSchedulerTrackedAnimation;
  -[PXSchedulerTrackedAnimation dealloc](&v5, sel_dealloc);
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_scheduler);
}

uint64_t __38__PXSchedulerTrackedAnimation_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "schedulePerformPendingBlocksAfterAnimation");
}

@end
