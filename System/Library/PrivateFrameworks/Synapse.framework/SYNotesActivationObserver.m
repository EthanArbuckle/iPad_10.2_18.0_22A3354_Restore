@implementation SYNotesActivationObserver

void __49__SYNotesActivationObserver__startObservingNotes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint64_t v12;
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v2 = (void *)getFBSDisplayLayoutMonitorConfigurationClass_softClass_0;
  v20 = getFBSDisplayLayoutMonitorConfigurationClass_softClass_0;
  v3 = MEMORY[0x1E0C809B0];
  if (!getFBSDisplayLayoutMonitorConfigurationClass_softClass_0)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_0;
    v15 = &unk_1E757B260;
    v16 = &v17;
    __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke_0((uint64_t)&v12);
    v2 = (void *)v18[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v4, "configurationForDefaultMainDisplayMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __49__SYNotesActivationObserver__startObservingNotes__block_invoke_2;
  v9[3] = &unk_1E757B988;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "setTransitionHandler:", v9);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v6 = (void *)getFBSDisplayLayoutMonitorClass_softClass_0;
  v20 = getFBSDisplayLayoutMonitorClass_softClass_0;
  if (!getFBSDisplayLayoutMonitorClass_softClass_0)
  {
    v12 = v3;
    v13 = 3221225472;
    v14 = __getFBSDisplayLayoutMonitorClass_block_invoke_0;
    v15 = &unk_1E757B260;
    v16 = &v17;
    __getFBSDisplayLayoutMonitorClass_block_invoke_0((uint64_t)&v12);
    v6 = (void *)v18[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v7, "monitorWithConfiguration:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "set_displayLayoutMonitor:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)set_displayLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->__displayLayoutMonitor, a3);
}

void __49__SYNotesActivationObserver__startObservingNotes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateNotesVisibilityFromLayout:", v5);
    objc_msgSend(WeakRetained, "_notifyHandlerOfVisibility");
  }

}

- (void)_updateNotesVisibilityFromLayout:(id)a3
{
  id v4;
  double *v5;
  __int128 v6;
  void *v7;
  double *v8;
  double *v9;
  double *v10;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4010000000;
  v15 = &unk_1BCC7D661;
  v5 = (double *)MEMORY[0x1E0C9D628];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *MEMORY[0x1E0C9D628];
  v17 = v6;
  objc_msgSend(v4, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SYNotesActivationObserver__updateNotesVisibilityFromLayout___block_invoke;
  v11[3] = &unk_1E757C570;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  -[SYNotesActivationObserver setVisible:](self, "setVisible:", *((unsigned __int8 *)v19 + 24));
  if (*((_BYTE *)v19 + 24))
  {
    v5 = v13 + 4;
    v8 = v13 + 5;
    v9 = v13 + 6;
    v10 = v13 + 7;
  }
  else
  {
    v10 = v5 + 3;
    v9 = v5 + 2;
    v8 = v5 + 1;
  }
  -[SYNotesActivationObserver setVisibleFrame:](self, "setVisibleFrame:", *v5, *v8, *v9, *v10);
  -[SYNotesActivationObserver setHasInitialVisibility:](self, "setHasInitialVisibility:", 1);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

}

- (void)setVisibleFrame:(CGRect)a3
{
  self->_visibleFrame = a3;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void)setHasInitialVisibility:(BOOL)a3
{
  self->_hasInitialVisibility = a3;
}

- (void)_notifyHandlerOfVisibility
{
  void *v3;
  void (**v4)(id, BOOL);

  -[SYNotesActivationObserver handler](self, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SYNotesActivationObserver handler](self, "handler");
    v4 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue();
    v4[2](v4, -[SYNotesActivationObserver isVisible](self, "isVisible"));

  }
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)isVisible
{
  void *v3;
  void *v4;

  if (!self->_hasInitialVisibility)
  {
    -[SYNotesActivationObserver _displayLayoutMonitor](self, "_displayLayoutMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYNotesActivationObserver _updateNotesVisibilityFromLayout:](self, "_updateNotesVisibilityFromLayout:", v4);

  }
  return self->_visible;
}

- (FBSDisplayLayoutMonitor)_displayLayoutMonitor
{
  return self->__displayLayoutMonitor;
}

- (SYNotesActivationObserver)initWithHandler:(id)a3
{
  id v4;
  SYNotesActivationObserver *v5;
  uint64_t v6;
  id handler;
  CGSize v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SYNotesActivationObserver;
  v5 = -[SYNotesActivationObserver init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handler = v5->_handler;
    v5->_handler = (id)v6;

    v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v5->_visibleFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v5->_visibleFrame.size = v8;
    -[SYNotesActivationObserver startObservingNotes](v5, "startObservingNotes");
  }

  return v5;
}

- (void)_startObservingNotes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SYNotesActivationObserver__startObservingNotes__block_invoke;
  block[3] = &unk_1E757B758;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__SYNotesActivationObserver__updateNotesVisibilityFromLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilenotes")))
    v7 = objc_msgSend(v16, "layoutRole") == 5;
  else
    v7 = 0;

  objc_msgSend(v16, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.SystemPaperViewService")))
  {

LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    objc_msgSend(v16, "frame");
    v11 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v11[4] = v12;
    v11[5] = v13;
    v11[6] = v14;
    v11[7] = v15;
    *a4 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v16, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.SystemPaperViewService"));

  if ((v7 | v10) == 1)
    goto LABEL_7;
LABEL_8:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SYNotesActivationObserver _displayLayoutMonitor](self, "_displayLayoutMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SYNotesActivationObserver;
  -[SYNotesActivationObserver dealloc](&v4, sel_dealloc);
}

- (CGRect)visibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleFrame.origin.x;
  y = self->_visibleFrame.origin.y;
  width = self->_visibleFrame.size.width;
  height = self->_visibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)hasInitialVisibility
{
  return self->_hasInitialVisibility;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayLayoutMonitor, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
