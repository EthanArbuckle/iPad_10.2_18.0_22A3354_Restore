@implementation ScrollContactTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  signed int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void ***v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  ScrollContactTest *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ScrollContactTest;
  v5 = -[ContactsTest prepareForTestWithOptions:](&v33, "prepareForTestWithOptions:", v4);
  if (v5)
  {
    if (!-[ContactsTest isIPad](self, "isIPad"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactSplitViewController](self, "contactSplitViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationControllerForPPT"));

      v8 = objc_opt_class(CNContactNavigationController);
      v9 = v7;
      if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
      {
        objc_initWeak(&location, self);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100007E78;
        v30[3] = &unk_10001C510;
        objc_copyWeak(&v31, &location);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNTestNavigationControllerDelegate delegateWithDelegate:willShowViewControllerHandler:didShowViewControllerHandler:](CNTestNavigationControllerDelegate, "delegateWithDelegate:willShowViewControllerHandler:didShowViewControllerHandler:", v12, 0, v30));
        -[ScrollContactTest setNavControllerDelegate:](self, "setNavControllerDelegate:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ScrollContactTest navControllerDelegate](self, "navControllerDelegate"));
        objc_msgSend(v11, "setDelegate:", v14);

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(v9, "setDelegate:", self);
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("scrollMemberAtIndex")));
    v16 = objc_msgSend(v15, "intValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contacts"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v16));

    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100007EC0;
    v27 = &unk_10001C538;
    v28 = self;
    v29 = v20;
    v21 = v20;
    v22 = objc_retainBlock(&v24);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v22, v24, v25, v26, v27, v28);

  }
  return v5;
}

- (void)prepareForNextTest
{
  objc_super v3;

  -[ScrollContactTest resetDelegate](self, "resetDelegate");
  v3.receiver = self;
  v3.super_class = (Class)ScrollContactTest;
  -[ContactsTest prepareForNextTest](&v3, "prepareForNextTest");
}

- (void)resetDelegate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactSplitViewController](self, "contactSplitViewController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationControllerForPPT"));

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
  v5 = v9;
  if (v9 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ScrollContactTest navControllerDelegate](self, "navControllerDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
    objc_msgSend(v8, "setDelegate:", v7);

    v5 = v9;
  }

}

- (void)didShow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_opt_class(CNContactViewController);
  v13 = v4;
  if ((objc_opt_isKindOfClass(v13, v5) & 1) != 0)
    v6 = v13;
  else
    v6 = 0;
  v7 = v6;

  v8 = v13;
  if (v7
    || (v9 = objc_opt_class(UINavigationController), (objc_opt_isKindOfClass(v13, v9) & 1) != 0)
    && ((v10 = objc_opt_class(CNContactViewController),
         v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topViewController")),
         (objc_opt_isKindOfClass(v8, v10) & 1) == 0)
      ? (v11 = 0)
      : (v11 = v8),
        v12 = v11,
        v8,
        v12))
  {
    -[ScrollContactTest scrollContactViewController:](self, "scrollContactViewController:", v8);

  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  -[ScrollContactTest didShow:](self, "didShow:", a4);
}

- (void)scrollContactViewController:(id)a3
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactView"));

  v6 = dispatch_time(0, 500000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000081E8;
  v8[3] = &unk_10001C538;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);

}

- (CNTestNavigationControllerDelegate)navControllerDelegate
{
  return self->_navControllerDelegate;
}

- (void)setNavControllerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_navControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navControllerDelegate, 0);
}

@end
