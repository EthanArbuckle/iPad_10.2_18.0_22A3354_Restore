@implementation CreateNewContactTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  _QWORD *v7;
  _QWORD v9[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CreateNewContactTest;
  v5 = -[ContactsTest prepareForTestWithOptions:](&v10, "prepareForTestWithOptions:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("iterations")));
    -[CreateNewContactTest setTotalIterations:](self, "setTotalIterations:", (int)objc_msgSend(v6, "intValue"));

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007268;
    v9[3] = &unk_10001C488;
    v9[4] = self;
    v7 = objc_retainBlock(v9);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v7);

  }
  return v5;
}

- (void)performTest
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v3 = -[CreateNewContactTest iterations](self, "iterations");
  if (v3 >= -[CreateNewContactTest totalIterations](self, "totalIterations"))
  {
    v9 = (void *)UIApp;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testName")));
    objc_msgSend(v9, "finishedTest:", v10);

  }
  else
  {
    -[CreateNewContactTest setIterations:](self, "setIterations:", (char *)-[CreateNewContactTest iterations](self, "iterations") + 1);
    v4 = (void *)UIApp;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("testName")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
    objc_msgSend(v4, "startedSubTest:forTest:withMetrics:", CFSTR("Create New Contact"), v6, v7);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007418;
    v12[3] = &unk_10001C488;
    v12[4] = self;
    objc_msgSend(UIApp, "installCACommitCompletionBlock:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
    objc_msgSend(v8, "addContact:animated:", 0, 0);

  }
}

- (int64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int64_t)a3
{
  self->_iterations = a3;
}

- (int64_t)totalIterations
{
  return self->_totalIterations;
}

- (void)setTotalIterations:(int64_t)a3
{
  self->_totalIterations = a3;
}

@end
