@implementation UINavigationController

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  id v21;
  BOOL v22;
  id v23;
  _QWORD *v24;
  void *v25;
  void (**v26)(_QWORD);
  void *v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  _QWORD v30[5];
  id v31;
  BOOL v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const char *v36;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(_QWORD))a6;
  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController modalPresentationDelegate](self, "modalPresentationDelegate"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController presentingViewController](self, "presentingViewController"));
        v18 = v17 == 0;

      }
      else
      {
        v18 = 1;
      }

    }
    else
    {
      v18 = 0;
    }

    v22 = !v18;
    -[UINavigationController _addDoneButtonIfNeededToViewController:](self, "_addDoneButtonIfNeededToViewController:", v11);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10004F654;
    v30[3] = &unk_1001B2EC8;
    v30[4] = self;
    v23 = v11;
    v31 = v23;
    v32 = v22 && v7;
    v24 = objc_retainBlock(v30);
    objc_msgSend(v23, "preferredContentSize");
    -[UINavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
    if (v22)
    {
      ((void (*)(_QWORD *))v24[2])(v24);
      if (v13)
        v13[2](v13);
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController modalPresentationDelegate](self, "modalPresentationDelegate"));

      if (!v25)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ManagedNavigationController.m"), 153, CFSTR("Can't present self without a modal presentation delegate."));

      }
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10004FA60;
      v28[3] = &unk_1001B2E30;
      v29 = objc_retainBlock(v13);
      v26 = v29;
      -[UINavigationController _presentSelfOnModalPresentationDelegateAnimated:withCompletionHandler:](self, "_presentSelfOnModalPresentationDelegateAnimated:withCompletionHandler:", v7, v28);
      ((void (*)(_QWORD *))v24[2])(v24);

    }
  }
  else
  {
    v19 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      *(_DWORD *)buf = 138412546;
      v34 = (id)objc_opt_class(self);
      v35 = 2080;
      v36 = "-[UINavigationController(MobileCalUniversalShowViewControllerSignatureUsage) showViewController:sender:anima"
            "ted:completion:]";
      v21 = v34;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@ [%s] given nil input to show.", buf, 0x16u);

    }
  }

}

- (void)_presentSelfOnModalPresentationDelegateAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController presentingViewController](self, "presentingViewController"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController modalPresentationDelegate](self, "modalPresentationDelegate"));
    v9 = objc_opt_class(v8);
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@> presents <%@> with modal style %ld"), v9, objc_opt_class(self), -[UINavigationController modalPresentationStyle](self, "modalPresentationStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v13 = v12;
      *(_DWORD *)buf = 138412802;
      v17 = (id)objc_opt_class(self);
      v18 = 2080;
      v19 = "-[UINavigationController(MobileCalUniversalShowViewControllerSignatureUsage) _presentSelfOnModalPresentation"
            "DelegateAnimated:withCompletionHandler:]";
      v20 = 2112;
      v21 = v11;
      v14 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ [%s] %@", buf, 0x20u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController modalPresentationDelegate](self, "modalPresentationDelegate"));
    objc_msgSend(v15, "presentViewController:animated:completion:", self, v4, v6);

  }
}

- (void)_addDoneButtonIfNeededToViewController:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if ((objc_msgSend(v16, "prefersForcedModalShowViewController") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v16, "prefersToBePresentedFromUINavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self, "view"));
  v7 = EKUICurrentWindowInterfaceParadigm(v5, v6);

  v8 = objc_opt_class(CNContactViewController);
  isKindOfClass = objc_opt_isKindOfClass(v16, v8);
  v10 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    if (v7 == 8)
      v11 = v4;
    else
      v11 = 0;
    if (v11 == 1)
    {
      v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_doneButtonTapped");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationItem"));
      objc_msgSend(v13, "setLeftBarButtonItem:", v12);

LABEL_12:
      v10 = v16;
      goto LABEL_13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leftBarButtonItem"));

    v10 = v16;
    if (v15)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationItem"));
      objc_msgSend(v12, "setLeftBarButtonItem:", 0);
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)_doneButtonTapped
{
  -[UINavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

- (void)popViewControllersAfterAndIncluding:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self, "viewControllers"));
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v9);
      if (*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13) == v6)
        break;
      objc_msgSend(v8, "addObject:", (_QWORD)v16);
      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = objc_msgSend(v9, "count");
  if (v14 == objc_msgSend(v8, "count"))
  {
    v15 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "View controller (%@) not found when trying to find a view controller to pop. View controllers = %@", buf, 0x16u);
    }
  }
  else
  {
    -[UINavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v8, v4);
  }

}

@end
