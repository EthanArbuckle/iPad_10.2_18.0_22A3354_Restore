@implementation ContactsTest

- (BOOL)isRecap
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("testType")));
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("recap"));

  return v4;
}

+ (id)testWithSplitViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setContactSplitViewController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactNavigationController"));

  objc_msgSend(v5, "setContactNavigationController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  objc_msgSend(v5, "setIsIPad:", objc_msgSend(v7, "userInterfaceIdiom") == (id)1);

  return v5;
}

- (BOOL)prepareForTestWithOptions:(id)a3
{
  -[ContactsTest setTestOptions:](self, "setTestOptions:", a3);
  return 1;
}

- (void)willStartTest
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)UIApp;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v2, "startedTest:", v3);

}

- (void)showContactListWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  void (**v14)(_QWORD);
  _QWORD v15[4];
  void (**v16)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[ContactsTest isIPad](self, "isIPad"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactSplitViewController](self, "contactSplitViewController"));
    objc_msgSend(v5, "showColumn:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactSplitViewController](self, "contactSplitViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));

    if (v7)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000A354;
      v15[3] = &unk_10001C6A8;
      v16 = v4;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v15);

    }
    else if (v4)
    {
      v4[2](v4);
    }
  }
  else
  {
    v8 = (void *)UIApp;
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_10000A368;
    v13 = &unk_10001C5C0;
    v14 = v4;
    objc_msgSend(v8, "installCACommitCompletionBlock:", &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactSplitViewController](self, "contactSplitViewController", v10, v11, v12, v13));
    objc_msgSend(v9, "showContactList");

    v7 = v14;
  }

}

- (void)performScrollTestWithScrollView:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  if (-[ContactsTest isRecap](self, "isRecap"))
  {
    if (+[RPTTestRunner isRecapAvailable](RPTTestRunner, "isRecapAvailable"))
    {
      v8 = objc_alloc((Class)RPTScrollViewTestParameters);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("testName")));
      v11 = objc_msgSend(v8, "initWithTestName:scrollView:completionHandler:", v10, v6, v7);

      +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v11);
LABEL_19:

      goto LABEL_20;
    }
    v16 = CNUILogTesting();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000F2B8(v17);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("delta")));
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "intValue");
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("offset")));
      v15 = objc_msgSend(v19, "intValue");

    }
    if (v15)
      v20 = v15;
    else
      v20 = 20;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testName")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("iterations")));
    v24 = objc_msgSend(v23, "intValue");

    if (v24 <= 1)
      v25 = 1;
    else
      v25 = v24;
    objc_msgSend(v6, "contentSize");
    v27 = (int)v26;
    if (!v7)
    {
      objc_msgSend(v6, "_performScrollTest:iterations:delta:length:", v21, v25, v20, (int)v26);

      goto LABEL_19;
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000A600;
    v28[3] = &unk_10001C6D0;
    v29 = v7;
    objc_msgSend(v6, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:", v21, v25, v20, v27, 2, 0, v28);

  }
LABEL_20:

}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (void)setTestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_testOptions, a3);
}

- (CNContactNavigationController)contactNavigationController
{
  return self->_contactNavigationController;
}

- (void)setContactNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_contactNavigationController, a3);
}

- (ContactsSplitViewController)contactSplitViewController
{
  return self->_contactSplitViewController;
}

- (void)setContactSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactSplitViewController, a3);
}

- (BOOL)isIPad
{
  return self->_isIPad;
}

- (void)setIsIPad:(BOOL)a3
{
  self->_isIPad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSplitViewController, 0);
  objc_storeStrong((id *)&self->_contactNavigationController, 0);
  objc_storeStrong((id *)&self->_testOptions, 0);
}

@end
