@implementation ScrollMemberListTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void ***v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  ScrollMemberListTest *v15;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ScrollMemberListTest;
  v4 = -[ContactsTest prepareForTestWithOptions:](&v17, "prepareForTestWithOptions:", a3);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactListViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView"));

    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10000A96C;
    v14 = &unk_10001C538;
    v15 = self;
    v16 = v7;
    v8 = v7;
    v9 = objc_retainBlock(&v11);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v9, v11, v12, v13, v14, v15);

  }
  return v4;
}

@end
