@implementation ShowPseudoContactsTest

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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ShowPseudoContactsTest;
  v5 = -[ContactsTest prepareForTestWithOptions:](&v26, "prepareForTestWithOptions:", v4);
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
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000D448;
      v23[3] = &unk_10001C510;
      objc_copyWeak(&v24, &location);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNTestNavigationControllerDelegate delegateWithDelegate:willShowViewControllerHandler:didShowViewControllerHandler:](CNTestNavigationControllerDelegate, "delegateWithDelegate:willShowViewControllerHandler:didShowViewControllerHandler:", v12, 0, v23));
      -[ShowPseudoContactsTest setNavControllerDelegate:](self, "setNavControllerDelegate:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShowPseudoContactsTest navControllerDelegate](self, "navControllerDelegate"));
      objc_msgSend(v11, "setDelegate:", v14);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v9, "setDelegate:", self);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[ShowPseudoContactsTest setExtraResults:](self, "setExtraResults:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("animate")));
    -[ShowPseudoContactsTest setAnimate:](self, "setAnimate:", objc_msgSend(v16, "BOOLValue"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("searchQueries")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("%")));
    -[ShowPseudoContactsTest setAllSearchQueries:](self, "setAllSearchQueries:", v18);
    -[ShowPseudoContactsTest setCurrentQueryIndex:](self, "setCurrentQueryIndex:", 0);
    -[ShowPseudoContactsTest setNextContactIndex:](self, "setNextContactIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("iterations")));
    -[ShowPseudoContactsTest setMaxContactIndex:](self, "setMaxContactIndex:", objc_msgSend(v19, "intValue"));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000D490;
    v22[3] = &unk_10001C488;
    v22[4] = self;
    v20 = objc_retainBlock(v22);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v20);

  }
  return v5;
}

- (void)prepareForNextTest
{
  objc_super v3;

  -[ShowPseudoContactsTest resetDelegate](self, "resetDelegate");
  v3.receiver = self;
  v3.super_class = (Class)ShowPseudoContactsTest;
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShowPseudoContactsTest navControllerDelegate](self, "navControllerDelegate"));
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
    -[ShowPseudoContactsTest performSelector:](self, "performSelector:", "iterateContact");
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D668;
    v7[3] = &unk_10001C488;
    v7[4] = self;
    objc_msgSend(UIApp, "installCACommitCompletionBlock:", v7);
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  -[ShowPseudoContactsTest didShow:](self, "didShow:", a4);
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
  v7[2] = sub_10000D790;
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
  ShowPseudoContactsTest *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contacts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", -[ShowPseudoContactsTest nextContactIndex](self, "nextContactIndex")));

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10000DA44;
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

- (void)showPseudoContactsListForIPhone
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
  v8[2] = sub_10000DD10;
  v8[3] = &unk_10001C488;
  v8[4] = self;
  objc_msgSend(UIApp, "installCACommitCompletionBlock:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactSplitViewController](self, "contactSplitViewController"));
  objc_msgSend(v7, "showContactList");

}

- (void)startSearchQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShowPseudoContactsTest allSearchQueries](self, "allSearchQueries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", -[ShowPseudoContactsTest currentQueryIndex](self, "currentQueryIndex")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactListViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DE48;
  v7[3] = &unk_10001C488;
  v7[4] = self;
  objc_msgSend(v6, "searchForString:animated:completionBlock:", v4, -[ShowPseudoContactsTest animate](self, "animate"), v7);

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

- (NSMutableDictionary)extraResults
{
  return self->_extraResults;
}

- (void)setExtraResults:(id)a3
{
  objc_storeStrong((id *)&self->_extraResults, a3);
}

- (unint64_t)currentDirectoryIndex
{
  return self->_currentDirectoryIndex;
}

- (void)setCurrentDirectoryIndex:(unint64_t)a3
{
  self->_currentDirectoryIndex = a3;
}

- (BOOL)animate
{
  return self->_animate;
}

- (void)setAnimate:(BOOL)a3
{
  self->_animate = a3;
}

- (NSArray)allSearchQueries
{
  return self->_allSearchQueries;
}

- (void)setAllSearchQueries:(id)a3
{
  objc_storeStrong((id *)&self->_allSearchQueries, a3);
}

- (unint64_t)currentQueryIndex
{
  return self->_currentQueryIndex;
}

- (void)setCurrentQueryIndex:(unint64_t)a3
{
  self->_currentQueryIndex = a3;
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
  objc_storeStrong((id *)&self->_allSearchQueries, 0);
  objc_storeStrong((id *)&self->_extraResults, 0);
}

@end
