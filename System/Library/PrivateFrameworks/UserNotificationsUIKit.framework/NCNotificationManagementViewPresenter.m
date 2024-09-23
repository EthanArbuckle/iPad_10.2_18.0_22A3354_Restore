@implementation NCNotificationManagementViewPresenter

- (void)presentNotificationManagementViewType:(unint64_t)a3 forNotificationRequest:(id)a4 withPresentingViewController:(id)a5 withPresentingView:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  NCNotificationManagementDemotionAlertController *v13;
  __objc2_class *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  v10 = a5;
  v11 = a6;
  switch(a3)
  {
    case 0uLL:
      +[NCNotificationManagementViewController notificationManagementAlertControllerForNotificationRequest:withPresentingView:settingsDelegate:](NCNotificationManagementViewController, "notificationManagementAlertControllerForNotificationRequest:withPresentingView:settingsDelegate:", v21, v11, self);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1uLL:
      v14 = NCNotificationManagementPromotionAlertController;
      goto LABEL_11;
    case 2uLL:
      v14 = NCNotificationManagementDemotionAlertController;
      goto LABEL_11;
    case 3uLL:
      v13 = -[NCNotificationManagementDemotionAlertController initWithRequest:withPresentingView:settingsDelegate:includeExplanation:]([NCNotificationManagementDemotionAlertController alloc], "initWithRequest:withPresentingView:settingsDelegate:includeExplanation:", v21, v11, self, 1);
      v15 = 0;
      goto LABEL_14;
    case 4uLL:
      v14 = NCNotificationManagementTimeSensitiveKeepAlertController;
      goto LABEL_11;
    case 5uLL:
      v14 = NCNotificationManagementTimeSensitiveTurnOffAlertController;
      goto LABEL_11;
    case 6uLL:
      v14 = NCNotificationManagementMuteAppAlertController;
      goto LABEL_11;
    case 7uLL:
      v14 = NCNotificationManagementMuteThreadAlertController;
LABEL_11:
      v12 = objc_msgSend([v14 alloc], "initWithRequest:withPresentingView:settingsDelegate:", v21, v11, self);
LABEL_12:
      v13 = (NCNotificationManagementDemotionAlertController *)v12;
      break;
    default:
      v13 = 0;
      break;
  }
  v15 = 1;
LABEL_14:
  -[NCNotificationManagementViewPresenter delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "notificationManagementViewPresenterWillPresentManagementView:", self);
  if (v13)
  {
    if (v15)
    {
      -[NCNotificationManagementDemotionAlertController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 7);
      -[NCNotificationManagementDemotionAlertController popoverPresentationController](v13, "popoverPresentationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSourceView:", v11);

      -[NCNotificationManagementDemotionAlertController popoverPresentationController](v13, "popoverPresentationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      objc_msgSend(v18, "setSourceRect:");

      -[NCNotificationManagementDemotionAlertController popoverPresentationController](v13, "popoverPresentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPermittedArrowDirections:", 3);

      -[NCNotificationManagementDemotionAlertController popoverPresentationController](v13, "popoverPresentationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCanOverlapSourceViewRect:", 1);

    }
    else
    {
      -[NCNotificationManagementDemotionAlertController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 6);
    }
    -[NCNotificationManagementViewPresenter setNotificationManagementAlertViewController:](self, "setNotificationManagementAlertViewController:", v13);
    objc_msgSend(v10, "presentViewController:animated:completion:", v13, 1, 0);
  }

}

- (BOOL)dismissManagementViewIfPresentedAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *notificationManagementAlertViewController;

  v3 = a3;
  -[UIAlertController presentingViewController](self->_notificationManagementAlertViewController, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, 0);
    -[NCNotificationManagementViewPresenter delegate](self, "delegate");
    notificationManagementAlertViewController = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(notificationManagementAlertViewController, "notificationManagementViewPresenterDidDismissManagementView:", self);
  }
  else
  {
    notificationManagementAlertViewController = self->_notificationManagementAlertViewController;
    self->_notificationManagementAlertViewController = 0;
  }

  return v6 != 0;
}

- (id)notificationManagementController:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationManagementViewPresenter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationManagementViewPresenter:sectionSettingsForSectionIdentifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)notificationManagementControllerRequestsSystemSettings:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationManagementViewPresenter delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "notificationManagementViewPresenterRequestsSystemSettings:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)notificationManagementController:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  -[NCNotificationManagementViewPresenter delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationManagementViewPresenter:setAllowsNotifications:forNotificationRequest:withSectionIdentifier:", self, v7, v10, v9);

}

- (void)notificationManagementController:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  -[NCNotificationManagementViewPresenter delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationManagementViewPresenter:setDeliverQuietly:forNotificationRequest:withSectionIdentifier:", self, v7, v10, v9);

}

- (void)notificationManagementController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  -[NCNotificationManagementViewPresenter delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationManagementViewPresenter:setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", self, v7, v10, v9);

}

- (void)notificationManagementControllerDidDismissManagementView:(id)a3
{
  id v4;

  -[NCNotificationManagementViewPresenter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationManagementViewPresenterDidDismissManagementView:", self);

}

- (void)notificationManagementController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  -[NCNotificationManagementViewPresenter delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationManagementViewPresenter:setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:", self, v7, v10, v9);

}

- (void)notificationManagementController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v11 = a4;
  v17 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  -[NCNotificationManagementViewPresenter delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "notificationManagementViewPresenter:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", self, v11, v17, v13, v14, v15);

}

- (void)notificationManagementController:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  id v11;

  v7 = a4;
  v11 = a5;
  v9 = a6;
  -[NCNotificationManagementViewPresenter delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "notificationManagementViewPresenter:setScheduledDelivery:forNotificationRequest:withSectionIdentifier:", self, v7, v11, v9);

}

- (NCNotificationManagementViewPresenterDelegate)delegate
{
  return (NCNotificationManagementViewPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIAlertController)notificationManagementAlertViewController
{
  return self->_notificationManagementAlertViewController;
}

- (void)setNotificationManagementAlertViewController:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManagementAlertViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManagementAlertViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
