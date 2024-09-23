@implementation TKVibrationRecorderContentViewController

- (TKVibrationRecorderContentViewController)initWithVibratorController:(id)a3
{
  id v5;
  TKVibrationRecorderContentViewController *v6;
  TKVibrationRecorderContentViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIBarButtonItem *cancelButton;
  id v12;
  void *v13;
  uint64_t v14;
  UIBarButtonItem *saveButton;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = a3;
  v6 = -[TKVibrationRecorderContentViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vibratorController, a3);
    TLLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderContentViewController setTitle:](v7, "setTitle:", v8);

    -[TKVibrationRecorderContentViewController navigationItem](v7, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, v7, sel__cancelButtonTapped_);
    cancelButton = v7->_cancelButton;
    v7->_cancelButton = (UIBarButtonItem *)v10;

    v12 = objc_alloc(MEMORY[0x24BDF6860]);
    TLLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithTitle:style:target:action:", v13, 2, v7, sel__saveButtonTapped_);
    saveButton = v7->_saveButton;
    v7->_saveButton = (UIBarButtonItem *)v14;

    objc_msgSend(v9, "setLeftBarButtonItem:", v7->_cancelButton);
    objc_msgSend(v9, "setRightBarButtonItem:", v7->_saveButton);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BDF7528];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__handleApplicationDidEnterBackgroundNotification_, v17, v18);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF7528];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  -[TKVibrationRecorderContentViewController _cleanUpVibrationNameAlertController](self, "_cleanUpVibrationNameAlertController");
  v6.receiver = self;
  v6.super_class = (Class)TKVibrationRecorderContentViewController;
  -[TKVibrationRecorderContentViewController dealloc](&v6, sel_dealloc);
}

- (void)_stopRecordingOrPlayingForApplicationSuspension
{
  int mode;
  uint64_t v3;

  mode = self->_mode;
  if (mode == 1)
  {
    v3 = 2;
  }
  else
  {
    if (mode != 2)
      return;
    v3 = 4;
  }
  -[TKVibrationRecorderContentViewController vibrationRecorderView:buttonTappedWithIdentifier:](self, "vibrationRecorderView:buttonTappedWithIdentifier:", self->_vibrationRecorderView, v3);
}

- (void)applicationWillSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderContentViewController;
  -[TKVibrationRecorderContentViewController applicationWillSuspend](&v3, sel_applicationWillSuspend);
  -[TKVibrationRecorderContentViewController _stopRecordingOrPlayingForApplicationSuspension](self, "_stopRecordingOrPlayingForApplicationSuspension");
}

- (void)loadView
{
  TKVibrationRecorderView *v3;
  TKVibrationRecorderView *vibrationRecorderView;

  v3 = -[TKVibrationRecorderView initWithVibrationPatternMaximumDuration:]([TKVibrationRecorderView alloc], "initWithVibrationPatternMaximumDuration:", 10.0);
  vibrationRecorderView = self->_vibrationRecorderView;
  self->_vibrationRecorderView = v3;

  -[TKVibrationRecorderView setDelegate:](self->_vibrationRecorderView, "setDelegate:", self);
  -[TKVibrationRecorderContentViewController setView:](self, "setView:", self->_vibrationRecorderView);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKVibrationRecorderContentViewController;
  -[TKVibrationRecorderContentViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[TKVibrationRecorderContentViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[TKVibrationRecorderContentViewController resignFirstResponder](self, "resignFirstResponder");
  -[TKVibrationRecorderContentViewController _finishedWithRecorder](self, "_finishedWithRecorder");
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderContentViewController;
  -[TKVibrationRecorderContentViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_mode = 0;
  -[UIBarButtonItem setEnabled:](self->_saveButton, "setEnabled:", 0);
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderContentViewController;
  -[TKVibrationRecorderContentViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSDictionary *indefiniteVibrationPattern;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderContentViewController;
  -[TKVibrationRecorderContentViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[TKVibrationRecorderContentViewController _finishedWithRecorder](self, "_finishedWithRecorder");
  indefiniteVibrationPattern = self->_indefiniteVibrationPattern;
  self->_indefiniteVibrationPattern = 0;

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_cancelButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[TKVibrationRecorderContentViewController _finishedWithRecorder](self, "_finishedWithRecorder", a3);
  -[TKVibrationRecorderContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[TKVibrationRecorderContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TKVibrationRecorderContentViewController parentVibrationRecorderViewController](self, "parentVibrationRecorderViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vibrationRecorderViewControllerWasDismissedWithoutSavingRecordedVibrationPattern:", v4);

}

- (void)_saveButtonTapped:(id)a3
{
  id v4;
  TKVibrationRecorderContentViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIAlertController *vibrationNameAlertController;
  void *v10;
  uint64_t v11;
  UITextField *vibrationNameAlertTextField;
  void *v13;
  UIAlertController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIAlertAction *vibrationNameAlertSaveAction;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  TKVibrationRecorderContentViewController *v26;

  v4 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__0;
  v25[4] = __Block_byref_object_dispose__0;
  v5 = self;
  v26 = v5;
  v6 = (void *)MEMORY[0x24BDF67F0];
  TLLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, 0, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  vibrationNameAlertController = v5->_vibrationNameAlertController;
  v5->_vibrationNameAlertController = (UIAlertController *)v8;

  -[UIAlertController addTextFieldWithConfigurationHandler:](v5->_vibrationNameAlertController, "addTextFieldWithConfigurationHandler:", &__block_literal_global_0);
  -[UIAlertController textFields](v5->_vibrationNameAlertController, "textFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = objc_claimAutoreleasedReturnValue();
  vibrationNameAlertTextField = v5->_vibrationNameAlertTextField;
  v5->_vibrationNameAlertTextField = (UITextField *)v11;

  -[UITextField setDelegate:](v5->_vibrationNameAlertTextField, "setDelegate:", v5);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel__vibrationNameTextFieldContentsDidChange_, *MEMORY[0x24BDF7F58], v5->_vibrationNameAlertTextField);

  v14 = v5->_vibrationNameAlertController;
  v15 = (void *)MEMORY[0x24BDF67E8];
  TLLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke_2;
  v24[3] = &unk_24D380160;
  v24[4] = v25;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v14, "addAction:", v18);

  v19 = (void *)MEMORY[0x24BDF67E8];
  TLLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke_3;
  v23[3] = &unk_24D380160;
  v23[4] = v25;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v23);
  v21 = objc_claimAutoreleasedReturnValue();
  vibrationNameAlertSaveAction = v5->_vibrationNameAlertSaveAction;
  v5->_vibrationNameAlertSaveAction = (UIAlertAction *)v21;

  -[UIAlertController addAction:](v5->_vibrationNameAlertController, "addAction:", v5->_vibrationNameAlertSaveAction);
  -[TKVibrationRecorderContentViewController _updateStateSaveButtonInAlert](v5, "_updateStateSaveButtonInAlert");
  -[TKVibrationRecorderContentViewController presentViewController:animated:completion:](v5, "presentViewController:animated:completion:", v5->_vibrationNameAlertController, 1, 0);
  _Block_object_dispose(v25, 8);

}

uint64_t __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TKVibrationInterfaceUtilities configureVibrationNameTextField:](TKVibrationInterfaceUtilities, "configureVibrationNameTextField:", a2);
}

uint64_t __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_cancelButtonInAlertTapped:", a2);
}

uint64_t __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_saveButtonInAlertTapped:", a2);
}

- (void)_saveButtonInAlertTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TKVibrationRecorderContentViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKVibrationRecorderContentViewController parentVibrationRecorderViewController](self, "parentVibrationRecorderViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLVibrationPattern propertyListRepresentation](self->_recordedVibrationPattern, "propertyListRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField text](self->_vibrationNameAlertTextField, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vibrationRecorderViewController:didFinishRecordingVibrationPattern:name:", v5, v6, v7);

  -[TKVibrationRecorderContentViewController _finishedWithRecorder](self, "_finishedWithRecorder");
  -[TKVibrationRecorderContentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[TKVibrationRecorderContentViewController _cleanUpVibrationNameAlertController](self, "_cleanUpVibrationNameAlertController");
}

- (void)_updateStateSaveButtonInAlert
{
  UIAlertAction *vibrationNameAlertSaveAction;
  id v3;

  vibrationNameAlertSaveAction = self->_vibrationNameAlertSaveAction;
  -[UITextField text](self->_vibrationNameAlertTextField, "text");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertAction setEnabled:](vibrationNameAlertSaveAction, "setEnabled:", objc_msgSend(v3, "length") != 0);

}

- (void)_cleanUpVibrationNameAlertController
{
  void *v3;
  UITextField *vibrationNameAlertTextField;
  UIAlertAction *vibrationNameAlertSaveAction;
  UIAlertController *vibrationNameAlertController;

  if (self->_vibrationNameAlertTextField)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7F58], self->_vibrationNameAlertTextField);

    -[UITextField setDelegate:](self->_vibrationNameAlertTextField, "setDelegate:", 0);
    vibrationNameAlertTextField = self->_vibrationNameAlertTextField;
    self->_vibrationNameAlertTextField = 0;

  }
  vibrationNameAlertSaveAction = self->_vibrationNameAlertSaveAction;
  self->_vibrationNameAlertSaveAction = 0;

  vibrationNameAlertController = self->_vibrationNameAlertController;
  self->_vibrationNameAlertController = 0;

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  BOOL v7;

  if (self->_vibrationNameAlertTextField != a3)
    return 1;
  v7 = +[TKVibrationInterfaceUtilities vibrationNameTextField:shouldChangeCharactersInRange:replacementString:](TKVibrationInterfaceUtilities, "vibrationNameTextField:shouldChangeCharactersInRange:replacementString:");
  -[TKVibrationRecorderContentViewController _updateStateSaveButtonInAlert](self, "_updateStateSaveButtonInAlert");
  return v7;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  BOOL v3;
  void *v4;

  if (self->_vibrationNameAlertTextField != a3)
    return 1;
  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

- (id)_indefiniteVibrationPattern
{
  NSDictionary *indefiniteVibrationPattern;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  indefiniteVibrationPattern = self->_indefiniteVibrationPattern;
  if (!indefiniteVibrationPattern)
  {
    objc_msgSend(MEMORY[0x24BEB8CE0], "simpleVibrationPatternWithVibrationDuration:pauseDuration:", 10.0, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyListRepresentation");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_indefiniteVibrationPattern;
    self->_indefiniteVibrationPattern = v5;

    indefiniteVibrationPattern = self->_indefiniteVibrationPattern;
  }
  return indefiniteVibrationPattern;
}

- (void)_startVibratingWithVibrationPattern:(id)a3
{
  id v4;

  v4 = a3;
  -[TKVibrationRecorderContentViewController _stopVibrating](self, "_stopVibrating");
  -[TKVibratorController turnOnWithVibrationPattern:](self->_vibratorController, "turnOnWithVibrationPattern:", v4);

}

- (void)_stopVibrating
{
  -[TKVibratorController turnOff](self->_vibratorController, "turnOff");
}

- (void)_storeVibrationComponentOfTypePause:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  -[TLVibrationPattern appendVibrationComponentWithDuration:isPause:](self->_recordedVibrationPattern, "appendVibrationComponentWithDuration:isPause:", v3, v5 - self->_currentVibrationComponentDidStartTimeStamp);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_currentVibrationComponentDidStartTimeStamp = v6;
  self->_isWaitingForEndOfCurrentVibrationComponent = v3;
}

- (void)_eraseCurrentVibrationComponentDidStartTimeStamp
{
  self->_currentVibrationComponentDidStartTimeStamp = 0.0;
}

- (void)vibrationComponentDidStartForVibrationRecorderView:(id)a3
{
  id v4;
  TLVibrationPattern *v5;
  TLVibrationPattern *recordedVibrationPattern;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  if (self->_mode == 1)
  {
    v9 = v4;
    if (self->_recordedVibrationPattern)
    {
      -[TKVibrationRecorderContentViewController _storeVibrationComponentOfTypePause:](self, "_storeVibrationComponentOfTypePause:", 1);
    }
    else
    {
      v5 = (TLVibrationPattern *)objc_alloc_init(MEMORY[0x24BEB8CE0]);
      recordedVibrationPattern = self->_recordedVibrationPattern;
      self->_recordedVibrationPattern = v5;

      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      self->_currentVibrationComponentDidStartTimeStamp = v7;
      objc_msgSend(v9, "startAnimatingProgress");
    }
    -[TKVibrationRecorderContentViewController _indefiniteVibrationPattern](self, "_indefiniteVibrationPattern");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderContentViewController _startVibratingWithVibrationPattern:](self, "_startVibratingWithVibrationPattern:", v8);

    v4 = v9;
  }

}

- (void)vibrationComponentDidEndForVibrationRecorderView:(id)a3
{
  if (self->_mode == 1)
  {
    -[TKVibrationRecorderContentViewController _storeVibrationComponentOfTypePause:](self, "_storeVibrationComponentOfTypePause:", 0);
    -[TKVibrationRecorderContentViewController _stopVibrating](self, "_stopVibrating");
  }
}

- (void)vibrationRecorderView:(id)a3 buttonTappedWithIdentifier:(int)a4
{
  id v6;
  int mode;
  void *v8;
  _BOOL8 v9;
  TLVibrationPattern *recordedVibrationPattern;
  id v11;

  v6 = a3;
  mode = self->_mode;
  switch(mode)
  {
    case 2:
      if (a4 == 4)
      {
        self->_mode = 0;
        v11 = v6;
        -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", 1);
        -[UIBarButtonItem setEnabled:](self->_saveButton, "setEnabled:", 1);
        -[TKVibrationRecorderContentViewController _stopVibrating](self, "_stopVibrating");
        objc_msgSend(v11, "exitReplayMode");
        -[TKVibrationRecorderContentViewController _accessibilityDidExitReplayMode](self, "_accessibilityDidExitReplayMode");
        goto LABEL_13;
      }
      break;
    case 1:
      v11 = v6;
      -[TKVibrationRecorderContentViewController _stopVibrating](self, "_stopVibrating");
      if (self->_isWaitingForEndOfCurrentVibrationComponent)
        -[TKVibrationRecorderContentViewController vibrationComponentDidEndForVibrationRecorderView:](self, "vibrationComponentDidEndForVibrationRecorderView:", 0);
      -[TKVibrationRecorderContentViewController _eraseCurrentVibrationComponentDidStartTimeStamp](self, "_eraseCurrentVibrationComponentDidStartTimeStamp");
      v9 = self->_recordedVibrationPattern != 0;
      -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", 1);
      -[UIBarButtonItem setEnabled:](self->_saveButton, "setEnabled:", v9);
      self->_mode = 0;
      objc_msgSend(v11, "exitRecordingModeWithPlayButtonEnabled:", v9);
      -[TLVibrationPattern appendVibrationComponentWithDuration:isPause:](self->_recordedVibrationPattern, "appendVibrationComponentWithDuration:isPause:", 1, 0.5);
      -[TKVibrationRecorderContentViewController _accessibilityDidExitRecordingMode](self, "_accessibilityDidExitRecordingMode");
      goto LABEL_13;
    case 0:
      if (a4 == 1)
      {
        self->_mode = 1;
        recordedVibrationPattern = self->_recordedVibrationPattern;
        self->_recordedVibrationPattern = 0;
        v11 = v6;

        -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", 0);
        -[UIBarButtonItem setEnabled:](self->_saveButton, "setEnabled:", 0);
        objc_msgSend(v11, "enterRecordingMode");
        -[TKVibrationRecorderContentViewController _accessibilityDidEnterRecordingMode](self, "_accessibilityDidEnterRecordingMode");
        goto LABEL_13;
      }
      if (a4 == 3)
      {
        self->_mode = 2;
        v11 = v6;
        -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", 0);
        -[UIBarButtonItem setEnabled:](self->_saveButton, "setEnabled:", 0);
        objc_msgSend(v11, "enterReplayModeWithVibrationPattern:", self->_recordedVibrationPattern);
        -[TLVibrationPattern propertyListRepresentation](self->_recordedVibrationPattern, "propertyListRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKVibrationRecorderContentViewController _startVibratingWithVibrationPattern:](self, "_startVibratingWithVibrationPattern:", v8);

        -[TKVibrationRecorderContentViewController _accessibilityDidEnterReplayMode](self, "_accessibilityDidEnterReplayMode");
LABEL_13:
        v6 = v11;
      }
      break;
  }

}

- (void)vibrationRecorderViewDidFinishReplayingVibration:(id)a3
{
  self->_mode = 0;
  -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", 1);
  -[UIBarButtonItem setEnabled:](self->_saveButton, "setEnabled:", 1);
  -[TKVibrationRecorderContentViewController _accessibilityDidExitReplayMode](self, "_accessibilityDidExitReplayMode");
}

- (BOOL)vibrationRecorderViewDidEnterRecordingMode:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (self->_mode || self->_recordedVibrationPattern)
  {
    v5 = 0;
  }
  else
  {
    v5 = 1;
    -[TKVibrationRecorderContentViewController vibrationRecorderView:buttonTappedWithIdentifier:](self, "vibrationRecorderView:buttonTappedWithIdentifier:", v4, 1);
  }

  return v5;
}

- (void)vibrationRecorderView:(id)a3 didExitRecordingModeWithContextObject:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[TLVibrationPattern contextObject](self->_recordedVibrationPattern, "contextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[TLVibrationPattern setContextObject:](self->_recordedVibrationPattern, "setContextObject:", v6);

}

- (void)vibrationRecorderViewDidReachVibrationRecordingMaximumDuration:(id)a3
{
  if (self->_mode == 1)
    -[TKVibrationRecorderContentViewController vibrationRecorderView:buttonTappedWithIdentifier:](self, "vibrationRecorderView:buttonTappedWithIdentifier:", a3, 2);
}

- (void)_finishedWithRecorder
{
  TLVibrationPattern *recordedVibrationPattern;

  -[TKVibrationRecorderView stopAnimatingProgress](self->_vibrationRecorderView, "stopAnimatingProgress");
  recordedVibrationPattern = self->_recordedVibrationPattern;
  self->_recordedVibrationPattern = 0;

  -[TKVibrationRecorderContentViewController _stopVibrating](self, "_stopVibrating");
}

- (void)_accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:(id)a3
{
  UIAccessibilityNotifications v3;
  id v4;
  id argument;

  v3 = *MEMORY[0x24BDF72C8];
  v4 = a3;
  UIAccessibilityPostNotification(v3, 0);
  TLLocalizedString();
  argument = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
}

- (void)_accessibilityDidEnterRecordingMode
{
  -[TKVibrationRecorderContentViewController _accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:](self, "_accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:", CFSTR("VIBRATION_RECORDER_DID_ENTER_RECORDING_MODE_ANNOUNCEMENT"));
}

- (void)_accessibilityDidExitRecordingMode
{
  -[TKVibrationRecorderContentViewController _accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:](self, "_accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:", CFSTR("VIBRATION_RECORDER_DID_EXIT_RECORDING_MODE_ANNOUNCEMENT"));
}

- (void)_accessibilityDidEnterReplayMode
{
  -[TKVibrationRecorderContentViewController _accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:](self, "_accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:", CFSTR("VIBRATION_RECORDER_DID_ENTER_REPLAY_MODE_ANNOUNCEMENT"));
}

- (void)_accessibilityDidExitReplayMode
{
  -[TKVibrationRecorderContentViewController _accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:](self, "_accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:", CFSTR("VIBRATION_RECORDER_DID_EXIT_REPLAY_MODE_ANNOUNCEMENT"));
}

- (TKVibrationRecorderViewControllerDelegate)delegate
{
  return (TKVibrationRecorderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TKVibrationRecorderViewController)parentVibrationRecorderViewController
{
  return (TKVibrationRecorderViewController *)objc_loadWeakRetained((id *)&self->_parentVibrationRecorderViewController);
}

- (void)setParentVibrationRecorderViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentVibrationRecorderViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentVibrationRecorderViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indefiniteVibrationPattern, 0);
  objc_storeStrong((id *)&self->_vibratorController, 0);
  objc_storeStrong((id *)&self->_vibrationNameAlertTextField, 0);
  objc_storeStrong((id *)&self->_vibrationNameAlertSaveAction, 0);
  objc_storeStrong((id *)&self->_vibrationNameAlertController, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_recordedVibrationPattern, 0);
  objc_storeStrong((id *)&self->_vibrationRecorderView, 0);
}

@end
