@implementation NCNotificationShortLookViewController

- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationShortLookViewController;
  v4 = -[NCNotificationViewController _initWithNotificationRequest:revealingAdditionalContentOnPresentation:](&v7, sel__initWithNotificationRequest_revealingAdditionalContentOnPresentation_, a3, a4);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "_setupCustomContentProvider");
  return v5;
}

- (BOOL)isShortLook
{
  return 1;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController setMaterialGroupNameBase:](&v6, sel_setMaterialGroupNameBase_, a3);
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController materialGroupNameBase](self, "materialGroupNameBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaterialGroupNameBase:", v5);

}

- (BOOL)hasCommittedToPresentingCustomContentProvidingViewController
{
  if (-[NCNotificationShortLookViewController _isPresentingCustomContentProvidingViewController](self, "_isPresentingCustomContentProvidingViewController"))
  {
    return 1;
  }
  else
  {
    return -[PLClickPresentationInteractionManager hasCommittedToPresentation](self->_clickPresentationInteractionManager, "hasCommittedToPresentation");
  }
}

- (BOOL)isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController
{
  void *v3;
  char v4;

  if (!-[NCNotificationShortLookViewController hasCommittedToPresentingCustomContentProvidingViewController](self, "hasCommittedToPresentingCustomContentProvidingViewController"))return 1;
  -[NCNotificationShortLookViewController _presentedViewController](self, "_presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBeingDismissed");

  return v4;
}

- (BOOL)didForwardNotificationRequestToCustomContent:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  NCExpandedPlatterViewController *expandedPlatterViewController;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[NCNotificationViewController _customContentProvidingViewController](self, "_customContentProvidingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)NCNotificationShortLookViewController;
    v6 = -[NCNotificationViewController didForwardNotificationRequestToCustomContent:](&v11, sel_didForwardNotificationRequestToCustomContent_, v4);
  }
  else
  {
    expandedPlatterViewController = self->_expandedPlatterViewController;
    if (expandedPlatterViewController)
    {
      -[NCExpandedPlatterViewController customContentViewController](expandedPlatterViewController, "customContentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "didReceiveNotificationRequest:", v4);

      goto LABEL_6;
    }
    v6 = -[NCNotificationViewController didForwardNotificationRequestToCustomContent:](self->_longLookNotificationViewController, "didForwardNotificationRequestToCustomContent:", v4);
  }
  v7 = v6;
LABEL_6:

  return v7;
}

- (BOOL)dismissPresentedViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[NCNotificationShortLookViewController _isPresentingCustomContentProvidingViewController](self, "_isPresentingCustomContentProvidingViewController");
  if (v5)
    -[NCNotificationViewController _executeNilAction:](self, "_executeNilAction:", v3);
  return v5;
}

- (BOOL)isContentExtensionVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[NCExpandedPlatterViewController customContentViewController](self->_expandedPlatterViewController, "customContentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NCNotificationViewController _customContentProvidingViewController](self->_longLookNotificationViewController, "_customContentProvidingViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "contentExtensionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v9, "isEqualToString:", v4);

  return v10;
}

- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController setCustomContentHomeAffordanceVisible:](&v4, sel_setCustomContentHomeAffordanceVisible_, a3);
  -[NCNotificationLongLookViewController setCustomContentHomeAffordanceVisible:](self->_longLookNotificationViewController, "setCustomContentHomeAffordanceVisible:", -[NCNotificationViewController isCustomContentHomeAffordanceVisible](self, "isCustomContentHomeAffordanceVisible"));
}

- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationShortLookViewController;
  v4 = a3;
  -[NCNotificationViewController setCustomContentHomeAffordanceGestureRecognizer:](&v5, sel_setCustomContentHomeAffordanceGestureRecognizer_, v4);
  -[NCNotificationLongLookViewController setCustomContentHomeAffordanceGestureRecognizer:](self->_longLookNotificationViewController, "setCustomContentHomeAffordanceGestureRecognizer:", v4, v5.receiver, v5.super_class);

}

- (void)setNotificationContentViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setNotificationContentViewHidden:", v3);
    v4 = v5;
  }

}

- (BOOL)isNotificationContentViewHidden
{
  void *v2;
  void *v3;
  char v4;

  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isNotificationContentViewHidden");
  else
    v4 = 0;

  return v4;
}

- (void)setHasShadow:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[NCNotificationViewController hasShadow](self, "hasShadow");
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController setHasShadow:](&v6, sel_setHasShadow_, v3);
  if (v5 != -[NCNotificationViewController hasShadow](self, "hasShadow"))
    -[NCNotificationShortLookViewController _updateShortLookShadow](self, "_updateShortLookShadow");
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backgroundMaterialView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setContentReplacedWithSnapshot:", v3);
      v9.receiver = self;
      v9.super_class = (Class)NCNotificationShortLookViewController;
      -[NCNotificationViewController setContentReplacedWithSnapshot:](&v9, sel_setContentReplacedWithSnapshot_, objc_msgSend(v8, "isContentReplacedWithSnapshot"));
    }

  }
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[NCNotificationShortLookViewController _isPresentingCustomContentProvidingViewController](self, "_isPresentingCustomContentProvidingViewController"))
  {
    -[NCNotificationShortLookViewController _presentedViewController](self, "_presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canBecomeFirstResponder");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationShortLookViewController;
    return -[NCNotificationShortLookViewController canBecomeFirstResponder](&v6, sel_canBecomeFirstResponder);
  }
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[NCNotificationShortLookViewController _isPresentingCustomContentProvidingViewController](self, "_isPresentingCustomContentProvidingViewController"))
  {
    -[NCNotificationShortLookViewController _presentedViewController](self, "_presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "becomeFirstResponder");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationShortLookViewController;
    return -[NCNotificationShortLookViewController becomeFirstResponder](&v6, sel_becomeFirstResponder);
  }
}

- (BOOL)canResignFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[NCNotificationShortLookViewController _isPresentingCustomContentProvidingViewController](self, "_isPresentingCustomContentProvidingViewController"))
  {
    -[NCNotificationShortLookViewController _presentedViewController](self, "_presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canResignFirstResponder");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationShortLookViewController;
    return -[NCNotificationShortLookViewController canResignFirstResponder](&v6, sel_canResignFirstResponder);
  }
}

- (BOOL)resignFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[NCNotificationShortLookViewController _isPresentingCustomContentProvidingViewController](self, "_isPresentingCustomContentProvidingViewController"))
  {
    -[NCNotificationShortLookViewController _presentedViewController](self, "_presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "resignFirstResponder");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationShortLookViewController;
    return -[NCNotificationShortLookViewController resignFirstResponder](&v6, sel_resignFirstResponder);
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  -[NCNotificationShortLookViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_lookViewWrapper, "setFrame:", v5, v7, v9, v11);
  -[UIView bounds](self->_lookViewWrapper, "bounds");
  PLSetViewFrameMaintainingTransform();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[NCNotificationShortLookViewController _intelligenceLightAnimationIfNeeded](self, "_intelligenceLightAnimationIfNeeded");
  if (-[NCNotificationViewController _canPan](self, "_canPan"))
    objc_msgSend((id)objc_opt_class(), "_prepareSharedNotificationFeedbackGenerator");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  if (-[NCNotificationShortLookViewController _isPresentingCustomContentProvidingViewController](self, "_isPresentingCustomContentProvidingViewController"))
  {
    -[NCNotificationShortLookViewController dismissPresentedViewControllerAnimated:](self, "dismissPresentedViewControllerAnimated:", v3);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldCommitToExpandedPlatterPresentationWithFeedback
{
  void *v3;
  void *v4;

  -[NCNotificationShortLookViewController containerViewForExpandedContent](self, "containerViewForExpandedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      -[NCNotificationShortLookViewController shouldCommitToExpandedPlatterPresentationWithFeedback].cold.1(v4, self);
  }
  return v3 != 0;
}

- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  int64_t v20;
  BOOL v21;
  _QWORD aBlock[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v6 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "un_logDigest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NCStringFromLongLookPresentationTrigger(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "Asked to present long look for request %{public}@ for trigger %{public}@", buf, 0x16u);

  }
  self->_trigger = a4;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__NCNotificationShortLookViewController_presentLongLookAnimated_trigger_completion___block_invoke;
  aBlock[3] = &unk_1E8D1F978;
  v16 = v8;
  aBlock[4] = self;
  v23 = v16;
  v17 = _Block_copy(aBlock);
  if (-[NCNotificationShortLookViewController _isLockedByAppProtection](self, "_isLockedByAppProtection"))
  {
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __84__NCNotificationShortLookViewController_presentLongLookAnimated_trigger_completion___block_invoke_2;
    v18[3] = &unk_1E8D1F9A0;
    v21 = v6;
    v18[4] = self;
    v20 = a4;
    v19 = v17;
    -[NCNotificationShortLookViewController _requestAppProtectionUnlockWithCompletion:](self, "_requestAppProtectionUnlockWithCompletion:", v18);

  }
  else
  {
    -[NCNotificationShortLookViewController _presentLongLookAnimated:trigger:completion:](self, "_presentLongLookAnimated:trigger:completion:", v6, a4, v17);
  }

}

uint64_t __84__NCNotificationShortLookViewController_presentLongLookAnimated_trigger_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1208) = 0;
  return result;
}

uint64_t __84__NCNotificationShortLookViewController_presentLongLookAnimated_trigger_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_presentLongLookAnimated:trigger:completion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5
{
  if (a4 == 6)
    -[NCNotificationShortLookViewController _presentLongLookForScrollAnimated:completion:](self, "_presentLongLookForScrollAnimated:completion:", a3, a5);
  else
    -[NCNotificationShortLookViewController _presentLongLookViaInteractionManager:](self, "_presentLongLookViaInteractionManager:", a5);
}

- (void)_requestAppProtectionUnlockWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v6, "un_logDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "Requesting AppProtection authentication for %@ in %@", buf, 0x16u);

  }
  -[NCNotificationShortLookViewController setNotificationContentViewHidden:](self, "setNotificationContentViewHidden:", 1);
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0CF9690], "sharedGuard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke;
  v15[3] = &unk_1E8D1F9C8;
  v13 = v6;
  v16 = v13;
  objc_copyWeak(&v18, (id *)buf);
  v14 = v4;
  v17 = v14;
  objc_msgSend(v12, "authenticateForSubject:completion:", v8, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x1E0DC5F70];
  v7 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "AppProtection authentication result for %@: %@", buf, 0x16u);

  }
  if (v5)
  {
    v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke_cold_1(a1, v12, v5);
  }
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v13 = *(id *)(a1 + 40);
  v15 = a2;
  BSDispatchMain();

  objc_destroyWeak(&v14);
}

uint64_t __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke_37(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setNotificationContentViewHidden:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)expandAndPlayMedia
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__NCNotificationShortLookViewController_expandAndPlayMedia__block_invoke;
  v2[3] = &unk_1E8D1CDC0;
  v2[4] = self;
  -[NCNotificationShortLookViewController presentLongLookAnimated:trigger:completion:](self, "presentLongLookAnimated:trigger:completion:", 1, 5, v2);
}

uint64_t __59__NCNotificationShortLookViewController_expandAndPlayMedia__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1128), "playMedia");
  return result;
}

- (BOOL)shouldRestorePresentingShortLookOnDismiss
{
  return self->_expandedPlatterViewController
      || -[NCNotificationViewController _shouldRestorePresentingShortLookOnDismiss](self->_longLookNotificationViewController, "_shouldRestorePresentingShortLookOnDismiss");
}

- (void)setInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v6 = CFSTR("ENABLED");
    else
      v6 = CFSTR("DISABLED");
    v7 = v5;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v6;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "Setting tap interaction %@ for notification cell for request %{public}@", buf, 0x16u);

  }
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController setInteractionEnabled:](&v11, sel_setInteractionEnabled_, v3);
  -[UITapGestureRecognizer setEnabled:](self->_tapGesture, "setEnabled:", v3);
}

- (void)setPlatterHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (id)containerViewForExpandedContent
{
  UIView *containerViewForExpandedContent;
  void *v4;
  void *v5;
  NSMutableArray *containerViewProviders;
  NSMutableArray *v7;
  NSMutableArray *v8;
  UIView *v9;
  UIView *v10;
  void *v11;

  containerViewForExpandedContent = self->_containerViewForExpandedContent;
  if (!containerViewForExpandedContent)
  {
    -[NCNotificationViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "notificationViewControllerContainerViewProviderForExpandedContent:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        containerViewProviders = self->_containerViewProviders;
        if (!containerViewProviders)
        {
          v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v8 = self->_containerViewProviders;
          self->_containerViewProviders = v7;

          containerViewProviders = self->_containerViewProviders;
        }
        -[NSMutableArray addObject:](containerViewProviders, "addObject:", v5);
        objc_msgSend(v5, "containerView");
        v9 = (UIView *)objc_claimAutoreleasedReturnValue();
        v10 = self->_containerViewForExpandedContent;
        self->_containerViewForExpandedContent = v9;

      }
      else
      {
        v11 = (void *)*MEMORY[0x1E0DC5F70];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
          -[NCNotificationShortLookViewController containerViewForExpandedContent].cold.1((uint64_t)v4, v11, self);
      }

    }
    containerViewForExpandedContent = self->_containerViewForExpandedContent;
  }
  return containerViewForExpandedContent;
}

- (id)backgroundMaterialView
{
  NCNotificationLookView *lookView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    lookView = self->super._lookView;
  else
    lookView = 0;
  return lookView;
}

- (id)presentedExpandedPlatterViewController
{
  void *expandedPlatterViewController;

  expandedPlatterViewController = self->_expandedPlatterViewController;
  if (!expandedPlatterViewController)
    expandedPlatterViewController = self->_longLookNotificationViewController;
  return expandedPlatterViewController;
}

- (BOOL)_setNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  NCNotificationLongLookViewController *longLookNotificationViewController;
  void *v9;
  NCExpandedPlatterViewController *expandedPlatterViewController;
  void *v11;
  NCNotificationLongLookViewController *v12;
  objc_super v14;

  v4 = a3;
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "matchesRequest:", v5);

  v14.receiver = self;
  v14.super_class = (Class)NCNotificationShortLookViewController;
  v7 = -[NCNotificationViewController _setNotificationRequest:](&v14, sel__setNotificationRequest_, v4);

  if (v7)
  {
    if (v6)
    {
      longLookNotificationViewController = self->_longLookNotificationViewController;
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationLongLookViewController setNotificationRequest:](longLookNotificationViewController, "setNotificationRequest:", v9);

      expandedPlatterViewController = self->_expandedPlatterViewController;
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCExpandedPlatterViewController setNotificationRequest:](expandedPlatterViewController, "setNotificationRequest:", v11);
    }
    else
    {
      -[NCNotificationViewController _setCustomContentProvidingViewController:](self, "_setCustomContentProvidingViewController:", 0);
      v12 = self->_longLookNotificationViewController;
      self->_longLookNotificationViewController = 0;

      v11 = self->_expandedPlatterViewController;
      self->_expandedPlatterViewController = 0;
    }

    -[NCNotificationShortLookViewController _updateScreenCaptureProhibited](self, "_updateScreenCaptureProhibited");
  }
  return v7;
}

- (id)_newClickPresentationInteractionManager
{
  void *v3;
  void *v4;

  -[NCNotificationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v3, "notificationViewControllerShouldSupportClickPresentationInteraction:", self))
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3A8]), "initWithPresentingViewController:delegate:", self, self);
  }

  return v4;
}

- (id)_presentedViewController
{
  NCExpandedPlatterViewController *expandedPlatterViewController;
  NCExpandedPlatterViewController *v3;
  NCNotificationLongLookViewController *v5;
  NCNotificationLongLookViewController *longLookNotificationViewController;

  expandedPlatterViewController = self->_expandedPlatterViewController;
  if (expandedPlatterViewController)
  {
    v3 = expandedPlatterViewController;
  }
  else
  {
    -[PLClickPresentationInteractionManager presentedViewController](self->_clickPresentationInteractionManager, "presentedViewController");
    v5 = (NCNotificationLongLookViewController *)objc_claimAutoreleasedReturnValue();
    longLookNotificationViewController = v5;
    if (!v5)
      longLookNotificationViewController = self->_longLookNotificationViewController;
    v3 = longLookNotificationViewController;

  }
  return v3;
}

- (BOOL)_isPresentingCustomContentProvidingViewController
{
  BOOL v2;
  void *v4;
  void *v5;

  if (self->_didScrollPresentLongLookViewController || self->_expandedPlatterPresentationState)
    return 1;
  -[NCNotificationShortLookViewController _presentedViewController](self, "_presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5 != 0;

  return v2;
}

- (void)_loadLookView
{
  NCNotificationLookView **p_lookView;
  void *v4;
  __objc2_class **v5;
  id v6;
  NCNotificationLookView *v7;
  void *v8;
  double v9;
  UIView *v10;
  UIView *lookViewWrapper;

  p_lookView = &self->super._lookView;
  if (!self->super._lookView)
  {
    -[NCNotificationViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = off_1E8D1A088;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v4, "isRichNotificationContentViewForNotificationViewController:", self))
    {
      v5 = off_1E8D1A050;
    }
    v6 = objc_alloc_init(*v5);
    objc_msgSend(v6, "setDelegate:", self);
    objc_storeStrong((id *)p_lookView, v6);
    v7 = *p_lookView;
    -[NCNotificationViewController backgroundAlpha](self, "backgroundAlpha");
    -[NCNotificationLookView setBackgroundAlpha:](v7, "setBackgroundAlpha:");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v4, "notificationViewControllerShouldAllowDragInteraction:", self))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", self);
      objc_msgSend(v8, "_setAllowsPointerDragBeforeLiftDelay:", 0);
      _UIDragInteractionDefaultPointerLiftDelay();
      objc_msgSend(v8, "_setPointerLiftDelay:", v9 + v9);
      -[NCNotificationLookView addInteraction:](*p_lookView, "addInteraction:", v8);
      -[NCNotificationLookView setUserInteractionEnabled:](*p_lookView, "setUserInteractionEnabled:", 1);

    }
    -[NCNotificationShortLookViewController _updateScreenCaptureProhibited](self, "_updateScreenCaptureProhibited");

  }
  if (!self->_lookViewWrapper)
  {
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    lookViewWrapper = self->_lookViewWrapper;
    self->_lookViewWrapper = v10;

  }
}

- (BOOL)_shouldSupportExpandedPlatterInteraction
{
  void *v3;
  char v4;

  -[NCNotificationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "notificationViewControllerShouldSupportExpandedPlatterInteraction:", self);
  else
    v4 = 1;

  return v4;
}

- (id)_interactionManagerCreatingIfNecessary
{
  PLExpandedPlatterInteractionManager *interactionManager;
  PLExpandedPlatterInteractionManager *v4;
  PLExpandedPlatterInteractionManager *v5;

  interactionManager = self->_interactionManager;
  if (!interactionManager)
  {
    v4 = (PLExpandedPlatterInteractionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3B0]), "initWithPresentingViewController:delegate:", self, self);
    v5 = self->_interactionManager;
    self->_interactionManager = v4;

    interactionManager = self->_interactionManager;
  }
  return interactionManager;
}

- (void)_notificationViewControllerViewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *tapGesture;
  void *v10;
  void *v11;
  uint64_t v12;
  UIPointerInteraction *v13;
  UIPointerInteraction *pointerInteraction;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController _notificationViewControllerViewDidLoad](&v16, sel__notificationViewControllerViewDidLoad);
  if (-[NCNotificationShortLookViewController _shouldSupportExpandedPlatterInteraction](self, "_shouldSupportExpandedPlatterInteraction"))
  {
    v3 = -[NCNotificationShortLookViewController _interactionManagerCreatingIfNecessary](self, "_interactionManagerCreatingIfNecessary");
  }
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationShortLookViewController setHasShadow:](self, "setHasShadow:", -[NCNotificationViewController _canPan](self, "_canPan"));
  -[NCNotificationShortLookViewController _updateShortLookShadow](self, "_updateShortLookShadow");
  -[NCNotificationViewController materialGroupNameBase](self, "materialGroupNameBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaterialGroupNameBase:", v5);

  objc_msgSend(v4, "setMaterialRecipe:", -[NCNotificationViewController materialRecipe](self, "materialRecipe"));
  -[UIView addSubview:](self->_lookViewWrapper, "addSubview:", v4);
  -[NCNotificationShortLookViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_lookViewWrapper);

  -[NCNotificationViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v7, "notificationViewControllerShouldInterpretTapAsDefaultAction:", self))
  {
    v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapOnView_);
    tapGesture = self->_tapGesture;
    self->_tapGesture = v8;

    -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", self);
    objc_msgSend(v4, "addGestureRecognizer:", self->_tapGesture);
    -[UITapGestureRecognizer setEnabled:](self->_tapGesture, "setEnabled:", -[NCNotificationViewController isInteractionEnabled](self, "isInteractionEnabled"));
    -[PLClickPresentationInteractionManager gestureRecognizerForExclusionRelationship](self->_clickPresentationInteractionManager, "gestureRecognizerForExclusionRelationship");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_tapGesture, "requireGestureRecognizerToFail:", v10);

  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 1)
  {
    v13 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
    pointerInteraction = self->_pointerInteraction;
    self->_pointerInteraction = v13;

    objc_msgSend(v4, "addInteraction:", self->_pointerInteraction);
    objc_msgSend(v4, "backgroundMaterialView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_cornerRadius");
    objc_msgSend(v4, "_setCornerRadius:");

  }
}

- (void)_updateLookView:(id)a3 withTitleFromProvidedStaticContent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (void)_handleTapOnView:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") != 3)
    goto LABEL_11;
  -[NSDate timeIntervalSinceNow](self->_tapBeginTime, "timeIntervalSinceNow");
  if (v5 < 0.0)
    v5 = -v5;
  if (v5 < 0.3)
  {
    -[NCNotificationViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v6, "handleTapOnNotificationViewController:", self) & 1) == 0)
    {
      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortLookDefaultActionInvokedWithTrigger:forNotificationRequest:withState:", 0, v8, v9);

      -[NCNotificationViewController staticContentProvider](self, "staticContentProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)*MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          -[NCNotificationViewController notificationRequest](self, "notificationRequest");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "notificationIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "un_logDigest");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543362;
          v27 = v16;
          _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "Notification cell tap performing default action for request %{public}@", (uint8_t *)&v26, 0xCu);

        }
        -[NCNotificationViewController _executeDefaultAction:](self, "_executeDefaultAction:", 1);
      }
      else
      {
        -[NCNotificationViewController notificationRequest](self, "notificationRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "options");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "revealsAdditionalContentIfNoDefaultAction");

        if (v20)
        {
          v21 = (void *)*MEMORY[0x1E0DC5F90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
          {
            v22 = v21;
            -[NCNotificationViewController notificationRequest](self, "notificationRequest");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "notificationIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "un_logDigest");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 138543362;
            v27 = v25;
            _os_log_impl(&dword_1CFC3D000, v22, OS_LOG_TYPE_DEFAULT, "Notification cell tap presenting long look for request %{public}@", (uint8_t *)&v26, 0xCu);

          }
          -[NCNotificationShortLookViewController presentLongLookAnimated:trigger:completion:](self, "presentLongLookAnimated:trigger:completion:", 1, 4, 0);
        }
      }
    }

  }
  else
  {
LABEL_11:
    v17 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationShortLookViewController _handleTapOnView:].cold.1(v17, self, v4);
  }

}

- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent
{
  id v3;
  void *v4;
  NSString *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationShortLookViewController;
  v3 = -[NCNotificationViewController _maximumNumberOfPrimaryTextLinesForProvidedStaticContent](&v8, sel__maximumNumberOfPrimaryTextLinesForProvidedStaticContent);
  -[NCNotificationShortLookViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = -[NCNotificationShortLookViewController _maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:isPrimary:isLarge:](self, "_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:isPrimary:isLarge:", v3, 1, UIContentSizeCategoryIsAccessibilityCategory(v5));

  return v6;
}

- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent
{
  id v3;
  void *v4;
  NSString *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationShortLookViewController;
  v3 = -[NCNotificationViewController _maximumNumberOfSecondaryTextLinesForProvidedStaticContent](&v8, sel__maximumNumberOfSecondaryTextLinesForProvidedStaticContent);
  -[NCNotificationShortLookViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = -[NCNotificationShortLookViewController _maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:isPrimary:isLarge:](self, "_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:isPrimary:isLarge:", v3, 0, UIContentSizeCategoryIsAccessibilityCategory(v5));

  return v6;
}

- (unint64_t)_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:(unint64_t)a3 isPrimary:(BOOL)a4 isLarge:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t v14;

  v5 = a5;
  -[NCNotificationViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController staticContentProvider](self, "staticContentProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isNumberOfLinesInfinite");

  if (v11)
    v12 = 0;
  else
    v12 = a3;
  if ((v11 & 1) == 0 && !a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_msgSend(v9, "showAdditionalMessageLinesForNotificationViewController:", self);
      v14 = 4;
      if (v5)
        v14 = 6;
      if (v13)
        v12 = v14;
      else
        v12 = a3;
    }
    else
    {
      v12 = a3;
    }
  }

  return v12;
}

- (void)_updateWithProvidedStaticContent
{
  void *v3;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController _updateWithProvidedStaticContent](&v11, sel__updateWithProvidedStaticContent);
  -[NCNotificationViewController _lookViewIfLoaded](self, "_lookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      -[NCNotificationViewController staticContentProvider](self, "staticContentProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[NCNotificationViewController staticContentProvider](self, "staticContentProvider");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationShortLookViewController _updateThumbnailForRichContentForShortLookView:withContentProvider:](self, "_updateThumbnailForRichContentForShortLookView:withContentProvider:", v4, v7);
        if ((objc_msgSend(v7, "isIconVisible") & 1) == 0)
          objc_msgSend(v4, "setBadgedIconView:", 0);

      }
    }
  }
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NCNotificationViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v9, "shouldAlignContentToBottomForNotificationViewController:", self);
    else
      v10 = 0;
    objc_msgSend(v8, "setAlignContentToBottom:", v10);

  }
}

- (void)_updateThumbnailForRichContentForShortLookView:(id)a3 withContentProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[NCNotificationViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "isRichNotificationContentViewForNotificationViewController:", self) ^ 1;
  else
    v9 = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v8, "isAttachmentImageFeaturedForNotificationViewController:", self);
  else
    v10 = 0;
  objc_msgSend(v6, "setAttachmentImageFeatured:", v10);
  if (((objc_msgSend(v7, "hasAttachmentImage") ^ 1 | v9) & 1) == 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __108__NCNotificationShortLookViewController__updateThumbnailForRichContentForShortLookView_withContentProvider___block_invoke;
    v11[3] = &unk_1E8D1CAB0;
    v12 = v6;
    objc_msgSend(v7, "fetchRichAttachmentImageIsFeatured:withCompletion:", v10, v11);

  }
}

uint64_t __108__NCNotificationShortLookViewController__updateThumbnailForRichContentForShortLookView_withContentProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setThumbnail:", a2);
}

- (void)_updateWithProvidedAuxiliaryOptionsContent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController _updateWithProvidedAuxiliaryOptionsContent](&v19, sel__updateWithProvidedAuxiliaryOptionsContent);
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationViewController auxiliaryOptionsContentProvider](self, "auxiliaryOptionsContentProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_7;
    -[NCNotificationViewController auxiliaryOptionsContentProvider](self, "auxiliaryOptionsContentProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      goto LABEL_7;
    -[NCNotificationViewController auxiliaryOptionsContentProvider](self, "auxiliaryOptionsContentProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "auxiliaryOptionsVisible");

    if (v8)
    {
      -[NCNotificationViewController auxiliaryOptionsContentProvider](self, "auxiliaryOptionsContentProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[NCNotificationViewController auxiliaryOptionsContentProvider](self, "auxiliaryOptionsContentProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "auxiliaryOptionsSummaryText");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v3, "setAuxiliaryOptionsSummaryText:", v12);
      objc_msgSend(v3, "setMaterialRecipe:", -[NCNotificationViewController materialRecipe](self, "materialRecipe"));
      -[NCNotificationViewController materialGroupNameBase](self, "materialGroupNameBase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setMaterialGroupNameBase:", v14);

      -[NCNotificationViewController auxiliaryOptionsContentProvider](self, "auxiliaryOptionsContentProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[NCNotificationViewController auxiliaryOptionsContentProvider](self, "auxiliaryOptionsContentProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "auxiliaryOptionActions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v3, "setAuxiliaryOptionActions:", v18);

      v13 = 1;
    }
    else
    {
LABEL_7:
      v13 = 0;
    }
    objc_msgSend(v3, "setAuxiliaryOptionsVisible:", v13);
    -[NCNotificationViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }

}

- (BOOL)_shouldUseHapticTouch
{
  void *v2;
  char v3;

  +[NCUserNotificationsUIKitDefaults standardDefaults](NCUserNotificationsUIKitDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "shouldForceHapticTouchForPreview") & 1) != 0)
    v3 = 1;
  else
    v3 = _NCDeviceDesiresHapticTouch();

  return v3;
}

- (void)_updateShortLookShadow
{
  id v3;

  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "setHasShadow:", -[NCNotificationViewController hasShadow](self, "hasShadow"));

}

- (void)_updateScreenCaptureProhibited
{
  NCNotificationLookView *lookView;
  void *v3;
  id v4;

  lookView = self->super._lookView;
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationLookView setScreenCaptureProhibited:](lookView, "setScreenCaptureProhibited:", objc_msgSend(v3, "screenCaptureProhibited"));

}

- (BOOL)_shouldPerformHoverHighlighting
{
  void *v3;
  char v4;

  -[NCNotificationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "notificationViewControllerShouldPerformHoverHighlighting:", self);
  else
    v4 = 1;

  return v4;
}

- (id)_expandedPlatterViewController
{
  NCExpandedPlatterViewController *expandedPlatterViewController;
  NCExpandedPlatterViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NCExpandedPlatterViewController *v9;
  NCExpandedPlatterViewController *v10;

  expandedPlatterViewController = self->_expandedPlatterViewController;
  if (!expandedPlatterViewController)
  {
    v4 = [NCExpandedPlatterViewController alloc];
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController customContentProvider](self, "customContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customContentViewControllerForNotificationRequest:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NCExpandedPlatterViewController initWithNotificationRequest:customContentViewController:](v4, "initWithNotificationRequest:customContentViewController:", v5, v8);
    v10 = self->_expandedPlatterViewController;
    self->_expandedPlatterViewController = v9;

    -[NCExpandedPlatterViewController setDelegate:](self->_expandedPlatterViewController, "setDelegate:", self);
    -[NCExpandedPlatterViewController addExpandedPlatterObserver:](self->_expandedPlatterViewController, "addExpandedPlatterObserver:", self);
    expandedPlatterViewController = self->_expandedPlatterViewController;
  }
  return expandedPlatterViewController;
}

- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *expandedPlatterViewController;
  uint64_t v6;
  void *v7;
  char v8;
  NCExpandedPlatterViewController *v9;

  v3 = a3;
  expandedPlatterViewController = self->_expandedPlatterViewController;
  if (!expandedPlatterViewController)
    expandedPlatterViewController = self->_longLookNotificationViewController;
  v9 = expandedPlatterViewController;
  -[NCExpandedPlatterViewController presentingViewController](v9, "presentingViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[NCExpandedPlatterViewController isBeingDismissed](v9, "isBeingDismissed");

    if ((v8 & 1) == 0)
    {
      if (v9 == self->_expandedPlatterViewController)
      {
        -[PLExpandedPlatterInteractionManager dismiss](self->_interactionManager, "dismiss");
      }
      else if ((-[PLClickPresentationInteractionManager dismissIfPossible:](self->_clickPresentationInteractionManager, "dismissIfPossible:", 0) & 1) == 0)
      {
        -[NCNotificationLongLookViewController dismissViewControllerAnimated:completion:](self->_longLookNotificationViewController, "dismissViewControllerAnimated:completion:", v3, 0);
      }
    }
  }

}

- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!self->_expandedPlatterDismissalReason)
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_storeStrong((id *)&self->_expandedPlatterDismissalReason, v10);

  }
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController _askDelegateToExecuteAction:withParameters:animated:](&v11, sel__askDelegateToExecuteAction_withParameters_animated_, v8, v9, v5);

}

- (void)_intelligenceLightAnimationIfNeeded
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[NCNotificationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "importantAdornmentEligibleOptionsForNotificationViewController:", self)
    && (objc_msgSend(v3, "importantAdornmentEligibleOptionsForNotificationViewController:", self) & 2) == 0;
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intelligentBehavior");

  if (v7 == 2 && !v4)
  {
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke;
    v12[3] = &unk_1E8D1B278;
    objc_copyWeak(&v13, &location);
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke_2;
    v10[3] = &unk_1E8D1B350;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 0, v12, v10, 1.0, 0.0, 0.0, 0.0);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[126], "startLightEffect");
    WeakRetained = v2;
  }

}

void __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x1E0DC3F10];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke_3;
  v2[3] = &unk_1E8D1B278;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_msgSend(v1, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 0, v2, 0, 0.5, 0.0, 0.0, 0.1);
  objc_destroyWeak(&v3);
}

void __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[126], "stopLightEffect");
    WeakRetained = v2;
  }

}

- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[NCExpandedPlatterViewController customContentViewController](self->_expandedPlatterViewController, "customContentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[NCNotificationViewController _customContentProvidingViewController](self->_longLookNotificationViewController, "_customContentProvidingViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  if (!v9
    || (-[NCNotificationViewController notificationRequest](self, "notificationRequest"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "performAction:forNotification:", v9, v14),
        v14,
        (v15 & 1) == 0))
  {
    v16.receiver = self;
    v16.super_class = (Class)NCNotificationShortLookViewController;
    -[NCNotificationViewController contentProvider:performAction:animated:](&v16, sel_contentProvider_performAction_animated_, v8, v9, v5);
  }

}

- (void)_expandedPlatterInteractionManager:(id)a3 willDismissWithReason:(id)a4
{
  const __CFString *v4;
  NCExpandedPlatterViewController *expandedPlatterViewController;
  id v6;

  if (a4)
    v4 = (const __CFString *)a4;
  else
    v4 = CFSTR("NCExpandedPlatterObservableDismissalReasonUnknown");
  expandedPlatterViewController = self->_expandedPlatterViewController;
  v6 = a4;
  -[NCExpandedPlatterViewController expandedPlatter:willDismissWithReason:](expandedPlatterViewController, "expandedPlatter:willDismissWithReason:", expandedPlatterViewController, v4);

}

- (void)_expandedPlatterInteractionManager:(id)a3 didDismissWithReason:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v5 = (__CFString *)a4;
  v8 = v5;
  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("NCExpandedPlatterObservableDismissalReasonUnknown");
  v7 = v6;
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_41);
  if (NCEqualExpandedPlatterObservableDismissalReasons(v7, CFSTR("NCExpandedPlatterObservableDismissalReasonUnknown")))-[NCNotificationViewController _executeCancelAction:](self, "_executeCancelAction:", 1);
  -[NCExpandedPlatterViewController expandedPlatter:didDismissWithReason:](self->_expandedPlatterViewController, "expandedPlatter:didDismissWithReason:", self->_expandedPlatterViewController, v7);

}

void __97__NCNotificationShortLookViewController__expandedPlatterInteractionManager_didDismissWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerDidEndUserInteraction:", v5);

}

- (BOOL)_isLockedByAppProtection
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocked");

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a4, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  if (-[NCNotificationShortLookViewController _shouldPerformHoverHighlighting](self, "_shouldPerformHoverHighlighting"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded", a3, a4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString window](v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v5);
    objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredTintMode:", 1);
    objc_msgSend(v8, "setPrefersScaledContent:", 0);
    objc_msgSend(v8, "setPrefersShadow:", 0);
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      -[NCNotificationShortLookViewController pointerInteraction:styleForRegion:].cold.1(v10, self, v5);
    v9 = 0;
  }

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6;

  -[NCNotificationViewController delegate](self, "delegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "notificationViewController:isPerformingHoverHighlighting:", self, 1);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6;

  -[NCNotificationViewController delegate](self, "delegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "notificationViewController:isPerformingHoverHighlighting:", self, 0);

}

+ (id)_sharedNotificationFeedbackGenerator
{
  if (_sharedNotificationFeedbackGenerator_onceToken != -1)
    dispatch_once(&_sharedNotificationFeedbackGenerator_onceToken, &__block_literal_global_120);
  return (id)_sharedNotificationFeedbackGenerator___sharedNotificationFeedbackGenerator;
}

void __77__NCNotificationShortLookViewController__sharedNotificationFeedbackGenerator__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3A58]);
  v1 = (void *)_sharedNotificationFeedbackGenerator___sharedNotificationFeedbackGenerator;
  _sharedNotificationFeedbackGenerator___sharedNotificationFeedbackGenerator = (uint64_t)v0;

}

+ (void)_prepareSharedNotificationFeedbackGenerator
{
  id v2;

  objc_msgSend(a1, "_sharedNotificationFeedbackGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepare");

}

+ (void)_playNegativeInteractionHaptic
{
  id v2;

  objc_msgSend(a1, "_sharedNotificationFeedbackGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationOccurred:", 2);

}

- (id)_notificationShortLookViewIfLoaded
{
  void *v2;
  void *v3;
  id v4;

  -[NCNotificationViewController _lookViewIfLoaded](self, "_lookViewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)_presentLongLookViaClickPresentationInteraction:(id)a3
{
  id v4;
  PLClickPresentationInteractionManager *clickPresentationInteractionManager;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  clickPresentationInteractionManager = self->_clickPresentationInteractionManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__NCNotificationShortLookViewController__presentLongLookViaClickPresentationInteraction___block_invoke;
  v7[3] = &unk_1E8D1B808;
  v8 = v4;
  v6 = v4;
  -[PLClickPresentationInteractionManager presentIfPossible:](clickPresentationInteractionManager, "presentIfPossible:", v7);

}

uint64_t __89__NCNotificationShortLookViewController__presentLongLookViaClickPresentationInteraction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_presentLongLookViaInteractionManager:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NCNotificationShortLookViewController _interactionManagerCreatingIfNecessary](self, "_interactionManagerCreatingIfNecessary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController _lookView](self, "_lookView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  UIRectGetCenter();
  objc_msgSend(v6, "presentAtLocation:completion:", v4);

}

- (void)_presentLongLookForScrollAnimated:(BOOL)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, int);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id location;

  v5 = a4;
  self->_didScrollPresentLongLookViewController = 1;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E8D1B278;
  objc_copyWeak(&v27, &location);
  v7 = _Block_copy(aBlock);
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_3;
  v23[3] = &unk_1E8D1B300;
  objc_copyWeak(&v25, &location);
  v8 = v5;
  v24 = v8;
  v9 = _Block_copy(v23);
  v15 = v6;
  v16 = 3221225472;
  v17 = __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_4;
  v18 = &unk_1E8D1FA50;
  objc_copyWeak(&v22, &location);
  v10 = v7;
  v19 = v10;
  v11 = v9;
  v20 = v11;
  v12 = v8;
  v21 = v12;
  v13 = _Block_copy(&v15);
  -[NCNotificationViewController delegate](self, "delegate", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "notificationRequestPresenter:shouldTransitionToStage:forTrigger:completionBlock:", self, CFSTR("notificationViewController.presentingStage.longLook"), 6, v13);
  }
  else
  {
    v10[2](v10);
    v11[2](v11);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyObserversWithBlock:", &__block_literal_global_122);

}

void __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerDidEndUserInteraction:", v5);

}

void __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_interactionManagerCreatingIfNecessary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_lookView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  UIRectGetCenter();
  objc_msgSend(v2, "presentAtLocation:completion:", *(_QWORD *)(a1 + 32));

}

void __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if (a2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_6:
      v5 = v7;
      goto LABEL_7;
    }
    objc_msgSend(WeakRetained, "_setDidScrollPresentLongLookViewController:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v7;
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v5, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.usernotifications.drag.response"), 3, &__block_literal_global_127);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v5);
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userNotification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultActionURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAD68]), "initWithUniqueIdentifier:withLaunchActions:startLocation:", v10, 0, 9);
    objc_msgSend(v14, "setLaunchURL:", v13);
    objc_msgSend(v6, "setLocalObject:", v14);
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0DC3A60]);
    objc_msgSend(MEMORY[0x1E0CEC750], "responseWithNotification:actionIdentifier:", v8, *MEMORY[0x1E0CEC808]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __82__NCNotificationShortLookViewController_dragInteraction_itemsForBeginningSession___block_invoke_2;
    v22[3] = &unk_1E8D1FAB8;
    v22[4] = self;
    v14 = (void *)objc_msgSend(v15, "initWithResponse:withHandler:", v16, v22);

    v17 = objc_alloc(MEMORY[0x1E0DAAD68]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithUniqueIdentifier:withLaunchActions:startLocation:", v10, v18, 9);

    objc_msgSend(v6, "setLocalObject:", v19);
  }

  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __82__NCNotificationShortLookViewController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D50];
  v3 = a2;
  objc_msgSend(v2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

  return 0;
}

void __82__NCNotificationShortLookViewController_dragInteraction_itemsForBeginningSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0CEC7C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CEC7C8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CEC808];
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application foreground launch action for notification response action %{public}@ recieved action response %{public}@", (uint8_t *)&v10, 0x20u);

  }
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:", self->_lookViewWrapper);
  objc_msgSend(v5, "set_springboardPlatterStyle:", 1);
  return v5;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  UIView *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  void *v16;
  _OWORD v18[3];

  v6 = a5;
  v7 = self->_lookViewWrapper;
  -[UIView superview](v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v9;
  if (v7)
    v11 = v8 == 0;
  else
    v11 = 1;
  v12 = v9;
  if (!v11)
  {
    objc_msgSend(v8, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v10;
    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0DC3770]);
      -[UIView center](v7, "center");
      v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v18[0] = *MEMORY[0x1E0C9BAA8];
      v18[1] = v15;
      v18[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v16 = (void *)objc_msgSend(v14, "initWithContainer:center:transform:", v8, v18);
      objc_msgSend(v10, "retargetedPreviewWithTarget:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "set_springboardPlatterStyle:", 1);
    }
  }

  return v12;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  NCNotificationLookView *v7;
  id v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  uint64_t v15;
  NCNotificationLookView *v16;
  UIView *v17;
  UIView *v18;
  _QWORD v19[4];
  UIView *v20;
  _QWORD v21[4];
  NCNotificationLookView *v22;
  double v23;
  CGRect v24;
  CGRect v25;

  v7 = self->super._lookView;
  v8 = a4;
  -[NCNotificationLookView bounds](v7, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v13 = CGRectGetWidth(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v14 = CGRectGetHeight(v25);
  if (v13 >= v14)
    v14 = v13;
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__NCNotificationShortLookViewController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v21[3] = &unk_1E8D1BCF8;
  v22 = v7;
  v23 = fmax(fmin((v14 + 12.0) / v14, 1.10000002), 1.00100005);
  v16 = v7;
  objc_msgSend(v8, "addAnimations:", v21);
  v17 = self->_lookViewWrapper;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __93__NCNotificationShortLookViewController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v19[3] = &unk_1E8D1FAE0;
  v20 = v17;
  v18 = v17;
  objc_msgSend(v8, "addCompletion:", v19);

}

uint64_t __93__NCNotificationShortLookViewController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __93__NCNotificationShortLookViewController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setAlpha:", 0.0);
  return result;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  NCNotificationLookView *v6;
  NCNotificationLookView *v7;
  _QWORD v8[4];
  NCNotificationLookView *v9;

  v6 = self->super._lookView;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__NCNotificationShortLookViewController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v8[3] = &unk_1E8D1B568;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a5, "addAnimations:", v8);

}

uint64_t __92__NCNotificationShortLookViewController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.0, 1.0);
  return objc_msgSend(v1, "setTransform:", &v3);
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NCNotificationViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "notificationViewController:dragInteraction:sessionWillBegin:", self, v8, v6);
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_141);

}

void __74__NCNotificationShortLookViewController_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerWillBeginUserInteraction:", v5);

}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  -[NCNotificationViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "notificationViewController:dragInteraction:session:willEndWithOperation:", self, v10, v8, a5);
  if (a5 <= 1)
    -[UIView setAlpha:](self->_lookViewWrapper, "setAlpha:", 1.0);

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  -[NCNotificationViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "notificationViewController:dragInteraction:session:didEndWithOperation:", self, v10, v8, a5);
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_148);

}

void __85__NCNotificationShortLookViewController_dragInteraction_session_didEndWithOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerDidEndUserInteraction:", v5);

}

- (id)expandedPlatterInteractionManagerIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NCNotificationViewController notificationRequest](self, "notificationRequest", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)expandedPlatterInteractionManager:(id)a3 menuWithSuggestedActions:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DC39D0];
  -[NCNotificationViewController staticContentProvider](self, "staticContentProvider", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuWithChildren:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)expandedPlatterInteractionManager:(id)a3 shouldBeginInteractionWithTouchAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __CFString *v19;
  BOOL v20;
  int v21;
  int v22;
  __CFString *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[8];
  _BYTE buf[24];
  char v32;
  uint64_t v33;

  y = a4.y;
  x = a4.x;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[NCNotificationViewController isInteractionEnabled](self, "isInteractionEnabled");
  if (-[NCNotificationShortLookViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[NCNotificationShortLookViewController viewForPreview](self, "viewForPreview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }
  if ((-[NCNotificationShortLookViewController isBeingPresented](self, "isBeingPresented") & 1) != 0)
    v12 = 1;
  else
    v12 = -[NCNotificationShortLookViewController isBeingDismissed](self, "isBeingDismissed");
  if (!v8 || !v11)
  {
    if (v8)
      goto LABEL_14;
LABEL_30:
    v19 = CFSTR("interaction disabled");
LABEL_31:
    v23 = v19;
    v24 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "notificationIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "un_logDigest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v23;
      _os_log_impl(&dword_1CFC3D000, v25, OS_LOG_TYPE_DEFAULT, "Denying interaction for view controller for request %{public}@: %{public}@", buf, 0x16u);

    }
    v20 = 0;
    goto LABEL_34;
  }
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "auxiliaryOptionsVisible");

  if (v14)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v32 = 0;
    -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "auxiliaryOptionButtons");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __117__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke;
    v30[3] = &unk_1E8D1FB48;
    v30[4] = self;
    v30[5] = buf;
    *(CGFloat *)&v30[6] = x;
    *(CGFloat *)&v30[7] = y;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v30);

    LODWORD(v15) = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if ((_DWORD)v15)
      goto LABEL_30;
  }
  if (self->_trigger == 3)
    goto LABEL_14;
  -[NCNotificationViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = objc_msgSend(v17, "notificationViewControllerShouldAllowExpandedPlatterInteraction:", self);
LABEL_23:
    v21 = v18;
    goto LABEL_25;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = objc_msgSend(v17, "notificationViewControllerShouldAllowClickPresentationInteraction:", self);
    goto LABEL_23;
  }
  v21 = 1;
LABEL_25:
  v22 = v21 ^ 1;
  if (self->_trigger)
    v22 = 1;
  if (((v22 | v12) & 1) == 0)
    self->_trigger = 1;

  if ((v21 & 1) == 0)
    goto LABEL_30;
LABEL_14:
  if (((!v11 | v12) & 1) != 0)
  {
    v19 = CFSTR("view not in a window");
    if (v11)
      v19 = CFSTR("view controller is transitioning");
    goto LABEL_31;
  }
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_155_0);
  if (!-[NCNotificationViewController _canPan](self, "_canPan"))
    objc_msgSend((id)objc_opt_class(), "_prepareSharedNotificationFeedbackGenerator");
  v20 = 1;
LABEL_34:

  return v20;
}

void __117__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "viewForPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v7, "hitTest:withEvent:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9 != 0;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __117__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerWillBeginUserInteraction:", v5);

}

- (void)expandedPlatterInteractionManager:(id)a3 shouldCommitInteraction:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  int64_t trigger;
  int v16;
  _BOOL4 v17;
  _QWORD v19[5];
  void (**v20)(void *, _QWORD);
  uint64_t v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke;
  aBlock[3] = &unk_1E8D1C750;
  objc_copyWeak(&v24, &location);
  v9 = v7;
  v23 = v9;
  v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  -[NCNotificationViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController staticContentProvider](self, "staticContentProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "summarizedNotificationsCount");

  if (v13)
  {
    objc_msgSend(v11, "handleTapOnNotificationViewController:", self);
LABEL_14:
    v10[2](v10, 0);
    goto LABEL_15;
  }
  if (!-[NCNotificationShortLookViewController shouldCommitToExpandedPlatterPresentationWithFeedback](self, "shouldCommitToExpandedPlatterPresentationWithFeedback"))goto LABEL_14;
  v14 = objc_msgSend(v6, "reachedForceThreshold");
  trigger = self->_trigger;
  if (trigger == 1)
    v16 = v14;
  else
    v16 = 0;
  if (v16 == 1)
  {
    trigger = 2;
    self->_trigger = 2;
  }
  v17 = -[NCNotificationShortLookViewController _isLockedByAppProtection](self, "_isLockedByAppProtection");
  if (trigger == 1 && v17)
  {
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke_3;
    v19[3] = &unk_1E8D1FBB0;
    v19[4] = self;
    v20 = v10;
    v21 = 1;
    -[NCNotificationShortLookViewController _requestAppProtectionUnlockWithCompletion:](self, "_requestAppProtectionUnlockWithCompletion:", v19);

  }
  else
  {
    -[NCNotificationShortLookViewController _checkDelegateShouldTransitionForTrigger:completionBlock:](self, "_checkDelegateShouldTransitionForTrigger:completionBlock:", trigger, v10);
  }
LABEL_15:

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

uint64_t __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t result;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_notifyObserversWithBlock:", &__block_literal_global_162);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerDidEndUserInteraction:", v5);

}

uint64_t __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_checkDelegateShouldTransitionForTrigger:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_checkDelegateShouldTransitionForTrigger:(int64_t)a3 completionBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[NCNotificationViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "notificationRequestPresenter:shouldTransitionToStage:forTrigger:completionBlock:", self, CFSTR("notificationViewController.presentingStage.longLook"), a3, v6);
  }
  else
  {
    v8 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "notificationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "un_logDigest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "Delegate for notification view controller for request %{public}@ doesn't respond to selector – denying presentation", (uint8_t *)&v13, 0xCu);

    }
    v6[2](v6, 0);
    objc_msgSend((id)objc_opt_class(), "_playNegativeInteractionHaptic");
  }

}

- (void)expandedPlatterInteractionManager:(id)a3 willPresentContentWithAnimator:(id)a4
{
  id v6;
  id v7;
  NCExpandedPlatterViewController *v8;
  NCExpandedPlatterViewController *v9;
  id v10;
  _QWORD v11[4];
  NCExpandedPlatterViewController *v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_activeExpandedPlatterInteractionAnimator, a4);
  v8 = self->_expandedPlatterViewController;
  -[NCExpandedPlatterViewController expandedPlatterWillPresent:](v8, "expandedPlatterWillPresent:", v8);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__NCNotificationShortLookViewController_expandedPlatterInteractionManager_willPresentContentWithAnimator___block_invoke;
  v11[3] = &unk_1E8D1CD30;
  objc_copyWeak(&v14, &location);
  v9 = v8;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v10, "addCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __106__NCNotificationShortLookViewController_expandedPlatterInteractionManager_willPresentContentWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD *v4;
  BOOL v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_opt_class();
  v4 = WeakRetained;
  v8 = v4;
  if (v3)
  {
    v5 = (objc_opt_isKindOfClass() & 1) == 0;
    v4 = v8;
    if (v5)
      v3 = 0;
    else
      v3 = (uint64_t)v8;
  }

  if (v3)
    v8[151] = 0;
  objc_msgSend(*(id *)(a1 + 32), "expandedPlatterDidPresent:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "_activeExpandedPlatterInteractionAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);

  if (v6 == v7)
    objc_msgSend(v8, "_setActiveExpandedPlatterInteractionAnimator:", 0);

}

- (BOOL)expandedPlatterInteractionManagerShouldAllowInitialSwipeToDismiss:(id)a3
{
  return self->_trigger != 6;
}

- (BOOL)expandedPlatterInteractionManagerShouldAllowLongPressGesture:(id)a3
{
  void *v4;
  char v5;

  -[NCNotificationViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "notificationViewControllerShouldAllowLongPressGesture:", self);
  else
    v5 = 1;

  return v5;
}

- (void)expandedPlatterInteractionManager:(id)a3 willDismissContentWithAnimator:(id)a4
{
  id v6;
  id v7;
  __CFString *expandedPlatterDismissalReason;
  __CFString *v9;
  __CFString *v10;
  id v11;
  id v12;
  NCNotificationShortLookViewController *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __CFString *v17;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_activeExpandedPlatterInteractionAnimator, a4);
  expandedPlatterDismissalReason = (__CFString *)self->_expandedPlatterDismissalReason;
  if (!expandedPlatterDismissalReason)
    expandedPlatterDismissalReason = CFSTR("NCExpandedPlatterObservableDismissalReasonUnknown");
  v9 = expandedPlatterDismissalReason;
  -[NCNotificationShortLookViewController _expandedPlatterInteractionManager:willDismissWithReason:](self, "_expandedPlatterInteractionManager:willDismissWithReason:", v6, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__NCNotificationShortLookViewController_expandedPlatterInteractionManager_willDismissContentWithAnimator___block_invoke;
  v14[3] = &unk_1E8D1DAE8;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = v9;
  v10 = v9;
  v11 = v6;
  v12 = v7;
  v13 = self;
  objc_msgSend(v12, "addCompletion:", v14);

}

void __106__NCNotificationShortLookViewController_expandedPlatterInteractionManager_willDismissContentWithAnimator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = *(id *)(a1 + 32);
  objc_msgSend(v4, "_activeExpandedPlatterInteractionAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(v4, "_expandedPlatterInteractionManager:didDismissWithReason:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(v4, "_setActiveExpandedPlatterInteractionAnimator:", 0);
  }

}

- (id)expandedPlatterViewController:(id)a3 staticContentProviderForNotificationRequest:(id)a4
{
  void *v4;
  void *v5;

  -[NCNotificationViewController staticContentProvider](self, "staticContentProvider", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithContentHidingEnforcement:", 1);

  return v5;
}

- (int64_t)expandedPlatterViewController:(id)a3 dateFormatStyleForNotificationRequest:(id)a4
{
  void *v5;
  int64_t v6;

  -[NCNotificationViewController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "notificationViewControllerDateFormatStyle:", self);
  else
    v6 = 1;

  return v6;
}

- (void)expandedPlatterViewController:(id)a3 requestsDismissalWithReason:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  NSString **p_expandedPlatterDismissalReason;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;

  v8 = a4;
  v9 = a5;
  p_expandedPlatterDismissalReason = &self->_expandedPlatterDismissalReason;
  objc_storeStrong((id *)&self->_expandedPlatterDismissalReason, a4);
  if (NCEqualExpandedPlatterObservableDismissalReasons(self->_expandedPlatterDismissalReason, CFSTR("dismissalReasonURL")))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("NCExpandedPlatterObservableDismissalReasonUserInfoKeyURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      dispatch_get_global_queue(25, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __108__NCNotificationShortLookViewController_expandedPlatterViewController_requestsDismissalWithReason_userInfo___block_invoke;
      block[3] = &unk_1E8D1B568;
      v20 = v11;
      dispatch_async(v12, block);

    }
  }
  else if (NCEqualExpandedPlatterObservableDismissalReasons(*p_expandedPlatterDismissalReason, CFSTR("dismissalReasonDefaultTap")))
  {
    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "longLookDefaultActionInvokedWithTrigger:forNotificationRequest:withState:", 1, v14, v15);

    -[NCNotificationViewController _executeDefaultAction:](self, "_executeDefaultAction:", 1);
  }
  else if (NCEqualExpandedPlatterObservableDismissalReasons(*p_expandedPlatterDismissalReason, CFSTR("dismissalReasonHomeAction")))
  {
    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController notificationUsageTrackingState](self, "notificationUsageTrackingState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "longLookReparkInvokedWithTrigger:forNotificationRequest:withState:", 0, v17, v18);

    -[NCNotificationViewController _executeCancelAction:](self, "_executeCancelAction:", 1);
  }

}

void __108__NCNotificationShortLookViewController_expandedPlatterViewController_requestsDismissalWithReason_userInfo___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD2E0]), "initWithURL:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "isValid"))
  {
    objc_msgSend(v3, "setShowUIPrompt:", 1);
    objc_msgSend(v3, "URL");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v4;
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D22DA8];
  v8[0] = *MEMORY[0x1E0D22D88];
  v8[1] = v6;
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v2, v7, 0);

}

- (unint64_t)importantAdornmentEligibleOptionsForNotificationViewController:(id)a3
{
  void *v4;
  unint64_t v5;

  -[NCNotificationViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "importantAdornmentEligibleOptionsForNotificationViewController:", self))
  {
    v5 = objc_msgSend(v4, "importantAdornmentEligibleOptionsForNotificationViewController:", self);
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (void)expandedPlatterWillPresent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NCStringFromLongLookPresentationTrigger(self->_trigger);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v9;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller will present expanded platter for request %{public}@ (_trigger: %{public}@)", (uint8_t *)&v19, 0x16u);

  }
  self->_expandedPlatterPresentationState = 1;
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "longLookPresentedForNotificationRequest:", v12);

  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_171);
  -[NCExpandedPlatterViewController customContentViewController](self->_expandedPlatterViewController, "customContentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentExtensionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    NCSDKVersionForExtensionWithIdentifier(v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = NCIsSDKVersionSameOrAfterSDKVersion(v15, CFSTR("13.0"));

    if (!v16)
    {
      -[NCExpandedPlatterViewController presentationController](self->_expandedPlatterViewController, "presentationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOverrideTraitCollection:", v18);

    }
  }

}

void __68__NCNotificationShortLookViewController_expandedPlatterWillPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "longLookWillPresentForNotificationViewController:", v5);

}

- (void)expandedPlatterDidPresent:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Notification view controller did present expanded platter for request %{public}@", (uint8_t *)&v9, 0xCu);

  }
  self->_expandedPlatterPresentationState = 2;
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_177);
}

void __67__NCNotificationShortLookViewController_expandedPlatterDidPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "longLookDidPresentForNotificationViewController:", v5);

}

- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller will dismiss expanded platter for request %{public}@", (uint8_t *)&v10, 0xCu);

  }
  self->_expandedPlatterPresentationState = 3;
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_180);
}

void __79__NCNotificationShortLookViewController_expandedPlatter_willDismissWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "longLookWillDismissForNotificationViewController:", v5);

}

- (void)expandedPlatter:(id)a3 didDismissWithReason:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NCExpandedPlatterViewController *expandedPlatterViewController;
  void *v11;
  UIView *containerViewForExpandedContent;
  NSString *expandedPlatterDismissalReason;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller did dismiss expanded platter for request %{public}@", (uint8_t *)&v14, 0xCu);

  }
  self->_expandedPlatterPresentationState = 0;
  -[NCExpandedPlatterViewController removeExpandedPlatterObserver:](self->_expandedPlatterViewController, "removeExpandedPlatterObserver:", self);
  expandedPlatterViewController = self->_expandedPlatterViewController;
  self->_expandedPlatterViewController = 0;

  -[NSMutableArray firstObject](self->_containerViewProviders, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  -[NSMutableArray removeFirstObject](self->_containerViewProviders, "removeFirstObject");
  containerViewForExpandedContent = self->_containerViewForExpandedContent;
  self->_containerViewForExpandedContent = 0;

  expandedPlatterDismissalReason = self->_expandedPlatterDismissalReason;
  self->_expandedPlatterDismissalReason = 0;

  -[NCNotificationViewController _setupCustomContentProvider](self, "_setupCustomContentProvider");
  self->_didScrollPresentLongLookViewController = 0;
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_183);
}

void __78__NCNotificationShortLookViewController_expandedPlatter_didDismissWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "longLookDidDismissForNotificationViewController:", v5);

}

- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD);
  PLExpandedPlatterInteractionAnimating *activeExpandedPlatterInteractionAnimator;
  objc_super v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_expandedPlatterViewController)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationViewController notificationRequest](self, "notificationRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "notificationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "un_logDigest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "Custom content extension is updating expanded platter actions for notification request %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__NCNotificationShortLookViewController_customContent_didUpdateUserNotificationActions___block_invoke;
    aBlock[3] = &unk_1E8D1CB40;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v7;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    activeExpandedPlatterInteractionAnimator = self->_activeExpandedPlatterInteractionAnimator;
    if (activeExpandedPlatterInteractionAnimator)
      -[PLExpandedPlatterInteractionAnimating addCompletion:](activeExpandedPlatterInteractionAnimator, "addCompletion:", v13);
    else
      v13[2](v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NCNotificationShortLookViewController;
    -[NCNotificationShortLookViewController customContent:didUpdateUserNotificationActions:](&v15, sel_customContent_didUpdateUserNotificationActions_, v6, v7);
  }

}

void __88__NCNotificationShortLookViewController_customContent_didUpdateUserNotificationActions___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "staticContentProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverriddenActions:", *(_QWORD *)(a1 + 32));

    v4 = (void *)v5[152];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __88__NCNotificationShortLookViewController_customContent_didUpdateUserNotificationActions___block_invoke_2;
    v6[3] = &unk_1E8D1FC58;
    v6[4] = v5;
    objc_msgSend(v4, "updateVisibleMenuWithBlock:", v6);
    WeakRetained = v5;
  }

}

id __88__NCNotificationShortLookViewController_customContent_didUpdateUserNotificationActions___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(*(id *)(a1 + 32), "staticContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "menuWithChildren:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_longLookNotificationViewController
{
  NCNotificationLongLookViewController *longLookNotificationViewController;
  NCNotificationLongLookViewController *v4;
  void *v5;
  NCNotificationLongLookViewController *v6;
  NCNotificationLongLookViewController *v7;
  NCNotificationLongLookViewController *v8;
  void *v9;
  void *v10;
  void *v11;

  longLookNotificationViewController = self->_longLookNotificationViewController;
  if (!longLookNotificationViewController)
  {
    v4 = [NCNotificationLongLookViewController alloc];
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NCNotificationLongLookViewController _initWithNotificationRequest:andPresentingNotificationViewController:revealingAdditionalContentOnPresentation:](v4, "_initWithNotificationRequest:andPresentingNotificationViewController:revealingAdditionalContentOnPresentation:", v5, self, -[NCNotificationViewController revealAdditionalContentOnPresentation](self, "revealAdditionalContentOnPresentation"));
    v7 = self->_longLookNotificationViewController;
    self->_longLookNotificationViewController = v6;

    v8 = self->_longLookNotificationViewController;
    -[NCNotificationViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationViewController setDelegate:](v8, "setDelegate:", v9);

    -[NCNotificationViewController addObserver:](self->_longLookNotificationViewController, "addObserver:", self);
    -[NCNotificationViewController updateContent](self->_longLookNotificationViewController, "updateContent");
    -[NCNotificationViewController staticContentProvider](self->_longLookNotificationViewController, "staticContentProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    longLookNotificationViewController = self->_longLookNotificationViewController;
    if (!v10)
    {
      -[NCNotificationViewController staticContentProvider](self, "staticContentProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationViewController setStaticContentProvider:](longLookNotificationViewController, "setStaticContentProvider:", v11);

      longLookNotificationViewController = self->_longLookNotificationViewController;
    }
  }
  return longLookNotificationViewController;
}

- (id)transitioningDelegateForClickPresentationInteractionManager:(id)a3
{
  return objc_alloc_init(NCLongLookTransitioningDelegate);
}

- (BOOL)clickPresentationInteractionManager:(id)a3 shouldBeginInteractionWithTouchAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSDate *v16;
  NSDate *tapBeginTime;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = -[NCNotificationViewController isInteractionEnabled](self, "isInteractionEnabled");
  if ((-[NCNotificationShortLookViewController isBeingPresented](self, "isBeingPresented") & 1) != 0)
  {
    v9 = 1;
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v9 = -[NCNotificationShortLookViewController isBeingDismissed](self, "isBeingDismissed");
    if (!v8)
    {
LABEL_7:
      LOBYTE(v14) = 0;
      goto LABEL_14;
    }
  }
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "auxiliaryOptionsVisible");

  if (v11)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "auxiliaryOptionButtons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __119__NCNotificationShortLookViewController_clickPresentationInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke;
    v19[3] = &unk_1E8D1FB48;
    v19[4] = self;
    v19[5] = &v20;
    *(CGFloat *)&v19[6] = x;
    *(CGFloat *)&v19[7] = y;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);

    LODWORD(v12) = *((unsigned __int8 *)v21 + 24);
    _Block_object_dispose(&v20, 8);
    if ((_DWORD)v12)
      goto LABEL_7;
  }
  -[NCNotificationViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = objc_msgSend(v15, "notificationViewControllerShouldAllowClickPresentationInteraction:", self);
  else
    v14 = 1;
  if (((v14 ^ 1 | v9) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    tapBeginTime = self->_tapBeginTime;
    self->_tapBeginTime = v16;

    self->_trigger = 1;
  }

LABEL_14:
  return v14 & (v9 ^ 1);
}

void __119__NCNotificationShortLookViewController_clickPresentationInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "viewForPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v7, "hitTest:withEvent:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9 != 0;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (void)clickPresentationInteractionManagerWillBeginUserInteraction:(id)a3
{
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_192);
}

void __101__NCNotificationShortLookViewController_clickPresentationInteractionManagerWillBeginUserInteraction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerWillBeginUserInteraction:", v5);

}

- (void)clickPresentationInteractionManagerDidEndUserInteraction:(id)a3
{
  NSDate *tapBeginTime;

  tapBeginTime = self->_tapBeginTime;
  self->_tapBeginTime = 0;

  if (!self->_didScrollPresentLongLookViewController)
  {
    -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_193);
    self->_trigger = 0;
  }
}

void __98__NCNotificationShortLookViewController_clickPresentationInteractionManagerDidEndUserInteraction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationViewControllerDidEndUserInteraction:", v5);

}

- (void)clickPresentationInteractionManager:(id)a3 shouldFinishInteractionThatReachedForceThreshold:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL4 v5;
  void *v7;
  void (**v8)(id, _QWORD);

  v5 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  -[NCNotificationViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && self->_trigger == 1)
    self->_trigger = 2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "notificationRequestPresenter:shouldTransitionToStage:forTrigger:completionBlock:", self, CFSTR("notificationViewController.presentingStage.longLook"), self->_trigger, v8);
  else
    v8[2](v8, 0);

}

- (void)_handlePresentedContentDismissalForClickPresentationInteractionManagerWithTrigger:(int64_t)a3
{
  NCNotificationLongLookViewController *longLookNotificationViewController;
  NCNotificationLongLookViewController *v6;
  NCNotificationLongLookViewController *v7;
  NCNotificationLongLookViewController *v8;
  NSObject *v9;
  int v10;
  NCNotificationLongLookViewController *v11;
  __int16 v12;
  NCNotificationLongLookViewController *v13;
  __int16 v14;
  NCNotificationShortLookViewController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    longLookNotificationViewController = self->_longLookNotificationViewController;
  else
    longLookNotificationViewController = 0;
  v6 = longLookNotificationViewController;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = self->_longLookNotificationViewController;
    v8 = v7;
    if (v6 && v7)
      goto LABEL_11;
  }
  else
  {
    v8 = 0;
  }
  v9 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
  {
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = self;
    _os_log_error_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_ERROR, "Couldn't find both presentable (%{public}@) and dismisser (%{public}@) for long look VC %{public}@", (uint8_t *)&v10, 0x20u);
  }
LABEL_11:
  -[NCNotificationLongLookViewController expandedPlatterPresentable:requestsDismissalWithTrigger:](v8, "expandedPlatterPresentable:requestsDismissalWithTrigger:", v6, a3);

}

- (void)clickPresentationInteractionManager:(id)a3 willDismissPresentedContentWithTrigger:(int64_t)a4
{
  -[NCNotificationShortLookViewController _handlePresentedContentDismissalForClickPresentationInteractionManagerWithTrigger:](self, "_handlePresentedContentDismissalForClickPresentationInteractionManagerWithTrigger:", a4);
}

- (void)clickPresentationInteractionManager:(id)a3 declinedDismissingPresentedContentWithTrigger:(int64_t)a4
{
  -[NCNotificationShortLookViewController _handlePresentedContentDismissalForClickPresentationInteractionManagerWithTrigger:](self, "_handlePresentedContentDismissalForClickPresentationInteractionManagerWithTrigger:", a4);
}

- (BOOL)clickPresentationInteractionManagerShouldAllowLongPressGesture:(id)a3
{
  void *v4;
  char v5;

  -[NCNotificationViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "notificationViewControllerShouldAllowLongPressGesture:", self);
  else
    v5 = 1;

  return v5;
}

- (PLClickPresentationInteractionManager)clickPresentationInteractionManager
{
  return self->_clickPresentationInteractionManager;
}

- (CGRect)initialPresentedFrameOfViewForPreview
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[NCNotificationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  -[NCNotificationShortLookViewController viewForPreview](self, "viewForPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v3, "notificationViewController:initialFrameForPresentingLongLookFromView:", self, v5);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    objc_msgSend(v5, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    objc_msgSend(v15, "convertRect:toView:", 0);
    v8 = v16;
    v10 = v17;
    v12 = v18;
    v14 = v19;

  }
  v20 = v8;
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)finalPresentedFrameOfViewForPreview
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[NCNotificationShortLookViewController initialPresentedFrameOfViewForPreview](self, "initialPresentedFrameOfViewForPreview");
  self->_finalPresentedFrameOfViewForPreview.origin.x = v3;
  self->_finalPresentedFrameOfViewForPreview.origin.y = v4;
  self->_finalPresentedFrameOfViewForPreview.size.width = v5;
  self->_finalPresentedFrameOfViewForPreview.size.height = v6;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)finalDismissedFrameOfViewForPreview
{
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[NCNotificationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NCNotificationShortLookViewController viewForPreview](self, "viewForPreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationViewController:finalFrameForDismissingLongLookFromView:", self, v4);
    x = v5;
    y = v7;
    width = v9;
    height = v11;

  }
  else
  {
    x = self->_finalPresentedFrameOfViewForPreview.origin.x;
    y = self->_finalPresentedFrameOfViewForPreview.origin.y;
    width = self->_finalPresentedFrameOfViewForPreview.size.width;
    height = self->_finalPresentedFrameOfViewForPreview.size.height;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)isHighlighted
{
  void *v2;
  void *v3;
  char v4;

  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundMaterialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHighlighted");

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[NCNotificationShortLookViewController _notificationShortLookViewIfLoaded](self, "_notificationShortLookViewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundMaterialView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (UIBezierPath)visiblePath
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  -[NCNotificationShortLookViewController viewForPreview](self, "viewForPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(v2, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v2, "_continuousCornerRadius");
  objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, v12 + -2.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBezierPath *)v13;
}

- (void)notificationViewControllerWillPresent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NCStringFromLongLookPresentationTrigger(self->_trigger);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v9;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller will present long look for request %{public}@ (_trigger: %{public}@)", (uint8_t *)&v19, 0x16u);

  }
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationViewController notificationRequest](self, "notificationRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "longLookPresentedForNotificationRequest:", v12);

  -[UITapGestureRecognizer setEnabled:](self->_tapGesture, "setEnabled:", 0);
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_203);
  -[NCNotificationViewController _customContentProvidingViewController](self->_longLookNotificationViewController, "_customContentProvidingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentExtensionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    NCSDKVersionForExtensionWithIdentifier(v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = NCIsSDKVersionSameOrAfterSDKVersion(v15, CFSTR("13.0"));

    if (!v16)
    {
      -[NCNotificationLongLookViewController presentationController](self->_longLookNotificationViewController, "presentationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOverrideTraitCollection:", v18);

    }
  }
  -[NCNotificationLongLookViewController _updateWithProvidedCustomContent](self->_longLookNotificationViewController, "_updateWithProvidedCustomContent");

}

void __79__NCNotificationShortLookViewController_notificationViewControllerWillPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "longLookWillPresentForNotificationViewController:", v5);

}

- (void)notificationViewControllerDidPresent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller did present long look for request %{public}@", (uint8_t *)&v13, 0xCu);

  }
  if (-[NCNotificationViewController _canPan](self, "_canPan"))
  {
    -[NCNotificationShortLookViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationLongLookViewController presentationController](self->_longLookNotificationViewController, "presentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v10, "setFrame:");

  }
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_204);

}

void __78__NCNotificationShortLookViewController_notificationViewControllerDidPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "longLookDidPresentForNotificationViewController:", v5);

}

- (void)notificationViewControllerWillDismiss:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Notification view controller will dismiss long look for request %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_205);
}

void __79__NCNotificationShortLookViewController_notificationViewControllerWillDismiss___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "longLookWillDismissForNotificationViewController:", v5);

}

- (void)notificationViewControllerDidDismiss:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NCNotificationLongLookViewController *longLookNotificationViewController;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[NCNotificationViewController notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "un_logDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Notification view controller did dismiss long look for request %{public}@", (uint8_t *)&v10, 0xCu);

  }
  -[UITapGestureRecognizer setEnabled:](self->_tapGesture, "setEnabled:", 1);
  longLookNotificationViewController = self->_longLookNotificationViewController;
  self->_longLookNotificationViewController = 0;

  self->_didScrollPresentLongLookViewController = 0;
  -[NCNotificationViewController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_206);
}

void __78__NCNotificationShortLookViewController_notificationViewControllerDidDismiss___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "longLookDidDismissForNotificationViewController:", v5);

}

- (BOOL)expandedPlatterPresentationControllerShouldProvideBackground:(id)a3
{
  return self->_didScrollPresentLongLookViewController;
}

- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationShortLookViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "customBackgroundContainerViewForExpandedPlatterPresentationController:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_presentedLongLookViewController
{
  NCNotificationLongLookViewController *v3;
  NCNotificationLongLookViewController *longLookNotificationViewController;
  uint64_t v5;
  NCNotificationLongLookViewController *v6;
  NCNotificationLongLookViewController *v7;
  NCNotificationLongLookViewController *v8;

  -[PLClickPresentationInteractionManager presentedViewController](self->_clickPresentationInteractionManager, "presentedViewController");
  v3 = (NCNotificationLongLookViewController *)objc_claimAutoreleasedReturnValue();
  longLookNotificationViewController = v3;
  if (!v3)
    longLookNotificationViewController = self->_longLookNotificationViewController;
  v5 = objc_opt_class();
  v6 = longLookNotificationViewController;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (BOOL)_didScrollPresentLongLookViewController
{
  return self->_didScrollPresentLongLookViewController;
}

- (void)_setDidScrollPresentLongLookViewController:(BOOL)a3
{
  self->_didScrollPresentLongLookViewController = a3;
}

- (PLExpandedPlatterInteractionAnimating)_activeExpandedPlatterInteractionAnimator
{
  return self->_activeExpandedPlatterInteractionAnimator;
}

- (void)_setActiveExpandedPlatterInteractionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_activeExpandedPlatterInteractionAnimator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeExpandedPlatterInteractionAnimator, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteractionManager, 0);
  objc_storeStrong((id *)&self->_containerViewProviders, 0);
  objc_storeStrong((id *)&self->_containerViewForExpandedContent, 0);
  objc_storeStrong((id *)&self->_expandedPlatterDismissalReason, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
  objc_storeStrong((id *)&self->_lookViewWrapper, 0);
  objc_storeStrong((id *)&self->_tapBeginTime, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_expandedPlatterViewController, 0);
  objc_storeStrong((id *)&self->_longLookNotificationViewController, 0);
}

- (void)shouldCommitToExpandedPlatterPresentationWithFeedback
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543362;
  v8 = v6;
  _os_log_error_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_ERROR, "Notification view controller for request %{public}@ doesn't have a container view for expanded content – aborting presentation", (uint8_t *)&v7, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

void __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_3_0(&dword_1CFC3D000, v5, v8, "AppProtection authentication failed for %@ with error %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_0_0();
}

- (void)containerViewForExpandedContent
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543618;
  v11 = a1;
  v12 = 2114;
  v13 = v8;
  OUTLINED_FUNCTION_3_0(&dword_1CFC3D000, v5, v9, "Delegate (%{public}@) for notification view controller for request %{public}@ failed to provide a container view provider", (uint8_t *)&v10);

}

- (void)_handleTapOnView:(void *)a3 .cold.1(void *a1, _QWORD *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a3, "state");
  v10 = a2[145];
  v11 = 138543874;
  v12 = v8;
  v13 = 2048;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "Notification cell tap gesture failed for request %{public}@ [tapGestureState : %ld tapBeginTime : %@]", (uint8_t *)&v11, 0x20u);

}

- (void)pointerInteraction:(const __CFString *)a3 styleForRegion:.cold.1(void *a1, void *a2, const __CFString *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v7;
  v10 = CFSTR("<nil>");
  if (a3)
    v10 = a3;
  v11 = 138543618;
  v12 = v7;
  v13 = 2114;
  v14 = v10;
  OUTLINED_FUNCTION_3_0(&dword_1CFC3D000, v5, v8, "[%{public}@] Short look view is not a member of a window. Cannot provide a pointer interaction. Short look view: %{public}@", (uint8_t *)&v11);

  OUTLINED_FUNCTION_0_0();
}

@end
