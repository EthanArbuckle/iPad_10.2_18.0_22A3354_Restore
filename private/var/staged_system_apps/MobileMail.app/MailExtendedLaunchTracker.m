@implementation MailExtendedLaunchTracker

- (void)observeViewController:(id)a3 scene:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker _sceneID:](self, "_sceneID:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker observedScenes](self, "observedScenes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker _viewControllerID:](self, "_viewControllerID:", v11));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));
    objc_msgSend(v10, "addObject:", v9);

  }
}

- (void)didFinishLoadViewController:(id)a3 scene:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  id v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[MailExtendedLaunchTracker log](MailExtendedLaunchTracker, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class(v6);
    v10 = NSStringFromClass(v9);
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    v12 = (objc_class *)objc_opt_class(v7);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v20 = 138544130;
    v21 = v11;
    v22 = 2048;
    v23 = v6;
    v24 = 2114;
    v25 = v14;
    v26 = 2048;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didFinishLoadViewController:<%{public}@: %p> scene: <%{public}@: %p>", (uint8_t *)&v20, 0x2Au);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker _sceneID:](self, "_sceneID:", v7));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker _viewControllerID:](self, "_viewControllerID:", v6));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker observedScenes](self, "observedScenes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));
  if (objc_msgSend(v18, "containsObject:", v16))
  {
    objc_msgSend(v18, "removeObject:", v16);
    if (v18 && !objc_msgSend(v18, "count"))
      objc_msgSend(v17, "removeObjectForKey:", v15);
    if (!objc_msgSend(v17, "count"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker delegate](self, "delegate"));
      objc_msgSend(v19, "didFinishLoadAllScenes:", self);

    }
  }

}

- (NSMutableDictionary)observedScenes
{
  return self->_observedScenes;
}

- (void)observeScene:(id)a3
{
  NSMutableSet *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker _sceneID:](self, "_sceneID:", a3));
  v4 = objc_opt_new(NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailExtendedLaunchTracker observedScenes](self, "observedScenes"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

}

- (MailExtendedLaunchTracker)initWithDelegate:(id)a3
{
  id v4;
  MailExtendedLaunchTracker *v5;
  MailExtendedLaunchTracker *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *observedScenes;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MailExtendedLaunchTracker;
  v5 = -[MailExtendedLaunchTracker init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_opt_new(NSMutableDictionary);
    observedScenes = v6->_observedScenes;
    v6->_observedScenes = v7;

  }
  return v6;
}

- (MailExtendedLaunchTrackerDelegate)delegate
{
  return (MailExtendedLaunchTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)_viewControllerID:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", a3));
}

- (id)_sceneID:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "session"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentIdentifier"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedScenes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C27C;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9D40 != -1)
    dispatch_once(&qword_1005A9D40, block);
  return (OS_os_log *)(id)qword_1005A9D38;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setObservedScenes:(id)a3
{
  objc_storeStrong((id *)&self->_observedScenes, a3);
}

@end
