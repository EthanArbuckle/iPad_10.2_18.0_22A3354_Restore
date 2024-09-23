@implementation MusicTermsVerificationOperation

- (MusicTermsVerificationOperation)init
{
  MusicTermsVerificationOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicTermsVerificationOperation;
  v2 = -[MusicTermsVerificationOperation init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.FuseUI.MusicTermsVerificationOperation.accessQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (MusicTermsVerificationOperation)initWithAdditionalPresentationHandler:(id)a3
{
  id v4;
  MusicTermsVerificationOperation *v5;
  id v6;
  id additionalPresentationHandler;

  v4 = a3;
  v5 = -[MusicTermsVerificationOperation init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    additionalPresentationHandler = v5->_additionalPresentationHandler;
    v5->_additionalPresentationHandler = v6;

  }
  return v5;
}

- (BOOL)isExecuting
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __46__MusicTermsVerificationOperation_isExecuting__block_invoke;
  v5[3] = &unk_1339AD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__MusicTermsVerificationOperation_isExecuting__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (BOOL)isFinished
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __45__MusicTermsVerificationOperation_isFinished__block_invoke;
  v5[3] = &unk_1339AD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__MusicTermsVerificationOperation_isFinished__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 33);
  return result;
}

- (void)start
{
  NSObject *accessQueue;
  NSObject *v4;
  _QWORD *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD block[5];

  if (-[MusicTermsVerificationOperation isCancelled](self, "isCancelled"))
  {
    -[MusicTermsVerificationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __40__MusicTermsVerificationOperation_start__block_invoke;
    block[3] = &unk_1338FD8;
    block[4] = self;
    dispatch_barrier_async(accessQueue, block);
    -[MusicTermsVerificationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  else
  {
    -[MusicTermsVerificationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    v4 = self->_accessQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __40__MusicTermsVerificationOperation_start__block_invoke_2;
    v7[3] = &unk_1338FD8;
    v7[4] = self;
    dispatch_barrier_async(v4, v7);
    -[MusicTermsVerificationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    if (objc_msgSend((id)objc_opt_class(self), "requiresTermsVerification")
      && self->_additionalPresentationHandler)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __40__MusicTermsVerificationOperation_start__block_invoke_3;
      v6[3] = &unk_1338FD8;
      v6[4] = self;
      v5 = objc_retainBlock(v6);
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
        ((void (*)(_QWORD *))v5[2])(v5);
      else
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

    }
    else
    {
      -[MusicTermsVerificationOperation _finishWithError:](self, "_finishWithError:", 0);
    }
  }
}

uint64_t __40__MusicTermsVerificationOperation_start__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 33) = 1;
  return result;
}

uint64_t __40__MusicTermsVerificationOperation_start__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 1;
  return result;
}

void __40__MusicTermsVerificationOperation_start__block_invoke_3(uint64_t a1)
{
  MusicTermsAgreementViewController *v2;
  uint64_t v3;
  void *v4;
  id v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  _QWORD block[5];

  v2 = objc_alloc_init(MusicTermsAgreementViewController);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  objc_setAssociatedObject(*(id *)(*(_QWORD *)(a1 + 32) + 48), _MusicTermsVerificationOperationAssociatedObjectKey, *(id *)(a1 + 32), (char *)&dword_0 + 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setLoading:", 1);
  v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40__MusicTermsVerificationOperation_start__block_invoke_4;
  block[3] = &unk_1338FD8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v7, block);

}

void __40__MusicTermsVerificationOperation_start__block_invoke_4(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  id v4;
  id location;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_newTermsUpdateOperationWithAcceptedStoreTermsVersion:", 0);
  objc_initWeak(&location, v2);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __40__MusicTermsVerificationOperation_start__block_invoke_5;
  v3[3] = &unk_1338F48;
  objc_copyWeak(&v4, &location);
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "setCompletionBlock:", v3);
  objc_msgSend(v2, "start");
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);

}

void __40__MusicTermsVerificationOperation_start__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "error"));
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      if (objc_msgSend(v6, "isEqualToString:", SSErrorDomain))
        v7 = objc_msgSend(v5, "code") == (char *)&stru_68.addr + 4;
      else
        v7 = 0;

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __40__MusicTermsVerificationOperation_start__block_invoke_8;
      v11[3] = &unk_1339E98;
      v11[4] = *(_QWORD *)(a1 + 32);
      v13 = v7;
      v12 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
      v10 = v12;
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __40__MusicTermsVerificationOperation_start__block_invoke_6;
      block[3] = &unk_1338EF8;
      v8 = v3;
      v9 = *(_QWORD *)(a1 + 32);
      v15 = v8;
      v16 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v10 = v15;
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
  }

}

void __40__MusicTermsVerificationOperation_start__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "hasAcceptedLatestTerms") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateSubscriptionStatus");
    v2 = *(void **)(a1 + 40);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __40__MusicTermsVerificationOperation_start__block_invoke_7;
    v6[3] = &unk_1338FD8;
    v6[4] = v2;
    objc_msgSend(v2, "_dismissTermsAgreementViewControllerWithCompletionHandler:", v6);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) = objc_msgSend(*(id *)(a1 + 32), "latestStoreTermsVersion");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setLoading:", 0);
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "termsContentText"));
    objc_msgSend(v4, "setTermsText:", v5);

  }
}

id __40__MusicTermsVerificationOperation_start__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

void __40__MusicTermsVerificationOperation_start__block_invoke_8(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;
  char v5;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __40__MusicTermsVerificationOperation_start__block_invoke_9;
  v2[3] = &unk_1339E98;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 48);
  v4 = v1;
  objc_msgSend(v3, "_dismissTermsAgreementViewControllerWithCompletionHandler:", v2);

}

id __40__MusicTermsVerificationOperation_start__block_invoke_9(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = 0;
  return objc_msgSend(v2, "_finishWithError:", v3);
}

- (void)termsAgreementViewControllerDidAcceptTerms:(id)a3
{
  id v4;
  id v5;
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "setAccepting:", 1);
  v5 = -[MusicTermsVerificationOperation _newTermsUpdateOperationWithAcceptedStoreTermsVersion:](self, "_newTermsUpdateOperationWithAcceptedStoreTermsVersion:", self->_acceptingTermsVersion);
  objc_initWeak(&location, v5);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke;
  v12[3] = &unk_1339EE8;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "setCompletionBlock:", v12);
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_7;
  block[3] = &unk_1338FD8;
  v11 = v5;
  v9 = v5;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "error"));
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      if (objc_msgSend(v6, "isEqualToString:", SSErrorDomain))
        v7 = objc_msgSend(v5, "code") == (char *)&stru_68.addr + 4;
      else
        v7 = 0;

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_4;
      v10[3] = &unk_1339EC0;
      v13 = v7;
      v10[4] = a1[4];
      v11 = v5;
      v12 = a1[5];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

    }
    else
    {
      objc_msgSend(a1[4], "_updateSubscriptionStatus");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_2;
      block[3] = &unk_1338FD8;
      block[4] = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }

  }
  else
  {
    v8 = a1[4];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_6;
    v9[3] = &unk_1338FD8;
    v9[4] = v8;
    objc_msgSend(v8, "_dismissTermsAgreementViewControllerWithCompletionHandler:", v9);
  }

}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_3;
  v3[3] = &unk_1338FD8;
  v3[4] = v1;
  return objc_msgSend(v1, "_dismissTermsAgreementViewControllerWithCompletionHandler:", v3);
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

void __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  if (*(_BYTE *)(a1 + 56))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_5;
    v12[3] = &unk_1338EF8;
    v2 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v14 = v2;
    objc_msgSend(v13, "_dismissTermsAgreementViewControllerWithCompletionHandler:", v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setAccepting:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Your request couldn’t be completed."), &stru_13E1990, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Your agreement to the Terms and Conditions couldn’t be submitted. Try again later."), &stru_13E1990, 0));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_13E1990, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, 0));

    objc_msgSend(v11, "addAction:", v9);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);

  }
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

id __78__MusicTermsVerificationOperation_termsAgreementViewControllerDidAcceptTerms___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)termsAgreementViewControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __73__MusicTermsVerificationOperation_termsAgreementViewControllerDidCancel___block_invoke;
  v3[3] = &unk_1338FD8;
  v3[4] = self;
  -[MusicTermsVerificationOperation _dismissTermsAgreementViewControllerWithCompletionHandler:](self, "_dismissTermsAgreementViewControllerWithCompletionHandler:", v3);
}

void __73__MusicTermsVerificationOperation_termsAgreementViewControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = SSError(SSErrorDomain, 140, 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v1, "_finishWithError:", v3);

}

- (void)termsAgreementViewController:(id)a3 didRequestSendByEmailToEmailAddress:(id)a4
{
  id v5;
  MusicTermsSendByEmailOperation *v6;
  void *v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  MusicTermsSendByEmailOperation *v10;
  _QWORD block[4];
  MusicTermsSendByEmailOperation *v12;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[MusicTermsSendByEmailOperation initWithEmailAddress:]([MusicTermsSendByEmailOperation alloc], "initWithEmailAddress:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsVerificationOperation SAPSession](self, "SAPSession"));
    if (v7)
      -[MusicTermsSendByEmailOperation setSAPSession:](v6, "setSAPSession:", v7);
    global_queue = dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __100__MusicTermsVerificationOperation_termsAgreementViewController_didRequestSendByEmailToEmailAddress___block_invoke;
    block[3] = &unk_1338FD8;
    v12 = v6;
    v10 = v6;
    dispatch_async(v9, block);

  }
}

id __100__MusicTermsVerificationOperation_termsAgreementViewController_didRequestSendByEmailToEmailAddress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (NSError)error
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __40__MusicTermsVerificationOperation_error__block_invoke;
  v5[3] = &unk_1339AD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __40__MusicTermsVerificationOperation_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (SSVFairPlaySAPSession)SAPSession
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __45__MusicTermsVerificationOperation_SAPSession__block_invoke;
  v5[3] = &unk_1339AD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSVFairPlaySAPSession *)v3;
}

void __45__MusicTermsVerificationOperation_SAPSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)setSAPSession:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __49__MusicTermsVerificationOperation_setSAPSession___block_invoke;
  v7[3] = &unk_1338EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __49__MusicTermsVerificationOperation_setSAPSession___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

+ (BOOL)requiresTermsVerification
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "musicSubscriptionStatus"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "termsStatusList"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type", (_QWORD)v14) == (char *)&dword_0 + 1)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  v9 = objc_msgSend(v5, "currentVersion");
  v10 = objc_msgSend(v5, "acceptedVersion");
  v12 = (uint64_t)v9 > 0 && (uint64_t)v10 < (uint64_t)v9;

  return v12;
}

- (void)_cleanUpTermsAgreementViewController:(id)a3
{
  objc_setAssociatedObject(a3, _MusicTermsVerificationOperationAssociatedObjectKey, 0, (char *)&dword_0 + 1);
}

- (void)_dismissTermsAgreementViewControllerWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsAgreementViewController navigationController](self->_termsAgreementViewController, "navigationController"));
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController")),
        v7,
        v6,
        v7 == v5))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentingViewController"));
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v9);

  }
  else if (v9)
  {
    v9[2]();
  }

}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD block[5];

  v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__MusicTermsVerificationOperation__finishWithError___block_invoke;
  block[3] = &unk_1338FD8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[MusicTermsVerificationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[MusicTermsVerificationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __52__MusicTermsVerificationOperation__finishWithError___block_invoke_2;
  v7[3] = &unk_1338EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
  -[MusicTermsVerificationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[MusicTermsVerificationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));

}

void __52__MusicTermsVerificationOperation__finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_cleanUpTermsAgreementViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

}

void __52__MusicTermsVerificationOperation__finishWithError___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
}

- (id)_newTermsUpdateOperationWithAcceptedStoreTermsVersion:(unint64_t)a3
{
  MusicTermsUpdateOperation *v4;
  void *v5;

  v4 = -[MusicTermsUpdateOperation initWithAcceptedStoreTermsVersion:termsContext:]([MusicTermsUpdateOperation alloc], "initWithAcceptedStoreTermsVersion:termsContext:", a3, CFSTR("subscription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicTermsVerificationOperation SAPSession](self, "SAPSession"));
  if (v5)
    -[MusicTermsUpdateOperation setSAPSession:](v4, "setSAPSession:", v5);

  return v4;
}

- (void)_updateSubscriptionStatus
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSVSubscriptionStatusCoordinator sharedCoordinator](SSVSubscriptionStatusCoordinator, "sharedCoordinator"));
  v5 = SSVSubscriptionStatusOptionIgnoreCache;
  v6 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  objc_msgSend(v2, "getStatusWithOptions:statusBlock:", v3, &__block_literal_global_13);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudServiceStatusController sharedController](MPCloudServiceStatusController, "sharedController"));
  objc_msgSend(v4, "refreshMusicSubscriptionStatus");

}

- (id)additionalPresentationHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalPresentationHandler, 0);
  objc_storeStrong((id *)&self->_termsAgreementViewController, 0);
  objc_storeStrong((id *)&self->_SAPSession, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
