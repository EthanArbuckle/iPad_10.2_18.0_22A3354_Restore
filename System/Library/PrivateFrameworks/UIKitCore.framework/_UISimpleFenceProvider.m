@implementation _UISimpleFenceProvider

+ (_UISimpleFenceProvider)sharedInstance
{
  if (qword_1ECD7CCB8 != -1)
    dispatch_once(&qword_1ECD7CCB8, &__block_literal_global_52);
  return (_UISimpleFenceProvider *)(id)_MergedGlobals_959;
}

- (BOOL)trackSystemAnimationFence:(id)a3
{
  id v5;
  int v6;
  void *v8;
  void *v9;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISimpleFenceProvider.m"), 51, CFSTR("main thread only"));

  }
  if (self->_synchronizing)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISimpleFenceProvider.m"), 52, CFSTR("cannot start tracking a new fence while we are synchronizing"));

  }
  v6 = objc_msgSend(v5, "isUsable");
  if (v6)
    self->_trackingAny = 1;

  return v6;
}

- (id)requestSystemAnimationFence
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D00C48];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CD2778], "newFenceFromDefaultServer");
  v4 = (void *)objc_msgSend(v2, "newFenceHandleForCAFenceHandle:", v3);

  return v4;
}

- (_UISimpleFenceProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISimpleFenceProvider;
  return -[_UISimpleFenceProvider init](&v3, sel_init);
}

- (void)synchronizeSystemAnimationFencesWithCleanUpBlock:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISimpleFenceProvider.m"), 63, CFSTR("main thread only"));

  }
  *(_WORD *)&self->_trackingAny = 256;
  v5 = v8;
  if (v8)
  {
    v6 = (void *)MEMORY[0x186DC9484]();
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    objc_autoreleasePoolPop(v6);
    v5 = v8;
  }
  self->_synchronizing = 0;

}

- (BOOL)isTrackingAnySystemAnimationFence
{
  void *v5;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISimpleFenceProvider.m"), 45, CFSTR("main thread only"));

  }
  return self->_trackingAny;
}

@end
