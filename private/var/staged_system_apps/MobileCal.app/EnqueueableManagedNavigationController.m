@implementation EnqueueableManagedNavigationController

- (EnqueueableManagedNavigationController)init
{
  EnqueueableManagedNavigationController *v2;
  id v3;
  Class v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;

  v12.receiver = self;
  v12.super_class = (Class)EnqueueableManagedNavigationController;
  v2 = -[EnqueueableManagedNavigationController init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSOperationQueue);
    objc_msgSend(v3, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v3, "setSuspended:", 1);
    objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("com.apple.mobilecal.%@.showViewControllers"), v6);
    objc_msgSend(v3, "setName:", v7);

    -[EnqueueableManagedNavigationController setShowViewControllersWhenReadyQueue:](v2, "setShowViewControllersWhenReadyQueue:", v3);
    v8 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Created showViewControllers queue named [%@]", buf, 0xCu);

    }
    -[EnqueueableManagedNavigationController _setClipUnderlapWhileTransitioning:](v2, "_setClipUnderlapWhileTransitioning:", 1);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;

  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_opt_class(self);
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    v6 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Dealloc [%@]", buf, 0xCu);

  }
  -[EnqueueableManagedNavigationController cancelOutstandingOperations](self, "cancelOutstandingOperations");
  v7.receiver = self;
  v7.super_class = (Class)EnqueueableManagedNavigationController;
  -[EnqueueableManagedNavigationController dealloc](&v7, "dealloc");
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 0;
}

- (BOOL)canBeDirectlyManaged
{
  return 0;
}

- (void)cancelOutstandingOperations
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
  objc_msgSend(v2, "cancelAllOperations");

}

- (void)sourceViewController:(id)a3 notifiesReadinessForPresentation:(BOOL)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController _popoverPresentationOperationInQueue](self, "_popoverPresentationOperationInQueue", a3, a4));
  objc_msgSend(v4, "isReady");

}

- (id)_popoverPresentationOperationInQueue
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100097C14;
  v11 = sub_100097C24;
  v12 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "operations"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100097C2C;
  v6[3] = &unk_1001B3E40;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (Class)showViewControllerOperationClass
{
  return (Class)objc_opt_class(ShowViewControllerOperation);
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  void *v15;
  id v16;
  objc_class *v17;
  id v18;
  void *v19;
  DeferredPopoverPresentationOperation *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  char *v32;
  char *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  char *v42;
  DeferredPopoverPresentationOperation *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  char v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  DeferredPopoverPresentationOperation *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  id v64;
  char *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  id v70;
  char v71;
  id v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  const char *v77;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    v13 = objc_msgSend(v10, "prefersForcedModalShowViewController");
    v14 = -[EnqueueableManagedNavigationController _shouldDoExternalPresentationOfManagedNavigationController](self, "_shouldDoExternalPresentationOfManagedNavigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self, "sourceViewController"));
    v16 = objc_msgSend(v15, "presentationStyleOverrideForChildViewControllers");

    if (v16 == (id)-52534682)
      goto LABEL_48;
    -[EnqueueableManagedNavigationController _addDoneButtonIfNeededToViewController:](self, "_addDoneButtonIfNeededToViewController:", v10);
    v17 = -[EnqueueableManagedNavigationController showViewControllerOperationClass](self, "showViewControllerOperationClass");
    v72 = v11;
    v71 = (char)v13;
    if ((v14 & v13) != 1 || v16 == (id)7)
    {
      if ((_DWORD)v13)
      {
        objc_opt_class(_TtC9MobileCal28EKReminderEditViewController);
        if ((objc_opt_isKindOfClass(v10, v25) & 1) != 0)
          v26 = 3;
        else
          v26 = 18;
        objc_msgSend(v10, "setModalPresentationStyle:", v26);
      }
      v20 = (DeferredPopoverPresentationOperation *)objc_msgSend([v17 alloc], "initWithViewControllerToShow:toBeShownInViewController:shouldBeModal:shouldShowWithAnimation:", v10, self, v13, 0);
    }
    else
    {
      objc_msgSend(v10, "setModalPresentationStyle:", v16);
      v18 = [v17 alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController modalPresentationDelegate](self, "modalPresentationDelegate"));
      v20 = (DeferredPopoverPresentationOperation *)objc_msgSend(v18, "initWithViewControllerToShow:toBeShownInViewController:shouldBeModal:shouldShowWithAnimation:", v10, v19, 1, v7);

      v14 = 0;
    }
    -[DeferredPopoverPresentationOperation setCompletionBlock:](v20, "setCompletionBlock:", v12);
    v27 = (void *)kCalUILogHandle;
    v73 = v12;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      objc_opt_class(self);
      v30 = v29;
      v31 = v29;
      objc_opt_class(v10);
      *(_DWORD *)buf = 138412546;
      v75 = v30;
      v76 = 2112;
      v77 = v32;
      v33 = v32;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ queueing show view controller operation to show %@", buf, 0x16u);

    }
    if (v14)
    {
      -[EnqueueableManagedNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", v16);
      if (v16 == (id)7)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController _popoverPresentationOperationInQueue](self, "_popoverPresentationOperationInQueue"));
        if (v34
          || (v35 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue")), v36 = objc_msgSend(v35, "operationCount"), v35, v36))
        {
          v37 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v38 = v37;
            objc_opt_class(self);
            v40 = v39;
            v41 = v39;
            v42 = (char *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
            *(_DWORD *)buf = 138412546;
            v75 = v40;
            v76 = 2112;
            v77 = v42;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@ won't create a popover presentation operation because the queue is not empty: \n %@", buf, 0x16u);

          }
          v43 = 0;
        }
        else
        {
          v43 = -[DeferredPopoverPresentationOperation initWithViewController:shouldShowWithAnimation:]([DeferredPopoverPresentationOperation alloc], "initWithViewController:shouldShowWithAnimation:", self, v7);
          v67 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v68 = v67;
            objc_opt_class(self);
            *(_DWORD *)buf = 138412290;
            v75 = v69;
            v70 = v69;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%@ queueing initial popover presentation operation on queue.", buf, 0xCu);

          }
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self, "sourceViewController"));
        v45 = objc_msgSend(v44, "conformsToProtocol:", &OBJC_PROTOCOL___EnqueuablePopoverPresentationManagedNavigationControllerDelegate);

        if (v45)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self, "sourceViewController"));
          objc_msgSend(v46, "enqueuableNavigationController:requestsDeferShowViewControllerUntilReady:", self, 0);

        }
        v47 = v71 ^ 1;
        if (!v34)
          v47 = 1;
        if ((v47 & 1) == 0)
          -[DeferredPopoverPresentationOperation addDependency:](v20, "addDependency:", v34);

        v48 = v45 ^ 1;
      }
      else
      {
        v49 = [v17 alloc];
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController modalPresentationDelegate](self, "modalPresentationDelegate"));
        v43 = (DeferredPopoverPresentationOperation *)objc_msgSend(v49, "initWithViewControllerToShow:toBeShownInViewController:shouldBeModal:shouldShowWithAnimation:", self, v50, 1, v7);

        v48 = 0;
      }
    }
    else
    {
      v48 = 0;
      v43 = 0;
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "operations"));

    if ((unint64_t)objc_msgSend(v52, "count") >= 2)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastObject"));
      -[DeferredPopoverPresentationOperation addDependency:](v20, "addDependency:", v53);

    }
    if (-[ShowViewControllerOperation shouldBeModal](v20, "shouldBeModal"))
    {
      if (v43)
        v54 = v48;
      else
        v54 = 1;
      if ((v54 & 1) == 0)
      {
        -[DeferredPopoverPresentationOperation addDependency:](v20, "addDependency:", v43);
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
        objc_msgSend(v55, "addOperation:", v43);

      }
    }
    else if (v43)
    {
      -[DeferredPopoverPresentationOperation setCompletionBlock:](v20, "setCompletionBlock:", 0);
      -[DeferredPopoverPresentationOperation setCompletionBlock:](v43, "setCompletionBlock:", v73);
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
      objc_msgSend(v56, "addOperation:", v20);

      if ((v48 & 1) != 0)
      {
LABEL_45:
        v60 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
        {
          v61 = v60;
          objc_opt_class(self);
          v63 = v62;
          v64 = v62;
          v65 = (char *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
          *(_DWORD *)buf = 138412546;
          v75 = v63;
          v76 = 2112;
          v77 = v65;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%@'s operation queue is ready for execution:\n%@", buf, 0x16u);

        }
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
        objc_msgSend(v66, "setSuspended:", 0);

        v11 = v72;
        v12 = v73;
        goto LABEL_48;
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
      v58 = v57;
      v59 = v43;
LABEL_44:
      objc_msgSend(v57, "addOperation:", v59);

      goto LABEL_45;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
    v58 = v57;
    v59 = v20;
    goto LABEL_44;
  }
  v21 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v22 = v21;
    objc_opt_class(self);
    *(_DWORD *)buf = 138412546;
    v75 = v23;
    v76 = 2080;
    v77 = "-[EnqueueableManagedNavigationController showViewController:sender:animated:completion:]";
    v24 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ [%s] given nil input to show.", buf, 0x16u);

  }
LABEL_48:

}

- (BOOL)_shouldDoExternalPresentationOfManagedNavigationController
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
  if (objc_msgSend(v3, "operationCount"))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController modalPresentationDelegate](self, "modalPresentationDelegate"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController presentingViewController](self, "presentingViewController"));
        v4 = v8 == 0;

      }
      else
      {
        v4 = 1;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)_addDoneButtonIfNeededToViewController:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[EnqueueableManagedNavigationController _shouldDoExternalPresentationOfManagedNavigationController](self, "_shouldDoExternalPresentationOfManagedNavigationController"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController viewControllers](self, "viewControllers"));
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController view](self, "view"));
  v8 = EKUICurrentWindowInterfaceParadigm(v6, v7);

  if (v5 && v8 == 8)
  {
    objc_opt_class(CNContactViewController);
    if ((objc_opt_isKindOfClass(v12, v9) & 1) != 0)
    {
      v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneButtonTapped");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationItem"));
      objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    }
  }

}

- (void)_doneButtonTapped
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController presentingViewController](self, "presentingViewController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000985A8;
  v4[3] = &unk_1001B2538;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (void)enqueueStackResetOperation
{
  -[EnqueueableManagedNavigationController enqueueStackResetOperationDismissingPresentations:cancelOperations:completionBlock:](self, "enqueueStackResetOperationDismissingPresentations:cancelOperations:completionBlock:", 1, 1, 0);
}

- (void)enqueueStackResetOperationDismissingPresentations:(BOOL)a3 cancelOperations:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  EnqueueableManagedNavigationController *v19;
  _BOOL4 v20;
  _QWORD v21[5];
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (void *)kCalUILogHandle;
  v10 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v10)
    {
      v11 = v9;
      objc_opt_class(self);
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      v13 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ queueing stack reset operation and cancelling all outstanding operations.", buf, 0xCu);

    }
    -[EnqueueableManagedNavigationController cancelOutstandingOperations](self, "cancelOutstandingOperations");
  }
  else if (v10)
  {
    v14 = v9;
    objc_opt_class(self);
    *(_DWORD *)buf = 138412290;
    v30 = v15;
    v16 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@ queueing stack reset operation.", buf, 0xCu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController presentedViewController](self, "presentedViewController"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController presentedViewController](self, "presentedViewController"));
    v19 = (EnqueueableManagedNavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "presentingViewController"));
    v20 = v19 == self;

  }
  else
  {
    v20 = 0;
  }

  if (-[EnqueueableManagedNavigationController _shouldEnqueueDismissals](self, "_shouldEnqueueDismissals") && v6 && v20)
  {
    objc_initWeak((id *)buf, self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000988B8;
    v26[3] = &unk_1001B3E68;
    objc_copyWeak(&v28, (id *)buf);
    v26[4] = self;
    v27 = v8;
    -[EnqueueableManagedNavigationController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 0, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100098A40;
    v21[3] = &unk_1001B3EB8;
    v24 = v6;
    v25 = v20;
    objc_copyWeak(&v23, (id *)buf);
    v21[4] = self;
    v22 = v8;
    -[EnqueueableManagedNavigationController enqueueBlock:](self, "enqueueBlock:", v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)enqueueBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v6 = v5;
      objc_opt_class(self);
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      v8 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ queueing block operation.", buf, 0xCu);

    }
    objc_opt_class(self);
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_100099088;
    v18 = &unk_1001B3EE0;
    v20 = v9;
    v19 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v15));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue", v15, v16, v17, v18));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "operations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

    if (v13)
      objc_msgSend(v10, "addDependency:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
    objc_msgSend(v14, "addOperation:", v10);

  }
}

- (BOOL)_shouldEnqueueDismissals
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;

  if (self->_enqueuingDismissalsDisabled)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self, "sourceViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___EnqueueablePresentationDismissalManagedNavigationControllerDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self, "sourceViewController"));
  if ((objc_opt_respondsToSelector(v5, "enqueueableManagedNavigationControllerShouldEnqueuePresentationDismissals:") & 1) != 0)
    v6 = objc_msgSend(v5, "enqueueableManagedNavigationControllerShouldEnqueuePresentationDismissals:", self);
  else
    v6 = 0;

  return v6;
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  DismissPresentedViewControllerOperation *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[24];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (-[EnqueueableManagedNavigationController _shouldEnqueueDismissals](self, "_shouldEnqueueDismissals"))
  {
    v7 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v8 = v7;
      objc_opt_class(self);
      *(_DWORD *)v17 = 138412290;
      *(_QWORD *)&v17[4] = v9;
      v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ queueing show view controller operation to dismiss presented view controller", v17, 0xCu);

    }
    v11 = -[DismissPresentedViewControllerOperation initWithPresentingViewController:transition:completion:]([DismissPresentedViewControllerOperation alloc], "initWithPresentingViewController:transition:completion:", self, v4, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "operations"));

    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
      -[DismissPresentedViewControllerOperation addDependency:](v11, "addDependency:", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue", *(_OWORD *)v17));
    objc_msgSend(v15, "addOperation:", v11);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"));
    objc_msgSend(v16, "setSuspended:", 0);

  }
  else
  {
    -[EnqueueableManagedNavigationController dismissViewControllerWithoutEnqueuingWithTransition:completion:](self, "dismissViewControllerWithoutEnqueuingWithTransition:completion:", v4, v6);
  }

}

- (void)dismissViewControllerWithoutEnqueuingWithTransition:(int)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EnqueueableManagedNavigationController;
  -[EnqueueableManagedNavigationController dismissViewControllerWithTransition:completion:](&v4, "dismissViewControllerWithTransition:completion:", *(_QWORD *)&a3, a4);
}

- (void)setAllowsEnqueuedDismissal:(BOOL)a3
{
  self->_enqueuingDismissalsDisabled = !a3;
}

- (id)EKUI_viewHierarchy
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self, "sourceViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self, "sourceViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "EKUI_viewHierarchy"));

    return v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EnqueueableManagedNavigationController;
    v7 = -[EnqueueableManagedNavigationController EKUI_viewHierarchy](&v8, "EKUI_viewHierarchy");
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }
}

- (MainViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (void)setSourceViewController:(id)a3
{
  self->_sourceViewController = (MainViewController *)a3;
}

- (NSOperationQueue)showViewControllersWhenReadyQueue
{
  return self->_showViewControllersWhenReadyQueue;
}

- (void)setShowViewControllersWhenReadyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_showViewControllersWhenReadyQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showViewControllersWhenReadyQueue, 0);
}

@end
