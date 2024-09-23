@implementation EditContactTransitionTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EditContactTransitionTest;
  v5 = -[ContactsTest prepareForTestWithOptions:](&v8, "prepareForTestWithOptions:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("iterations")));
    -[EditContactTransitionTest setMaxIterations:](self, "setMaxIterations:", (int)objc_msgSend(v6, "intValue"));

    -[ContactsTest willStartTest](self, "willStartTest");
    -[EditContactTransitionTest showNextContact](self, "showNextContact");
  }

  return v5;
}

- (void)showNextContact
{
  _QWORD *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E84C;
  v4[3] = &unk_10001C488;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v3);

}

- (void)measureEditingTransitionOnController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = (void *)UIApp;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000EB3C;
  v11[3] = &unk_10001C488;
  v11[4] = self;
  v5 = a3;
  objc_msgSend(v4, "installCACommitCompletionBlock:", v11);
  v6 = (void *)UIApp;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest testOptions](self, "testOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("testName")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
  objc_msgSend(v6, "startedSubTest:forTest:withMetrics:", CFSTR("Edit Contact Transition"), v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentViewController"));
  objc_msgSend(v10, "toggleEditing:", self);

}

- (unint64_t)iteration
{
  return self->_iteration;
}

- (void)setIteration:(unint64_t)a3
{
  self->_iteration = a3;
}

- (unint64_t)maxIterations
{
  return self->_maxIterations;
}

- (void)setMaxIterations:(unint64_t)a3
{
  self->_maxIterations = a3;
}

@end
