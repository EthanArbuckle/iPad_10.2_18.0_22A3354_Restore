@implementation SBUIRemoteAlertServiceViewController

- (SBUIRemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIRemoteAlertServiceViewController;
  return -[SBUIRemoteAlertServiceViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_hasPreservedInputViews)
    -[SBUIRemoteAlertServiceViewController sb_restoreInputViewsAnimated:](self, "sb_restoreInputViewsAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUIRemoteAlertServiceViewController;
  -[SBUIRemoteAlertServiceViewController dealloc](&v3, sel_dealloc);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  BOOL v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = -[SBUIRemoteAlertServiceViewController _selectorIsOverriden:](self, "_selectorIsOverriden:", sel_prepareForActivationWithContext_completion_);
  v6 = v7;
  if (v7 && !v5)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBUIRemoteAlertServiceViewController _selectorIsOverriden:](self, "_selectorIsOverriden:", sel_handleButtonActions_))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (!v6)
      goto LABEL_23;
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "events", (_QWORD)v13);
        v11 = v10;
        if ((v10 & 1) != 0)
        {
          -[SBUIRemoteAlertServiceViewController handleLockButtonPressed](self, "handleLockButtonPressed");
          if ((v11 & 2) == 0)
          {
LABEL_9:
            if ((v11 & 4) == 0)
              goto LABEL_10;
            goto LABEL_18;
          }
        }
        else if ((v10 & 2) == 0)
        {
          goto LABEL_9;
        }
        -[SBUIRemoteAlertServiceViewController handleVolumeUpButtonPressed](self, "handleVolumeUpButtonPressed");
        if ((v11 & 4) == 0)
        {
LABEL_10:
          if ((v11 & 8) == 0)
            goto LABEL_11;
          goto LABEL_19;
        }
LABEL_18:
        -[SBUIRemoteAlertServiceViewController handleVolumeDownButtonPressed](self, "handleVolumeDownButtonPressed");
        if ((v11 & 8) == 0)
        {
LABEL_11:
          if ((v11 & 0x20) == 0)
            goto LABEL_12;
          goto LABEL_20;
        }
LABEL_19:
        -[SBUIRemoteAlertServiceViewController handleHeadsetButtonPressed:](self, "handleHeadsetButtonPressed:", 0);
        if ((v11 & 0x20) == 0)
        {
LABEL_12:
          if ((v11 & 0x10) == 0)
            goto LABEL_14;
LABEL_13:
          -[SBUIRemoteAlertServiceViewController handleHomeButtonPressed](self, "handleHomeButtonPressed");
          goto LABEL_14;
        }
LABEL_20:
        -[SBUIRemoteAlertServiceViewController handleHeadsetButtonPressed:](self, "handleHeadsetButtonPressed:", 1);
        if ((v11 & 0x10) != 0)
          goto LABEL_13;
LABEL_14:
        ++v9;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v12;
      if (!v12)
      {
LABEL_23:

        break;
      }
    }
  }

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)synchronizeAnimationsInActions:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)MEMORY[0x1A85A15D0]();
  if (-[SBUIRemoteAlertServiceViewController _appearState](self, "_appearState"))
  {
    if (self->_hasSentAnimationFence)
    {
      objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    self->_hasSentAnimationFence = 1;
    v7 = (void *)*MEMORY[0x1E0CEB258];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__SBUIRemoteAlertServiceViewController_synchronizeAnimationsInActions___block_invoke;
    v9[3] = &unk_1E4C3E408;
    v9[4] = self;
    objc_msgSend(v7, "_performBlockAfterCATransactionCommits:", v9);
    -[SBUIRemoteAlertServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_participateInSystemAnimationFence:", v6);

  }
  v4[2](v4);
  objc_autoreleasePoolPop(v5);

}

uint64_t __71__SBUIRemoteAlertServiceViewController_synchronizeAnimationsInActions___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 969) = 0;
  return result;
}

- (void)sb_preserveInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (!self->_hasPreservedInputViews)
  {
    v3 = a3;
    self->_hasPreservedInputViews = 1;
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_preserveInputViewsWithId:animated:", v5, v3);

  }
}

- (void)sb_restoreInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_hasPreservedInputViews)
  {
    v3 = a3;
    self->_hasPreservedInputViews = 0;
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_restoreInputViewsWithId:animated:", v5, v3);

  }
}

- (void)sb_presentForAlertAnimated:(BOOL)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)sb_dismissForAlertAnimated:(BOOL)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7D2C48);
}

+ (id)_exportedInterface
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7B6D80);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_handleButtonActions_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_prepareForActivationWithContext_completion_, 0, 0);

  return v2;
}

- (BOOL)_selectorIsOverriden:(SEL)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a3);
  return v4 != objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a3);
}

@end
