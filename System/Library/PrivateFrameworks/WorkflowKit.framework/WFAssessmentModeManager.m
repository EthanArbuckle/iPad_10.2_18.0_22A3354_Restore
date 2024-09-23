@implementation WFAssessmentModeManager

- (WFAssessmentModeManager)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  WFAssessmentModeManager *v9;
  WFAssessmentModeManager *v10;
  uint64_t v11;
  AEAssessmentModeGestalt *assessmentGestalt;
  WFAssessmentModeManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFAssessmentModeManager;
  v9 = -[WFAssessmentModeManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF0FD0]), "initWithQueue:", v7);
    assessmentGestalt = v10->_assessmentGestalt;
    v10->_assessmentGestalt = (AEAssessmentModeGestalt *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_isObservingLock._os_unfair_lock_opaque = 0;
    v13 = v10;
  }

  return v10;
}

- (BOOL)isInAssessmentMode
{
  void *v2;
  char v3;

  -[WFAssessmentModeManager assessmentGestalt](self, "assessmentGestalt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)startObservingForAssesmentModeChangesIfNeeded
{
  void *v3;

  if (!-[WFAssessmentModeManager isObserving](self, "isObserving"))
  {
    -[WFAssessmentModeManager assessmentGestalt](self, "assessmentGestalt");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("active"), 0, WFAssessmentModeActiveContext);

    -[WFAssessmentModeManager setIsObserving:](self, "setIsObserving:", 1);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[WFAssessmentModeManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WFAssessmentModeManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E7AF77B8;
  v20 = v12;
  v21 = a6;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[WFAssessmentModeManager isObserving](self, "isObserving"))
  {
    -[WFAssessmentModeManager assessmentGestalt](self, "assessmentGestalt");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("active"), WFAssessmentModeActiveContext);

  }
  v4.receiver = self;
  v4.super_class = (Class)WFAssessmentModeManager;
  -[WFAssessmentModeManager dealloc](&v4, sel_dealloc);
}

- (BOOL)isObserving
{
  WFAssessmentModeManager *v2;
  os_unfair_lock_s *p_isObservingLock;

  v2 = self;
  p_isObservingLock = &self->_isObservingLock;
  os_unfair_lock_lock(&self->_isObservingLock);
  LOBYTE(v2) = v2->_isObserving;
  os_unfair_lock_unlock(p_isObservingLock);
  return (char)v2;
}

- (void)setIsObserving:(BOOL)a3
{
  os_unfair_lock_s *p_isObservingLock;

  p_isObservingLock = &self->_isObservingLock;
  os_unfair_lock_lock(&self->_isObservingLock);
  self->_isObserving = a3;
  os_unfair_lock_unlock(p_isObservingLock);
}

- (AEAssessmentModeGestalt)assessmentGestalt
{
  return self->_assessmentGestalt;
}

- (WFAssessmentModeManagerDelegate)delegate
{
  return (WFAssessmentModeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)isObservingLock
{
  return self->_isObservingLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assessmentGestalt, 0);
}

void __74__WFAssessmentModeManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  if (v2 == WFAssessmentModeActiveContext)
  {
    if (objc_msgSend(v3, "isInAssessmentMode"))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assessmentModeManagerDidBecomeActive:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8.receiver = v3;
    v8.super_class = (Class)WFAssessmentModeManager;
    objc_msgSendSuper2(&v8, sel_observeValueForKeyPath_ofObject_change_context_, v4, v5, v6);
  }
}

+ (BOOL)isAssessmentModeSupportedOnCurrentDevice
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idiom") == 1 || objc_msgSend(v2, "idiom") == 2;

  return v3;
}

@end
