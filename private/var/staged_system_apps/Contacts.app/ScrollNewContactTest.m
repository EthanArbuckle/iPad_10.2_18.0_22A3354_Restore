@implementation ScrollNewContactTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  _BOOL4 v4;
  _QWORD *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ScrollNewContactTest;
  v4 = -[ContactsTest prepareForTestWithOptions:](&v8, "prepareForTestWithOptions:", a3);
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000A734;
    v7[3] = &unk_10001C488;
    v7[4] = self;
    v5 = objc_retainBlock(v7);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v5);

  }
  return v4;
}

- (void)performTest
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  ScrollNewContactTest *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
  objc_msgSend(v3, "addContact:animated:", 0, 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleViewController"));

  v6 = objc_opt_class(CNContactViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = dispatch_time(0, 1000000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000A828;
    v8[3] = &unk_10001C538;
    v9 = v5;
    v10 = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);

  }
}

@end
