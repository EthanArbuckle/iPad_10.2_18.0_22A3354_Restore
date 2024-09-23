@implementation ShowContactsTest

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
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ShowContactsTest;
  v5 = -[ContactsTest prepareForTestWithOptions:](&v23, "prepareForTestWithOptions:", v4);
  if (v5)
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
      v17 = _NSConcreteStackBlock;
      v18 = 3221225472;
      v19 = sub_10000AF9C;
      v20 = &unk_10001C510;
      objc_copyWeak(&v21, &location);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNTestNavigationControllerDelegate delegateWithDelegate:willShowViewControllerHandler:didShowViewControllerHandler:](CNTestNavigationControllerDelegate, "delegateWithDelegate:willShowViewControllerHandler:didShowViewControllerHandler:", v12, 0, &v17));
      -[ShowContactsTest setNavControllerDelegate:](self, "setNavControllerDelegate:", v13, v17, v18, v19, v20);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShowContactsTest navControllerDelegate](self, "navControllerDelegate"));
      objc_msgSend(v11, "setDelegate:", v14);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v9, "setDelegate:", self);
    }
    -[ShowContactsTest setNextContactIndex:](self, "setNextContactIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("iterations")));
    -[ShowContactsTest setMaxContactIndex:](self, "setMaxContactIndex:", objc_msgSend(v15, "intValue"));

    -[ContactsTest willStartTest](self, "willStartTest");
    -[ShowContactsTest showNextContact](self, "showNextContact");

  }
  return v5;
}

- (void)prepareForNextTest
{
  objc_super v3;

  -[ShowContactsTest resetDelegate](self, "resetDelegate");
  v3.receiver = self;
  v3.super_class = (Class)ShowContactsTest;
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShowContactsTest navControllerDelegate](self, "navControllerDelegate"));
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
  char isKindOfClass;
  _QWORD v7[5];

  v4 = a3;
  v5 = objc_opt_class(CNContactNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    -[ShowContactsTest performSelector:](self, "performSelector:", "iterateContact");
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000B194;
    v7[3] = &unk_10001C488;
    v7[4] = self;
    objc_msgSend(UIApp, "installCACommitCompletionBlock:", v7);
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  -[ShowContactsTest didShow:](self, "didShow:", a4);
}

- (void)iterateContact
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));

  v5 = (void *)UIApp;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B2D8;
  v7[3] = &unk_10001C538;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "installCACommitCompletionBlock:", v7);

}

- (void)showNextContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void ***v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ShowContactsTest *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contacts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", -[ShowContactsTest nextContactIndex](self, "nextContactIndex")));

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10000B520;
  v12 = &unk_10001C538;
  v13 = self;
  v14 = v6;
  v7 = v6;
  v8 = objc_retainBlock(&v9);
  if (-[ContactsTest isIPad](self, "isIPad", v9, v10, v11, v12, v13))
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v8);
  else
    ((void (*)(void ***))v8[2])(v8);

}

- (void)showContactsListForIPhone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (void *)UIApp;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
  objc_msgSend(v3, "startedSubTest:forTest:withMetrics:", CFSTR("Close Contact"), v5, v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B788;
  v8[3] = &unk_10001C488;
  v8[4] = self;
  objc_msgSend(UIApp, "installCACommitCompletionBlock:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactSplitViewController](self, "contactSplitViewController"));
  objc_msgSend(v7, "showContactList");

}

- (int)nextContactIndex
{
  return self->_nextContactIndex;
}

- (void)setNextContactIndex:(int)a3
{
  self->_nextContactIndex = a3;
}

- (int)maxContactIndex
{
  return self->_maxContactIndex;
}

- (void)setMaxContactIndex:(int)a3
{
  self->_maxContactIndex = a3;
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
