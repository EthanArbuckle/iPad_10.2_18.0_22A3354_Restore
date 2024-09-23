@implementation DeferredPopoverPresentationOperation

- (DeferredPopoverPresentationOperation)initWithViewController:(id)a3 shouldShowWithAnimation:(BOOL)a4
{
  id v7;
  DeferredPopoverPresentationOperation *v8;
  DeferredPopoverPresentationOperation *v9;
  Class v10;
  NSString *v11;
  id v12;
  const char *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DeferredPopoverPresentationOperation;
  v8 = -[DeferredPopoverPresentationOperation init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewController, a3);
    v9->_shouldShowWithAnimation = a4;
    objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v11));
    v13 = (const char *)objc_msgSend(v12, "UTF8String");

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create(v13, v15);
    -[ShowViewControllerOperation setQueue:](v9, "setQueue:", v16);

  }
  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  Class v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self->_viewController, "sourceViewController"));
  objc_opt_class(v3);
  v5 = v4;
  *(_QWORD *)&v6 = objc_opt_class(self->_viewController).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ presents popover showing view controller %@"), v6, v5, v7));
  -[DeferredPopoverPresentationOperation setName:](self, "setName:", v8);

  objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DeferredPopoverPresentationOperation name](self, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p{name = '%@'}>"), v11, self, v12));

  v14 = objc_msgSend(objc_alloc((Class)CalDescriptionBuilder), "initWithSuperclassDescription:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "build"));

  return v15;
}

- (id)sourceViewController
{
  void *v4;
  unsigned __int8 v5;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self->_viewController, "sourceViewController"));
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___EnqueuablePopoverPresentationManagedNavigationControllerDelegate);

  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController sourceViewController](self->_viewController, "sourceViewController"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DeferredPopoverPresentationOperation.m"), 53, CFSTR("Fatal: source view controller %@ does not support popover presentations."), v8);

  }
  return -[EnqueueableManagedNavigationController sourceViewController](self->_viewController, "sourceViewController");
}

- (BOOL)isReady
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;

  v21.receiver = self;
  v21.super_class = (Class)DeferredPopoverPresentationOperation;
  v3 = -[DeferredPopoverPresentationOperation isReady](&v21, "isReady");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnqueueableManagedNavigationController presentingViewController](self->_viewController, "presentingViewController"));

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeferredPopoverPresentationOperation sourceViewController](self, "sourceViewController"));
    v7 = objc_msgSend(v6, "isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:", self->_viewController);

    v8 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      objc_opt_class(self);
      v11 = v10;
      v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
      *(_DWORD *)buf = 138412546;
      v23 = v11;
      v24 = 2112;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Operation %@ sourceViewControllerClaimsReadiness: %@", buf, 0x16u);

    }
    v5 = v3 & v7;
  }
  if (self->_isReady != (_DWORD)v5)
  {
    -[DeferredPopoverPresentationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isReady"));
    self->_isReady = v5;
    -[DeferredPopoverPresentationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isReady"));
  }
  v14 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v15 = v14;
    objc_opt_class(self);
    v17 = v16;
    v18 = v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
    *(_DWORD *)buf = 138412546;
    v23 = v17;
    v24 = 2112;
    v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Operation %@ isReady: %@", buf, 0x16u);

  }
  return self->_isReady;
}

- (void)main
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  DeferredPopoverPresentationOperation *v6;

  v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Executing operation: %@", buf, 0xCu);
  }
  -[DeferredPopoverPresentationOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_isExecuting = 1;
  -[DeferredPopoverPresentationOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072410;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
