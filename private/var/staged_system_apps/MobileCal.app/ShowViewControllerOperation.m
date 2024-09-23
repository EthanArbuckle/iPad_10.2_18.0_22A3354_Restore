@implementation ShowViewControllerOperation

- (ShowViewControllerOperation)initWithViewControllerToShow:(id)a3 toBeShownInViewController:(id)a4 shouldBeModal:(BOOL)a5 shouldShowWithAnimation:(BOOL)a6
{
  id v11;
  id v12;
  ShowViewControllerOperation *v13;
  ShowViewControllerOperation *v14;
  Class v15;
  NSString *v16;
  id v17;
  const char *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ShowViewControllerOperation;
  v13 = -[ShowViewControllerOperation init](&v23, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_shownViewController, a3);
    objc_storeStrong((id *)&v14->_parentOfShownViewController, a4);
    v14->_shouldBeModal = a5;
    v14->_shouldShowWithAnimation = a6;
    objc_opt_class(v14);
    v16 = NSStringFromClass(v15);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v16));
    v18 = (const char *)objc_msgSend(v17, "UTF8String");

    v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create(v18, v20);
    -[ShowViewControllerOperation setQueue:](v14, "setQueue:", v21);

  }
  return v14;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  objc_opt_class(self->_parentOfShownViewController);
  v4 = v3;
  *(_QWORD *)&v5 = objc_opt_class(self->_shownViewController).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ shows view controller %@"), v5, v4, v6));
  -[ShowViewControllerOperation setName:](self, "setName:", v7);

  v8 = objc_alloc((Class)CalDescriptionBuilder);
  v14.receiver = self;
  v14.super_class = (Class)ShowViewControllerOperation;
  v9 = -[ShowViewControllerOperation description](&v14, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v8, "initWithSuperclassDescription:", v10);

  objc_msgSend(v11, "setKey:withBoolean:", CFSTR("_shouldBeModal"), self->_shouldBeModal);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "build"));

  return v12;
}

- (void)doInternalPresentation
{
  void *v3;
  NSObject *v4;
  UIViewController *v5;
  UIViewController *v6;
  UIViewController *parentOfShownViewController;
  UIViewController *v8;
  void *v9;
  void *v10;
  UIViewController *shownViewController;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  UIViewController *v17;
  NSObject *v18;
  void *v19;
  UIViewController *v20;
  uint64_t v21;
  void *v22;
  UIViewController *v23;
  UIViewController *v24;
  _BOOL8 shouldShowWithAnimation;
  id v26;
  _QWORD v27[4];
  id v28;
  ShowViewControllerOperation *v29;
  uint8_t buf[4];
  UIViewController *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_opt_class(self);
    v6 = v5;
    parentOfShownViewController = self->_parentOfShownViewController;
    v8 = v5;
    objc_opt_class(parentOfShownViewController);
    v10 = v9;
    shownViewController = self->_shownViewController;
    v12 = v9;
    objc_opt_class(shownViewController);
    *(_DWORD *)buf = 138412802;
    v31 = v6;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v13;
    v14 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ operation instructing %@ to modally present %@.", buf, 0x20u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](self->_shownViewController, "presentingViewController"));

  if (v15)
  {
    v16 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_shownViewController;
      v18 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentingViewController](v17, "presentingViewController"));
      *(_DWORD *)buf = 138412546;
      v31 = v17;
      v32 = 2112;
      v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[51150180] Requested to present %@ but it's already presented by %@", buf, 0x16u);

    }
  }
  v20 = self->_parentOfShownViewController;
  objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController delegate](self->_parentOfShownViewController, "delegate"));
  else
    v22 = 0;
  if ((objc_opt_respondsToSelector(v22, "navigationController:willShowViewController:animated:") & 1) != 0)
    objc_msgSend(v22, "navigationController:willShowViewController:animated:", self->_parentOfShownViewController, self->_shownViewController, self->_shouldShowWithAnimation);
  v23 = self->_parentOfShownViewController;
  v24 = self->_shownViewController;
  shouldShowWithAnimation = self->_shouldShowWithAnimation;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100110B14;
  v27[3] = &unk_1001B26A0;
  v28 = v22;
  v29 = self;
  v26 = v22;
  -[UIViewController presentViewController:animated:completion:](v23, "presentViewController:animated:completion:", v24, shouldShowWithAnimation, v27);

}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ShowViewControllerOperation queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100110CB4;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)main
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  ShowViewControllerOperation *v6;

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Executing operation: %@", buf, 0xCu);
  }
  -[ShowViewControllerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 1;
  -[ShowViewControllerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  if ((-[ShowViewControllerOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    -[ShowViewControllerOperation finish](self, "finish");
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100110E2C;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)isConcurrent
{
  return 0;
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ShowViewControllerOperation;
  -[ShowViewControllerOperation cancel](&v5, "cancel");
  if (-[ShowViewControllerOperation isExecuting](self, "isExecuting"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[ShowViewControllerOperation queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001110FC;
    block[3] = &unk_1001B2538;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)finish
{
  void *v3;
  NSObject *v4;
  Class v5;
  NSString *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  ShowViewControllerOperation *v11;

  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finishing %@ operation: [%p]", (uint8_t *)&v8, 0x16u);

  }
  if (!self->_isFinished)
  {
    if (self->_isExecuting)
    {
      -[ShowViewControllerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
      self->_isExecuting = 0;
      -[ShowViewControllerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    }
    -[ShowViewControllerOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_isFinished = 1;
    -[ShowViewControllerOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)shouldBeModal
{
  return self->_shouldBeModal;
}

- (void)setShouldBeModal:(BOOL)a3
{
  self->_shouldBeModal = a3;
}

- (BOOL)shouldShowWithAnimation
{
  return self->_shouldShowWithAnimation;
}

- (void)setShouldShowWithAnimation:(BOOL)a3
{
  self->_shouldShowWithAnimation = a3;
}

- (UIViewController)shownViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShownViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UIViewController)parentOfShownViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setParentOfShownViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentOfShownViewController, 0);
  objc_storeStrong((id *)&self->_shownViewController, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end
