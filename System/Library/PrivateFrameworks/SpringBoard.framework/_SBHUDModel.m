@implementation _SBHUDModel

+ (id)HUDModelForController:(id)a3 viewController:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBHUDController.m"), 527, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBHUDController.m"), 528, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HUDController"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBHUDController.m"), 526, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

  if (!v12)
    goto LABEL_6;
LABEL_3:
  if (!v9)
    goto LABEL_7;
LABEL_4:
  v13 = (_QWORD *)objc_opt_new();
  v14 = (void *)v13[4];
  v13[4] = v9;
  v15 = v9;

  v16 = (void *)v13[3];
  v13[3] = v10;
  v17 = v10;

  v18 = (void *)v13[6];
  v13[6] = v12;

  return v13;
}

- (void)dealloc
{
  BSInvalidatable *dropletLayoutAssertion;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_dropletLayoutAssertion, "invalidate");
  dropletLayoutAssertion = self->_dropletLayoutAssertion;
  self->_dropletLayoutAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)_SBHUDModel;
  -[_SBHUDModel dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  char v15;

  if (a3 == self)
    return 1;
  v4 = a3;
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_SBHUDModel identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    objc_msgSend(v6, "HUDViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBHUDModel HUDViewController](self, "HUDViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    objc_msgSend(v6, "HUDController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBHUDModel HUDController](self, "HUDController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v13, "isEqual:", v14);

    v15 = v11 & v9 & v12;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBHUDModel identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("identifier"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isPresenting](self, "isPresenting"), CFSTR("isPresenting"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isPresented](self, "isPresented"), CFSTR("isPresented"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isDismissing](self, "isDismissing"), CFSTR("isDismissing"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isDismissed](self, "isDismissed"), CFSTR("isDismissing"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[_SBHUDModel isDismissalScheduled](self, "isDismissalScheduled"), CFSTR("isDismissalScheduled"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)isDismissalScheduled
{
  return self->_dismissalTimer != 0;
}

- (BOOL)isVisible
{
  return -[_SBHUDModel isPresenting](self, "isPresenting")
      || -[_SBHUDModel isPresented](self, "isPresented")
      || -[_SBHUDModel isDismissing](self, "isDismissing");
}

- (void)presentWithDismissalInterval:(double)a3
{
  -[_SBHUDModel presentWithDismissalInterval:animated:](self, "presentWithDismissalInterval:animated:", 1, a3);
}

- (void)presentWithDismissalInterval:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  -[_SBHUDModel invalidateDismissalTimer](self, "invalidateDismissalTimer");
  self->_dismissalInterval = a3;
  -[_SBHUDModel HUDController](self, "HUDController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_presentHUD:animated:", self, v4);

}

- (void)dismiss
{
  -[_SBHUDModel dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[_SBHUDModel invalidateDismissalTimer](self, "invalidateDismissalTimer");
  -[_SBHUDModel HUDController](self, "HUDController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dismissHUD:animated:", self, v3);

}

- (void)invalidateDismissalTimer
{
  NSTimer *dismissalTimer;
  NSTimer *v4;

  dismissalTimer = self->_dismissalTimer;
  if (dismissalTimer)
  {
    -[NSTimer invalidate](dismissalTimer, "invalidate");
    v4 = self->_dismissalTimer;
    self->_dismissalTimer = 0;

  }
}

- (void)scheduleDismissalTimer
{
  double v4;
  double v5;
  NSTimer *v6;
  NSTimer *dismissalTimer;
  void *v8;
  id v9;

  -[_SBHUDModel dismissalInterval](self, "dismissalInterval");
  v5 = v4;
  if (BSFloatGreaterThanFloat())
  {
    if (self->_dismissalTimer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHUDController.m"), 614, CFSTR("Dismissal Timer already set! Something is messed up!"));

    }
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_dismiss, 0, 0, v5);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    dismissalTimer = self->_dismissalTimer;
    self->_dismissalTimer = v6;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTimer:forMode:", self->_dismissalTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)rescheduleDismissalTimer
{
  -[_SBHUDModel invalidateDismissalTimer](self, "invalidateDismissalTimer");
  -[_SBHUDModel scheduleDismissalTimer](self, "scheduleDismissalTimer");
}

- (void)_setupDropletLayout
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  SBHUDViewControlling *HUDViewController;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *dropletLayoutAssertion;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, double);
  void *v16;
  id v17;
  id location;

  v3 = -[SBHUDViewControlling triggerButton](self->_HUDViewController, "triggerButton");
  if (v3)
    v4 = v3 == 9;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = v3;
    -[SBHUDController windowScene](self->_HUDController, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hardwareButtonBezelEffectsCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "hintDropletsEnabled");
    HUDViewController = self->_HUDViewController;
    if ((v8 & 1) != 0)
    {
      -[SBHUDViewControlling setAttachmentDelegate:](HUDViewController, "setAttachmentDelegate:", self);
      objc_initWeak(&location, self);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __34___SBHUDModel__setupDropletLayout__block_invoke;
      v16 = &unk_1E8EAC078;
      objc_copyWeak(&v17, &location);
      v10 = (void *)MEMORY[0x1D17E5550](&v13);
      -[BSInvalidatable invalidate](self->_dropletLayoutAssertion, "invalidate", v13, v14, v15, v16);
      objc_msgSend(v7, "setDropletLayoutCallback:forButton:", v10, v5);
      v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      dropletLayoutAssertion = self->_dropletLayoutAssertion;
      self->_dropletLayoutAssertion = v11;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      -[SBHUDViewControlling setAttachmentDelegate:](HUDViewController, "setAttachmentDelegate:", 0);
    }

  }
}

- (void)_teardownDropletLayout
{
  BSInvalidatable *dropletLayoutAssertion;
  BSInvalidatable *v4;

  dropletLayoutAssertion = self->_dropletLayoutAssertion;
  if (dropletLayoutAssertion)
  {
    -[BSInvalidatable invalidate](dropletLayoutAssertion, "invalidate");
    v4 = self->_dropletLayoutAssertion;
    self->_dropletLayoutAssertion = 0;

  }
}

- (BOOL)_shouldIgnoreDropletAttachment
{
  -[SBHUDViewControlling attachmentIgnoredOrientations](self->_HUDViewController, "attachmentIgnoredOrientations");
  -[SBHUDViewControlling interfaceOrientation](self->_HUDViewController, "interfaceOrientation");
  return BSInterfaceOrientationMaskContainsInterfaceOrientation();
}

- (void)_handleDropletLayoutCallback:(double)a3
{
  _BOOL4 v5;
  SBHUDViewControlling *HUDViewController;
  double v7;
  double v8;
  uint64_t v9;

  v5 = -[_SBHUDModel _shouldIgnoreDropletAttachment](self, "_shouldIgnoreDropletAttachment");
  HUDViewController = self->_HUDViewController;
  if (v5)
  {
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v9 = -[SBHUDViewControlling interfaceOrientation](HUDViewController, "interfaceOrientation");
    v8 = 0.0;
    if ((unint64_t)(v9 - 3) >= 2)
      v7 = a3;
    else
      v7 = 0.0;
    if ((unint64_t)(v9 - 3) < 2)
      v8 = a3;
    HUDViewController = self->_HUDViewController;
  }
  -[SBHUDViewControlling setPositionOffset:](HUDViewController, "setPositionOffset:", v7, v8);
}

- (void)updateAttachmentStateForHUDViewController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = -[SBHUDViewControlling triggerButton](self->_HUDViewController, "triggerButton", a3);
  if (v4)
  {
    if (self->_dropletLayoutAssertion)
    {
      v5 = v4;
      v6 = -[SBHUDViewControlling isHUDAttached](self->_HUDViewController, "isHUDAttached");
      v7 = v6 & ~-[_SBHUDModel _shouldIgnoreDropletAttachment](self, "_shouldIgnoreDropletAttachment");
      -[SBHUDController windowScene](self->_HUDController, "windowScene");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hardwareButtonBezelEffectsCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateHintContentVisibility:forButton:animationSettings:", v7, v5, 0);

    }
  }
}

- (void)hudViewController:(id)a3 willDismissHUD:(id)a4
{
  -[_SBHUDModel setPresented:](self, "setPresented:", 1, a4);
  -[_SBHUDModel setPresenting:](self, "setPresenting:", 0);
  -[_SBHUDModel setDismissing:](self, "setDismissing:", 1);
  -[_SBHUDModel setDismissed:](self, "setDismissed:", 0);
}

- (void)hudViewController:(id)a3 didDismissHUD:(id)a4
{
  -[_SBHUDModel setPresented:](self, "setPresented:", 0, a4);
  -[_SBHUDModel setPresenting:](self, "setPresenting:", 0);
  -[_SBHUDModel setDismissing:](self, "setDismissing:", 0);
  -[_SBHUDModel setDismissed:](self, "setDismissed:", 1);
  -[_SBHUDModel _teardownDropletLayout](self, "_teardownDropletLayout");
}

- (void)hudViewController:(id)a3 willPresentHUD:(id)a4
{
  -[_SBHUDModel _setupDropletLayout](self, "_setupDropletLayout", a3, a4);
  -[_SBHUDModel setPresenting:](self, "setPresenting:", 1);
  -[_SBHUDModel setPresented:](self, "setPresented:", 0);
  -[_SBHUDModel setDismissing:](self, "setDismissing:", 0);
  -[_SBHUDModel setDismissed:](self, "setDismissed:", 0);
}

- (void)hudViewController:(id)a3 didPresentHUD:(id)a4
{
  -[_SBHUDModel setPresenting:](self, "setPresenting:", 0, a4);
  -[_SBHUDModel setPresented:](self, "setPresented:", 1);
  -[_SBHUDModel setDismissing:](self, "setDismissing:", 0);
  -[_SBHUDModel setDismissed:](self, "setDismissed:", 0);
}

- (SBHUDViewControlling)HUDViewController
{
  return self->_HUDViewController;
}

- (SBHUDController)HUDController
{
  return self->_HUDController;
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (double)dismissalInterval
{
  return self->_dismissalInterval;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BSInvalidatable)dropletLayoutAssertion
{
  return self->_dropletLayoutAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropletLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_HUDController, 0);
  objc_storeStrong((id *)&self->_HUDViewController, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
}

@end
