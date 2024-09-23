@implementation _UIApplicationModalProgressController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___UIApplicationModalProgressController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7D5C8 != -1)
    dispatch_once(&qword_1ECD7D5C8, block);
  return (id)_MergedGlobals_1008;
}

+ (id)instanceForScene:(id)a3
{
  id v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  id *v12;
  id v13;
  id WeakRetained;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = &_initializeForIdiom__didInitializeForCarPlay;
  v5 = (id)_progressControllers;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {

    v9 = 0;
LABEL_18:
    if (!*((_QWORD *)v4 + 395))
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v16 = (void *)*((_QWORD *)v4 + 395);
      *((_QWORD *)v4 + 395) = v15;

    }
    v8 = (id *)objc_alloc_init((Class)objc_opt_class());
    objc_storeWeak(v8 + 3, v3);
    objc_msgSend(*((id *)v4 + 395), "addObject:", v8);
    goto LABEL_21;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v5);
      v12 = *(id **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (!v8 && (v13 = objc_loadWeakRetained(v12 + 3), v13, v13 == v3))
      {
        v8 = v12;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained(v12 + 3);

        if (!WeakRetained)
        {
          if (!v9)
            v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v9, "addObject:", v12);
        }
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);

  v4 = &_initializeForIdiom__didInitializeForCarPlay;
  if (!v8)
    goto LABEL_18;
LABEL_21:
  if (objc_msgSend(v9, "count"))
    objc_msgSend(*((id *)v4 + 395), "minusSet:", v9);

  return v8;
}

- (_UIApplicationModalProgressController)init
{
  _UIApplicationModalProgressController *v2;
  int v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIApplicationModalProgressController;
  v2 = -[_UIApplicationModalProgressController init](&v6, sel_init);
  if (v2)
  {
    v3 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_ModelProgressControllerDisplayDelay, (uint64_t)CFSTR("ModelProgressControllerDisplayDelay"));
    v4 = *(double *)&qword_1EDDA7F00;
    if (v3)
      v4 = 2.0;
    v2->_displayDelaySeconds = v4;
  }
  return v2;
}

- (void)_setShowTimer:(id)a3
{
  NSTimer *v5;
  NSTimer *v6;
  NSTimer **p_showTimer;
  NSTimer *showTimer;
  NSTimer *v9;

  v5 = (NSTimer *)a3;
  showTimer = self->_showTimer;
  p_showTimer = &self->_showTimer;
  v6 = showTimer;
  if (showTimer != v5)
  {
    v9 = v5;
    -[NSTimer invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_showTimer, a3);
    v5 = v9;
  }

}

- (void)_setHideTimer:(id)a3
{
  NSTimer *v5;
  NSTimer *v6;
  NSTimer **p_hideTimer;
  NSTimer *hideTimer;
  NSTimer *v9;

  v5 = (NSTimer *)a3;
  hideTimer = self->_hideTimer;
  p_hideTimer = &self->_hideTimer;
  v6 = hideTimer;
  if (hideTimer != v5)
  {
    v9 = v5;
    -[NSTimer invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_hideTimer, a3);
    v5 = v9;
  }

}

- (void)_callAndClearDismissalHandlerWasDismissedByUser:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v6 = _Block_copy(self->_dismissalHandler);
  -[_UIApplicationModalProgressController _setDismissalHandler:](self, "_setDismissalHandler:", 0);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v3);
    v5 = v6;
  }

}

- (void)_reset
{
  void *v3;
  _BOOL8 v4;
  id v5;

  -[UIViewController presentingViewController](self->_alertController, "presentingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && !-[UIViewController isBeingDismissed](self->_alertController, "isBeingDismissed"))
  {
    objc_msgSend(v5, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[_UIApplicationModalProgressController _shouldAnimatePresentationForIdiom:](self, "_shouldAnimatePresentationForIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));

    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v4, 0);
  }
  -[_UIApplicationModalProgressController _setPresented:](self, "_setPresented:", 0);
  -[_UIApplicationModalProgressController _setSourceViewController:](self, "_setSourceViewController:", 0);
  -[UIWindow setHidden:](self->_window, "setHidden:", 1);
  -[_UIApplicationModalProgressController _setShowTimer:](self, "_setShowTimer:", 0);
  -[_UIApplicationModalProgressController _setHideTimer:](self, "_setHideTimer:", 0);
  -[_UIApplicationModalProgressController _setWindow:](self, "_setWindow:", 0);
  -[_UIApplicationModalProgressController _setAlertController:](self, "_setAlertController:", 0);
  -[_UIApplicationModalProgressController _setProgress:](self, "_setProgress:", 0);
  -[_UIApplicationModalProgressController _setPreDisplayTestBlock:](self, "_setPreDisplayTestBlock:", 0);

}

- (void)_hideImmediatelyWasDismissedByUser:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_sourceViewController)
  {
    v3 = a3;
    -[_UIApplicationModalProgressController _reset](self, "_reset");
    -[_UIApplicationModalProgressController _callAndClearDismissalHandlerWasDismissedByUser:](self, "_callAndClearDismissalHandlerWasDismissedByUser:", v3);
  }
}

- (BOOL)_shouldAnimatePresentationForIdiom:(int64_t)a3
{
  return a3 == 6;
}

- (void)_showTimerAction:(id)a3
{
  uint64_t (**preDisplayTestBlock)(void);
  void *v5;
  _BOOL8 v6;

  if (self->_showTimer == a3)
  {
    -[_UIApplicationModalProgressController _setShowTimer:](self, "_setShowTimer:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[_UIApplicationModalProgressController _setDisplayStartTime:](self, "_setDisplayStartTime:");
    preDisplayTestBlock = (uint64_t (**)(void))self->_preDisplayTestBlock;
    if (preDisplayTestBlock && (preDisplayTestBlock[2]() & 1) == 0)
    {
      -[_UIApplicationModalProgressController _reset](self, "_reset");
      -[_UIApplicationModalProgressController _callAndClearDismissalHandlerWasDismissedByUser:](self, "_callAndClearDismissalHandlerWasDismissedByUser:", 0);
    }
    else
    {
      -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
      -[UIViewController traitCollection](self->_sourceViewController, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[_UIApplicationModalProgressController _shouldAnimatePresentationForIdiom:](self, "_shouldAnimatePresentationForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));

      -[UIViewController presentViewController:animated:completion:](self->_sourceViewController, "presentViewController:animated:completion:", self->_alertController, v6, 0);
      self->_presented = 1;
    }
  }
}

- (void)_hideTimerAction:(id)a3
{
  if (self->_hideTimer == a3)
  {
    -[_UIApplicationModalProgressController _setHideTimer:](self, "_setHideTimer:", 0);
    -[_UIApplicationModalProgressController _hideImmediatelyWasDismissedByUser:](self, "_hideImmediatelyWasDismissedByUser:", 0);
  }
}

- (void)_dismissButtonAction:(id)a3
{
  if (!self->_disableButtonAction)
    -[_UIApplicationModalProgressController _hideImmediatelyWasDismissedByUser:](self, "_hideImmediatelyWasDismissedByUser:", 1);
}

- (void)hideAfterMinimumUptimeWithDismissalHandler:(id)a3
{
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_ModelProgressControllerMinimumUptime, (uint64_t)CFSTR("ModelProgressControllerMinimumUptime")) == 0;
  v5 = v10;
  if (v4)
    v6 = *(double *)&qword_1EDDA7F10;
  else
    v6 = 1.0;
  if (self->_sourceViewController)
  {
    if (self->_dismissalHandler != v10)
    {
      -[_UIApplicationModalProgressController _callAndClearDismissalHandlerWasDismissedByUser:](self, "_callAndClearDismissalHandlerWasDismissedByUser:", 0);
      -[_UIApplicationModalProgressController _setDismissalHandler:](self, "_setDismissalHandler:", v10);
      v5 = v10;
    }
    if (!self->_hideTimer)
    {
      -[_UIApplicationModalProgressController _setShowTimer:](self, "_setShowTimer:", 0);
      if (self->_presented
        && (objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"),
            v8 = v7 - self->_displayStartTime,
            v8 < v6))
      {
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__hideTimerAction_, 0, 0, v6 - v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIApplicationModalProgressController _setHideTimer:](self, "_setHideTimer:", v9);

      }
      else
      {
        -[_UIApplicationModalProgressController _hideImmediatelyWasDismissedByUser:](self, "_hideImmediatelyWasDismissedByUser:", 0);
      }
      v5 = v10;
    }
  }

}

- (void)hideAfterDelay:(double)a3 forceCompletion:(BOOL)a4 replacementDismissalHandler:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id dismissalHandler;
  dispatch_time_t v13;
  id v14;
  _QWORD v15[5];
  id v16;

  self->_disableButtonAction = 1;
  v7 = (void *)MEMORY[0x1E0CB38A8];
  v8 = a5;
  objc_msgSend(v7, "discreteProgressWithTotalUnitCount:", 100);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletedUnitCount:", 100);
  WeakRetained = objc_loadWeakRetained((id *)&self->_progressView);
  objc_msgSend(WeakRetained, "setTrackedProgress:", v9);

  v11 = _Block_copy(v8);
  if (!v11)
  {
    v11 = _Block_copy(self->_dismissalHandler);
    dismissalHandler = self->_dismissalHandler;
    self->_dismissalHandler = 0;

  }
  v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100___UIApplicationModalProgressController_hideAfterDelay_forceCompletion_replacementDismissalHandler___block_invoke;
  v15[3] = &unk_1E16B1D18;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  dispatch_after(v13, MEMORY[0x1E0C80D38], v15);

}

- (void)reconfigureWithTitle:(id)a3 message:(id)a4 progress:(id)a5 buttonTitle:(id)a6 dismissalHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  char v21;
  void *v22;
  UIAlertController *alertController;
  void *v24;
  UIAlertController *v25;
  UIViewController *v26;
  void *v27;
  _UIProgressView *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  UIViewController *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[3];
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (self->_sourceViewController)
  {
    -[UIAlertController actions](self->_alertController, "actions");
    v51 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v15);

    v16 = v51;
    v21 = -[NSProgress isEqual:](self->_progress, "isEqual:", v14);
    -[_UIApplicationModalProgressController _setProgress:](self, "_setProgress:", v14);
    if (self->_dismissalHandler != v51)
    {
      -[_UIApplicationModalProgressController _callAndClearDismissalHandlerWasDismissedByUser:](self, "_callAndClearDismissalHandlerWasDismissedByUser:", 0);
      -[_UIApplicationModalProgressController _setDismissalHandler:](self, "_setDismissalHandler:", v51);
    }
    -[UIAlertController setTitle:](self->_alertController, "setTitle:", v12);
    -[UIAlertController setMessage:](self->_alertController, "setMessage:", v13);
    if ((v20 & 1) == 0)
    {
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __108___UIApplicationModalProgressController_reconfigureWithTitle_message_progress_buttonTitle_dismissalHandler___block_invoke;
      v52[3] = &unk_1E16B3EC8;
      v52[4] = self;
      +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, v52);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      alertController = self->_alertController;
      v54[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = alertController;
      v16 = v51;
      -[UIAlertController _setActions:](v25, "_setActions:", v24);

    }
    if ((v21 & 1) == 0)
    {
      v48 = v15;
      -[UIAlertController setContentViewController:](self->_alertController, "setContentViewController:", 0);
      v26 = objc_alloc_init(UIViewController);
      -[UIViewController view](v26, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAlertController setContentViewController:](self->_alertController, "setContentViewController:", v26);
      v49 = v13;
      v50 = v12;
      if (v14 && (objc_msgSend(v14, "isIndeterminate") & 1) == 0)
      {
        v28 = objc_alloc_init(_UIProgressView);
        -[_UIProgressView setTrackedProgress:](v28, "setTrackedProgress:", v14);
        objc_storeWeak((id *)&self->_progressView, v28);
        v30 = 22.0;
      }
      else
      {
        v28 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]([UIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", 100);
        +[UIColor systemGrayColor](UIColor, "systemGrayColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIProgressView setColor:](v28, "setColor:", v29);

        -[_UIProgressView startAnimating](v28, "startAnimating");
        v30 = 0.0;
      }
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v27, "addSubview:", v28);
      -[UIViewController preferredContentSize](v26, "preferredContentSize");
      v32 = v31;
      -[UIView frame](v28, "frame");
      -[UIViewController setPreferredContentSize:](v26, "setPreferredContentSize:", v32, v33 + v33);
      v43 = (void *)MEMORY[0x1E0D156E0];
      -[UIView centerXAnchor](v28, "centerXAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "centerXAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v34;
      -[UIView topAnchor](v28, "topAnchor");
      v47 = v26;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "topAnchor");
      v36 = v27;
      v44 = v27;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, 0.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v38;
      -[UIView bottomAnchor](v28, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -v30);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "activateConstraints:", v42);

      v13 = v49;
      v12 = v50;
      v15 = v48;
      v16 = v51;
    }
  }

}

- (NSString)title
{
  return -[UIViewController title](self->_alertController, "title");
}

- (void)setTitle:(id)a3
{
  -[UIAlertController setTitle:](self->_alertController, "setTitle:", a3);
}

- (NSString)message
{
  return -[UIAlertController message](self->_alertController, "message");
}

- (void)setMessage:(id)a3
{
  -[UIAlertController setMessage:](self->_alertController, "setMessage:", a3);
}

- (void)displayWithTitle:(id)a3 message:(id)a4 progress:(id)a5 buttonTitle:(id)a6 sourceViewController:(id)a7 preDisplayTestBlock:(id)a8 dismissalHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  -[_UIApplicationModalProgressController _setPreDisplayTestBlock:](self, "_setPreDisplayTestBlock:", a8);
  if (self->_sourceViewController)
  {
    -[_UIApplicationModalProgressController _setHideTimer:](self, "_setHideTimer:", 0);
    -[_UIApplicationModalProgressController _callAndClearDismissalHandlerWasDismissedByUser:](self, "_callAndClearDismissalHandlerWasDismissedByUser:", 0);
  }
  else
  {
    if (v18)
    {
      -[_UIApplicationModalProgressController _setSourceViewController:](self, "_setSourceViewController:", v18);
    }
    else
    {
      -[_UIApplicationModalProgressController _defaultSourceViewControllerCreatingWindowIfNeeded](self, "_defaultSourceViewControllerCreatingWindowIfNeeded");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIApplicationModalProgressController _setSourceViewController:](self, "_setSourceViewController:", v20);

    }
    +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", &stru_1E16EDF20, &stru_1E16EDF20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIApplicationModalProgressController _setAlertController:](self, "_setAlertController:", v21);

  }
  if (!self->_showTimer)
  {
    if (self->_presented)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[_UIApplicationModalProgressController _setDisplayStartTime:](self, "_setDisplayStartTime:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__showTimerAction_, 0, 0, self->_displayDelaySeconds);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIApplicationModalProgressController _setShowTimer:](self, "_setShowTimer:", v22);

    }
  }
  -[_UIApplicationModalProgressController reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:](self, "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", v23, v15, v16, v17, v19);

}

- (id)_defaultSourceViewControllerCreatingWindowIfNeeded
{
  void *v3;
  void *v4;

  -[_UIApplicationModalProgressController _createSourceWindow](self, "_createSourceWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIApplicationModalProgressController _setWindow:](self, "_setWindow:", v3);
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_createSourceWindow
{
  void *v2;
  _UIApplicationModalProgressWindow *v3;
  _UIApplicationModalProgressWindow *v4;
  _UIApplicationModalProgressWindow *v5;
  void *v6;
  UIViewController *v7;
  UIView *v8;

  -[_UIApplicationModalProgressController _sourceScene](self, "_sourceScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [_UIApplicationModalProgressWindow alloc];
  v4 = v3;
  if (v2)
  {
    v5 = -[UIWindow initWithWindowScene:](v3, "initWithWindowScene:", v2);
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v5 = -[_UIApplicationModalProgressWindow initWithFrame:](v4, "initWithFrame:");

  }
  v7 = objc_alloc_init(UIViewController);
  v8 = objc_alloc_init(UIView);
  -[UIViewController setView:](v7, "setView:", v8);

  -[UIWindow setRootViewController:](v5, "setRootViewController:", v7);
  return v5;
}

- (id)_sourceScene
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
  }
  else
  {
    objc_msgSend((id)UIApp, "_defaultSceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v4 = v6;
    }
    else
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "windowScene");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (void)displayForDownloadingURL:(id)a3 sourceViewController:(id)a4 completionHandler:(id)a5
{
  -[_UIApplicationModalProgressController displayForDownloadingURL:copyToURL:sourceViewController:completionHandler:](self, "displayForDownloadingURL:copyToURL:sourceViewController:completionHandler:", a3, 0, a4, a5);
}

- (void)displayForDownloadingURL:(id)a3 copyToURL:(id)a4 sourceViewController:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v54;
  void *v55;
  void *v56;
  _QWORD block[4];
  id v58;
  id v59;
  id v60;
  _UIApplicationModalProgressController *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t *v67;
  _QWORD v68[4];
  id v69;
  _UIApplicationModalProgressController *v70;
  id v71;
  uint64_t *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _UIApplicationModalProgressController *v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  _QWORD v81[5];
  _QWORD aBlock[4];
  id v83;
  id v84;
  _QWORD *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  void *(*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _QWORD v93[3];
  char v94;
  id v95;
  id v96;
  id v97[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v97[0] = 0;
  LOBYTE(a6) = objc_msgSend(v9, "getPromisedItemResourceValue:forKey:error:", v97, *MEMORY[0x1E0C99A70], 0);
  v13 = v97[0];
  if ((a6 & 1) == 0)
  {
    objc_msgSend(v9, "lastPathComponent");
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v14;
  }
  v96 = 0;
  v15 = *MEMORY[0x1E0C99998];
  v95 = 0;
  v16 = objc_msgSend(v9, "getPromisedItemResourceValue:forKey:error:", &v96, v15, &v95);
  v17 = v96;
  v18 = v95;
  v51 = v18;
  v52 = v17;
  v50 = v10;
  v56 = v9;
  if (v16)
  {
    v19 = objc_msgSend(v17, "unsignedIntegerValue");
  }
  else
  {
    NSLog(CFSTR("Couldn't get file size for %@: %@"), v9, v18);
    v19 = 0;
  }
  v20 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  v21 = (void *)MEMORY[0x1E0CB3940];
  _UIKitBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Downloading \"%@\"), CFSTR("Downloading a Copy of “%@”"), CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringWithFormat:", v23, v13);
  v24 = objc_claimAutoreleasedReturnValue();

  _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  v94 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__62;
  v91 = __Block_byref_object_dispose__62;
  v26 = MEMORY[0x1E0C809B0];
  v92 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke;
  aBlock[3] = &unk_1E16C2880;
  v85 = v93;
  v49 = v20;
  v83 = v49;
  v27 = v12;
  v84 = v27;
  v86 = &v87;
  v28 = _Block_copy(aBlock);
  v55 = (void *)v24;
  -[_UIApplicationModalProgressController displayWithTitle:message:progress:buttonTitle:sourceViewController:preDisplayTestBlock:dismissalHandler:](self, "displayWithTitle:message:progress:buttonTitle:sourceViewController:preDisplayTestBlock:dismissalHandler:", v24, 0, 0, v25, v11, 0, v28);
  v48 = v11;
  if (v19)
  {
    v81[0] = v26;
    v81[1] = 3221225472;
    v81[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_2;
    v81[3] = &unk_1E16C28A8;
    v81[4] = self;
    objc_msgSend(MEMORY[0x1E0CB38A8], "_addSubscriberForFileURL:withPublishingHandler:", v56, v81);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v19, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v26;
    _UINSLocalizedStringWithDefaultValue(CFSTR("%@ of %@ downloaded"), CFSTR("%@ of %@ downloaded"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", self, "urlProgress.fractionCompleted");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v31;
    v73[1] = 3221225472;
    v73[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_4;
    v73[3] = &unk_1E16C28F8;
    v80 = v19;
    v34 = v32;
    v74 = v34;
    v35 = v30;
    v75 = v35;
    v76 = self;
    v77 = v55;
    v78 = v25;
    v79 = v28;
    objc_msgSend(v33, "addObserverBlock:", v73);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v68[0] = v31;
    v68[1] = 3221225472;
    v68[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_6;
    v68[3] = &unk_1E16C2920;
    v69 = v36;
    v70 = self;
    v71 = v29;
    v72 = &v87;
    v37 = v29;
    v38 = v36;
    v39 = _Block_copy(v68);
    v40 = (void *)v88[5];
    v88[5] = (uint64_t)v39;

    v26 = v31;
  }
  dispatch_get_global_queue(0, 0);
  v41 = objc_claimAutoreleasedReturnValue();
  block[0] = v26;
  block[1] = 3221225472;
  block[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_7;
  block[3] = &unk_1E16C29E0;
  v58 = v50;
  v59 = v49;
  v66 = v93;
  v67 = &v87;
  v60 = v56;
  v61 = self;
  v62 = v55;
  v63 = v25;
  v64 = v28;
  v65 = v27;
  v54 = v27;
  v42 = v28;
  v43 = v25;
  v44 = v55;
  v45 = v56;
  v46 = v49;
  v47 = v50;
  dispatch_async(v41, block);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(v93, 8);

}

- (double)displayDelaySeconds
{
  return self->_displayDelaySeconds;
}

- (void)setDisplayDelaySeconds:(double)a3
{
  self->_displayDelaySeconds = a3;
}

- (BOOL)_isPresented
{
  return self->_presented;
}

- (void)_setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (UIWindow)_window
{
  return self->_window;
}

- (void)_setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (UIViewController)_sourceViewController
{
  return self->_sourceViewController;
}

- (void)_setSourceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewController, a3);
}

- (UIAlertController)_alertController
{
  return self->_alertController;
}

- (void)_setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (id)_dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)_setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)_preDisplaySetBlock
{
  return self->_preDisplayTestBlock;
}

- (void)_setPreDisplayTestBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSProgress)_progress
{
  return self->_progress;
}

- (void)_setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSTimer)_showTimer
{
  return self->_showTimer;
}

- (NSTimer)_hideTimer
{
  return self->_hideTimer;
}

- (double)_displayStartTime
{
  return self->_displayStartTime;
}

- (void)_setDisplayStartTime:(double)a3
{
  self->_displayStartTime = a3;
}

- (NSProgress)urlProgress
{
  return self->_urlProgress;
}

- (void)setUrlProgress:(id)a3
{
  objc_storeStrong((id *)&self->_urlProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlProgress, 0);
  objc_storeStrong((id *)&self->_hideTimer, 0);
  objc_storeStrong((id *)&self->_showTimer, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_preDisplayTestBlock, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_weakScene);
  objc_destroyWeak((id *)&self->_progressView);
}

@end
