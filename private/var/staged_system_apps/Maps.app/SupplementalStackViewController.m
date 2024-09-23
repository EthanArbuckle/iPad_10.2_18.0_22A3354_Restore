@implementation SupplementalStackViewController

- (SupplementalStackViewController)init
{
  SupplementalStackViewController *v2;
  uint64_t v3;
  NSMutableArray *containeeViewControllerStack;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SupplementalStackViewController;
  v2 = -[SupplementalStackViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    containeeViewControllerStack = v2->_containeeViewControllerStack;
    v2->_containeeViewControllerStack = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)_addContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, uint64_t);
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];

  v28 = (void (**)(id, uint64_t))a5;
  v31 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SupplementalStackViewController addChildViewController:](self, "addChildViewController:", v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", v7);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "safeAreaLayoutGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v26));
  v32[0] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "safeAreaLayoutGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v21));
  v32[1] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "safeAreaLayoutGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v9));
  v32[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SupplementalStackViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v14));
  v32[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  objc_msgSend(v31, "didMoveToParentViewController:", self);
  if (v28)
    v28[2](v28, 1);

}

- (void)_removeContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  v6 = a3;
  objc_msgSend(v6, "willMoveToParentViewController:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(v6, "removeFromParentViewController");
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    v8 = v9;
  }

}

- (void)pushContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((-[NSMutableArray containsObject:](self->_containeeViewControllerStack, "containsObject:", v8) & 1) == 0)
  {
    v10 = dispatch_group_create();
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_containeeViewControllerStack, "lastObject"));
    if (v11)
    {
      dispatch_group_enter(v10);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100697BA4;
      v17[3] = &unk_1011AE8F8;
      v18 = v10;
      -[SupplementalStackViewController _removeContainee:animated:completion:](self, "_removeContainee:animated:completion:", v11, v6, v17);

    }
    dispatch_group_enter(v10);
    -[NSMutableArray addObject:](self->_containeeViewControllerStack, "addObject:", v8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100697BAC;
    v15[3] = &unk_1011AE8F8;
    v16 = v10;
    v12 = v10;
    -[SupplementalStackViewController _addContainee:animated:completion:](self, "_addContainee:animated:completion:", v8, v6, v15);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100697BB4;
    block[3] = &unk_1011ADA00;
    v14 = v9;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)popContainee:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;

  v4 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_containeeViewControllerStack, "lastObject"));
  if (v8)
  {
    dispatch_group_enter(v7);
    -[NSMutableArray removeObjectAtIndex:](self->_containeeViewControllerStack, "removeObjectAtIndex:", (char *)-[NSMutableArray count](self->_containeeViewControllerStack, "count") - 1);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100697D78;
    v15[3] = &unk_1011AE8F8;
    v9 = v7;
    v16 = v9;
    -[SupplementalStackViewController _removeContainee:animated:completion:](self, "_removeContainee:animated:completion:", v8, v4, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_containeeViewControllerStack, "lastObject"));
    if (v10)
    {
      dispatch_group_enter(v9);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100697D80;
      v13[3] = &unk_1011AE8F8;
      v14 = v9;
      -[SupplementalStackViewController _addContainee:animated:completion:](self, "_addContainee:animated:completion:", v10, v4, v13);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100697D88;
    block[3] = &unk_1011ADA00;
    v12 = v6;
    dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

- (void)setContainees:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSMutableArray *containeeViewControllerStack;
  unint64_t v11;
  id v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  containeeViewControllerStack = self->_containeeViewControllerStack;
  v11 = (unint64_t)v8;
  v12 = containeeViewControllerStack;
  if (v11 | (unint64_t)v12
    && (v13 = v12,
        v14 = objc_msgSend((id)v11, "isEqual:", v12),
        v13,
        (id)v11,
        !v14))
  {
    v15 = dispatch_group_create();
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_containeeViewControllerStack, "lastObject"));
    if (v16)
    {
      dispatch_group_enter(v15);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100697F98;
      v24[3] = &unk_1011AE8F8;
      v25 = v15;
      -[SupplementalStackViewController _removeContainee:animated:completion:](self, "_removeContainee:animated:completion:", v16, v6, v24);

    }
    v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11));
    v18 = self->_containeeViewControllerStack;
    self->_containeeViewControllerStack = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_containeeViewControllerStack, "lastObject"));
    if (v19)
    {
      dispatch_group_enter(v15);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100697FA0;
      v22[3] = &unk_1011AE8F8;
      v23 = v15;
      -[SupplementalStackViewController _addContainee:animated:completion:](self, "_addContainee:animated:completion:", v19, v6, v22);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100697FA8;
    block[3] = &unk_1011ADA00;
    v21 = v9;
    dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_containeeViewControllerStack, "count") == 0;
}

- (id)preferredFocusEnvironments
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v2 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_containeeViewControllerStack, "lastObject"));
  v3 = (void *)v2;
  if (v2)
  {
    v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)topContainee_forTests
{
  return -[NSMutableArray lastObject](self->_containeeViewControllerStack, "lastObject");
}

- (NSMutableArray)containeeViewControllerStack
{
  return self->_containeeViewControllerStack;
}

- (void)setContaineeViewControllerStack:(id)a3
{
  objc_storeStrong((id *)&self->_containeeViewControllerStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containeeViewControllerStack, 0);
}

@end
