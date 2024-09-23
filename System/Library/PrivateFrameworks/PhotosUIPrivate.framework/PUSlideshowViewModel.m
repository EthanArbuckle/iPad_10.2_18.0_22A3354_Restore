@implementation PUSlideshowViewModel

- (PUSlideshowViewModel)initWithAssetCollection:(id)a3
{
  id v4;
  PUSlideshowViewModel *v5;
  uint64_t v6;
  PXContentPrivacyController *privacyController;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUSlideshowViewModel;
  v5 = -[PUViewModel init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D7B288], "privacyControllerForCollection:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    privacyController = v5->_privacyController;
    v5->_privacyController = (PXContentPrivacyController *)v6;

    if (v5->_privacyController)
    {
      PLContentPrivacyUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Privacy controller found for asset collection representing the slideshow.", v10, 2u);
      }

      -[PXContentPrivacyController registerChangeObserver:context:](v5->_privacyController, "registerChangeObserver:context:", v5, PrivacyControllerObservationContext_89145);
    }
  }

  return v5;
}

- (PUSlideshowViewModel)init
{
  return -[PUSlideshowViewModel initWithAssetCollection:](self, "initWithAssetCollection:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[PXContentPrivacyController unregisterChangeObserver:context:](self->_privacyController, "unregisterChangeObserver:context:", self, PrivacyControllerObservationContext_89145);
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewModel;
  -[PUSlideshowViewModel dealloc](&v3, sel_dealloc);
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUSlideshowViewModelChange);
}

- (id)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewModel;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)registerChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewModel;
  -[PUViewModel registerChangeObserver:](&v3, sel_registerChangeObserver_, a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowViewModel;
  -[PUViewModel unregisterChangeObserver:](&v3, sel_unregisterChangeObserver_, a3);
}

- (void)setCurrentState:(int64_t)a3
{
  id v3;

  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    -[PUSlideshowViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setCurrentStateDidChange:", 1);

  }
}

- (void)setWantsChromeVisible:(BOOL)a3
{
  -[PUSlideshowViewModel setWantsChromeVisible:changeReason:](self, "setWantsChromeVisible:changeReason:", a3, 0);
}

- (void)setWantsChromeVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  id v4;

  if (self->_wantsChromeVisible != a3)
  {
    self->_wantsChromeVisible = a3;
    -[PUSlideshowViewModel currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setWantsChromeVisibleDidChange:", 1);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id location;

  v6 = a4;
  v9 = a3;
  if ((void *)PrivacyControllerObservationContext_89145 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowViewModel.m"), 113, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v12, &location);
    px_dispatch_on_main_queue();
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)dismissSlideshowIfLocked
{
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  -[PUSlideshowViewModel privacyController](self, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  if (v4)
  {
    PLContentPrivacyUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Slideshow dismissing because privacy controller is locked", buf, 2u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__PUSlideshowViewModel_dismissSlideshowIfLocked__block_invoke;
    v6[3] = &unk_1E58ABD10;
    v6[4] = self;
    -[PUViewModel performChanges:](self, "performChanges:", v6);
  }
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (BOOL)wantsChromeVisible
{
  return self->_wantsChromeVisible;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void)setPrivacyController:(id)a3
{
  objc_storeStrong((id *)&self->_privacyController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyController, 0);
}

uint64_t __48__PUSlideshowViewModel_dismissSlideshowIfLocked__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 6);
}

void __53__PUSlideshowViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissSlideshowIfLocked");

}

@end
