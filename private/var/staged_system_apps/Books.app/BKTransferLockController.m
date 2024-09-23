@implementation BKTransferLockController

- (void)resolveTransferLockWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BKAcquireSlotRequest *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  -[BKTransferLockController setPresentingViewController:](self, "setPresentingViewController:", v6);
  -[BKTransferLockController setCompletion:](self, "setCompletion:", v7);
  objc_initWeak(&location, self);
  v8 = objc_alloc_init(BKAcquireSlotRequest);
  -[BKTransferLockController setAcquireSlotRequest:](self, "setAcquireSlotRequest:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransferLockController acquireSlotRequest](self, "acquireSlotRequest"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C0E9C;
  v10[3] = &unk_1008E8198;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "performRequestWithResponseHandler:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_handleTransferLockError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BKAcquireSlotDialogResponse *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  v5 = objc_opt_class(NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (objc_msgSend(v4, "code") == (id)2
    && +[BKAcquireSlotDialogResponse isDialogResponse:](BKAcquireSlotDialogResponse, "isDialogResponse:", v8))
  {
    objc_initWeak(&location, self);
    v9 = -[BKAcquireSlotDialogResponse initWithDialogDictionary:]([BKAcquireSlotDialogResponse alloc], "initWithDialogDictionary:", v8);
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1000C12A0;
    v18 = &unk_1008E9B28;
    objc_copyWeak(&v19, &location);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotDialogResponse createTransferDialogWithCompletion:](v9, "createTransferDialogWithCompletion:", &v15));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransferLockController presentingViewController](self, "presentingViewController", v15, v16, v17, v18));
      objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);
    }
    else
    {
      v12 = sub_1000CA2E0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to create transfer dialog from response: %@", buf, 0xCu);
      }

      v14 = objc_claimAutoreleasedReturnValue(-[BKTransferLockController completion](self, "completion", v15, v16, v17, v18));
      v11 = (void *)v14;
      if (v14)
        (*(void (**)(uint64_t))(v14 + 16))(v14);
      -[BKTransferLockController setCompletion:](self, "setCompletion:", 0);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else if (objc_msgSend(v4, "code") == (id)3)
  {
    -[BKTransferLockController _showTransferLockBackOffAlert](self, "_showTransferLockBackOffAlert");
  }

}

- (void)_showTransferLockBackOffAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Couldn’t Play Audiobook"), &stru_10091C438, 0));

  LODWORD(v3) = _os_feature_enabled_impl("AppleAccount", "AABranding");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if ((_DWORD)v3)
    v7 = CFSTR("You’re using an Apple Account different than the one associated with this device. Try again later.");
  else
    v7 = CFSTR("You’re using an Apple ID different than the one associated with this device. Try again later.");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10091C438, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10091C438, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v8, 1));
  objc_initWeak(&location, self);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000C1728;
  v17 = &unk_1008E9B50;
  objc_copyWeak(&v18, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, &v14));
  objc_msgSend(v11, "addAction:", v12, v14, v15, v16, v17);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransferLockController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v13, "presentViewController:animated:completion:", v11, 1, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (BKAcquireSlotRequest)acquireSlotRequest
{
  return self->_acquireSlotRequest;
}

- (void)setAcquireSlotRequest:(id)a3
{
  objc_storeStrong((id *)&self->_acquireSlotRequest, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_acquireSlotRequest, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
